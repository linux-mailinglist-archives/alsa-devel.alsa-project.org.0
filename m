Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15872842896
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jan 2024 17:01:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFB131530;
	Tue, 30 Jan 2024 17:01:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFB131530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706630481;
	bh=0KL/Y0SnobL/6n/MUpYveoYcHEtx4NlHTFVtjPAIIRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VMU9yDAzR4YciOMGATAdCLVPqh47Y56ABxNMsOr/nzeKurOpYtov/VwQ9BYfSnQof
	 NAJsfORvQf8akjeajQ5jYP8jVsQcHFAbHpN8KMov3KIQeZwMP/BxW63vxm2RW51Dcz
	 l1n4cXJ9iDc8vdbpQJDL1uo5uXz8KH2D6wLUwcbA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 043E7F80571; Tue, 30 Jan 2024 17:01:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94A35F805B5;
	Tue, 30 Jan 2024 17:01:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 128EFF80567; Tue, 30 Jan 2024 17:00:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3103CF80564
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 17:00:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3103CF80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=E4J0i8c7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0DE24CE1A4D;
	Tue, 30 Jan 2024 16:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5FC3C433F1;
	Tue, 30 Jan 2024 16:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706630452;
	bh=0KL/Y0SnobL/6n/MUpYveoYcHEtx4NlHTFVtjPAIIRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E4J0i8c79Ox8p/S7gFAvjkgr8SkNJ0KTSs/GHu0RmE+VRkNU62vrfwElr50l4ppl9
	 trNKevIb7cmeB1zkvbQ1pykYQFPUquB+Ls9IhZOYhbwUp11/JwGL8+LYcJcQ+Ez3gc
	 DZkF9STkQ8NZ3cKZBao73QXUjg58A0FPGzUTFUEtZRmx9Kr1MRMgP2wN9yzDoNY9t2
	 fWjt2mPXFHaSx+D07LobsoQpKD3Kq523SkCrMeqrbBtTOL5Nig9d7cWIyNitjwjBhE
	 AOLijyK7sFUfhwRs0907uOAF8oMcqcH6aBPDBlasfzQFZun00M0HKNclez6aeKRBxP
	 8zw64+0rpYUcw==
Date: Tue, 30 Jan 2024 21:30:48 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, vinod.koul@intel.com,
	venkataprasad.potturu@amd.com,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V4 06/13] soundwire: amd: refactor register mask structure
Message-ID: <ZbkdMKp-vGdJfZ_b@matsya>
References: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
 <20240129055147.1493853-7-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129055147.1493853-7-Vijendar.Mukunda@amd.com>
Message-ID-Hash: 3CZNIHKVXQJI2D2HJBED2MQ4TCGR7AAY
X-Message-ID-Hash: 3CZNIHKVXQJI2D2HJBED2MQ4TCGR7AAY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3CZNIHKVXQJI2D2HJBED2MQ4TCGR7AAY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29-01-24, 11:21, Vijendar Mukunda wrote:
> Register mask array structure is no longer needed as except interrupt
> control masks, rest of the register masks are not used in code.
> Use array for interrupt masks instead of structure.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
