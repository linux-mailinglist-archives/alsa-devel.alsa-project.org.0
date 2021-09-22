Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E34BB414BCA
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Sep 2021 16:24:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D97A1614;
	Wed, 22 Sep 2021 16:23:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D97A1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632320666;
	bh=I4JaBMBq3FqO33IuXZhnzeFZjFe/WGM1WxBSLHEcIv4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fRc8DCmjwJO+u+ZWt9+9E5NnzpEj4Ob3hrGDT2QCOGs5zQe50c6BY5FwsiOqC8sXK
	 1l3/e0JN/vRkPDsoy532kkerGTYVNHZUcoBx3gMhTCxrHKQ2JQp/1y2qcHs9e/spxo
	 N9VqH9hUxyXO6voAY9Sn1UjWgKajZg5xQGXkq9Yw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 551B6F8014E;
	Wed, 22 Sep 2021 16:22:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E68CF80279; Wed, 22 Sep 2021 16:22:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 005BCF8014E
 for <alsa-devel@alsa-project.org>; Wed, 22 Sep 2021 16:22:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 005BCF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vG5Z5JUR"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A1786120E;
 Wed, 22 Sep 2021 14:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632320552;
 bh=I4JaBMBq3FqO33IuXZhnzeFZjFe/WGM1WxBSLHEcIv4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vG5Z5JUR3JXwVWJidPdZVATV2PLkwziiPrgSwrRijnbeGIz1083V2GWZehJeBLReL
 p++eH240id5321byVFgX1hilQ9Z7XPu7n5LejE8atc/FiGD097sIAq0RmaPgNatY/N
 bOfeIUHInmlfWTwgC0zNRJ3qi0FzRnpL18LWCjADt5kRmhPQy65n8lUH9TY0r+BNoy
 O0KueQQviBmRvTOBMTL5SpDpz5E5prWo9KFi6IWz1pGN2mb43XxmK25PiOZzXIze7P
 XIj0X8LXeu5Y8mycOhTwTWAn3a/c4aY2Lu3gbOwUV4//byyd0V0uv7JbRMxWLWcDOi
 2NmjXAp8qVI4A==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>
Subject: Re: [PATCH v2 01/16] ASoC: eureka-tlv320: Update to modern clocking
 terminology
Date: Wed, 22 Sep 2021 15:21:39 +0100
Message-Id: <163232020287.53242.69105803133049993.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921213542.31688-1-broonie@kernel.org>
References: <20210921213542.31688-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
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

On Tue, 21 Sep 2021 22:35:27 +0100, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the eureka-tlv320 driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/16] ASoC: eureka-tlv320: Update to modern clocking terminology
        commit: 4348be6330a18b123fa82494df9f5a134feecb7f
[02/16] ASoC: fsl-asoc-card: Update to modern clocking terminology
        commit: 8fcfd3493426c229f4f28bc5757dd3359e02cee8
[03/16] ASoC: fsl-audmix: Update to modern clocking terminology
        commit: 2757b340b25dd2cb3afc748d48c1dff6c9689f80
[04/16] ASoC: fsl-esai: Update to modern clocking terminology
        commit: e0b64fa34c7f444908549c32dd68f81ac436299e
[05/16] ASoC: fsl-mqs: Update to modern clocking terminology
        commit: a51da9dc9b3a844460a355cd10d0db4320f4d726
[06/16] ASoC: fsl_sai: Update to modern clocking terminology
        commit: 361284a4eb598eaf28e8458c542f214d3689b134
[07/16] ASoC: fsl_ssi: Update to modern clocking terminology
        commit: 89efbdaaa444d63346bf1bdf3b58dfb421de91f1
[08/16] ASoC: imx-audmix: Update to modern clocking terminology
        commit: bf101022487091032fd8102c835b1157b8283c43
[09/16] ASoC: imx-card: Update to modern clocking terminology
        commit: d689e280121abf1cdf0d37734b0b306098a774ed
[10/16] ASoC: imx-es8328: Update to modern clocking terminology
        commit: 56b69e4e4bc24c732b68ff6df54be83226a3b4e6
[11/16] ASoC: imx-hdmi: Update to modern clocking terminology
        commit: a90f847ad2f1c8575f6a7980e5ee9937d1a5eeb4
[12/16] ASoC: imx-rpmsg: Update to modern clocking terminology
        commit: caa0a6075a6e9239e49690a40a131496398602ab
[13/16] ASoC: imx-sgtl5000: Update to modern clocking terminology
        commit: 419099b4c3318a3c486f9f65b015760e71d53f0a
[14/16] ASoC: mpc8610_hpcd: Update to modern clocking terminology
        commit: 8a7f299b857b81a10566fe19c585fae4d1c1f8ef
[15/16] ASoC: pl1022_ds: Update to modern clocking terminology
        commit: fcd444bf6a29a22e529510de07c72555b7e46224
[16/16] ASoC: pl1022_rdk: Update to modern clocking terminology
        commit: 39e178a4cc7d042cd6353e73f3024d87e79a86ca

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
