Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B89E6BC5F1
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 07:05:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 903D6114E;
	Thu, 16 Mar 2023 07:04:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 903D6114E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678946713;
	bh=1H1HS9Ry+ELdH7NWYIXpQ9Kk85X7UC33y9TSVoiLvvQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LQX/S2AW4bjaOIwQXeBPX5ViMWx7cFSDkazIUv6gBZjKStOSU2QWAXoO+HEpzFr3a
	 daN0FvDjm0cIrOI+QOZc0yM+jZeBcGB+V6tkqikoO0DJwENNGk+UAPCz4+xAgUO9fW
	 cxjJs9GzsRXN6Aa3vdYuy7/+1ybwQ2GvFjFir/7I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C915F8032D;
	Thu, 16 Mar 2023 07:04:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C512F800C9; Thu, 16 Mar 2023 07:03:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8522F800C9
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 07:02:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8522F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oaxElmRd
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4C8FF61CDB;
	Thu, 16 Mar 2023 06:02:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF3FC433EF;
	Thu, 16 Mar 2023 06:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678946571;
	bh=1H1HS9Ry+ELdH7NWYIXpQ9Kk85X7UC33y9TSVoiLvvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oaxElmRd9DbiXFuxEc7CPG5z8DTtJ9jwtTZPmuI/lPBsROxRiC7fX3OoNt27ZghEv
	 Rv7zpktxvPSMKGW9xVkxwpNT+9N+9E1fXRJFLHu4jOk6vlrA0RUC+EypbdsE3UsTPZ
	 0/9lTAQEEuyLhJwfSXCcY18hBbWa62M3Df+ii8zivP6uPb6go/gugPRuBUn2tVLfy4
	 hqeiKj1uzMN2SxQ8rZe0QNpSfMuAhGdDLkzWhCwMqy/xZYe8w3srIE0SlliSqPmm5m
	 cyZ02Fla3LWHg5EcMMU6yda/Qvb569MdlqEtldviUWPrN/9ADXHHqh5A+EhWkF69IW
	 0RW2CbaC/pWIQ==
Date: Thu, 16 Mar 2023 11:32:47 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH v2] soundwire: bandwidth allocation: Use hweight32() to
 calculate set bits
Message-ID: <ZBKxB+4uTPDcibmj@matsya>
References: <20230315145051.2299822-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230315145051.2299822-1-rf@opensource.cirrus.com>
Message-ID-Hash: 235CYXT36MPO7MZTWN6HW6DRCJPDV4ZY
X-Message-ID-Hash: 235CYXT36MPO7MZTWN6HW6DRCJPDV4ZY
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 15-03-23, 14:50, Richard Fitzgerald wrote:
> Replace the call to sdw_ch_mask_to_ch() with a call to hweight32().
> 
> sdw_ch_mask_to_ch() is counting the number of set bits. The hweight()
> family of functions already do this, and they have an advantage of
> using a bit-counting instruction if it is available on the target CPU.
> This also fixes a potential infinite loop bug in the implementation of
> sdw_ch_mask_to_ch().

Applied, thanks

-- 
~Vinod
