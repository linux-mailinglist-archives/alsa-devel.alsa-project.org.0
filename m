Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B527932B6
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Sep 2023 01:56:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C6897F1;
	Wed,  6 Sep 2023 01:55:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C6897F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693958172;
	bh=RL56H2R1fieBsfqM0aisZr93umGofhlCdNLGPJnEMDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K7ZGVyYJ+3IVKf28LWxQU+OlFdGIhnzY+5TlD2MWbgqiWSYdj2rN3YtBAzMsG/ZKL
	 IMP9A95g+NkFJ3d4MM8Usmsm7OENoBIuBRPKDvUq7UWittmwHrcUBSBmD7YXU6BKHK
	 4KI49eqJ6fOPpMz4k+ZtTqB5tA/0kgEwucUf/pc4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB027F800AA; Wed,  6 Sep 2023 01:55:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AB17F8047D;
	Wed,  6 Sep 2023 01:55:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA3E8F80494; Wed,  6 Sep 2023 01:54:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86C1BF80236
	for <alsa-devel@alsa-project.org>; Wed,  6 Sep 2023 01:54:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86C1BF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=fbfogEFc;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=v/qcNXbD
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id A2F075C0076;
	Tue,  5 Sep 2023 19:54:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 05 Sep 2023 19:54:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1693958086; x=
	1694044486; bh=dPsHDpN7+anTUdYdobzSVtgJ1EWm27pUVlVyegakwzo=; b=f
	bfogEFcuW2QxFALX6Grc//na0AASVbk+oWVdKyyzXtE8yBoL05omc3HQZGk7flrt
	cFvzsMZll1/IcnLg8AWO92oZZsiCJFqRvLOwNb0lJW4/ZS7FUIdlRiOI3MbDliYV
	oBvTPwy7fmVPG2WrFaFksE+YN7r5O0e4ssrUtKC0WU/V/bkkCafwV63+H7YDbB/U
	4zLAWgQvX7hnZ5RM7FPrFWe3J+Zyqgyv/hyKpN6tYZSr514fYZCIeQY343hwCBUQ
	lmy1s2WjvF/4wDAAYiXVDI3MGmbQ0yReOEwoZ2P9Vb5p+GcLhMSyRB//a0EP80PM
	ubANu8D4OtVT4Jp4rbY9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1693958086; x=1694044486; bh=dPsHDpN7+anTU
	dYdobzSVtgJ1EWm27pUVlVyegakwzo=; b=v/qcNXbDYPJl44RWAOk1QjFmu/LIP
	WP5HK7ghSa2FkM4CZ5ycJGH/wROzaLJre0yp0eWN15NhfFCWAMmdbb4s1QYnxq/C
	j4TsO1mEjOLGmMTK8Qga/z9gSTqARoUOjKN4fLLiSS3wfMnvjPDzxnBmV8ha7V/S
	hAgQRswCBmI+oJaDTi4IZ0GUES/uFeehkI8hK1R73RQBN0hM1pOvTw0W7sM31Y1J
	wuNM+ITf+NeREY3k/DgOV1ehjXTd4/cxkzQLpD+T4aB07j09Y+ZxYax4S/b9zqiY
	4gocTDJ9iMeNxQjVfTKzJvPW4rVTSvGF0i29zw2ERbCA9FuvV9gTB7o+A==
X-ME-Sender: <xms:xb_3ZD2HCVmy30KNWnj-bm6niQ6Z5J32UGBNvZIkYgJynnJwqvPvxg>
    <xme:xb_3ZCF_wVIc7SZNPphMcTpGQR_TfioFawe2OHuTnVd3KXVjujen6ozTEPPmkGT90
    5ejHp-la1ba7S8Rk6A>
