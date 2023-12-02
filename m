Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBD8801AFB
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Dec 2023 07:19:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2145DF4;
	Sat,  2 Dec 2023 07:18:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2145DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701497943;
	bh=H/Rl2ZW7/Dsn7yTndgamRf2l+bGN0jpxDPUtz93hv2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OZ3l9uyqNHFzFk1bHnPenvm4+Jj3VcHODafW6fE73K6uaW9OAW/mloy3R+RWLWFmn
	 ZKkLg4j8es1HMksrUkq041QS5Toh5BuVgH7MC5U2CntuqlfKDcfV4Tuzv6igGok/ib
	 2Py3MDvUntGLFrxsN+8cm+cCdB02O8BBslDetWd4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD0D6F8055B; Sat,  2 Dec 2023 07:18:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A96DF80570;
	Sat,  2 Dec 2023 07:18:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFE63F8016E; Sat,  2 Dec 2023 07:13:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3394F800AC
	for <alsa-devel@alsa-project.org>; Sat,  2 Dec 2023 07:12:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3394F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=u20YRoRI
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8E0AE6069F;
	Sat,  2 Dec 2023 06:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7006CC433C7;
	Sat,  2 Dec 2023 06:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701497542;
	bh=H/Rl2ZW7/Dsn7yTndgamRf2l+bGN0jpxDPUtz93hv2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u20YRoRIBso4W9k10jo5NfzEYjJ/CyYqfqQdMoStOXL3q9jknzzfAcUWnT1xWpPKk
	 DERxMN2OI0AWqzWpykizFXx1SP2DyMMOPyTY+JQPm4Zvy69U5q4CtDYXrTy0UL2AZh
	 z9UHGkMVD93PMXM2wFMZfZYF4n9iAgb4bWavNvuMhnZbniB2wg4FdCFv1m2biPhYAI
	 21wMhPM/o4TKLG22/fxeUOFK1qzHLgzMpSZ0cTEm47gmzkIjauYjAOGAl69s3Tsv0u
	 H/I9UiF95ST0G2ZeS+IjQH7xOT5KpAQlDmBoBv+DyfZeuvfawpFjuTYvx3ub/nLEqX
	 RycbUIxCIsD/g==
Date: Sat, 2 Dec 2023 11:42:17 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH] soundwire: amd: drop bus freq calculation and set
 'max_clk_freq'
Message-ID: <ZWrKwU90SLFtMMRO@matsya>
References: <20231129130449.9892-1-vkoul@kernel.org>
 <30e6b8d3-6369-4c23-a4fa-f70cc01acd7e@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30e6b8d3-6369-4c23-a4fa-f70cc01acd7e@amd.com>
Message-ID-Hash: PAQIJWJPFUOJ2QVY73I7KQLCWWZ3AEJL
X-Message-ID-Hash: PAQIJWJPFUOJ2QVY73I7KQLCWWZ3AEJL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PAQIJWJPFUOJ2QVY73I7KQLCWWZ3AEJL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 01-12-23, 11:16, Mukunda,Vijendar wrote:
> On 29/11/23 18:34, Vinod Koul wrote:
> > max_dr_freq and curr_dr_freq is calculated and set in
> > sdw_bus_master_add(). Setting in the driver is reduanant, so drop that.
> > Set max_clk_freq instead.
> LGTM

Right way would be add a proper tag like 
Reviewed-by: Foo bar <foo@bar.com>

or better to test the patch and update with
Tested-by: Foo bar <foo@bar.com> #on xyz target

-- 
~Vinod
