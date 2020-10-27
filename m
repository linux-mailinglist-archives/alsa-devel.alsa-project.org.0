Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A68129CBC4
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 23:09:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98FC2168D;
	Tue, 27 Oct 2020 23:08:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98FC2168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603836553;
	bh=0s8eorO0+5cCBd055VZ9u3z+zUkBtU/jHQ8xdAMXy1Y=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZFYJy/cG4NzlPo2ia5K1haf5EB3iGXWjQpj7WhelpMVymUy/KL91hKe8gUvXgSnJu
	 UTZPKrleq6qxuEmsMYB33yk0cnRhuqhU5hSSV/Sm46xx8DYMlzhWamW9XPDXJ5GNZ0
	 5TFKYCgcSnMFBNUExz+ATYGsVMkAQwa4s7At6Vww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08091F8019D;
	Tue, 27 Oct 2020 23:07:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30D8BF8020D; Tue, 27 Oct 2020 23:07:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 5C649F80086
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 23:07:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C649F80086
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1603836453642128944-webhooks-bot@alsa-project.org>
References: <1603836453642128944-webhooks-bot@alsa-project.org>
Subject: Out of bounds array reference aplay.c playbackv_go function
Message-Id: <20201027220739.30D8BF8020D@alsa1.perex.cz>
Date: Tue, 27 Oct 2020 23:07:39 +0100 (CET)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-utils issue #70 was opened from ygator:

I was looking through the aplay source file and came across an out of bounds reference.  The reason I was looking through the code is that I am using an i2s amp and there is this code:
`/usr/bin/aplay -D default -t raw -r 44100 -c 2 -f S16_LE /dev/zero /dev/zero`
The reason for it is:
> We've added an extra helper systemd script that will play quiet audio when the I2S peripheral isn't in use. This removes popping when playback starts or stops. It uses a tiny amount of CPU time (on a Pi Zero, 5%, on a Pi 2 or 3 its negligible). 

I thought there must be a way to just open the device and not have to use any CPU time actually playing nothing.
If anyone knows if this is possible then let me know.  Thanks.

Any way back to the out of bounds.

In the function playbackv_go function of aplay.c there is a call to perror(names[channel]).  However, instead of channel being equal to zero it is equal to channels which is 1 + the number of names being passed to the function.

> 	while (count > 0 && !in_aborting) {
		size_t c = 0;
		size_t expected = count / channels;
		if (expected > vsize)
			expected = vsize;
		do {
			**channel = 0;  // Code to fix out of bound**
			r = safe_read(fds[0], bufs[0], expected);
			if (r < 0) {
				**perror(names[channel]);  // Out of bounds reference**
				prg_exit(EXIT_FAILURE);
			}
			for (channel = 1; channel < channels; ++channel) {
				if (safe_read(fds[channel], bufs[channel], r) != r) {
					perror(names[channel]);
					prg_exit(EXIT_FAILURE);
				}
			}
			if (r == 0)
				break;
			c += r;
		} while (c < expected);

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/70
Repository URL: https://github.com/alsa-project/alsa-utils
