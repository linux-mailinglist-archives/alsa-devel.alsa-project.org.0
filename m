Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 622D381CC5F
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Dec 2023 16:46:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBF98DF3;
	Fri, 22 Dec 2023 16:46:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBF98DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703260013;
	bh=WhROq6fxnNV/9LI7/csVWNcx/nYTzRP6g5WWhYCUuNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d6cfGfiASXbBu3Zsy/iS/2i4opzz3xCh84xz5dFfbcOAS0PZVEPo8gIiTfyiCI8hq
	 vQWPxmWz9DkILeVggmxJ5lxQZspS4U0RrHjgwPxD4pAWl9rUDgq4C76cLWCWEQnqb6
	 2TPMbZ53fr5wP9r2vs7ZmUPJKy8ELLWnEozK2fzY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBD9FF8057D; Fri, 22 Dec 2023 16:46:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2A8FF80431;
	Fri, 22 Dec 2023 16:46:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36473F8016E; Fri, 22 Dec 2023 16:46:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B227F800D2
	for <alsa-devel@alsa-project.org>; Fri, 22 Dec 2023 16:46:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B227F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Qizy9SzF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 45F7A61C31;
	Fri, 22 Dec 2023 15:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C3DFC433C9;
	Fri, 22 Dec 2023 15:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703259964;
	bh=WhROq6fxnNV/9LI7/csVWNcx/nYTzRP6g5WWhYCUuNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qizy9SzFWYEh7GuqWHk5sN61dU1zluBDr2eiyV5ul86BnAWICg7vCzRhmMvfpfqRF
	 bRd3p+nmLBqpeJ8wDX5ok5OTYWdQjBWXuHoulKeRZHvQHJWJHmOepJO3r6Gcz+dfkc
	 5iya6ox8Wn1qI6TAZaMKmR5phr2kNyP0OxniPLG9qyV+BTLU1GrVD5eDVgHF7LkGIi
	 O203Ey4xbjKTSq6EymOWWhQSRWEfkgnUbZsbFKIRU04uv75HHnzsfQx8qmwW4C+c7n
	 tTjePTVEzWNj0YZSdSaSGBCUS2uHnl3wRSb5ZRak+7hN1xF/ZI2SZ4ast7O8S9oZkj
	 3cu7s8j++sGpw==
Date: Fri, 22 Dec 2023 21:15:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	pierre-louis.bossart@linux.intel.com, vinod.koul@intel.com,
	venkataprasad.potturu@amd.com,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 04/12] drivers: soundwire: refactor soundwire pads enable
Message-ID: <ZYWvNxpLPUGCGElA@matsya>
References: <20231221073558.3181911-1-Vijendar.Mukunda@amd.com>
 <20231221073558.3181911-5-Vijendar.Mukunda@amd.com>
 <ZYRqEbVADgU4fNtB@matsya>
 <6d98c43d-fb90-4cfa-a22e-8fd6d5a6eb50@amd.com>
 <ZYVVD2mL5kAePXDE@matsya>
 <0ab000c3-be7f-41f3-8017-28738cf0a698@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ab000c3-be7f-41f3-8017-28738cf0a698@amd.com>
Message-ID-Hash: Y3ELQSRR7SNNMUFBQNT5NCJNTSOK3V2Q
X-Message-ID-Hash: Y3ELQSRR7SNNMUFBQNT5NCJNTSOK3V2Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y3ELQSRR7SNNMUFBQNT5NCJNTSOK3V2Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 22-12-23, 16:04, Mukunda,Vijendar wrote:
> On 22/12/23 14:51, Vinod Koul wrote:
> > On 22-12-23, 12:45, Mukunda,Vijendar wrote:
> >> On 21/12/23 22:08, Vinod Koul wrote:
> >>> so the code is copied from a GPL declared file to now and GPL + BSD one!
> >>> Have you had lawyers look into this... why change one file license ?
> >> As per recommendations from our legal team, we have updated the license as dual
> >> one for amd_init.c file.
> >> We have also observed that license terms should be updated for other files as
> >> well (amd_manager.c, amd_manager.h & sdw_amd.h) as dual one, which we have
> >> planned to submit as a supplement patch.
> > Lets change that first before we move code from one license file to
> > another
> Will push the license update patch first.
> >
> > Btw why would you want to do the change of license form GPL to dual?
> As this code being used by AMD SOF stack which uses dual license,
> So we want to maintain the same license terms.

SOF is firmware, do you share this kernel code with sofproject, that
doesnt make sense to me, maybe I am missing something

-- 
~Vinod
