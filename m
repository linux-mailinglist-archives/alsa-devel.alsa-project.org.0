Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F182302635
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jan 2021 15:20:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B033184E;
	Mon, 25 Jan 2021 15:19:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B033184E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611584400;
	bh=fYsDyTpc8wvz0Dpsy9WED60vadF1MFuzJBzxnFx4l/o=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LmjddkHixqGRmYPyN9Ylv83X0TMTgMnce1hnw8eLtuCqEz7deL1JJXKIQKw2XxqWX
	 O2vISV/O5H4MDrN+2e5wSgDlR7t7DBhBFA7kodi8c9+tfB48pDNWZ4aYUd216QBDhJ
	 rg6lDsLkZUfhb7OnY1nF/prx5Pikvzv0RaofDVwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFB34F80269;
	Mon, 25 Jan 2021 15:18:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DACB0F80278; Mon, 25 Jan 2021 15:18:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B59AF8014D
 for <alsa-devel@alsa-project.org>; Mon, 25 Jan 2021 15:18:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B59AF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VU5DBXcg"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3BE5E2145D;
 Mon, 25 Jan 2021 14:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611584288;
 bh=fYsDyTpc8wvz0Dpsy9WED60vadF1MFuzJBzxnFx4l/o=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=VU5DBXcgejgroRHtoasGaXEd2Zp5RMXHS9BM0TcazQ0xIVDpRn2rlk5jwmgq426Hv
 X66sWbhGmdOZDichRZAg5orRlt76yhU9REv7z5ihYzW8w9MAjKnX3w9fWj3A7j722Z
 KJiQTyt6aEK5yQ4lCZhF0+pIXdspllTBjHw1raSFDtSAXqzxEvkctVzNVtwVpn5NZ0
 VZqYPSnL+HLjnLvQs9sr8NZ3d/FVCIjq9hv5S6HVzkSmaesnsqekNx0IT/WmgLyu63
 L2hsbtdJev4HiVlO1Rgm5okpVFVcm56Lwb50Ev0PE/YCFqnWQI6X4TqzlTYhYJdGyp
 ymk5Zx+Y/blag==
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20210125081117.814488-1-kai.vehmanen@linux.intel.com>
References: <20210125081117.814488-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw: set proper flags for Dell TGL-H SKU
 0A5E
Message-Id: <161158424212.32959.6636308393612395831.b4-ty@kernel.org>
Date: Mon, 25 Jan 2021 14:17:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Libin Yang <libin.yang@intel.com>, cezary.rojewski@intel.com,
 yang.jie@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, Hui Wang <hui.wang@canonical.com>,
 Bard Liao <bard.liao@intel.com>
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

On Mon, 25 Jan 2021 10:11:17 +0200, Kai Vehmanen wrote:
> Add flag "SOF_RT711_JD_SRC_JD2", flag "SOF_RT715_DAI_ID_FIX"
> and "SOF_SDW_FOUR_SPK" to the Dell TGL-H based SKU "0A5E".

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_sdw: set proper flags for Dell TGL-H SKU 0A5E
      commit: 9ad9bc59dde106e56dd59ce2bec7c1b08e1f0eb4

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
