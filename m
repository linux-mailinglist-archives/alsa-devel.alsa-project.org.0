Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA6C5B7633
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 18:14:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD46C17B7;
	Tue, 13 Sep 2022 18:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD46C17B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663085646;
	bh=GVVGW0XNbw65Kif4FFiljAj61CM7fhSjCYDVZNvRSdM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hnwY5HFFrR4/wro32jDc5L05SlsvrODnHSjjRzQK+mcVSkslraAFoecAh8ih1AQtM
	 X9IK+KQ5KJFtDSxvIsFxx3C8P2QT5CP+6mlBdtR6WpIT0Bu/8Ne5L8HmvtpOi+v3zB
	 IC03uVfSDeIW6b/K3MhkL5rf1lCC2XwutJ+TDQwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 202A9F801EC;
	Tue, 13 Sep 2022 18:13:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D862FF80224; Tue, 13 Sep 2022 18:13:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 677D1F8008E
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 18:13:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 677D1F8008E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iviA63r0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2E3D2614D6;
 Tue, 13 Sep 2022 16:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 008C5C433C1;
 Tue, 13 Sep 2022 16:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663085577;
 bh=GVVGW0XNbw65Kif4FFiljAj61CM7fhSjCYDVZNvRSdM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=iviA63r0Lnm9UEQn9DmhBWffJx4Tw1RqEphmsamTrPfgWRh4ifN5EJBu5RYLu6Vjy
 rc1KkkuoMDQMaIQ+6UvAlJOabjXFlKvK2Xd8TN9fDVVsjh0eb/5wxaS4SJQnHyVc0H
 B1+DsRScvdtLYBirx0t2zXQff0l1CW0o7UGbQWHFpzSfjgrILjEFYnvwkKOKoq4JAQ
 Oen66MBTKKvvyUAPwEX9T4jX8GIn8tI+VyPpQnHUEdNLAdfIr5zPuFN20bQt4NQJlK
 MdQI2kt+UDLwI0XewGwTmutlxypa9xSgLJ/Q81ZhQjT1mHUXZYbh++1NBZWsMbInON
 xYd9dTe5P/reA==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, tiwai@suse.com, alsa-devel@alsa-project.org,
 perex@perex.cz, Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com
In-Reply-To: <1663057594-29141-1-git-send-email-shengjiu.wang@nxp.com>
References: <1663057594-29141-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: ak4458: Add ak4458_reset in device probe and remove
Message-Id: <166308557481.242391.17534144170473474022.b4-ty@kernel.org>
Date: Tue, 13 Sep 2022 17:12:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-7dade
Cc: kuninori.morimoto.gx@renesas.com
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

On Tue, 13 Sep 2022 16:26:34 +0800, Shengjiu Wang wrote:
> This patch fixup this warning when CONFIG_PM not defined
> 
> linux/sound/soc/codecs/ak4458.c:631:13: error: 'ak4458_reset' defined but\
>         not used [-Werror=unused-function]
>   631 | static void ak4458_reset(struct ak4458_priv *ak4458, bool active)
>       |             ^~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: ak4458: Add ak4458_reset in device probe and remove
      commit: da995e22fa7193b067f2545e63d726ffe36ba174

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
