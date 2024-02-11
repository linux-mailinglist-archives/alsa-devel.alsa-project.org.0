Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B49F5850993
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Feb 2024 15:14:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6C6DE0;
	Sun, 11 Feb 2024 15:14:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6C6DE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707660860;
	bh=+A68fHDLxGgoa8YSsnH+X/QQsb4s83CpC4PxrdcrkBs=;
	h=Date:From:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=pWIDipC63EqokiUEjZLdqR1i6Qs1ek7eHS72b2tg+GHQI52J48Fy48zzOb5cS490G
	 qyT58IxTU5du7kTW+QYm5BZJJ+mIl8P8BE/w8lSxvAFlMYVSpx76lFBr/tjhRKbj3X
	 ZUU5Xl4TnnzXBqZYrCh54mOVpsguTz++8uz3S4mo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2864F8057D; Sun, 11 Feb 2024 15:13:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D17FF805A1;
	Sun, 11 Feb 2024 15:13:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41204F80238; Sun, 11 Feb 2024 15:12:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp.ivitera.com (smtp.ivitera.com [88.101.85.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21C58F800EE
	for <alsa-devel@alsa-project.org>; Sun, 11 Feb 2024 15:12:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21C58F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ivitera.com header.i=@ivitera.com header.a=rsa-sha256
 header.s=mail header.b=Ay/bwRdC;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.a=rsa-sha256 header.s=mail header.b=Ay/bwRdC
Received: from localhost (localhost [127.0.0.1])
	by smtp.ivitera.com (Postfix) with ESMTP id E87871029A;
	Sun, 11 Feb 2024 15:12:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1707660748; bh=+A68fHDLxGgoa8YSsnH+X/QQsb4s83CpC4PxrdcrkBs=;
	h=Date:From:Subject:To:From;
	b=Ay/bwRdCrAFsb0v4vRziVUSeibXOCNHWBQTCDG+0jZf10+eWFpvYi/T9heeG350k+
	 dEUgX2/AEyU+Zp7tJAW4ID1EQhqQmtLWEhArW3951aZSnCPNTZ8/tZuqMbuPi6yAE2
	 8kJh8xIc1y3HVdNsPFfoPlLULnqN4c3KRRvTEJgc=
Received: from smtp.ivitera.com ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EumA0KP4gADm; Sun, 11 Feb 2024 15:12:28 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by smtp.ivitera.com (Postfix) with ESMTPSA id 6212E10519;
	Sun, 11 Feb 2024 15:12:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1707660748; bh=+A68fHDLxGgoa8YSsnH+X/QQsb4s83CpC4PxrdcrkBs=;
	h=Date:From:Subject:To:From;
	b=Ay/bwRdCrAFsb0v4vRziVUSeibXOCNHWBQTCDG+0jZf10+eWFpvYi/T9heeG350k+
	 dEUgX2/AEyU+Zp7tJAW4ID1EQhqQmtLWEhArW3951aZSnCPNTZ8/tZuqMbuPi6yAE2
	 8kJh8xIc1y3HVdNsPFfoPlLULnqN4c3KRRvTEJgc=
Message-ID: <15fc18e6-b4f1-e309-4353-d2e41946750b@ivitera.com>
Date: Sun, 11 Feb 2024 15:12:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
From: Pavel Hofman <pavel.hofman@ivitera.com>
Subject: ALSA-LIB: correct IEC958 preambles for PCM multichannel?
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2U5BPZ74253RL6KODVF4QVLDYYFWNJCX
X-Message-ID-Hash: 2U5BPZ74253RL6KODVF4QVLDYYFWNJCX
X-MailFrom: pavel.hofman@ivitera.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2U5BPZ74253RL6KODVF4QVLDYYFWNJCX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

I wonder if the pcm_iec958.c correctly sets preambles for multichannel 
PCM/LPCM. It looks as if coded only for stereo.

IIUC the X/Y preambles should alternate for even/odd channels.

This check 
https://github.com/alsa-project/alsa-lib/blob/master/src/pcm/pcm_iec958.c#L122 
:

if (channel)
		data |= iec->preamble[PREAMBLE_Y];	/* odd sub frame, 'Y' */
	else if (! iec->counter)
		data |= iec->preamble[PREAMBLE_Z];	/* Block start, 'Z' */
	else
		data |= iec->preamble[PREAMBLE_X];	/* even sub frame, 'X' */


IMO the condition should be "if (channel % 2)", because for multichannel 
only the first even channel ch0 gets Y, and the remaining even channels 
ch2, ch4, ... get X. This is confirmed by analyzing the generated stream 
captured with the file plugin.

Also I am not sure if counting the subframes for Z preamble in 
https://github.com/alsa-project/alsa-lib/blob/master/src/pcm/pcm_iec958.c#L182 
respects the multichannel. I do not know what "parallel IEC958 streams" 
mean, how the Z preamble should be placed for PCM multichannel.

A) Either it can count all channel pairs sequentially up to 192, i.e. 
preamble Z after 192 pair of (ch0, ch1), (ch2, ch3),...

If so, IMO the incrementation in 
https://github.com/alsa-project/alsa-lib/blob/master/src/pcm/pcm_iec958.c#L229 
should increment by channels/2, not by 1 (which fits for channels=2)


B) Or it can count each channel pair separately, i.e. 4 preables Z (for 
8ch) in a row after 192 pairs of (ch0+ch1), 192 pairs of (ch2+ch3), etc.

If so, IMO the counter should be reset after looping for all channel 
frames also for PCM, not only for nonaudio/single_stream 
https://github.com/alsa-project/alsa-lib/blob/master/src/pcm/pcm_iec958.c#L232-L233

The reason I am looking at this code are the problems with channel swaps 
at xrun handling of RPi HDMI 
https://forums.raspberrypi.com/viewtopic.php?p=2187582#p2187540. I 
suspect the iec958 plugin does not generate correct multichannel IEC958 
stream which confuses the HDMI receiver at the stream recovery.

Thanks a lot,

Pavel.
