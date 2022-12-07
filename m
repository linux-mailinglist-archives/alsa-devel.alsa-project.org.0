Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DED464606E
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Dec 2022 18:39:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B136E187B;
	Wed,  7 Dec 2022 18:38:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B136E187B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670434772;
	bh=l/Hux/68V+al46JNc+uBAW3FAqg3S010/czLJPsKipM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tYLevEqiDfKQSW6JMyvgyr22HZnk5unERNOb3rnPxrQRC5SPhug1ZBUsmCO8WgiMo
	 loR2jF/+9P7RbW1r7KEE0jTKgjDRkv9jM592Vct87tWpINEuERe/lZcPTfFMrLopV0
	 driaTaqsDbz7KOXt3MPWGhw2Z6WMbcR1BzMRWls8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73214F80564;
	Wed,  7 Dec 2022 18:37:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44D06F80559; Wed,  7 Dec 2022 18:37:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EE56F802BE
 for <alsa-devel@alsa-project.org>; Wed,  7 Dec 2022 18:37:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EE56F802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UhbrPF7b"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E13E161B77;
 Wed,  7 Dec 2022 17:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6BC7C433C1;
 Wed,  7 Dec 2022 17:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670434658;
 bh=l/Hux/68V+al46JNc+uBAW3FAqg3S010/czLJPsKipM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UhbrPF7bQhhj/AM69qDVz4xBlD0EB0Ibzkb7Z4hNx3T7f95NHB3TqGO5hAH0Ya7N4
 OV0Tk+pr2mSdNl8inq7RkCNIs9BsBIz9KizJ7/QczoVogxJ2OgWyL1SmmSARO3V8hI
 oLTTL1PuqhU12LAZ/kUNNSvpV52QGEIbDLGeNdKXNDqDTPXTM8Z5lKfnu1i2/Nf6w2
 4tWGmlr59/dkIN/3cDhHmO45uCqHY28NwWDLkA5kypyzfrtZ9i/Hl7cdG9/IoqcaDK
 JUE8WCyBNyn2vM3w2GEoCPzEgNRICGR+zIQpZEXw6dMAxnIzrkoQVAKOVK1GoGdfxo
 qphvY6E43eCgg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, Wang Yufen <wangyufen@huawei.com>
In-Reply-To: <1670234188-23596-1-git-send-email-wangyufen@huawei.com>
References: <1670234188-23596-1-git-send-email-wangyufen@huawei.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8183: fix refcount leak in
 mt8183_mt6358_ts3a227_max98357_dev_probe()
Message-Id: <167043465528.393374.16429232928958937003.b4-ty@kernel.org>
Date: Wed, 07 Dec 2022 17:37:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.0-dev-b77ec
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 shunli.wang@mediatek.com, linux-arm-kernel@lists.infradead.org
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

On Mon, 05 Dec 2022 17:56:28 +0800, Wang Yufen wrote:
> The node returned by of_parse_phandle() with refcount incremented,
> of_node_put() needs be called when finish using it. So add it in the
> error path in mt8183_mt6358_ts3a227_max98357_dev_probe().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8183: fix refcount leak in mt8183_mt6358_ts3a227_max98357_dev_probe()
      commit: 38eef3be38ab895959c442702864212cc3beb96c

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
