Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8A86DC411
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Apr 2023 09:57:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 648B8F22;
	Mon, 10 Apr 2023 09:56:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 648B8F22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681113462;
	bh=9dIFX3pM5x+qwaPb4y6W6dFtA8fu0m942AZigej6Rg4=;
	h=Date:From:To:Subject:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=t8jgnwz1gEpn5qKNQS56CJejY7XrKTSNp8BvRrE75ofNQTBwSridaXAffwEcVmOtr
	 gQdofCeP+DFGbrQnkHmCcZ8EBlR5MA77248OQB58BXD6L8BpQr3a1hQ/eA0LEWQCF8
	 9wCLh7Io6yRhV81fm31cs2lw5cHfEDLktybK/eDg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E7E3F8025E;
	Mon, 10 Apr 2023 09:56:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24D22F80246; Thu,  6 Apr 2023 16:42:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sender4-op-o10.zoho.com (sender4-op-o10.zoho.com
 [136.143.188.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA8B2F8013D
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 16:42:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA8B2F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=arinc9.com header.i=arinc.unal@arinc9.com
 header.a=rsa-sha256 header.s=zmail header.b=Twr9TPaK
ARC-Seal: i=1; a=rsa-sha256; t=1680792157; cv=none;
	d=zohomail.com; s=zohoarc;
	b=lhFsL36wim/K65jIXa+gIFWbzebSGbXx5n0fwvKrzfu74fy+ANSpJza+GdIU9UKyFoZCJVYNKmgYQ0SIIzfTGLdnalLYqztpC5qR9ZBNVL7bYuVFBjW2/X0Y+WUEPhTdXSPenswuawwBNRXEcvqcxZph3lae73tX+axRaaGLj9A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1680792157;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
	bh=U4WFoqaG/WTz/rldWrbpYj6I6++dLC1ugFzEHCLlJ1M=;
	b=OBesM/jnC1O+4SAh5OVj0rUVc7PWoewWj/rr8j/E9QoARht+Agr+F4MVaGi7OkZfjHM0CpfGRf7lgHkmVWQLvyG8DJ1b6yZsxm/W5+7puPDFyRnOBjC7zNo3iFvf352rw/8eVW+5Zb/OTWemejyP7Xp+dM+/ytbD5g6VexFql5A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1680792157;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:From:From:To:To:Cc:Cc:Subject:Subject:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=U4WFoqaG/WTz/rldWrbpYj6I6++dLC1ugFzEHCLlJ1M=;
	b=Twr9TPaKPpapwK8oz14Qz7EpLcbHKpDu7SfBYDhqq6WwAm7JjIkv/dABRoMMuDeX
	NynZnpBrGVI0koHOX3mPiQBXKzURu9fu4yMpkP3A9d5qZntMHdcnv1N+NMn14QqnBjb
	9whSaKFYV1zxQ8erZcA9ORHqJ64+99XNRGt0RacE=
Received: from [10.10.10.248] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1680792155340132.56001297566422;
 Thu, 6 Apr 2023 07:42:35 -0700 (PDT)
Message-ID: <3c1eda4a-2dfc-a0d0-d4f5-8b475440a21e@arinc9.com>
Date: Thu, 6 Apr 2023 17:42:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>
Content-Language: en-US
Subject: Computer Audio Appears on Input Device
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-MailFrom: arinc.unal@arinc9.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GOZRNDK2MHQVV2TTXPMJ2EHYF6HUFEXF
X-Message-ID-Hash: GOZRNDK2MHQVV2TTXPMJ2EHYF6HUFEXF
X-Mailman-Approved-At: Mon, 10 Apr 2023 07:53:23 +0000
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 wulcato@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GOZRNDK2MHQVV2TTXPMJ2EHYF6HUFEXF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi all,

Me and my friend have got a problem with the computer audio being sent 
to the receiver as if the headphone microphone hears it.

I've got a generic headphone with a microphone. It's got a single jack.

When I plug it to the laptop two devices are detected. Headphones for 
output, microphone for input.

As an incorrect behaviour, the computer audio appears on the input 
device along with output. The expected behaviour should be the audio 
appears only on the output device.

I tried this on my laptop and headphone while my friend tried it on 
their laptop and headphone.

I've tried it on Linux v6.3-rc5 while my friend tried it on v6.1.

My laptop has got this audio device:

00:1f.3 Multimedia audio controller: Intel Corporation Comet Lake PCH-LP 
cAVS

My friend's laptop has got these:

05:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Family 17h/19h 
HD Audio Controller

05:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Renoir 
Radeon High Definition Audio Controller

I assumed this was a problem with the HD-Audio Controller driver on 
Linux as I don't see this behaviour on Windows 10. The drivers on 
Windows 10:

AMD High Definition Audio Device 10.0.1.24
Realtek (R)  Audio 6.0.9132.1

What could be causing this behaviour on Linux?

Thanks.
Arınç
