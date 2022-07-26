Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2215811F7
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 13:31:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64C861E2;
	Tue, 26 Jul 2022 13:30:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64C861E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658835108;
	bh=5S7SIX8+8VYQEQQKBE0504g9SamLUXfQF0wD+GwQE6E=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DzbE8XrA25YnTxZbvb9AxrXuIjdHOyUr6Gts41K8d5YApqQx7cCHFMBWu8HmD6ALJ
	 SKCTAfAlqC3C8tJ0I8SgOyV2ZYwOFRmidcvnTUsyWLpsX+TmwIwNPScjtzlnHPKTYu
	 /f3ZTMXV/BukzsFlb7ZLIi5x8+sabPW8JFJtwhVg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C363BF800FA;
	Tue, 26 Jul 2022 13:30:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3317F804C3; Tue, 26 Jul 2022 13:30:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2750F80155
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 13:30:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2750F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="If6nt4Pn"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F341161349;
 Tue, 26 Jul 2022 11:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92203C341C0;
 Tue, 26 Jul 2022 11:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658835038;
 bh=5S7SIX8+8VYQEQQKBE0504g9SamLUXfQF0wD+GwQE6E=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=If6nt4Pne47+rniua7hVbGMTUWoakTPT4G2XWlzFjBmt3SHHB9pdlMwDkjjaDpDON
 k+/nDHRz7+ZNd3ULc+Ac3HPb32+AK8ofzZ8Qp8cdTdfUzhWVUZ18IgTWrZq9c9ONS7
 N80SgCwZsFGGxYOyeWByRcUx50tNTt/q0N1SnyYunee2RCZAfyKKuMoTRZGifVnCOi
 igoi19ltxvQYwuMToUjlEqV/AP040hMjddBLUor89Dl22pPcSzeMmgbjbwk3SeqD5y
 IhhK2XCXKX+a5RXE4Td+AcDgTEupG2u2F7KhdHZrdq6KXpyVBzqvUTKO0DbSa2sFDm
 tDBgtv/QcSkow==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, julianbraha@gmail.com, perex@perex.cz,
 geert+renesas@glider.be, matthias.bgg@gmail.com, 
 lgirdwood@gmail.com, tzungbi@kernel.org,
 angelogioacchino.delregno@collabora.com, Ren Zhijie <renzhijie2@huawei.com>, 
 trevor.wu@mediatek.com, jiaxin.yu@mediatek.com
In-Reply-To: <20220724110619.212774-1-renzhijie2@huawei.com>
References: <20220724110619.212774-1-renzhijie2@huawei.com>
Subject: Re: [PATCH -next] ASoC: mediatek: mt8186: fix Kconfig dependency
Message-Id: <165883503527.86475.6043755927851181413.b4-ty@kernel.org>
Date: Tue, 26 Jul 2022 12:30:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-c7731
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

On Sun, 24 Jul 2022 19:06:19 +0800, Ren Zhijie wrote:
> If CONFIG_SND_SOC_MT8186=y and CONFIG_SND_SOC_MT6358 is not set,
> make ARCH=x86_64 CROSS_COMPILE=x86_64-linux-gnu-, will be failed, like this:
> 
> sound/soc/mediatek/mt8186/mt8186-mt6366-common.o: In function `mt8186_mt6366_init':
> mt8186-mt6366-common.c:(.text+0x4d): undefined reference to `mt6358_set_mtkaif_protocol'
> make: *** [vmlinux] Error 1
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: fix Kconfig dependency
      commit: f20d5116b7f3d8d40e1248a59be89e667eaabd62

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
