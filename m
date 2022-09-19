Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CC15BD7F8
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 01:14:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 352861614;
	Tue, 20 Sep 2022 01:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 352861614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663629277;
	bh=QqCeONs3KOkZtBFUS0zKL1oQTF3Sy4lu9v7FOyHocbM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RonF735ienpL0I51f8aStGLDjHuMwpLME+zg7yLjRWr1v/fYTweOZYJw86UW2BvDz
	 nHRq91YL/UGk8SNsloYxlqZufICE6o17es3OavM0iHtLcVCD25+ZVoisgVcAoteHw9
	 +cK0R35Kcr9e7rGdGWxfueKYpP4vqBOZisPslH4E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC3FDF805B1;
	Tue, 20 Sep 2022 01:10:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99402F805B1; Tue, 20 Sep 2022 01:10:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B34B7F805B1
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 01:10:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B34B7F805B1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pjI1AIGh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7306B620E6;
 Mon, 19 Sep 2022 23:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B815EC433D7;
 Mon, 19 Sep 2022 23:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663629024;
 bh=QqCeONs3KOkZtBFUS0zKL1oQTF3Sy4lu9v7FOyHocbM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=pjI1AIGhfAL0E2t0uGutcQ3DaPuzGrD0swHQdAGOETonyFGSeQK7R2srr2eFiE9l7
 EomSKUFuEYUbJSDwSk2RWJe+xA07mYIOywSaEkd9Jq/3pRNntgJt5Nes4dl+WCXRSt
 T6uaHOyEGXUr50fnLo8f9T2LT1B/5I3FzH2jGz4Xr+54blBfoFgTGi7fjJOVQNx353
 LG5Y+V797js3rfYhTzhjbK7ekYKGYbFcp1k3sN3zmc00itIq9dqb8Nz/bzfpqsLLCg
 YvSFp8bvutSy+ScGZuJEXFFGPbqy+6Z1IpHEOLulUcxoURbUDPesppx8LkaXWroBfr
 bbq/nkiKNMgyQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220919114429.42700-1-pierre-louis.bossart@linux.intel.com>
References: <20220919114429.42700-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASOC: SOF: pci: Change DMI match info to support all
 Chrome platforms
Message-Id: <166362902247.3419825.17438221743152081978.b4-ty@kernel.org>
Date: Tue, 20 Sep 2022 00:10:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: Jairaj Arava <jairaj.arava@intel.com>,
 Curtis Malainey <curtis@malainey.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, tiwai@suse.de,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Chao Song <chao.song@intel.com>, Curtis Malainey <cujomalainey@chromium.org>
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

On Mon, 19 Sep 2022 13:44:29 +0200, Pierre-Louis Bossart wrote:
> From: Jairaj Arava <jairaj.arava@intel.com>
> 
> In some Chrome platforms if OEM's use their own string as SYS_VENDOR than
> "Google", it leads to firmware load failure from intel/sof/community path.
> 
> Hence, changing SYS_VENDOR to PRODUCT_FAMILY in which "Google" is used
> as common prefix and is supported in all Chrome platforms.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASOC: SOF: pci: Change DMI match info to support all Chrome platforms
      commit: c1c1fc8103f794a10c5c15e3c17879caf4f42c8f

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
