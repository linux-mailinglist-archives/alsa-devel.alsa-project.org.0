Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EE31B46C8
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 16:04:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDE3816BD;
	Wed, 22 Apr 2020 16:03:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDE3816BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587564287;
	bh=Eee8d+5Hu8BFJeOdJCHWoIR/ex6fFhcbdTN/Vls1UIw=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W9b1J5QhfGUkxL8Z9mu8OtBoIlaWu6b8TGurLnOZwMOs0DtIy0+sykcHGNtQimdbF
	 Xced+3+QkmoPhS+VarN1pPlyDdVmvT3n1C+540Yt2r93JmsX2eSAh1nGK5Wm4JfhuF
	 KEb/iHflajz6/qPJI9iTd/NazkFZSp/d2eRkcu1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF4FBF8020C;
	Wed, 22 Apr 2020 16:03:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F307AF801D9; Wed, 22 Apr 2020 16:03:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24515F800FF
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 16:02:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24515F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bBLH5hR/"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CCAB92077D;
 Wed, 22 Apr 2020 14:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587564177;
 bh=Eee8d+5Hu8BFJeOdJCHWoIR/ex6fFhcbdTN/Vls1UIw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=bBLH5hR/kD0OiuCE1N1gPai0IMmih6B7hDHD+Yn0zpltoPQQfYly+5bCufdy3BcyH
 HDMQrmnQi1cgfI6jHI2UXOtapZRWnJpmXK/RcnKdzkPFlWg2uflJJcWp5NykWVBBC6
 WzFqWZJ+JeMBmHJxcyB1OerHCNRy73x0QrulURco=
Date: Wed, 22 Apr 2020 15:02:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>
In-Reply-To: <20200421212121.3286517-1-thierry.reding@gmail.com>
References: <20200421212121.3286517-1-thierry.reding@gmail.com>
Subject: Re: [GIT PULL] ASoC: tegra: Fixes for v5.7-rc3
Message-Id: <158756395814.23495.171205742201395813.b4-ty@kernel.org>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
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

On Tue, 21 Apr 2020 23:21:21 +0200, Thierry Reding wrote:
> Hi Liam, Mark,
> 
> The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:
> 
>   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Merged into

   undefined asoc-5.7

Thanks!

merge commit: 41d91ec3de8a90167159275bde7ed65768723556

Thanks,
Mark
