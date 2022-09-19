Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EFE5BD186
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 17:58:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 338E2950;
	Mon, 19 Sep 2022 17:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 338E2950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663603088;
	bh=EfneYqeI6pjZUhF5N//HF7NhHVcfFfi8497dpcmXQSs=;
	h=Date:From:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pRTvrIjnLL+nGAml7eV4d/Gn5VEVcTJp1+BIkgox550dn+UDVuORQyozwgiZ4z1hz
	 E7mp6kDgJvCvRzASvlmQvHJDT2ShUN/Bhj77DXIRr/5l3VGXO1wJZuCo7nvnc2Vx5y
	 xaOnvD4feKlgUHAB4uyavi5wqb+hsqxI5iLKEmqo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9125FF8032B;
	Mon, 19 Sep 2022 17:57:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EB54F80134; Mon, 19 Sep 2022 17:57:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3753F80134
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 17:57:02 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id EECCEA0040;
 Mon, 19 Sep 2022 17:57:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz EECCEA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1663603022; bh=X1870ojty5Wv+67tPAJygd/GU2+yk4IzqfWr8dK8doc=;
 h=Date:From:Subject:To:Cc:From;
 b=MWPKVD1UQxr9d4l3nmBbqvBKGkFlmMAnkKES7B0xjiaxBZ5O/sotxm5dfnrjKQGSk
 ME3ojBnTdb5oW23uIFlbPm3CJ5D7feqyt2j77O9waaMdnnWdl63ai6nvA9o/LnA9HL
 clE2XURLSghOvSx6zVD1t8xVj8jI1NaXOQ3SLR9k=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 19 Sep 2022 17:56:58 +0200 (CEST)
Message-ID: <2f37e0b2-1e82-8c0b-2bbd-1e5038d6ecc6@perex.cz>
Date: Mon, 19 Sep 2022 17:56:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
From: Jaroslav Kysela <perex@perex.cz>
Subject: HDA HDMI PCM device allocation
To: ALSA development <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

Hi,

	I am trying to fix some issues in UCM for the HDA HDMI devices [1][2]. I 
would like to summary the current situation at first (correct me, if I miss 
something):

We have two methods to map the PINs in the HDA HDMI driver to the PCM devices 
(legacy/static - 1:1 mapping, dynamic - used for new devices with the MST 
capability). There is also set of converters in each HDMI codec and the number 
of simultaneously used PCM devices cannot go beyond this count of converters 
in hardware (otherwise -EBUSY error is returned). The count of converters is 3 
or 4 depending on the hardware.

Things to discuss:

It seems quite straight to limit the count of created PCMs to the count of 
converters. We cannot use more anyway and it does not help, if more PCM 
devices are allocated (and Jacks reported) to applications when they cannot be 
used simultaneously.

Legacy/static mapping should be converted to dynamic (unless the count of 
created PCM devices is equal to the count of codec converters).

There may be 1:1 mapping between the converter and the PCM device to make 
things easier.

There is a corner case, when more HDMI devices are connected than the count of 
converters. In this case, an extra method (a module parameter and/or a control 
element and/or procfs) may be used to filter unwanted HDMI devices. It may be 
a bit difficult to select the proper filtering key - it may be the PIN/MST 
device hash or so. The driver may report this key in eld#* files (procfs).

Impact to applications:

Those days, pulseaudio or pipewire servers are mostly used on the current 
hardware. Both servers share the legacy probe code for HDMI devices - they are 
trying to open PCM devices sequentially and check for the error code. There 
should not be a problem when the connected HDMI devices do not go beyond the 
count of converters. A minor issue is that the name of the used sink/port may 
be different (users may be forced to reselect the output path).

For other applications, the PCM device assigned to the connected HDMI device 
may be different (available in a different ALSA device name). I do not think 
that it's a big issue. It should be easy solvable with an updated software 
configuration.


Let me know about your opinion about this.

					Thank you,
						Jaroslav

[1] https://github.com/alsa-project/alsa-lib/issues/245
[2] https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/2481

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
