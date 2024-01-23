Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1A58387E5
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jan 2024 08:21:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8E2D84A;
	Tue, 23 Jan 2024 08:21:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8E2D84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705994515;
	bh=Qv0r9JskAd/omjXZcyv5p/SPThUBQVmcjBfikLL8YWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gKhMSfHzO22JjNYRMd3W52qZhFR+RXP8GvGBW4Hag1Tza84Sv9iEd4JlbvApIzywT
	 IYz4lAHIFto4t6rID51W0JPZjyZ2TVE3U/4m3Ph8+6F8mpJKj6u9uUKSp3aA9whxmu
	 4QKF+brd++QYfvASYimwG6W14PALo6AhVfsl9H/E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 404E9F80570; Tue, 23 Jan 2024 08:21:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E627F8057D;
	Tue, 23 Jan 2024 08:21:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6062CF8028D; Tue, 23 Jan 2024 08:19:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37E9FF8003A
	for <alsa-devel@alsa-project.org>; Tue, 23 Jan 2024 08:16:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37E9FF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qW5Zq2D6
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4988FCE2E09;
	Tue, 23 Jan 2024 07:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4EDBC433C7;
	Tue, 23 Jan 2024 07:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705994163;
	bh=Qv0r9JskAd/omjXZcyv5p/SPThUBQVmcjBfikLL8YWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qW5Zq2D67axmNfAag6UD+cc0EyAAhQ4cWTjSdG312yVyVfCKlA1nuX0vQXij14p3z
	 BsDDjAci3ZSPOShc6jOVA9Ojf1MC7JmipGhixnkx5ZC5v788r03pPwBLom3xJxtzl4
	 QCbgzcdtFT+t6tohVfNaTnrDIFtT9t28sPi9rNfY5zXtBYS7T0Ls64uIGucFV2rlOq
	 Nzs/BD/IpNMhN5HwihoPgUIm2FE1rD4vOl/+UW1RycGnhgZPTqawjimTWQ4AckS+Fh
	 1cwp7MRc6tK0iikQiJEBouIIZeW82ENtDOeyWCk/VCqLug7kv/7fXG5IfOyQBdBuND
	 TmSPc4n+TItIQ==
Date: Tue, 23 Jan 2024 12:45:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, vinod.koul@intel.com,
	venkataprasad.potturu@amd.com,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2 03/13] drivers: soundwire: amd: refactor amd soundwire
 manager device node creation
Message-ID: <Za9nrtvDtCT_SLzY@matsya>
References: <20240110094416.853610-1-Vijendar.Mukunda@amd.com>
 <20240110094416.853610-4-Vijendar.Mukunda@amd.com>
 <Za4f1rwAXAiJU-j5@matsya>
 <d8f5ee8b-466e-4069-b06b-41cdc7fa9e40@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8f5ee8b-466e-4069-b06b-41cdc7fa9e40@amd.com>
Message-ID-Hash: MXQWUQ434TWEFGJG2RWEQ4FEZGAHCZKY
X-Message-ID-Hash: MXQWUQ434TWEFGJG2RWEQ4FEZGAHCZKY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MXQWUQ434TWEFGJG2RWEQ4FEZGAHCZKY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 22-01-24, 17:18, Mukunda,Vijendar wrote:
> On 22/01/24 13:27, Vinod Koul wrote:
> > On 10-01-24, 15:14, Vijendar Mukunda wrote:

> >
> >> + * @count: link count
> >> + * @num_slaves: total number of devices exposed across all enabled links
> > should this be not per link?
> No, this will be total count of peripheral devices across all the links.
> This variable will be used in  snd_soc_acpi_sdw_link_slaves_found()
> API.

yeah noticed later

> >
> >> + * @link_mask: bit-wise mask listing SoundWire links reported by the
> >> + * Controller
> >> + * @ids: array of slave_id, representing Slaves exposed across all enabled
> >> + * links
> > this does not tell us which device to expect in which link..?
> sdw_extended_slave_id structure contains information about link id as well.

ok

-- 
~Vinod
