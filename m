Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0201F2950BA
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Oct 2020 18:29:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F9BC176D;
	Wed, 21 Oct 2020 18:29:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F9BC176D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603297791;
	bh=Fg9cxFyryXTJQNYsnhcv2J9NBRoboZH3ldO2MAVbQdY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cfe7s3gcZ1419ueeMnt088dv95aFd38rYB6lJR/U3hm9l6JxLMbUiqR2FRRgltjRA
	 5MC65ly5sy50+t0b3jOGmFAhz6iD4sfrviffS1E53k58KdOExA/AeLBIyojyxHQYet
	 Rs/36t/QxgoaeLVKa/X6XR7ujMYfZgRRewKxcRZE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22C02F80264;
	Wed, 21 Oct 2020 18:28:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A58EF80264; Wed, 21 Oct 2020 18:28:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id BFDABF80111
 for <alsa-devel@alsa-project.org>; Wed, 21 Oct 2020 18:27:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFDABF80111
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1603297674082875967-webhooks-bot@alsa-project.org>
References: <1603297674082875967-webhooks-bot@alsa-project.org>
Subject: bug in the ALSA driver 'snd_hda_intel'
Message-Id: <20201021162805.3A58EF80264@alsa1.perex.cz>
Date: Wed, 21 Oct 2020 18:28:05 +0200 (CEST)
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

alsa-project/alsa-lib issue #90 was opened from Mysgym:

Hello,
after spending some time troubleshooting an issue with an audio interface (using snd_hda_intel). I've stumbled upon this message from PulseAudio in the journal :
`Oct 17 18:30:58 LaptopName pulseaudio[1782]: E: [alsa-sink-ALC256 Analog] alsa-sink.c: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Oct 17 18:30:58 LaptopName pulseaudio[1782]: E: [alsa-sink-ALC256 Analog] alsa-sink.c: Most likely this is a bug in the ALSA driver 'snd_hda_intel'. Please report this issue to the ALSA developers.
Oct 17 18:30:58 LaptopName pulseaudio[1782]: E: [alsa-sink-ALC256 Analog] alsa-sink.c: We were woken up with POLLOUT set -- however a subsequent snd_pcm_avail() returned 0 or another value < min_avail.
`
So I filed a bug report

This is Manjaro on Kernel 5.8

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/90
Repository URL: https://github.com/alsa-project/alsa-lib
