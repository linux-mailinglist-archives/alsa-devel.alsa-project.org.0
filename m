Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D20D3FE24A
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 20:18:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 996A21797;
	Wed,  1 Sep 2021 20:17:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 996A21797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630520286;
	bh=F3PsqF8kI1YopDkw1jrsG80A5fXXJVkd7n6uEtryW9U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nnNqI9dt1Ee7lC0InUnYuGjTgZGLwhBt3StLRe/enJDFtc6/seVoYs+oEdgL8DaWA
	 i6D/Qe37A0hbcWWgf9O54cgj+/Xk0sUoXK0yYRJsQUt7pqp3ZXvNoGdDC7BmoRxGZs
	 2x1F1/jJKk/hUi2ZJuSheocbMb80jifvAxgafjXI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26694F804F1;
	Wed,  1 Sep 2021 20:15:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15649F804E7; Wed,  1 Sep 2021 20:15:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECE5BF804D9
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 20:15:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECE5BF804D9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mZgKgvjQ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 139AE610CA;
 Wed,  1 Sep 2021 18:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630520135;
 bh=F3PsqF8kI1YopDkw1jrsG80A5fXXJVkd7n6uEtryW9U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mZgKgvjQxxELJfFRNv8ApXFEG4ksWKr9Tfr1mg9T5x3awqaB/7OTXIneqIer7IJrt
 BYg6f0CJAbffLI1fhSMN5dFH6YNjSnqrhPBetHlUjpqXls383MYDIMauBtnhMcz2YB
 V8iOEe1Tib8zZYZIvGJBTl6UYEpaKOgrB6L1dZaWFx9ukY2zz9XZOWhwP83Ygyni5x
 sLYnix6tC1keHVU/UKCj3ZZ1OWowQpbJHI+/M/RVmkGBTXGddFV+JpiMIbzP4J3kwI
 ZTgdisv9fetcQiNr39m4ZBVXn0uTTy+/LoP3LHQzwD3y9C18Tt4kCpuPvjismuEk+V
 ywQwwkHU6WOVQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, matthias.bgg@gmail.com, Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: add MTK_PMIC_WRAP dependency
Date: Wed,  1 Sep 2021 19:14:47 +0100
Message-Id: <163051912509.21630.1658074283329712845.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210831021303.5230-1-trevor.wu@mediatek.com>
References: <20210831021303.5230-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

On Tue, 31 Aug 2021 10:13:03 +0800, Trevor Wu wrote:
> randconfig builds show the warning below,
> 
> WARNING: unmet direct dependencies detected for SND_SOC_MT6359
>    Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && MTK_PMIC_WRAP [=n]
>    Selected by [y]:
>    - SND_SOC_MT8195_MT6359_RT1019_RT5682 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y] && SND_SOC_MT8195 [=y]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: add MTK_PMIC_WRAP dependency
      commit: cd5e4efde23ad8050921672ed777ec3f7aa310ec

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
