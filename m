Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 931554FE75B
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 19:39:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30929187A;
	Tue, 12 Apr 2022 19:38:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30929187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649785188;
	bh=zZkQCYesF/sm5DoAVfI8r+QbjE7oMDeDYotH3+XpDaU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OvqbjkuRn6sGnIdyu/je37zwgZkCDf4XM/Oh9rR1jr21jSXFgi/EiGlqyeveVQD4o
	 +OHGdvlj0X75GZ/CTxU0Jcf47UAZcDu7M7TlEgdUQWwgezfcJCLr9IUOy5sgm02kSJ
	 sZ8EzYDKlz0Nb+I95u273CKZbvP2iPms3WBz2doA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B91FDF80095;
	Tue, 12 Apr 2022 19:38:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0DAAF80154; Tue, 12 Apr 2022 19:38:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 892C5F80109
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 19:38:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 892C5F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="s0NFGWHc"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1A35CB81F5F;
 Tue, 12 Apr 2022 17:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32F1C385A1;
 Tue, 12 Apr 2022 17:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649785090;
 bh=zZkQCYesF/sm5DoAVfI8r+QbjE7oMDeDYotH3+XpDaU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=s0NFGWHc5QAgTBSymp29uk7oQhEMqGisqfHn4x1/xF9xqYlm5JMsTxRA89yI00uPL
 rHvTifL97r26jNMjXlDwvsFUTNbPcbknnhm16iVxHcEgAfc2KC/i93gS+XOx7TdEnh
 z/0t6h9hCb/uHkNDg4LQnfipwYVRxQUApuf3A6SRs03Qpxba5eKIAOWFeez3PyWUVg
 iQThjtzcxRxMbIH8mY9QnYLF0tUCm3RHdgf96vkJeSnrcKvnOIRWRf4T7fJXHFp2RH
 euZQUtMZWgA+85Fd/DpOI0l3476J+qCfb3gv4F1ql4QtBktXYvVuBgF67rvxBOoUPC
 nFC9C4o9CRRtg==
From: Mark Brown <broonie@kernel.org>
To: thierry.reding@gmail.com, lgirdwood@gmail.com, jonathanh@nvidia.com,
 perex@perex.cz, tiwai@suse.com, spujar@nvidia.com, yuehaibing@huawei.com
In-Reply-To: <20220411020908.580-1-yuehaibing@huawei.com>
References: <20220411020908.580-1-yuehaibing@huawei.com>
Subject: Re: [PATCH -next] ASoC: tegra186_asrc: mark runtime-pm functions as
 __maybe_unused
Message-Id: <164978508863.404572.4357231774639790524.b4-ty@kernel.org>
Date: Tue, 12 Apr 2022 18:38:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Mon, 11 Apr 2022 10:09:08 +0800, YueHaibing wrote:
> sound/soc/tegra/tegra186_asrc.c:90:12: error: ‘tegra186_asrc_runtime_resume’ defined but not used [-Werror=unused-function]
>  static int tegra186_asrc_runtime_resume(struct device *dev)
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> sound/soc/tegra/tegra186_asrc.c:80:12: error: ‘tegra186_asrc_runtime_suspend’ defined but not used [-Werror=unused-function]
>  static int tegra186_asrc_runtime_suspend(struct device *dev)
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra186_asrc: mark runtime-pm functions as __maybe_unused
      commit: dc7680ca7ac6c32b8c18aff36bca728a2f83e2a0

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
