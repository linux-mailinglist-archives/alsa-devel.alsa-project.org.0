Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AA957048C
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jul 2022 15:43:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 642DF82C;
	Mon, 11 Jul 2022 15:42:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 642DF82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657547006;
	bh=KqT9jXk7gPcHs0OREpA0JbWzkxkbkXw/FOHUWxufhRo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bWgTpr/9wYCcEE86G11Ubi66XA+FdodRvF7t1iPqharW1Ddib68ZRNLpVL5wfsLei
	 3/iKG8gwZH08dCF47ZJ8yBpqj/0jlyG+fjBmR0cuUet85grrkSG2ZppUma50zFdT4X
	 kPN556cl1n4sw3aVHOZS/kzjAcotFd7EuDu62zR0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3242F80256;
	Mon, 11 Jul 2022 15:42:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 379F5F80256; Mon, 11 Jul 2022 15:42:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3794F800E1
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 15:42:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3794F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Yh4+12vn"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EFF68B80F10;
 Mon, 11 Jul 2022 13:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1876C3411C;
 Mon, 11 Jul 2022 13:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657546938;
 bh=KqT9jXk7gPcHs0OREpA0JbWzkxkbkXw/FOHUWxufhRo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Yh4+12vnfz/2k7t73GAfVvazukytAqGwPao+x+u63zCaZL4Ed1Et6Pd6qTMkTuVhH
 G62ZGbXc5ca1lpNJmS4AHKmiSO1cGZFv7A5Ez/skc2P/E4ib4x6Nm8F1GGYFGmlKUe
 jdqg9f8RZ0m5m1jQQn4TwF4Dy/68gsc4RcbQg4J4Ic+yxz5Hx5J14pZeGgSnGZjxwe
 YWwtmifKVmuztiw6SJzq4vmtONW1aXJE1mA2qZqstUuVhFqdX//Wv9UNXgKpHB0iNT
 Q4se9Xx61BaiigNoUqPFsE09l9Lsp1fQQg3kM5pkv2xy829N7Qnf7uHPzWwq5j0K5t
 wDC8Sbj6efthQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@nxp.com, perex@perex.cz, festevam@gmail.com,
 lgirdwood@gmail.com, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, tiwai@suse.com
In-Reply-To: <1657507190-14546-1-git-send-email-shengjiu.wang@nxp.com>
References: <1657507190-14546-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_utils: Drop usage of __clk_get_name()
Message-Id: <165754693638.334539.15476852072708408930.b4-ty@kernel.org>
Date: Mon, 11 Jul 2022 14:42:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Mon, 11 Jul 2022 10:39:50 +0800, Shengjiu Wang wrote:
> Avoid build errors when CONFIG_COMMON_CLK is not set/enabled.
> 
> ERROR: modpost: "__clk_get_name" [sound/soc/fsl/snd-soc-fsl-utils.ko] undefined!
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_utils: Drop usage of __clk_get_name()
      commit: eaa27e7fe43f16fe587c3e93fd5c25ce86be3c43

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
