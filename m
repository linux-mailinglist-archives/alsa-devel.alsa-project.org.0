Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48185835BAB
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 08:33:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B918174C;
	Mon, 22 Jan 2024 08:33:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B918174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705908803;
	bh=w3x6fjQRj1G239oK4GnIyAbnMwFvI9UCv7x3oK55Llk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SGLKSq1HxGQeO4lwd02b01mfIwRWyAVm8XYmjzDI2aY1N9A1fsuPQRCa2cFSOcQXm
	 mpoo2zNMauyNjn4krkg18kPDsQPOtzcugDhNQa17G0NxO1hmSD25QF7tEX5/m0obFf
	 pNcGACAPPqJGC6NIMb/ZfIQ0GKm+rUGA7Imo7ZEg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 558D0F804E7; Mon, 22 Jan 2024 08:33:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DEAB5F8028D;
	Mon, 22 Jan 2024 08:33:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F684F8025F; Mon, 22 Jan 2024 08:32:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 028C7F80149
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 08:32:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 028C7F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kThrX8DK
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 940CCCE28E7;
	Mon, 22 Jan 2024 07:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE58C43390;
	Mon, 22 Jan 2024 07:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705908756;
	bh=w3x6fjQRj1G239oK4GnIyAbnMwFvI9UCv7x3oK55Llk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kThrX8DKkqS/wgk/ydg8e9O+Ht9U9dFKbiK8Wz5sBUH/T6Mg8bQzwwD07efNxXaq7
	 /+MzyqpQT89gC5+AKc7k5Sdz4ZyJ9CcACJCWFdg36WHwKwLRkOyZqZGu0hShqb1IH+
	 oA4emJvBTNrhC1wJvyaX/nSsibnHprJ6dUmCN7vx0hRy7UGyGzjOHWrjq+iZ8pZbmG
	 5lEkXS6DBgFiI9wC1cC4S/YaHeI6sfGC6ZpgtBue37FMVdtkhOyhIJ4SOg50iGpoS2
	 FIfFHFYnJvE3smS3jq06+Jh1vU0C8euG/+x7hDneaj0hYxVeyQHtHcRfNOBifu85EL
	 IGWpPJfUqfYzA==
Date: Mon, 22 Jan 2024 13:02:32 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, vinod.koul@intel.com,
	venkataprasad.potturu@amd.com,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Arnd Bergmann <arnd@arndb.de>, Marian Postevca <posteuca@mutex.one>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>
Subject: Re: [PATCH V2 01/13] ASoC/soundwire: implement generic api for
 scanning amd soundwire controller
Message-ID: <Za4aEL1NaGS8UeGr@matsya>
References: <20240110094416.853610-1-Vijendar.Mukunda@amd.com>
 <20240110094416.853610-2-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240110094416.853610-2-Vijendar.Mukunda@amd.com>
Message-ID-Hash: D7WWOX7AMFTZQ7YXMKQSEFJV2MOB7WSV
X-Message-ID-Hash: D7WWOX7AMFTZQ7YXMKQSEFJV2MOB7WSV
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D7WWOX7AMFTZQ7YXMKQSEFJV2MOB7WSV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10-01-24, 15:14, Vijendar Mukunda wrote:
> Implement generic function for scanning SoundWire controller.
> Same function will be used for legacy and sof stack for AMD platforms.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
