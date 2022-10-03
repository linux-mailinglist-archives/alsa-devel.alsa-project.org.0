Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DDD5F33E4
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Oct 2022 18:48:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C14E17E2;
	Mon,  3 Oct 2022 18:48:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C14E17E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664815734;
	bh=8275/nUNkwTS9Z+rY35CEzhqt4CgDP9X5igmrk+BmuQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KlxTOLM50elWO8eYUE8p76ITViMcpJJmqKqXtmq2wbxWMuzqirUmKT7u1trfmXRrX
	 NQKT5OZoxzh57QY0eePYYlqO/mMaUoic5Q8f1NY1/nVemYO4byc4mZLAidvALP0T/O
	 gidqcIeFUndv7Ghc51FVHWVZdIXzPgFxKdQa04nY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0BFAF80431;
	Mon,  3 Oct 2022 18:47:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1E45F80269; Mon,  3 Oct 2022 18:47:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64E51F800CC
 for <alsa-devel@alsa-project.org>; Mon,  3 Oct 2022 18:47:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64E51F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ccTXOr0V"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA35B61165;
 Mon,  3 Oct 2022 16:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C594C433C1;
 Mon,  3 Oct 2022 16:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664815671;
 bh=8275/nUNkwTS9Z+rY35CEzhqt4CgDP9X5igmrk+BmuQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ccTXOr0VeVzw1V7AvDqidgIJgg/1hNMxHhUMAirC/a6DhHOGSjk1DgmlKCtfecEnQ
 vA8DVXJN70vsACDl3DTPb7P1QFD5geWn/E4/BabHSx9xu0hkQriFP2MIGlVA9K4HH+
 ae1XEh5SSPa9r8rKiQp+nRrHQ3CeOsiTx+be7qgnB62gaqNOUs6h+gtPdh4HLlbpjJ
 ELka7AYkaAwioxFBRIsfbekJAXCNW+wsH9+DhT8uRrTAd5n+hfMq8ZzlFyGlV2NMUc
 csRC8ktVgAb5EP661b1xslTZyxHaFcU6pDanEAex/XArzGQTCLGeGzVNExVyzFcnk1
 nP8DolLl/vj4Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Zhang Qilong <zhangqilong3@huawei.com>, perex@perex.cz,
 ckeepax@opensource.wolfsonmicro.com, 
 matthias.bgg@gmail.com, tiwai@suse.com, jeff_chang@richtek.com
In-Reply-To: <20220929150653.63845-1-zhangqilong3@huawei.com>
References: <20220929150653.63845-1-zhangqilong3@huawei.com>
Subject: Re: [PATCH v2 -next 0/4] Fix PM disable depth imbalance in probe
Message-Id: <166481566916.272202.9369598232153225882.b4-ty@kernel.org>
Date: Mon, 03 Oct 2022 17:47:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org
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

On Thu, 29 Sep 2022 23:06:49 +0800, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by calling
> pm_runtime_disable when error returns.
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: wm8997: Fix PM disable depth imbalance in wm8997_probe
      commit: 41a736ac20602f64773e80f0f5b32cde1830a44a
[2/4] ASoC: wm5110: Fix PM disable depth imbalance in wm5110_probe
      commit: 86b46bf1feb83898d89a2b4a8d08d21e9ea277a7
[3/4] ASoC: wm5102: Fix PM disable depth imbalance in wm5102_probe
      commit: fcbb60820cd3008bb44334a0395e5e57ccb77329
[4/4] ASoC: mt6660: Fix PM disable depth imbalance in mt6660_i2c_probe
      commit: b73f11e895e140537e7f8c7251211ccd3ce0782b

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
