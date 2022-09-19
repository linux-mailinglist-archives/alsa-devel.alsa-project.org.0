Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A38F25BD7FB
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 01:15:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50721E11;
	Tue, 20 Sep 2022 01:14:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50721E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663629323;
	bh=imAxMcwej8e/jpOrVmww6EpqLPSax4FRPG2ggkXGY58=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nqt1Al1wrKjjxeLRiZEJftTRbh+PkKwQOtXpvvcfMI/uqCrNJXlsJ6DZShN+QZrM1
	 cVmgimtYOrsTbStNgwZu3NW20Om3klP62y7A/tHK7r4R79QsMHcum+22240SFAaR7s
	 zL1p14r8hN6m9cOuWWjfyu94dv0wmhL6wP9nJzK0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 449C7F805C8;
	Tue, 20 Sep 2022 01:10:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A6E6F805C7; Tue, 20 Sep 2022 01:10:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10791F805BE
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 01:10:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10791F805BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AtOTh1nW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BDF8B620F7;
 Mon, 19 Sep 2022 23:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56C34C4314E;
 Mon, 19 Sep 2022 23:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663629026;
 bh=imAxMcwej8e/jpOrVmww6EpqLPSax4FRPG2ggkXGY58=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AtOTh1nW96Lg5K07aTH2AD58kvsKTZp+iRIap4UNzUvvFc7SNxFS7LJDyam1pR3Fx
 Z6ezzxG+eBw9hL9AmdMWPQCtrjhuzdijW+bdSidYQyXWL4iw0EyNHpLKJQlOhVf2R5
 vcWZUPglgYMm2xtMV/WjbhBCagGZdAzlB/0nFuX/mTYgEnvBMbCZIr1ifjjhonzgAF
 LQVD2mxD2dWWe1vUtf2Zt4XuVhRD6ADSYMtpOOrnVf1TWGDM38YpnyyX2MrkBsFcy9
 MqEkcfvx+jKH+n+goCmWMFdX4QcSkDEbF4PM42pYNsO4W+bZouASQgSO3K0D5+Szog
 dKrp3pOKIaI+A==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220919114548.42769-1-pierre-louis.bossart@linux.intel.com>
References: <20220919114548.42769-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ALSA: intel-dspconfig: add ES8336 support for AlderLake-PS
Message-Id: <166362902508.3419825.11503414548855623937.b4-ty@kernel.org>
Date: Tue, 20 Sep 2022 00:10:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: tiwai@suse.de, Muralidhar Reddy <muralidhar.reddy@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

On Mon, 19 Sep 2022 13:45:48 +0200, Pierre-Louis Bossart wrote:
> From: Muralidhar Reddy <muralidhar.reddy@intel.com>
> 
> added quirks for ESS8336 for AlderLake-PS
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ALSA: intel-dspconfig: add ES8336 support for AlderLake-PS
      commit: 9db1c9fa214ef41d098633ff40a87284ca6e1870

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
