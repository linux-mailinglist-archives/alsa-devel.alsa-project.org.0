Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B11F5843D21
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jan 2024 11:47:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BBCAEB6;
	Wed, 31 Jan 2024 11:47:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BBCAEB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706698073;
	bh=jNNQtCUF5VXKJ6YIrjxUrq1PMn9N1ckIoecQT3lV168=;
	h=Date:Subject:From:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=KRFe56GkYbUPRYfQDaCcFB8ChQJ99LnYA13lBHw/2dggvDMBMkhDj0P+h2QJrgrsc
	 41OzNoEha3K8c3xDmE1qN/7giImGfMbXiJtufYkdnXQgImF3BcR0SjuQF+ci0sNJCi
	 jrQUPTlW4RJnCzZq9QHOFBxPMuXXzdRxJjuzwPFE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5320CF805A9; Wed, 31 Jan 2024 11:47:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 632D4F805A8;
	Wed, 31 Jan 2024 11:47:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA8EAF8055C; Wed, 31 Jan 2024 11:47:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp.ivitera.com (smtp.ivitera.com [88.101.85.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D139F804E7
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 11:47:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D139F804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ivitera.com header.i=@ivitera.com header.a=rsa-sha256
 header.s=mail header.b=WJSVcBiP;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.a=rsa-sha256 header.s=mail header.b=Z3JfoF3R
Received: from localhost (localhost [127.0.0.1])
	by smtp.ivitera.com (Postfix) with ESMTP id 60E6713111
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 11:46:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1706698019; bh=jNNQtCUF5VXKJ6YIrjxUrq1PMn9N1ckIoecQT3lV168=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=WJSVcBiPb66jJBnMf41mdJPr1H/K4kitqq3D6vMb6FDaQssPgdFKEFd2VH0s15RzE
	 f+BkgRqAj9iB1Z7hHMHcfEusUcZVelJKpcWaRtnoKvwaT5UGR6axzF2Q0pq0AIfawV
	 YamDQBApeZJ39p5eesvG/555IwAizj1gQq5C3Faw=
Received: from smtp.ivitera.com ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zPqvZKWH9a-L for <alsa-devel@alsa-project.org>;
	Wed, 31 Jan 2024 11:46:59 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by smtp.ivitera.com (Postfix) with ESMTPSA id E0E4711F45
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 11:46:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1706698018; bh=jNNQtCUF5VXKJ6YIrjxUrq1PMn9N1ckIoecQT3lV168=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=Z3JfoF3R/BcTLKlNb6a2ad+laCc3MadR5kc6fu4NDOiYU5bknK4O2G8XKzoTJnNQJ
	 YnoFNmLbatU94x0x5qtynNvX9XdGdHEZ7PXC0ilDVi0AQ6+BZWFWK1XklqtmJSZ57j
	 9Rsg3olz0TuaXM4MH34gtb81GCoL9D9Tfm7fi6As=
Message-ID: <7c66a48f-a3c8-d1a9-a039-db916147e14a@ivitera.com>
Date: Wed, 31 Jan 2024 11:46:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: ALSA-LIB: xrun recovery in iec958 plugin for 8ch HDMI?
Content-Language: en-US
From: Pavel Hofman <pavel.hofman@ivitera.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <133a2e13-0bb8-bd2d-a1b4-9953a88a608c@ivitera.com>
In-Reply-To: <133a2e13-0bb8-bd2d-a1b4-9953a88a608c@ivitera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L2TRYMLVIQY7DIIUBS2662352YQX2H5G
X-Message-ID-Hash: L2TRYMLVIQY7DIIUBS2662352YQX2H5G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L2TRYMLVIQY7DIIUBS2662352YQX2H5G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dne 31. 01. 24 v 9:48 Pavel Hofman napsal(a):
> Hi,
> 
> Users of RPi's  hdmi:vc4-hdmi report random channel swapping after an 
> xrun. Tested (among other clients) on speaker-test, details 
> https://forums.raspberrypi.com/viewtopic.php?p=2187582#p2187540
> 
> Experienced RPi developer has diagnosed the driver - HDMI device and DMA 
> are correctly reset at xrun recovery (i.e. snd_pcm_stop(XRUN) in the 
> driver -> snd_pcm_prepare in the client).
> 
> Therefore an option is that alsa supplies misaligned 8ch samples after 
> the xrun recovery.
> 
> Users checked the older HDMI driver bcm2835_audio (bcm2835-pcm.c) which 
> accepts standard S16/24_LE formats and does not require the iec958 
> plugin and xruns did not cause any channel swaps.
> 
> Hence aiming at the iec958 plugin. It seems to keep state (e.g. 
> iec->counter) which perhaps may not be reset at snd_pcm_prepare.
> 

Hm, iec->counter seems to be reset correctly at prepare through 
plugin->prepare -> snd_pcm_plugin_call_init_cb -> snd_pcm_iec958_init . 
It should mark the audio block with 'Z' on the first byte of the 
recovered stream OK. Could perhaps be any cached samples within the 
chain, not cleared by prepare? But that would cause issues in other 
cases too... So I have no idea now :-)
