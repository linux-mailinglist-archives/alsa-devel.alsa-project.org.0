Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DD1549978
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 19:03:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0818175E;
	Mon, 13 Jun 2022 19:02:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0818175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655139781;
	bh=zH7DwkKRGFFZLBmAteDlsCQw8yPj/w0q9YqYHZgyiVA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eKGI3Hj0Br/WgE+vEqguxnawnKS/eFyP5RNxrfIe32e77nubbUXMT2tSXSYEsSppl
	 s1oLkZw/CVbl328ahThoxtL4sSd/KyGJOzOmKLmD5hAP6O9FWHEqPSwnV8llkqMkZo
	 nxfZvONziuN8xSfmsxvxZwaLSSE1Z0BROdNujB2w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FD4DF804CC;
	Mon, 13 Jun 2022 19:02:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9D74F80107; Mon, 13 Jun 2022 19:01:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69CDDF80107
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 19:01:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69CDDF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bkjewIXi"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 27554CE13D4;
 Mon, 13 Jun 2022 17:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078CDC34114;
 Mon, 13 Jun 2022 17:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655139710;
 bh=zH7DwkKRGFFZLBmAteDlsCQw8yPj/w0q9YqYHZgyiVA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bkjewIXiUaJie2/EFRI2Y6+WB0SV1vS+n59R8pKdxGZaIjTc2Zkr5uclzJWcg1tFu
 Hx7hvnEr8mGj3M/GTIgQAE0y8tGzsSEQHYXNZLoHPlr845yaC0jHwBWLyTHvDz4rFe
 +ss1xm/nAdObcdxocEjm2LorKEpdlFjeeEOpDugA7sdt13DkDxbaA+pV4Dp8r3mPcq
 n4DPLGyOxwKjaUYp834Om6WsBCnuSoUsCPejZwTrG0ALwOc23P/aYug+kjBExpzCtY
 cw238838J/TPZsu5YwDO2n4nLgpmQKdXIbiTusuSNgifO2xH82OYNbaimjMCmpk5K0
 eKHk2TnY291Jw==
From: Mark Brown <broonie@kernel.org>
To: andrzej.hajda@intel.com, airlied@linux.ie, kyungmin.park@samsung.com,
 jy0922.shim@samsung.com, narmstrong@baylibre.com, linux@armlinux.org.uk,
 robert.foss@linaro.org, daniel@ffwll.ch, alim.akhtar@samsung.com,
 lgirdwood@gmail.com, inki.dae@samsung.com, broonie@kernel.org,
 sw0312.kim@samsung.com
In-Reply-To: <20220602103029.3498791-1-broonie@kernel.org>
References: <20220602103029.3498791-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: hdmi-codec: Update to modern DAI terminology
Message-Id: <165513970673.636966.9826730904967146178.b4-ty@kernel.org>
Date: Mon, 13 Jun 2022 18:01:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 jonas@kwiboo.se, dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com
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

On Thu, 2 Jun 2022 12:30:29 +0200, Mark Brown wrote:
> As part of retiring the old defines used to specify DAI formats update the
> hdmi_codec driver to use the modern names, including the variables in the
> struct hdmi_codec_daifmt exported to the DRM drivers.
> 
> In updating this I did note that the only use of this information in DRM
> drivers is to reject clock provider settings, thinking about what this
> hardware is doing I rather suspect that there might not be any hardware
> out there which needs the configuration so it may be worth considering
> just having hdmi-codec support only clock consumer.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdmi-codec: Update to modern DAI terminology
      commit: 9f1c8677724a0e6a6ac7a74d2b0192a584df859d

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
