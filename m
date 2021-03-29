Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D72634D8C1
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Mar 2021 22:01:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B243F1684;
	Mon, 29 Mar 2021 22:00:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B243F1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617048070;
	bh=O4yG+QcLTsHGlbXDAjCrViOg6xBSlg1/SH28druab+U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LLfWxNfVfgO0U0Fw0NIvWTQ9zHuuwjQp+/TeOOdEvooMnh5ZqiALWkN/UDUtFCrIV
	 YXekbchGxD8UKaaAfDsxNIPe55K4Tep1GfrZwVNqtdZ3IIep4aO347DZyzzrg6WeIS
	 OvPsgLQmJlMeTR3R04lTkTMEB4DC5AhefnShonRI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF808F80430;
	Mon, 29 Mar 2021 21:58:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF94BF8016E; Mon, 29 Mar 2021 21:58:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A7DFF8020C
 for <alsa-devel@alsa-project.org>; Mon, 29 Mar 2021 21:58:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A7DFF8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ci58Obfs"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8856E61976;
 Mon, 29 Mar 2021 19:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617047917;
 bh=O4yG+QcLTsHGlbXDAjCrViOg6xBSlg1/SH28druab+U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ci58Obfs1vK49MmrrP1rL5Z6S5bF8mw2eDAy6QJAAgNPZ3rfGiM4ZXsDiIu5DxzH8
 btHm9uHgeDDfnPVf/l+2yvXhZDbiSXB469JdFUnjV07UFsToMYo7TmuVz/2CwCSJsR
 S2l7Eeg7V3e2ZM7pZaNyIzm/kk4KLilGB6jQiGNd3ovdofpmP0eLExBCGj+FUv/3tE
 oTN7JKo+wv2JRvGaA+qSV3QXhHEIJQB8j8FXtkaGfzh8mr9SiORdtvpb2yUx6eTy4J
 hVl1MEyxnGZ2Dx6fvKX59vFKP9vf+J44nQ/nqR0zg52fXleAUBYtMRJMStBZSIl2Ui
 tY3Es/kMZYMQg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH RESEND 1/2] ASoC: amd: update spdx license for acp machine
 driver
Date: Mon, 29 Mar 2021 20:58:11 +0100
Message-Id: <161704724764.10039.1962173442335521261.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1616777074-5151-1-git-send-email-Vijendar.Mukunda@amd.com>
References: <1616777074-5151-1-git-send-email-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Sunil-kumar.Dommati@amd.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Chuhong Yuan <hslester96@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Alexander.Deucher@amd.com
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

On Fri, 26 Mar 2021 22:14:30 +0530, Vijendar Mukunda wrote:
> update SPDX license for acp machine driver.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: amd: update spdx license for acp machine driver
      commit: 23f23db29ac996a824dce2b3a800c7a002f1c480
[2/2] ASoC: amd: fix acpi dependency kernel warning
      commit: d463cead11ace05c81de31a0fb9c2507c5c1d0a2

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
