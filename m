Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBD46DF1A5
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 12:08:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A89710C8;
	Wed, 12 Apr 2023 12:07:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A89710C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681294091;
	bh=yF/uFRHThBaezM0NTlXWHeSUyorZ+xUTqEgdHeW/6RM=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=khkGvbP60c4bmRreVOYSUkgavrGxF8r3FbcHDeqdCwOcZViuHIlBIrdAF8N2LAaEW
	 MBMCOKCPKnZ31kiDaYiQc8jt5TmUCz1eM44p10DShyqIeEhcSGeU/mkRJf0YQLBgfI
	 DhnLrg4uEFOsji26uSKTLvYP2zyjSX7yj/CHuh/M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23C12F8025E;
	Wed, 12 Apr 2023 12:07:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E49CF8032B; Wed, 12 Apr 2023 12:07:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2FA90F800E5
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 12:07:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FA90F800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=b5VqUxzC
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2C5CC6328D;
	Wed, 12 Apr 2023 10:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B8FCC433EF;
	Wed, 12 Apr 2023 10:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681294027;
	bh=yF/uFRHThBaezM0NTlXWHeSUyorZ+xUTqEgdHeW/6RM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b5VqUxzCLLBle3AnLLDpUACQQp0zfOI4ujjCkpUTUmw+c/x/Gq2uPB1jdaUd1/Si+
	 huX4/Iz1vjqPuSpx5iSSKPK5NKxyjg9rMregRYdBC32g9Ewo+lyhON1kyvU4b2Ur0U
	 XlT1BQHMgiPUE1l2Nj0UACdeXxVKRJYUyGwgEiC5qz1NM7kVaHzmxzpvJzM64K62Hh
	 FQpqanHBtWSEsHGmxg9eGfOMhk6UR8NJ5Wea11B/E/c7VvV1YdyhXgy27jGGP5FmkE
	 LLgdeI+Jzwy/MbBrSLkILO0GNdmIxu86R4FKdvZS+AUc0E9BO0ZBoB6aO8w81h0Yed
	 9I4i3H3Ty87Eg==
Date: Wed, 12 Apr 2023 15:37:04 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: intel_auxdevice: improve pm_prepare step
Message-ID: <ZDaCyFdzlPmoi6qK@matsya>
References: <20230323025228.1537107-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323025228.1537107-1-yung-chuan.liao@linux.intel.com>
Message-ID-Hash: 7EN4KGBCXSXVHP5OI6ZC7PIS5MZQKONY
X-Message-ID-Hash: 7EN4KGBCXSXVHP5OI6ZC7PIS5MZQKONY
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7EN4KGBCXSXVHP5OI6ZC7PIS5MZQKONY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23-03-23, 10:52, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> In the case where multiple peripherals are attached on the same link,
> it's possible that they are in different pm_runtime states.
> 
> The device_for_each_child() loop to resume all devices before a system
> suspend would not work if one peripheral was active and others
> suspended. pm_runtime_resume() returns 1 in the former case, which is
> taken as a error. As a result, a pm_runtime suspended device might be
> skipped if the first device was active.
> 
> This patch changes the behavior of the helper function to only return
> zero or a negative error. A Fixes tag is not provided since there are
> no existing configurations on Intel platforms with different types of
> devices on the same link. Amplifiers may be used on the same link, but
> they are used by the same dailink so their pm_runtime state is always
> matching. This assumption may not be true in the future, so we should
> improve the behavior and align with AMD.

Applied, thanks

-- 
~Vinod
