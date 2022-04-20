Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5820650923F
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 23:42:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2D221B54;
	Wed, 20 Apr 2022 23:41:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2D221B54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650490961;
	bh=gvn5BSmC9Jsd1/qMym3y+oaL74DaveOcfZLSgIjczxs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bro++YZuk3BXwLLVhuoZHTJTsPXFbDL+TOmmKLaJ1jopySP695M1MKBSsNOAx2zR0
	 XAROQNUoIqeD+kSXId8cRCrwPfyCFBXsAFDvO7tHvXXuyjcVM7VIW6YCi2Ofezq8OP
	 hHmN4n9wLfrnqvkq12w8fCvp05tafFXKZ5qUkz3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3AC8F80511;
	Wed, 20 Apr 2022 23:41:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DCBAF80506; Wed, 20 Apr 2022 23:40:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5A95F800C1
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 23:40:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5A95F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cif8fJwX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E153B61856;
 Wed, 20 Apr 2022 21:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80299C385A0;
 Wed, 20 Apr 2022 21:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650490850;
 bh=gvn5BSmC9Jsd1/qMym3y+oaL74DaveOcfZLSgIjczxs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=cif8fJwXIv+c+0lzRiwin91dbAUesYiiL3gDZCK6bJttroQMK6hwk/okrzEpqfk7a
 QQKxFs/2a9mqroRCMrkXKCEN6Y/uC2Kh0xLL39zhvr2CJf/qUhd5diAUtuuonu0xnP
 9FfMZZL+TUTT1/xx7JPjM8vtl5LK/LgCE4X2xYAMVeu2AYCj/nlrgEMVT2ijYJ8gDF
 WH/pGVgE9nKct/GlBXw6jyXs50LCfUlSS3CNUex9XY9GKcWECiO3rfk/ZH0s53Ev6t
 YsSXTPSLhFmqYcvJt4GKFGBzrIktgwvEfUFbNimZE3EfWnFToRnyVKs1lVnlNalOWJ
 pOY6Wl16WC/dA==
From: Mark Brown <broonie@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>, alsa-devel@alsa-project.org
In-Reply-To: <20220414162249.3934543-1-s.hauer@pengutronix.de>
References: <20220414162249.3934543-1-s.hauer@pengutronix.de>
Subject: Re: [PATCH v6 00/21] ASoC: fsl_micfil: Driver updates
Message-Id: <165049084823.138067.11607241649692641258.b4-ty@kernel.org>
Date: Wed, 20 Apr 2022 22:40:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Xiubo.Lee@gmail.com, festevam@gmail.com, vkoul@kernel.org,
 linux-imx@nxp.com, kernel@pengutronix.de, dmaengine@vger.kernel.org,
 shengjiu.wang@gmail.com
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

On Thu, 14 Apr 2022 18:22:28 +0200, Sascha Hauer wrote:
> I added one more ack from Shengjiu Wang, but other than that it's just a
> resend with +Cc: Mark Brown
> 
> Sascha
> 
> Changes since v5:
> - Add one more ack from Shengjiu Wang
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/21] ASoC: fsl_micfil: Drop unnecessary register read
        commit: c808e277bcdfce37aed80a443be305ac1aec1623
[02/21] ASoC: fsl_micfil: Drop unused register read
        commit: 384672e3b7af65aaebb794a6d1a77bb975a10678
[03/21] ASoC: fsl_micfil: drop fsl_micfil_set_mclk_rate()
        commit: 3ff84e3dd180c368981b2d58ed50f17a47471828
[04/21] ASoC: fsl_micfil: do not define SHIFT/MASK for single bits
        commit: bd2cffd10d79eb9280cb8f5b7cb441f206c1e6ac
[05/21] ASoC: fsl_micfil: use GENMASK to define register bit fields
        commit: 17f2142bae4b6f2e27f19ce57d79fc42ba5ef659
[06/21] ASoC: fsl_micfil: use clear/set bits
        commit: d46c2127ae8e10378213f71abe4fe88adb17549c
[07/21] ASoC: fsl_micfil: drop error messages from failed register accesses
        commit: 2c602c7ef9ef08835f2e3e0c438d10b7142d6959
[08/21] ASoC: fsl_micfil: drop unused variables
        commit: 819dc38b93e7e0606d71dde80896c139afe7ce48
[09/21] dmaengine: imx: Move header to include/dma/
        commit: c6547c2ed0e1487c91983faccad841611ab6a783
[10/21] dmaengine: imx-sdma: error out on unsupported transfer types
        commit: 625d8936c3378016ec8c480a00432034bcb813c9
[11/21] dmaengine: imx-sdma: Add multi fifo support
        commit: 824a0a02cd74776461aaa30d792b1ed9111c9aa5
[12/21] ASoC: fsl_micfil: add multi fifo support
        commit: 2495ba26e838176c3b572b2b1592d75b4b963692
[13/21] ASoC: fsl_micfil: use define for OSR default value
        commit: fb855b8d46a17c9bb5562e315158de52b18b7e62
[14/21] ASoC: fsl_micfil: Drop get_pdm_clk()
        commit: be6aeee2eb82e5ae57f8cc613c0b6cc3e8d33664
[15/21] ASoC: fsl_micfil: simplify clock setting
        commit: e8936f6925c1174242e643e0aa0646359c192fe2
[16/21] ASoC: fsl_micfil: rework quality setting
        commit: bea1d61d5892083551f92818e964801baabd95a9
[17/21] ASoC: fsl_micfil: drop unused include
        commit: dcc4301584abcf692fbe4836b01303c4b4cdef46
[18/21] ASoC: fsl_micfil: drop only once used defines
        commit: 99c08cdb6d51347ef3a56b8c8ec03e2d855b10c3
[19/21] ASoC: fsl_micfil: drop support for undocumented property
        commit: cbd090fa1fbf021e286f83d602e01ff3f0b726fd
[20/21] ASoC: fsl_micfil: fold fsl_set_clock_params() into its only user
        commit: cc5ef57d130d78c8c30062eef140c01ee47f346e
[21/21] ASoC: fsl_micfil: Remove debug message
        commit: a69d7f1bd373205bf539b9762423c8d526b9b9cb

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
