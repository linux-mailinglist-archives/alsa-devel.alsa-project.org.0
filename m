Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F23B447A3
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Sep 2025 22:45:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1560C601A6;
	Thu,  4 Sep 2025 22:45:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1560C601A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757018745;
	bh=NsmwmA5tOa3vgabv5NsiZjX/EZg/TUGmR8Clzjc8hqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PSPUNZ20UCtgUU2LcyXymRHXFdHjvoSLKT6a50XuuYzMdx+jDc4LL8oYSz51wiN/W
	 XAaXXYpqfGDYkRmuG7XjZOMJHlEIn/U5MLd9+T3pBDpo9tjY94Otw182VBWhiXSADU
	 6ViVeqZlO6pJcT7O0kywbJs6pSrfUuqdvEt+IxUs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C713FF805C6; Thu,  4 Sep 2025 22:45:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A562F805C1;
	Thu,  4 Sep 2025 22:45:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60C0FF804B0; Thu,  4 Sep 2025 22:45:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5372F80086
	for <alsa-devel@alsa-project.org>; Thu,  4 Sep 2025 22:44:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5372F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=exIiaumB;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=bUNA2azQ
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7810E7A05C3;
	Thu,  4 Sep 2025 16:44:56 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 04 Sep 2025 16:44:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1757018696; x=
	1757105096; bh=NsmwmA5tOa3vgabv5NsiZjX/EZg/TUGmR8Clzjc8hqQ=; b=e
	xIiaumBvpXJ/U3R3V9IVKg9EqaRcHJ9K/VaOHwUUnamPa0vUEUVe3pGonX1qmXQt
	TUbAVsTqtmon/Ac8T371kqYeAKShLzcpWn+6LiHaAdWDK2z6ywISGp3kxrmRjtoB
	u56djA2N5FYnTwba5ukAk2IVYNsKd7t7fWVj/F6sbTNykuxsYb2BYcQNb/NeBf9R
	4rowj1lbjfeCo9ids2L8hxSsUL/sVrsB1Do2Kc0vgRSUiZgo6NFK1Ov7T+dh/MpY
	AM6saIV+EYLkiZxjr7mAtNLrtpbN0dxGKaAe6gv5vXUcX+uGOosKw/4CStCl/t5T
	57+Xq1GAtXNHObfEsjy6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1757018696; x=1757105096; bh=NsmwmA5tOa3vgabv5NsiZjX/EZg/TUGmR8C
	lzjc8hqQ=; b=bUNA2azQqj7VZMhEWMj1BqRE55CnXFhXjVQs9ecKfFpWh9uI7fH
	sHl8RTgmC9gom6kumNr1OIN6ErCr5qWWB7XUjtj0yQoQdarlPOFkMqmot8UhN3hY
	qVicbKjcNDksy/hX7dh8c4MRUaZULERn4yO5WeIQrvxzeXKdkEJ4oK6BhRues8jV
	RKdFUEKgerfzNupz/1aER63iuoJz7/U7mlwUn8P353wGTGdyuPQsXQYpSpfeCIyR
	obJVQcMUaEfjtTQEo8ylAHiQkgI9MQJ5pK7s3iVtpnw4Ea6glSzIXQJJYKjUroBi
	WInGXXp81UuNyY82qRcilGwU9Bc1/UjfRBA==
X-ME-Sender: <xms:R_q5aP_PlvXLW688xIW_auLmJjDiuEATI3Jtc7UOMZiMZ5Cl3BVT0Q>
    <xme:R_q5aGmz_F5r8ItzzkBhRnPo84BYcSlqJQk01P29MZ4By8Rd24KgDuaJcd05dfwjG
    W5Iwf7JRJCCJhrGOug>