X-ME-Received: 
 <xmr:xb_3ZD4fZ9wjqtjPycjTVk3E3fxFugGswOAw1R47TdYOAhUqiLBRY7Uhw5mG4-k_FjkIdU0i-16gl3Jvj3tq-YeoE3heLLva06Q>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrudehvddgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
    shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjpheqnecuggftrfgrthhtvghrnhepjeeggeeuieegleeiffdvjeevkeduueelleevvdff
    ueejgfetieevtdelueevteeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhith
    hhuhgsrdgtohhmpdhffhgrughordhorhhgpdifvghishhsrdgthhenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrg
    hkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:xr_3ZI1tBVSENeBPkzdRDCai7EDVDCUqTOxPMnuCiyD8sxgTBrn3Jg>
    <xmx:xr_3ZGEX_CbzmPlDlN5Ilinel_SuZBovLq6FwDY1v2kauldWWanEyg>
    <xmx:xr_3ZJ-2qULNXYnB5StncdAEm6YFx5DFy90cIt4tGZ3XizSb89X0Lg>
    <xmx:xr_3ZLRP1PX0WGVehVhBOtf-KlJ9Fbbf-fej1gy96SD_YVISru7o-Q>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Sep 2023 19:54:44 -0400 (EDT)
Date: Wed, 6 Sep 2023 08:54:41 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Michele Perrone <michele.perrone@weiss.ch>,
	Rolf Anderegg <rolf.anderegg@weiss.ch>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Subject: INT203 and DAC1 (Re: [PATCH] ALSA: dice: add stream format
 parameters for Weiss devices)
Message-ID: <20230905235441.GA24829@workstation.local>
Mail-Followup-To: Michele Perrone <michele.perrone@weiss.ch>,
	Rolf Anderegg <rolf.anderegg@weiss.ch>,
	Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
Message-ID-Hash: QXYWP53MLL3XPNXIHH67B7RPZZKD3TU2
X-Message-ID-Hash: QXYWP53MLL3XPNXIHH67B7RPZZKD3TU2
X-MailFrom: o-takashi@sakamocchi.jp
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QXYWP53MLL3XPNXIHH67B7RPZZKD3TU2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Rolf and Michele,

I'm working to fulfill hardware database of systemd project[1] for Weiss models with received
collection of configuration ROM, then have some issues. I would ask you to provide information
to solve them.

This is the table of the value of model ID field and model name.

                snd-dice    am-config-roms  systemd hwdb
DAC202          0x000007    0x000007        0x000007
DAC202(Maya)    0x000008    not yet         not yet
MAN301          0x00000b    0x00000b        not yet
INT202          0x000006    0x000006        0x000006
INT203          0x00000a    0x000006 (?)    not yet
ADC2            0x000001    0x000001        0x000001
DAC2/Minerva    0x000003    0x000003        0x000003
Vesta           0x000002    0x000002        0x000002
AFI1            0x000004    0x000004        0x000004
DAC1            not yet (?) not yet (?)     0x000005

I have two issues.

1. INT203

The modalias table in ALSA dice driver[2] includes 0x00000a for the model, while the configuration
ROM includes 0x000006. Michele wrote commit comment for it[3]:

```
Note: the INT203 presents itself as INT202, because the firmware
      running on the two devices is the same.
      The difference between the two lies in a jumper setting
      inside the device.
```

In my opinion, there are multiple hardawre revisions for the model.

2. DAC1

When committing to hardware database of systemd project[4], I referred to libffado2 configuration
file[5]. It includes `DAC1` with model ID 0x000005, while it is neither found in ALSA dice driver
nor the collection of configuration ROM. As long as searching DAC1 in website of Weiss Engineering,
I can see DAC1-mk3 has option card for IEEE 1394 connection[6]. Would I request you to provide
information about the model?

[1] `hwdb.d/80-ieee1394-unit-function.hwdb` in systemd project
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/firewire/dice/dice.c?id=4fb0dacb78c6a041bbd38ddd998df806af5c2c69#n395
[3] https://github.com/takaswie/am-config-roms/commit/e6717b3cbb4a
[4] https://github.com/systemd/systemd/commit/ff1cb7b9393ac
[5] http://subversion.ffado.org/browser/trunk/libffado/configuration
[6] https://weiss.ch/products/pro-audio/dac1-mk3/


Regards

Takashi Sakamoto
