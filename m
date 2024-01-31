Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A144B8439B8
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jan 2024 09:52:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D72FDF8;
	Wed, 31 Jan 2024 09:52:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D72FDF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706691153;
	bh=xAF75dQwYwgr081ZIIllWIFRHlSn4U64Rxpf8O2aMF8=;
	h=Date:To:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NFI2owtgCF+hJcHtuolTVTItouHk+FlwuN3kk5pD6IO6AGKKjXdGJH10sZO26yzgc
	 wKpaqhKooIGrORSiCH3sDmVg28ypyFWE2cA95wJKpQH4EF9r45u98KNmpH0EXp4coj
	 jYsPkz71Wq3XvzRnsRxZ9yEvtwBVtjmlvSXmzobA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EB72F80578; Wed, 31 Jan 2024 09:52:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10CBCF805A1;
	Wed, 31 Jan 2024 09:52:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BA8AF8055C; Wed, 31 Jan 2024 09:49:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp.ivitera.com (smtp.ivitera.com [88.101.85.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C437F804E7
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 09:48:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C437F804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ivitera.com header.i=@ivitera.com header.a=rsa-sha256
 header.s=mail header.b=R2YCuQ4B;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.a=rsa-sha256 header.s=mail header.b=R2YCuQ4B
Received: from localhost (localhost [127.0.0.1])
	by smtp.ivitera.com (Postfix) with ESMTP id ADD3812C4E
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 09:48:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1706690928; bh=xAF75dQwYwgr081ZIIllWIFRHlSn4U64Rxpf8O2aMF8=;
	h=Date:To:From:Subject:From;
	b=R2YCuQ4BHdoV1x5bMWPeCrS67aQ6IlFs84nBGsRK+cP2JNiWhshSvINy8rNgY85Cy
	 9JidNNpsMTW3S4G/9CwjzU1tPY3rlC6rfAlvcZb5mRjGSjjHvcU55xv8qr/P3EvQ1/
	 dpkYJDAg1BEQGDB/TUGrMvGgaRRo4zvKzmVLSxDo=
Received: from smtp.ivitera.com ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3LK_d2d6A6MX for <alsa-devel@alsa-project.org>;
	Wed, 31 Jan 2024 09:48:48 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by smtp.ivitera.com (Postfix) with ESMTPSA id 2887A129D9
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 09:48:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1706690928; bh=xAF75dQwYwgr081ZIIllWIFRHlSn4U64Rxpf8O2aMF8=;
	h=Date:To:From:Subject:From;
	b=R2YCuQ4BHdoV1x5bMWPeCrS67aQ6IlFs84nBGsRK+cP2JNiWhshSvINy8rNgY85Cy
	 9JidNNpsMTW3S4G/9CwjzU1tPY3rlC6rfAlvcZb5mRjGSjjHvcU55xv8qr/P3EvQ1/
	 dpkYJDAg1BEQGDB/TUGrMvGgaRRo4zvKzmVLSxDo=
Message-ID: <133a2e13-0bb8-bd2d-a1b4-9953a88a608c@ivitera.com>
Date: Wed, 31 Jan 2024 09:48:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: Pavel Hofman <pavel.hofman@ivitera.com>
Subject: ALSA-LIB: xrun recovery in iec958 plugin for 8ch HDMI?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CNQGGNPEG6JNIRJB7KAJ2WLWFE4JPOM4
X-Message-ID-Hash: CNQGGNPEG6JNIRJB7KAJ2WLWFE4JPOM4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CNQGGNPEG6JNIRJB7KAJ2WLWFE4JPOM4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Users of RPi's  hdmi:vc4-hdmi report random channel swapping after an 
xrun. Tested (among other clients) on speaker-test, details 
https://forums.raspberrypi.com/viewtopic.php?p=2187582#p2187540

Experienced RPi developer has diagnosed the driver - HDMI device and DMA 
are correctly reset at xrun recovery (i.e. snd_pcm_stop(XRUN) in the 
driver -> snd_pcm_prepare in the client).

Therefore an option is that alsa supplies misaligned 8ch samples after 
the xrun recovery.

Users checked the older HDMI driver bcm2835_audio (bcm2835-pcm.c) which 
accepts standard S16/24_LE formats and does not require the iec958 
plugin and xruns did not cause any channel swaps.

Hence aiming at the iec958 plugin. It seems to keep state (e.g. 
iec->counter) which perhaps may not be reset at snd_pcm_prepare.

Thanks a lot,

Pavel.
