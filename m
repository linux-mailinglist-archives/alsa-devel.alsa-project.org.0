Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 976EE6D215B
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Mar 2023 15:18:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2277B1F0;
	Fri, 31 Mar 2023 15:17:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2277B1F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680268720;
	bh=p6tek0JeK10uVkXKZcHwz6OJ/prwLyGRaIuHmwOqWh4=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LDdDqnHhGJqXJJ8vrCSFB9fp0Rt1nwiBrYdxBAZQ7jNxuZ2RGy9nRYmKiuhIltnUa
	 1UbtszZaasOZZ9X9c9JOKkI3Kl8fhXWhXtV2/UenFQhQlfMer4U3+lTk+NWUrSRabd
	 CjK7dQ9Uwz6kN6b9WBIR2kKyFNsEebK5o2XG4dgY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9149F8021D;
	Fri, 31 Mar 2023 15:17:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 548B1F8024E; Fri, 31 Mar 2023 15:17:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ABD9FF80114
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 15:17:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABD9FF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LhLKKPZH
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 954326291B;
	Fri, 31 Mar 2023 13:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B5DC433D2;
	Fri, 31 Mar 2023 13:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680268661;
	bh=p6tek0JeK10uVkXKZcHwz6OJ/prwLyGRaIuHmwOqWh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LhLKKPZHuOhtAvhvxO2/2+gCdVW8U3nWFcT/CtJPCP20/PJ++hoR/+GaFmtC8Y4tx
	 BSpiZNc2TrEZQSDBxNz5RnFNihWfrEd+pyrow0f3h9DFb++YgivXdrTFALXODrMkD1
	 /Ge0mXutZtmkEP2xPqQjGY6+5csfVxqDW21CTW7TlkTPYUFfSGFLZeNxCBxckWaTAy
	 p8eKIfkslL01mPOFwhUShLS/LFatTVAlZBhl8zIy7dLWNkBK8M5477G3EqQguQsoVz
	 8epg7G6mMUXVNBK0TubMEfj4KrAGCW/RskV1xQ+l6KoeT4m3x3/ZArd/zGbT4bcjbd
	 gJIVey8aBrW7A==
Date: Fri, 31 Mar 2023 18:47:37 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2 1/3] soundwire: bus: Remove now outdated comments on
 no_pm IO
Message-ID: <ZCbdcTDZt5P4EZiG@matsya>
References: <20230322164948.566962-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322164948.566962-1-ckeepax@opensource.cirrus.com>
Message-ID-Hash: P3ZIQK7IGVXOTCHXS4R4QJW4HWQLELAU
X-Message-ID-Hash: P3ZIQK7IGVXOTCHXS4R4QJW4HWQLELAU
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P3ZIQK7IGVXOTCHXS4R4QJW4HWQLELAU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 22-03-23, 16:49, Charles Keepax wrote:
> Things have moved more towards end drivers using the no_pm versions of
> the IO functions. See commits:
> 
> commit 167790abb90f ("soundwire: export sdw_write/read_no_pm functions")
> commit 62dc9f3f2fd0 ("soundwire: bus: export sdw_nwrite_no_pm and
>                       sdw_nread_no_pm functions")
> 
> As such this comment is now misleading, so remove it.

Applied all, thanks

-- 
~Vinod
