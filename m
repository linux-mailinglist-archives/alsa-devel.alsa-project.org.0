Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC89D5400FF
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 16:13:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E4F01ADB;
	Tue,  7 Jun 2022 16:12:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E4F01ADB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654611205;
	bh=cJyU+230aiz3hoabBrQP0N+I1Q926hj1jnMqC2WpPTo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QRQoRfGr1R6LFahUg9V6CPxI/Q34HHaNdD3XOMAy4syeT/t6vGOrsBV6jtOifzc3l
	 M8mctbziJ5cUOLwDM2SfkeEddM3FThfOTAL7Og3iVuKl67O8QX2EJZtctxGjlOveus
	 nBu9k1gdLHJdN9NkE+UbU6TnNTy8tID1e8wGBCig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 958CCF80302;
	Tue,  7 Jun 2022 16:11:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75E72F80526; Tue,  7 Jun 2022 16:11:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D6ECF80302
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 16:11:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D6ECF80302
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Xaa7RW0U"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0C5946157A;
 Tue,  7 Jun 2022 14:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DADCC385A5;
 Tue,  7 Jun 2022 14:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654611096;
 bh=cJyU+230aiz3hoabBrQP0N+I1Q926hj1jnMqC2WpPTo=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=Xaa7RW0UOlpXmuEQJCNVGyLHFldqiJn1YvEvkSSJk6FYeqT/mwPcEq/X2EkBkMNJE
 8/S6s++4kXiQjCJ1Ne17gp+hxWYyCGfssDyxcRBuHIeC8h3RaGilmktV6vbxSq28ev
 OF7gq/r3h2qCI21Ti/8jSz9fVzK6j6wcgivZtB0ywaQ1wt/camEcx/U9cLuekBQJOL
 ECCjBxtDCWbQtUyL1u5e4/WhBb2jlqVkTp1E717ZoAWaj3/PmkAPSmDLWaOEbATkXQ
 VKLVy34eecT3Ow6KS5uHK0Am9GjANeGZTNo6BlH4v0XoHceSmKtjMONamMyAm6OHUC
 4p5oLYP8cxiAw==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, akihiko.odaki@gmail.com, pc.liao@mediatek.com,
 angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org,
 tzungbi@google.com, koro.chen@mediatek.com, linux-kernel@vger.kernel.org,
 jiaxin.yu@mediatek.com, tiwai@suse.com, drinkcat@chromium.org,
 linmq006@gmail.com, lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, matthias.bgg@gmail.com
In-Reply-To: <20220603124243.31358-1-linmq006@gmail.com>
References: <20220603124243.31358-1-linmq006@gmail.com>
Subject: Re: [PATCH v2] ASoC: mediatek: mt8173-rt5650: Fix refcount leak in
 mt8173_rt5650_dev_probe
Message-Id: <165461109323.1597191.3939968146449868630.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 15:11:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 3 Jun 2022 16:42:41 +0400, Miaoqian Lin wrote:
> of_parse_phandle() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> Fix refcount leak in some error paths.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8173-rt5650: Fix refcount leak in mt8173_rt5650_dev_probe
      commit: efe2178d1a32492f99e7f1f2568eea5c88a85729

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
