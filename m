Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C41959EB75
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 20:52:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF3F4168B;
	Tue, 23 Aug 2022 20:51:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF3F4168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661280739;
	bh=cs17o2i+l63HI0ig2H81rSYNYdqBTrrXaJ5UfzE3tPc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IAlqHQ9MlZCyDVgYN1O3aqySxSPQbNFnC+y3TpK15S/wvz4gGiTdNer/Kz3J0Mj3E
	 ZKIh+W/w37p7XmTKFL79La/S985a0kk70k7WABvXZ+P30kq5fl81c8UtdRmoV2fGXE
	 BTWIZJuprKcWE+HHBuzKIUX79zcflkvq5bDOz98I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC7B1F8053D;
	Tue, 23 Aug 2022 20:50:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AD92F8053B; Tue, 23 Aug 2022 20:50:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C54FF80537
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 20:50:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C54FF80537
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gegl/xff"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3B63461716;
 Tue, 23 Aug 2022 18:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D17C43470;
 Tue, 23 Aug 2022 18:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661280608;
 bh=cs17o2i+l63HI0ig2H81rSYNYdqBTrrXaJ5UfzE3tPc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gegl/xff6oBa1d0RalUiCoq2qAl+HPe9CyA9nd/UG7QePRTIknGOT3k4AjlyiZ32y
 2R3nsWxlw8i+Iqlnn2fVIAiPTAHl3dUnW2HWx/i7n/KBFWyT4RaIE40VUdftjNlnOJ
 yEqfzL/mjGr3IbqSG3gJ0S+unCR1frZsQVtZqYpaEImQpJPbnNPaA+pDQ6GbkzJeL7
 BPKTkD6TiH7CIXMz7mjYOaQeQTYkvikFmFV2O4d/XkxlxAAT6z0SaS9XIHecFgqDQK
 XVHahS97Iw1Mt8VPBaf7ElESu2yPUJ7U1Lvgmm5Ytpoy1oRWQMv3paz7CH+eD+VnId
 D7K5e8AdNPuxg==
From: Mark Brown <broonie@kernel.org>
To: angelogioacchino.delregno@collabora.com, nfraprado@collabora.com,
 Chunxu Li <chunxu.li@mediatek.com>, lgirdwood@gmail.com
In-Reply-To: <20220823090735.12176-1-chunxu.li@mediatek.com>
References: <20220823090735.12176-1-chunxu.li@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: rename sound card name
Message-Id: <166128060567.1031684.10706581523547029443.b4-ty@kernel.org>
Date: Tue, 23 Aug 2022 19:50:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 jiaxin.yu@mediatek.com, project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
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

On Tue, 23 Aug 2022 17:07:35 +0800, Chunxu Li wrote:
> From: "chunxu.li" <chunxu.li@mediatek.com>
> 
> The field 'topology_shortname' in 'snd_soc_card' is defined as char[32],
> Current card name will be truncated when SOF is enabled, so rename the
> sound card name.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: rename sound card name
      commit: e8ee449bd7a45e871fc84fe51c773f7a6e68a02f

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
