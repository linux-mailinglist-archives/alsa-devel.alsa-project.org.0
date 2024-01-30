Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C62B84288C
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jan 2024 16:59:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8864EE0D;
	Tue, 30 Jan 2024 16:59:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8864EE0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706630385;
	bh=ayeCCM9eX9UuzR6QhI1Yi/QBnlgDh998JcXlC3hLB44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cQOfPHOvL+erdz6kOvIUE7Viq2lbG+LFY10d7XTnQZ5+72HWg31atZYQ4UO95bEFM
	 4Gdh69+NPcNriB6F8JaOLfPKsmzZ3t7CPmI5oQGLrN6GjUG2d4XK7isg3Uqt2qnsZH
	 ovhelSgW9oRIb1vwhfcDSeOw6pttYPPome8sEiHs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4A29F805BB; Tue, 30 Jan 2024 16:59:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B264F80564;
	Tue, 30 Jan 2024 16:59:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBD5DF80588; Tue, 30 Jan 2024 16:59:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06E70F80548
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 16:59:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06E70F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S9EHfRRg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6AB55CE1B56;
	Tue, 30 Jan 2024 15:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF70C433C7;
	Tue, 30 Jan 2024 15:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706630350;
	bh=ayeCCM9eX9UuzR6QhI1Yi/QBnlgDh998JcXlC3hLB44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S9EHfRRgKUwzZqRUsOXlRJ2Zr5I8nKUacNjp87CUob2Lq3vLHh8FTJo2jA2ndu8qD
	 LpYyGt9mvgL+H9SMRSdIwmm6ymznsbjjUSQ4FI/aKqbmRREjhTwgj6NiKJKgfcGRpY
	 4DJEnFpqN6waJiXJKW3mHVlHDmXZHDrDU0q4QzTSdr3HnkJHcTZAjfssdz8sszt0nt
	 qi17/4qrK2FHI8UO9rvLMC+6YCESkoyPJlo1+PieAXIGCiPzqqlxjcURe2PFFH3HZr
	 eeKUjvQoayjTy5SFmXuTX2X35sxdAQEc0SpwvOC1kn1bcxhngo/kNd1A3sf43Lcjqf
	 dDGtAqcR+kG+g==
Date: Tue, 30 Jan 2024 21:29:07 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, vinod.koul@intel.com,
	venkataprasad.potturu@amd.com,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V4 04/13] soundwire: amd: implement function to extract
 slave information
Message-ID: <Zbkcy3KLLkJ1mw7x@matsya>
References: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
 <20240129055147.1493853-5-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129055147.1493853-5-Vijendar.Mukunda@amd.com>
Message-ID-Hash: JAQOYSKBJU3LIJVVASOG5IE622HNK7MJ
X-Message-ID-Hash: JAQOYSKBJU3LIJVVASOG5IE622HNK7MJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JAQOYSKBJU3LIJVVASOG5IE622HNK7MJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29-01-24, 11:21, Vijendar Mukunda wrote:
> Implement function to extract slaves information connected on the bus.
> This information is required during machine select logic.
> This function will be called from machine select logic code.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
