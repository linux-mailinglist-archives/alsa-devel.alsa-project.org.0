Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A411D64606D
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Dec 2022 18:39:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA5B31838;
	Wed,  7 Dec 2022 18:38:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA5B31838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670434763;
	bh=ln8UbPMcYS/65vm5+MnMPgt6R+k41vnkbbKxMxHspAg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LW4PqWmZ+c1WalMMqWYV4VFvE6c79W90z5r4wtMSIEnT3tEC+oCSBvMoaDhbouBCU
	 wy/pE7MZPf30zHGlEV2Usk+JtOsJr3BXCGSA7315wgaG3JVzyDKS20MqvjihmabMKd
	 OTKSOyBM8cwXt0zg5agttC1qaX4oPS9Bbfc5NOCo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F271EF802BE;
	Wed,  7 Dec 2022 18:37:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2587F8055A; Wed,  7 Dec 2022 18:37:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FFE0F8054A
 for <alsa-devel@alsa-project.org>; Wed,  7 Dec 2022 18:37:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FFE0F8054A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fVY8eGIz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0004D61B45;
 Wed,  7 Dec 2022 17:37:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59532C433C1;
 Wed,  7 Dec 2022 17:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670434662;
 bh=ln8UbPMcYS/65vm5+MnMPgt6R+k41vnkbbKxMxHspAg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fVY8eGIz+EmmQCXMu5c/K9Rs+wsOoATgVdZm5jCSCo3mI9s/boRz79OC7TMDQvtfl
 yEOrX/8ZXFJwBVoeMhHZPTJ9gDjHlo80J+IJacOqiv+occTtb7vKNSF3db4Ktp9u0q
 3LXchymIY4sa/zZK3DYZlOyPjNOO/pBO1ZlCLIZtDxqpiCr7HTPEUCcOX6E55kq1lg
 zdtfW6Ao1Kh/Vvq4u8oA4G6S9HwfITVwBUbtBJy0ov7WGVMYhTRyDMSQ7gdJz2LKw8
 8c64qtRhVWPZWAJI9yc+HYPtHAJAcZdapEn1pmTzTuAKgLKeVoaULLGg6CYRsVDH3u
 Yr04EloZtLGRw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, Wang Yufen <wangyufen@huawei.com>
In-Reply-To: <1670234664-24246-1-git-send-email-wangyufen@huawei.com>
References: <1670234664-24246-1-git-send-email-wangyufen@huawei.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8173-rt5650-rt5514: fix refcount leak
 in mt8173_rt5650_rt5514_dev_probe()
Message-Id: <167043465894.393374.8060472153388836896.b4-ty@kernel.org>
Date: Wed, 07 Dec 2022 17:37:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.0-dev-b77ec
Cc: alsa-devel@alsa-project.org, garlic.tseng@mediatek.com,
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

On Mon, 05 Dec 2022 18:04:24 +0800, Wang Yufen wrote:
> The node returned by of_parse_phandle() with refcount incremented,
> of_node_put() needs be called when finish using it. So add it in the
> error path in mt8173_rt5650_rt5514_dev_probe().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8173-rt5650-rt5514: fix refcount leak in mt8173_rt5650_rt5514_dev_probe()
      commit: 3327d721114c109ba0575f86f8fda3b525404054

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
