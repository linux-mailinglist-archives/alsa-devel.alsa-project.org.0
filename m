Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF796593313
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Aug 2022 18:24:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 519641630;
	Mon, 15 Aug 2022 18:23:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 519641630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660580683;
	bh=00opu7Jl4uqjr0Td6sGAV8yEUvH/0wMplSwVn+zuZJo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cHFlp4wRnJgufAr+lY3ZpkS5fSF30Jv8KG9HlAjxUk6GwLM3QKGM8iD6os7hH8QL7
	 oNZ1TVo0hdf2Ufcz+MMoLpRX7ZOkTSiDjacErhhZWr0gSm2jcw57NSByd9xcfdRWRX
	 EfWDS8kkoP1lkXhit7fB87wt0R/JBnTSc5ujiEw0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C45EF80551;
	Mon, 15 Aug 2022 18:23:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FDD3F804AE; Mon, 15 Aug 2022 18:23:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8E4BF80271
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 18:23:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8E4BF80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TMZL/lvE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0DE89611EB;
 Mon, 15 Aug 2022 16:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0C1C433D6;
 Mon, 15 Aug 2022 16:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660580579;
 bh=00opu7Jl4uqjr0Td6sGAV8yEUvH/0wMplSwVn+zuZJo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=TMZL/lvEj6KGpWG+ScvbPm2kNPrt22Zd+6oorYe74odqhJaC2eoYvuRnLwGxdg4BE
 4wfKXP3/SFbWiX34QwyMWMOo+iQtaEZkN2ly3d3lEZfdtc6Hxq+/Imo6AcO5X4a7bA
 PUpHlBBUjkdrVt7l7ZajC1eUWSryKdfaZUZLmJeW5a+h9m9LMFpR0CEBX1L9QL+eLI
 6vGVs01tCOFzu5GVvZj3fSblMrAFNuCLMnOgCZ7A2tTih3YvCzIZvNC+hTfpG02FN9
 YRgng/mBacC1pj/v1kNkknjvPW0jkM4Fc4Yd8swflvmFBknCYQ2IiyWgkVlCfpfi9D
 vMHAEw8hTRv4w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 devicetree@vger.kernel.org
In-Reply-To: <1659443394-9838-1-git-send-email-shengjiu.wang@nxp.com>
References: <1659443394-9838-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v4] ASoC: dt-bindings: fsl,
 sai: Convert format to json-schema
Message-Id: <166058057756.769843.7829360954309157566.b4-ty@kernel.org>
Date: Mon, 15 Aug 2022 17:22:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: shengjiu.wang@gmail.com
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

On Tue, 2 Aug 2022 20:29:54 +0800, Shengjiu Wang wrote:
> Convert the NXP SAI binding to DT schema format using json-schema.
> 
> The Synchronous Audio Interface (SAI) provides an interface that
> supports full-duplex serial interfaces with frame synchronization
> formats such as I2S, AC97, TDM, and codec/DSP interfaces.
> 
> Beside conversion, 'fsl,shared-interrupt' and '#sound-dai-cells'
> are added for they are already used by some dts.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: fsl,sai: Convert format to json-schema
      commit: d563336877b21ede46053103c726f50a0206d155

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
