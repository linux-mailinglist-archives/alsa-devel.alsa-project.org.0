Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16058597500
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 19:24:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0C581654;
	Wed, 17 Aug 2022 19:23:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0C581654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660757076;
	bh=x8AOMYZPjuZI41+BV3yAeAPjkL3cZwXnkl+7Pszeukg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X/pEC2UvHRPNx/4267dnIJozXMRc9uIZXtez/SU/H95tmtnWrLTE0mCFjaajZ9Z0W
	 kMn8W6K8UgtfeSsMlvczkFdRWlTK3R1aIK+PDKEMI4OCabgMsRynsf/F7pk5Xtt8mB
	 tCybczB4xy1PrcC+k78KWnveeiZlxkoFcNmqICbo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11FAEF80130;
	Wed, 17 Aug 2022 19:23:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 555D9F800EE; Wed, 17 Aug 2022 19:23:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D1CFF800EE
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 19:23:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D1CFF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KClupnk/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 753ED611F1;
 Wed, 17 Aug 2022 17:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6BAC433C1;
 Wed, 17 Aug 2022 17:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660757005;
 bh=x8AOMYZPjuZI41+BV3yAeAPjkL3cZwXnkl+7Pszeukg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KClupnk/o4y9JmkCvWAynHjt8MxOASHtUGC8Qbo2bFqGsyPVQ1UBa2X4NPQCpYWcU
 2ToqwR/C6i6YFkuhv/KtxGEmIDs08cNrmDAliM8/35fjezRSuWv1Lr++oWQjt1sliG
 zT11cYDZ1+j0IDAlTkiQZRnIVHBPYAb91jeznTLBClppiovUY37uSN9qEhdljKkUSs
 OysHReuCbVCObpllntyjp3vKauPP4/6Te3Ab7PavzKlsVKcLSN86oK5fduZg+l2rb1
 SIEj57vlvx4GRLvzkJrUMZ9nPHpdkaLa0i1vP3SHwiGb5XN91OQ209ksuKq4kQivtb
 o8087sqV3a5fw==
Date: Wed, 17 Aug 2022 10:23:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] ASoC: codecs: add uspport for the TI SRC4392 codec
Message-ID: <Yv0kC2jscXISm7Ie@dev-arch.thelio-3990X>
References: <20220808214028.2502801-1-flatmax@flatmax.com>
 <202208090909.Pg0BZGie-lkp@intel.com>
 <YvvbKry5FVFbNdcI@dev-arch.thelio-3990X>
 <Yv0Vg2bkmlEqTSVk@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yv0Vg2bkmlEqTSVk@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, llvm@lists.linux.dev, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>, Matt Flax <flatmax@flatmax.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Aug 17, 2022 at 05:21:23PM +0100, Mark Brown wrote:
> On Tue, Aug 16, 2022 at 11:00:10AM -0700, Nathan Chancellor wrote:
> > On Tue, Aug 09, 2022 at 09:49:38AM +0800, kernel test robot wrote:
> 
> > > config: hexagon-randconfig-r002-20220808 (https://download.01.org/0day-ci/archive/20220809/202208090909.Pg0BZGie-lkp@intel.com/config)
> > > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
> 
> > It doesn't look like these warnings were addressed before the change was
> > applied to -next as commit 4e6bedd3c396 ("ASoC: codecs: add support for
> > the TI SRC4392 codec"). I now see them in next-20220816.
> 
> It's probably worth talking to the 0day people about prioritising what
> they're reporting against, especially given that the reports have
> evolved into a bit of an eye chart - this was reported against a Hexagon
> randconfig with an unreleased compiler which is underselling it rather.

Sure, that might be interesting to have certain architectures and
in-tree configurations prioritized over others (like arm64/x86_64 +
allmodconfig).

At the same time, I would expect developers and maintainers to focus on
the warning text first and foremost, not what architecture,
configuration, or compiler is being used. This issue is very clearly not
architecture or configuration specific, there is no #ifdef in this
function that changes the nature of the warning. While it is compiler
specific (because possible uninitialized variable warnings are disabled
with GCC), it is not dependent on the version (although I guess that
isn't apparent). I suppose I can just comment on future randconfig
reports to point out how they will affect allmodconfig and such.

Cheers,
Nathan
