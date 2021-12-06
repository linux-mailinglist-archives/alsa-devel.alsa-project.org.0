Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B07DB46A3B0
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 19:01:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E5F822B7;
	Mon,  6 Dec 2021 19:01:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E5F822B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638813714;
	bh=zHUTDXXfzWnxTHaFvSpW2L0XNbOVdHY/sxh/MV0nomI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I+SSkM3eEWtMJqKZsxAlggn7VNSzMEk5kjLp0TBZMk5iVcPNBzv+ZxfLUUI1esPxm
	 OGR3rqW1FjHjZOlGZKeyGKKJst6mSL56d2NCcuXpT6Fgh/JIyQJ+/hk3SLZc/tCNCi
	 onBiCAp04Fpi3WJA2S/E9rJmPQy+BePeQPLWXqA4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91373F804EC;
	Mon,  6 Dec 2021 19:00:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9454DF804EC; Mon,  6 Dec 2021 19:00:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DF6EF804E4
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 19:00:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DF6EF804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Tnx+LyrF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B40B1B811C9;
 Mon,  6 Dec 2021 18:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1AEBC341C1;
 Mon,  6 Dec 2021 18:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638813628;
 bh=zHUTDXXfzWnxTHaFvSpW2L0XNbOVdHY/sxh/MV0nomI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Tnx+LyrFNU/9Vvi5FBG2FmEFVQZunIyrA7BceY33+nYpWIxa+o6MqazpOp3xQY6ut
 +4LDzpPx2FXoJG3xN8c3svkItB7ogm2e/JvrN4IIs4dIm8/O+t856zmk4xGYS2Ajl5
 inhSKEjGfld+8p01/pQ9Zpk9nLonB3CwuVresSTw5WocLmlEJchvnNxAJyYtCF2KN1
 xYC5BOiJ3fFSKHKgC8ywjQzOf3vszFM+MfbIQPTf8ADLiwkDhdp8dqotCDNn33B6OZ
 Zfg/nfW9If9WjmVnGwlrLHTxk9W5CcI6Iy8qYl8g5PfWEGIosqozSWo6HUTRlRFDju
 xpLjmq68/rEiA==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, matthias.bgg@gmail.com, tiwai@suse.com,
 Trevor Wu <trevor.wu@mediatek.com>
In-Reply-To: <20211129141057.12422-1-trevor.wu@mediatek.com>
References: <20211129141057.12422-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH v2 0/4] ASoC: mediatek: Update MT8195 machine driver
Message-Id: <163881362422.2769299.13576953689584169746.b4-ty@kernel.org>
Date: Mon, 06 Dec 2021 18:00:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 daniel.baluta@nxp.com, linux-arm-kernel@lists.infradead.org
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

On Mon, 29 Nov 2021 22:10:53 +0800, Trevor Wu wrote:
> This series of patches adds support for RT5682s headset codec in mt8195
> machine drivers, and SOF support on card mt8195-mt6359-rt1019-rt5682 is
> also included.
> Patches are based on broonie tree "for-next" branch.
> 
> Changes since v1:
>   - remove patch3 and patch4 in v1
>   - add SOF support on card mt8195-mt6359-rt1012-rt5682
>   - add new propertes to dt-bindings for mt8195-mt6359-rt1019-rt5682
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: mediatek: mt8195: add headset codec rt5682s support
      commit: c9d57a25de53800e54969f4bf2b672b3a58cdaf5
[2/4] dt-bindings: mediatek: mt8195: add model property
      commit: 629e442761bae0c62b2fb14061d66bbd08b4155e
[3/4] ASoC: mediatek: mt8195: add sof support on mt8195-mt6359-rt1019-rt5682
      commit: 3d00d2c07f04f47aa4228700b440ac47abf13853
[4/4] dt-bindings: mediatek: mt8195: add adsp and dai-link property
      commit: 6182ec4616d6ffc046bea798c683a0dee11ded67

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
