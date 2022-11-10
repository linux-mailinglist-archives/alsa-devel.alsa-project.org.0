Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1A0624D25
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 22:37:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CD9C1663;
	Thu, 10 Nov 2022 22:36:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CD9C1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668116240;
	bh=FlOYPoOq6odOEjov8ah/a4Kw3+KSVXlv9br0h1BIjW0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=czT0wZOJy3LB3GC2DBI5jzKQiOAsomjYEPLlhO1LPC+tW4ABD+UgEVPWclRYBI/FQ
	 3VQ8byMf60Cat+s7zMsGXQ7ovT9ZEZrxV5BPtfmKPe91r0N/FnYdYX60QW8Irb9NfC
	 3k3f4YhlM8+h9wxuAI/XfP5MKBOegNerESUtX9VE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2605AF80114;
	Thu, 10 Nov 2022 22:36:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74E96F802E8; Thu, 10 Nov 2022 22:36:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D3A0F80114
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 22:36:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D3A0F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UWitsBdu"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CBBC161E60;
 Thu, 10 Nov 2022 21:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98ABFC433D6;
 Thu, 10 Nov 2022 21:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668116177;
 bh=FlOYPoOq6odOEjov8ah/a4Kw3+KSVXlv9br0h1BIjW0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UWitsBdukrJZZFVm7PRVSJ34QdvnyVSIyWRuMr4xH7gO7CevFnj48WPgsOJ+kSaOz
 jIEgWnZWvM97AexFBg7NvIdHjBAJLpLCLK7gmeBJ12ytvow/jtM1SYsV3beBJsNYvJ
 aR+FG4r038tZNI0htK/vgJ+0Wr59RWKqt77e5pajgCkTEuOUd5vx/wUt1sgWWDXB/b
 bdEtrjLU5F1uadV86XS9h+FkVODrLxXmTHSIH5r0q2yLMuu6LFODSNAW81u3ZssMIr
 zz4GvZ1gRYDJ2Qpy4xWYxXY4oqrAomQOLTo9mpCBm6CL9nN4BALQtyyVXTGWnZvwE2
 HKARagaS+x/ew==
From: Mark Brown <broonie@kernel.org>
To: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org
In-Reply-To: <20221104160315.213836-1-marex@denx.de>
References: <20221104160315.213836-1-marex@denx.de>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: fsl-sai: Fix mx6ul and mx7d
 compatible strings
Message-Id: <166811617433.1093199.4726126273479929969.b4-ty@kernel.org>
Date: Thu, 10 Nov 2022 21:36:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
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

On Fri, 4 Nov 2022 17:03:13 +0100, Marek Vasut wrote:
> Describe existing used combinations of compatible strings on MX6UL
> and MX7D, which are backward compatible with MX6SX. Add the missing
> imx7d-sai compatible string which is used on i.MX7 .
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: fsl-sai: Fix mx6ul and mx7d compatible strings
      commit: 81b6c043e7ba41e5a585f0d33213a32308d484ca
[2/3] ASoC: dt-bindings: fsl-sai: Use minItems 5 for i.MX8MN clock and similar
      commit: ef55595548e13a5d61695bdf92e03df88c45994f
[3/3] ASoC: dt-bindings: fsl-sai: Sort main section properties
      commit: 3e4f964ddd1a9ab962cb524cbea750030de6acd0

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
