Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6EC4E25E7
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 13:01:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05DCB16F7;
	Mon, 21 Mar 2022 13:01:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05DCB16F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647864116;
	bh=x7RIt4mLNf8mNberwc71l5fBa0XC8ugDp4MrJBP6Nek=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DohSe4LLdyCiq6gpXizPQK84nfLH3wNuoPdibYEb147n4KfIiPmqlMhRuR1yTGG/p
	 M1B8e8RikBOifCnb++oqZxNj6y/7JHgM5U8hZQ5YQA5AU6fK5f5VwU0GgHPwZu0r5z
	 EhamWz5jv96aPbS11UcJE+29ze5VtCy8MdXi2wnk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62EEBF80238;
	Mon, 21 Mar 2022 13:00:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 106FDF80227; Mon, 21 Mar 2022 13:00:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82253F80109
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 13:00:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82253F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Xa6xRMwo"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id EA44FCE1762;
 Mon, 21 Mar 2022 12:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E71C340E8;
 Mon, 21 Mar 2022 12:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647864037;
 bh=x7RIt4mLNf8mNberwc71l5fBa0XC8ugDp4MrJBP6Nek=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Xa6xRMwoEmgjWxCWOEJdmmp7L8ZGpxrrK/IlLjLMCpZPbOecdMtKsY4ttW5bkyiQn
 RQdQv+QdS/hH+Aa4AWx213Q864twi8Ro6gvE6BX1ttwwdPhY3CO+n685a17NeHdXJb
 r4n7YMUlYiqSq4O6IGLvRKMpHHAgTmgI5N4PzK+fNfeh4BtsVZWG+/n9ODaVQ5RkdU
 ftCJHj+SPsQQWa/J28XMkReAUUpgUaXPsRdx74w0qkQSPZTcOO7SicAeBXGbGliEZj
 A1elc8hIO0p5rT5DdSpiLF6IBT+FCWBMHYDjMzNVotBhhHO7pcD2qt3VnOEYimFV/p
 DKAYtWS5X3zPw==
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
In-Reply-To: <20220319120325.11882-1-jiaxin.yu@mediatek.com>
References: <20220319120325.11882-1-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt6358: add missing EXPORT_SYMBOLs
Message-Id: <164786403520.879132.12234155577870165792.b4-ty@kernel.org>
Date: Mon, 21 Mar 2022 12:00:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

On Sat, 19 Mar 2022 20:03:25 +0800, Jiaxin Yu wrote:
> Fixes the following build errors when mt6358 is configured as module:
> 
> >> ERROR: modpost: "mt6358_set_mtkaif_protocol"
> >> [sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.ko] undefined!
> >> ERROR: modpost: "mt6358_set_mtkaif_protocol"
> >> [sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.ko] undefined!
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: mediatek: mt6358: add missing EXPORT_SYMBOLs
      commit: a7663c89f4193dbf717572e46e5a3251940dbdc8

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
