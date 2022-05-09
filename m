Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8845B520421
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 20:06:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1C941678;
	Mon,  9 May 2022 20:05:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1C941678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652119599;
	bh=GNYW0f/0zhn3bNQV9q7pmTN0Wu2f6KlNa5abquY9vdA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tdsr4r7pf2+CCJAGp7fzKRasT4dM83NxhkcgoD4H60XSfhWOJxEMs+IPJluI0oiqB
	 cciaFX/29xxKsiOWWqp1FDOIlCHVzQwb/hEICA5YF4lhQ/hmXTfUJoFkHrKeR8zyr6
	 4txbx9XD3tZL0byht4VP7XVteMwyCNNAITdB7HrM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F2FCF80237;
	Mon,  9 May 2022 20:05:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22422F802E3; Mon,  9 May 2022 20:05:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2E01F800D3
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 20:05:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2E01F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NacPhBsk"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BC209B818D0;
 Mon,  9 May 2022 18:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15C6FC385B4;
 Mon,  9 May 2022 18:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652119529;
 bh=GNYW0f/0zhn3bNQV9q7pmTN0Wu2f6KlNa5abquY9vdA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=NacPhBskHAN4/3dE2A/9GW4Of2q4u87w654c1DT0X2jVS1stteLCl3si0gz3hWTAN
 IkuNw42c1oEwSNPAQi3OqpUvAuasU+IkNiOLiGlhUEKNajPqWUPuPcHT/Hof+VnphJ
 HgwcQXnCdmIPE9eXPEJAdnRySH5v7mueDVP26yCtj9T9D0reRkQNpQmlvK6CSPAket
 DMh5p6PRNzBP6Zsc3wN2l4Q7Z4kShMr0iTjLxO3v/ap3ZeFjQ8gvXb645tMyevJ0vV
 lwig9qFOd5yR6yURhawMB1gsSMxMo/nfOzDdiSuE7bsfVyT4g+XIhJ/jT23fMG2Wm1
 VkyOnNyGw5CWw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, yuehaibing@huawei.com, Arnd Bergmann <arnd@arndb.de>,
 angelogioacchino.delregno@collabora.com, perex@perex.cz, tzungbi@google.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, tiwai@suse.com
In-Reply-To: <20220507021424.12180-1-yuehaibing@huawei.com>
References: <20220507021424.12180-1-yuehaibing@huawei.com>
Subject: Re: [PATCH v2 -next] ASoC: mediatek: mt8195: Fix build warning
 without CONFIG_OF
Message-Id: <165211952680.1181242.3361665632308552172.b4-ty@kernel.org>
Date: Mon, 09 May 2022 19:05:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Sat, 7 May 2022 10:14:24 +0800, YueHaibing wrote:
> sound/soc/mediatek/mt8195/mt8195-mt6359.c:1639:32: warning: ‘mt8195_mt6359_max98390_rt5682_card’ defined but not used [-Wunused-variable]
>  1639 | static struct mt8195_card_data mt8195_mt6359_max98390_rt5682_card = {
>       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> sound/soc/mediatek/mt8195/mt8195-mt6359.c:1634:32: warning: ‘mt8195_mt6359_rt1011_rt5682_card’ defined but not used [-Wunused-variable]
>  1634 | static struct mt8195_card_data mt8195_mt6359_rt1011_rt5682_card = {
>       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> sound/soc/mediatek/mt8195/mt8195-mt6359.c:1629:32: warning: ‘mt8195_mt6359_rt1019_rt5682_card’ defined but not used [-Wunused-variable]
>  1629 | static struct mt8195_card_data mt8195_mt6359_rt1019_rt5682_card = {
>       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: Fix build warning without CONFIG_OF
      commit: 0e63a2be5651e2b34e5c2505992e58be0e9c4bb1

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
