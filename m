Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A04C03A8798
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 19:32:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FADD16B9;
	Tue, 15 Jun 2021 19:31:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FADD16B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623778364;
	bh=y/udLKFYHLJaB0XXSTV3/plG0EFz9UjFo4yY54gp2DE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FvAPXSEQ9StapgW580SDHm766C2wdpzTfLWYOUHq6GVuBj3cJXRTR888YnE+HnBve
	 YLlw8npKXdpb/eiY5VolQAG3fQbYmYIzrPv1NliIY1LYzKz8nJoAKIhN88wHB0uNi6
	 SFIIcROZXMKaklYftfu8hgTX39SaKDhnySrjUs9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A986F8016C;
	Tue, 15 Jun 2021 19:30:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0CCEF804CF; Tue, 15 Jun 2021 19:30:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 408D2F80171
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 19:30:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 408D2F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iKbe5gtH"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57694610A3;
 Tue, 15 Jun 2021 17:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623778193;
 bh=y/udLKFYHLJaB0XXSTV3/plG0EFz9UjFo4yY54gp2DE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iKbe5gtHeI1ioWirQJv2hdt5aroFC7VAq/EzTP+bv2jLRdhbT9GOaBVf71yFrjha8
 2P72WTy73lhUAnX158rxBGOF2g2+KBfWc2qmGuhcFUi7R3PHncaAhwH4i/mppOruNi
 fqQUBk44I5tABAa2HYoqe2WFz4srpeEffk4G3jqzV15xf6SLew3ALpehsZB7TUYM5X
 disxMy9aiPN21Z3MNsFmAqNEI0GfiXO9LnMEtLQrUFDCdNEAtMTFYicS9NWsHTOnI+
 ozR7X2O+m2IRRCUrLgHMhnaVtXbbf0OiiUY6r0b/057iI85gvt83PWaCUZD/woaoro
 XVbL5N2Q29gwA==
From: Mark Brown <broonie@kernel.org>
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH -next 1/5] ASoC: img-i2s-in: Use
 devm_platform_get_and_ioremap_resource()
Date: Tue, 15 Jun 2021 18:29:20 +0100
Message-Id: <162377763944.21612.10913621772984918294.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615135200.1661695-1-yangyingliang@huawei.com>
References: <20210615135200.1661695-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com
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

On Tue, 15 Jun 2021 21:51:56 +0800, Yang Yingliang wrote:
> Use devm_platform_get_and_ioremap_resource() to simplify
> code.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: img-i2s-in: Use devm_platform_get_and_ioremap_resource()
      commit: e43805c28df6394254d1f49a388a1c70cae208a1
[2/5] ASoC: img-i2s-out: Use devm_platform_get_and_ioremap_resource()
      commit: ef43f463ddb3dc0acaf1447db22db85df5100380
[3/5] ASoC: img-parallel-out: Use devm_platform_get_and_ioremap_resource()
      commit: a444a902b06a361d646e608136efb35119922445
[4/5] ASoC: img-spdif-in: Use devm_platform_get_and_ioremap_resource()
      commit: c481f3838acc3e1b28fc228f9fbb2f569e3d8d0c
[5/5] ASoC: img-spdif-out: Use devm_platform_get_and_ioremap_resource()
      commit: 942f2671c573904066ddbc699ff8812b3df70a9c

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
