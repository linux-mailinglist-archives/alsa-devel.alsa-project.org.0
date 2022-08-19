Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE8959A8BC
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Aug 2022 00:49:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 903371693;
	Sat, 20 Aug 2022 00:48:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 903371693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660949385;
	bh=dxI6vf/bStJmVt0I680tMgmCWDQv72BqvXZPaYcJOxQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KUb3rMkYoanCzO2gL0aGM4vZ++JAu1wDxiiIT2XRur8Tc9z5SiAn2QEBGMrlEArya
	 yNNYGadM60/fb7W+2x6KSUTogp1Tlp0FwDVDiux7j4Wcsoh8UL2zCOZ/M9ptQOYW6Y
	 A5uBv5YzeS3fE1l3RtkiAVFVqafkMBXkWYrlrkYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F118F8052D;
	Sat, 20 Aug 2022 00:47:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65D12F80527; Sat, 20 Aug 2022 00:47:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DDA4F80524;
 Sat, 20 Aug 2022 00:47:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DDA4F80524
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aPfQwPWY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 47D7CCE266F;
 Fri, 19 Aug 2022 22:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58DFAC433D6;
 Fri, 19 Aug 2022 22:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660949264;
 bh=dxI6vf/bStJmVt0I680tMgmCWDQv72BqvXZPaYcJOxQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=aPfQwPWYqbO38H6kKJjbb/+kNhw2REJtzZW+Lpf2pz/6fuu+RwNQfkXpPgh9dHEcf
 CG8f3AhCaQHapS3WwYoITlWZI8cbx6jex0WLzBbpVCHuqjf1pW/LAgMXdpKaihu1wM
 /vcm9EcTXHlFcjv3QOzso2K8y1MVRuFN9BfIa61Iq1Rq1ZT7RfG7wQj/icRgXktwCc
 kr99zJbtz1B+mc4vzYLXqwgqVtZGSqUq4LfB2ZO+GpqW8ufV6bL6MLX4iRh0Azd1Fa
 pOGGdewbCQiL/y4OKjbU/dtDazqmnbmG3oORULrBQrIeT9k4/TGcBljxkVYvgO3DiX
 3OrhBH7pWa53Q==
From: Mark Brown <broonie@kernel.org>
To: kernel@pengutronix.de, perex@perex.cz, ranjani.sridharan@linux.intel.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 s.hauer@pengutronix.de, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, lgirdwood@gmail.com, 
 shawnguo@kernel.org, daniel.baluta@nxp.com, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, 
 festevam@gmail.com, linux-imx@nxp.com, tiwai@suse.com,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 robh+dt@kernel.org
In-Reply-To: <1660787634-28550-1-git-send-email-shengjiu.wang@nxp.com>
References: <1660787634-28550-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [RESEND PATCH v2 1/2] dt-bindings: dsp: fsl: Add SOF compatile
 string for i.MX8ULP
Message-Id: <166094926008.19151.7343804058436995082.b4-ty@kernel.org>
Date: Fri, 19 Aug 2022 23:47:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: alsa-devel@alsa-project.org, shengjiu.wang@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

On Thu, 18 Aug 2022 09:53:53 +0800, Shengjiu Wang wrote:
> Add SOF compatile string "fsl,imx8ulp-dsp" for supporting DSP
> device on i.MX8ULP platform.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] dt-bindings: dsp: fsl: Add SOF compatile string for i.MX8ULP
      commit: ee6c42ba5c7670c6f8c17c7bcedbcdaf7b8eb72e
[2/2] ASoC: SOF: imx: Add i.MX8ULP HW support
      commit: fb5319af6ad8616b772761ed926ca57e10f30ea4

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