X-ME-Received: 
 <xmr:R_q5aE16w1BJbNIgdPOIwNGPWhex5lZn3Vh0uMwIIClDNCuSjONzjDXGZCXyovTke0Cn0gBpd0I95Io_K4g9ahZeugqogSEbtBc>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdejtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhhihcu
    ufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjpheqne
    cuggftrfgrthhtvghrnhephefhhfettefgkedvieeuffevveeufedtlefhjeeiieetvdel
    fedtgfefuedukeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphdpnhgspghrtghp
    thhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvrhgvgiesphgvrh
    gvgidrtgiipdhrtghpthhtohepmhdrrghrmhhssgihsehgmhigrdguvgdprhgtphhtthho
    pegrlhhsrgdquggvvhgvlhesrghlshgrqdhprhhojhgvtghtrdhorhhgpdhrtghpthhtoh
    epthgrkhgrshifihgvsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:R_q5aJpOAvbof3pGeJthZcI1OOYhdGN7MIqU9pxALY7wyq9-QdAKUQ>
    <xmx:R_q5aJfhsay3OUKuikddvMJc4OEOS_L-TXHN4v3NKvt4zJvcbkv-Vw>
    <xmx:R_q5aArt3-5qOrDeortkJ2ahNZSJyNbDGeKn7VUgvSBLlB7iqS4SCA>
    <xmx:R_q5aCE3HWTXI1hVDxsK-GbQxnX-aOG-u7sj0tmvfhPZXRiAdNLXAg>
    <xmx:SPq5aI_2-zBDT-fwoTCSpuTqGyn3jpA0vMQ3jjLKuqhYtQjTsZeZbXsE>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Sep 2025 16:44:54 -0400 (EDT)
Date: Fri, 5 Sep 2025 05:44:50 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Cc: "M. Armsby" <m.armsby@gmx.de>, alsa-devel@alsa-project.org,
	Takashi Sakamoto <takaswie@kernel.org>
Subject: Re: ALSAfirewire broken / Pipewire 90ms delay
Message-ID: <20250904204450.GA221422@workstation.local>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
	"M. Armsby" <m.armsby@gmx.de>, alsa-devel@alsa-project.org,
	Takashi Sakamoto <takaswie@kernel.org>
References: <224C5A41-DCED-4FA2-BE82-898F257DA2E9@gmx.de>
 <20250724143813.GA23616@workstation.local>
 <FD6FDA7B-D958-47BB-B90C-1A82349F94E4@gmx.de>
 <48A27ABA-5EF6-400D-A47A-103C1A4ABC6D@gmx.de>
 <1B53DD0F-1D85-49EC-BA7F-970BE9AEF457@gmx.de>
 <d21fb84e-d72e-4747-a9ff-92722b93f835@perex.cz>
 <20250903111519.GA76122@workstation.local>
 <3e07de0a-affa-4776-9172-83b2b071fbe8@perex.cz>
 <20250904131807.GA209723@workstation.local>
 <13e0868a-6528-42fa-ab9a-2b5e37e095f3@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13e0868a-6528-42fa-ab9a-2b5e37e095f3@perex.cz>
Message-ID-Hash: JLKWXKN4SXPZXNVB47HPOG3UNGKIQ7IK
X-Message-ID-Hash: JLKWXKN4SXPZXNVB47HPOG3UNGKIQ7IK
X-MailFrom: o-takashi@sakamocchi.jp
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JLKWXKN4SXPZXNVB47HPOG3UNGKIQ7IK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Sep 04, 2025 at 03:32:52PM +0200, Jaroslav Kysela wrote:
> It would be nice to check the buffer size / period size values using procfs
> for the problematic 2048 setup (see the referred thread), if there's a
> demand to fix this. Maybe there's a mismatch between GUI/sound server
> settings and driver settings.

Please suggest that all people involved in the discussion use strace(1)
to determine whether the failure originates from SNDRV_PCM_IOCTL_HW_PARAMS
or SNDRV_PCM_IOCTL_PREPARE, since the alsa-lib API, 'snd_pcm_hw_params()',
involves both and can be misleading.


Thanks

Takashi Sakamoto
