Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BE0726735
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 19:25:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A778483A;
	Wed,  7 Jun 2023 19:24:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A778483A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686158722;
	bh=DXFobuRLa5VJEYRkra8Yv2W5Fag/nn80UUPhzCO37/I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OuKJLYhjCbIzO3CnONb4Ut7YaQkBLdRvzot11XSEkUVgAGcc0ZqKCPxCpOFhopNoq
	 Lx6Q8upfdDFgRW7lcxlnRaR6v1c8jIs9QL0S4hn+tkEOvZ6+kYEIXb137H8Vjk5iOV
	 7FUMtSHa692tgX8TPyVSrLJE+FuUclhAIms0OlXU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A567F80567; Wed,  7 Jun 2023 19:23:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1839EF80548;
	Wed,  7 Jun 2023 19:23:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9239F80199; Wed,  7 Jun 2023 19:23:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84A77F80130
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 19:23:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84A77F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=p9nzJqhd
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 38C4A63DEC;
	Wed,  7 Jun 2023 17:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D11B0C4339B;
	Wed,  7 Jun 2023 17:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686158629;
	bh=DXFobuRLa5VJEYRkra8Yv2W5Fag/nn80UUPhzCO37/I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=p9nzJqhdievT3cH7sdFgcIONCpvuxD8owzg6hRkrjZd0OL6tPCLciW64eWZO5mMg0
	 sSx+jhvZNZ9crQzrNhpmkeUemXISN7HHUv/D/NmIIvJ/LCbimo4iuCOlJOykgeWXuQ
	 0kckTA81K5cmSPFB6+nKB4/vYFNvcRg9wuULRE+XVjBn51EUZlTHrOsKgmii9ivnlQ
	 hblqGMos5ZPcOqWHfRL/+DnW2wZpYk11Qw7k3+35NfX5n76tR9V6TAKqgGwV79E1gK
	 aVgii1F/QLjWZv1ndoz2FzWOVd59MmrXS6lIhACOZ0d/767G1j9a7dlNmTiAtr4iiQ
	 TCRlb9u2CEb0w==
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20230607120831.3587379-1-arnd@kernel.org>
References: <20230607120831.3587379-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: add i2c dependency
Message-Id: <168615862657.61571.8647819742396271999.b4-ty@kernel.org>
Date: Wed, 07 Jun 2023 18:23:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: N7ANFM7JT77D7GWTUPHZJ3XYTJAHRIHR
X-Message-ID-Hash: N7ANFM7JT77D7GWTUPHZJ3XYTJAHRIHR
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N7ANFM7JT77D7GWTUPHZJ3XYTJAHRIHR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 07 Jun 2023 14:08:15 +0200, Arnd Bergmann wrote:
> The newly added driver is missing this dependency, causing a possible
> build failure:
> 
> WARNING: unmet direct dependencies detected for SND_SOC_MAX98390
> WARNING: unmet direct dependencies detected for SND_SOC_NAU8825
>   Depends on [m]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=m]
>   Selected by [y]:
>   - SND_SOC_MT8188_MT6359 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_MT8188 [=y] && MTK_PMIC_WRAP [=y]
> aarch64-linux-ld: sound/soc/codecs/max98390.o: in function `max98390_i2c_probe':
> max98390.c:(.text+0x514): undefined reference to `__devm_regmap_init_i2c'
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8188-mt6359: add i2c dependency
      commit: 484ede9bcb031a98880817480b685cac0ec96f2b

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

