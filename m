Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D923A419D8C
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 19:52:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6435416BC;
	Mon, 27 Sep 2021 19:51:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6435416BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632765152;
	bh=1ITr6DFcrOiv67N7bgEYPdZBFX7rGR5djVl44XEiFHY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HimftjFxx5gwJYqtDdI/bGbSqkLZWFKNFRg7SMdmIDOLWSvPYbA7BdZiAGWpfDKWN
	 vggTyG2g9/kWJZNHRTVwyh5aAty1gtmoTeAEES/JdkTxDp79EFh58tVN4FRBqxL79l
	 gNXWQ2mbi9kksOf9pXjXKwGHFawal5gREKcWs5yo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72228F8052D;
	Mon, 27 Sep 2021 19:47:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7970F8052D; Mon, 27 Sep 2021 19:47:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69F3DF80506
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 19:47:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69F3DF80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nqQ79nRI"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DBF8D60FD7;
 Mon, 27 Sep 2021 17:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632764854;
 bh=1ITr6DFcrOiv67N7bgEYPdZBFX7rGR5djVl44XEiFHY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nqQ79nRI/jbu3wUy/w+xH3nOj6sFf4LBQ10Nt3M8wp9siYFU2INKjTf+QGQtRWxFe
 Bos6YxmQe51/qohrPqXJx8rYkWhWXhVAEFFcSWBin9W2RTz0Pbh+X4BKX44o8OzSrq
 hgntUYnqyv3A2jyCXzp9QIuIVDphM+5lm1lPTkAjUVUdLcebEubOhlTHqC8EQuZsYr
 veWlyDVQbK+dS2sU6EpOSj3fdST2lgPE+609hhnt+letQOwR+2CcukcRg311rCMWRE
 fPVjMEPHFEV2AovInSbNxc7HxuI/njy7C9fILd/fYaPNASj2tuaA+I2MCgGSiNkWX9
 4Xg7V9BS9bvFQ==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Subject: Re: [PATCH 1/6] ASoC: adau1372: Update to modern clocking terminology
Date: Mon, 27 Sep 2021 18:45:35 +0100
Message-Id: <163276442021.18200.13768597192766769075.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210916151806.20756-1-broonie@kernel.org>
References: <20210916151806.20756-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Thu, 16 Sep 2021 16:18:01 +0100, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the adau1372 driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: adau1372: Update to modern clocking terminology
      commit: 9c42dd7bfbcab002b67653eaf3b95358ad2ae29f
[2/6] ASoC: adau1373: Update to modern clocking terminology
      commit: 829fddb1f6863c323bad354afa708ecad180ac39
[3/6] ASoC: adau1701: Update to modern clocking terminology
      commit: 33ff453907ee1d92e43108a0f18853f59a14d896
[4/6] ASoC: adau17x1: Update to modern clocking terminology
      commit: a41a008fe8229dfefb069cc6121a81982d164b87
[5/6] ASoC: adau1977: Update to modern clocking terminology
      commit: 21b686e0bf439de97dab5c78f2e07c4cb361ec26
[6/6] ASoC: adav80x: Update to modern clocking terminology
      commit: 9943ab72fd37062a850a4a58eac2c74269e28432

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
