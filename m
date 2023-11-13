Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1EE7E9E1B
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 15:06:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0720829;
	Mon, 13 Nov 2023 15:05:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0720829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699884401;
	bh=6scqCP6KmruB1FI722uEIB9ZpX+PcxEvio8fakOFAAs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=BMGuhlIHXGjZpcbL/Lec+TSqV8C1wxXPUVaGQqJQrULOVhUpdrj2OuoVe15Ge8BZ/
	 YRvFO1PYwbZg4IhXyz0xhqwQD5omgEh3ORiORg6dliqwsxlLLuJ7oypFDFdyC1S1s8
	 SOOW94habdG027vLbGWjxrN61dy0QJq29vfT7728=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CADFF80558; Mon, 13 Nov 2023 15:05:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E313FF8022B;
	Mon, 13 Nov 2023 15:05:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51333F802E8; Mon, 13 Nov 2023 15:05:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C5CAF800ED
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 15:05:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C5CAF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OkhPOVvZ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 23F4360EBA;
	Mon, 13 Nov 2023 14:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7504C433CD;
	Mon, 13 Nov 2023 14:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699884334;
	bh=6scqCP6KmruB1FI722uEIB9ZpX+PcxEvio8fakOFAAs=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=OkhPOVvZL0e1+6pkDkC6APCiOoT0QgxMKALIXRTsYat/zRx/6GhgdJAbvl1rRAjfF
	 MyzIFpgo262OPgoOcV31zr6ClN2eZvZwF2mnc6vnPVevUYpk9u3fh1KDhGzgW89/aJ
	 xtMsCZKzvJkfr2rLK/iGu8VJkermAwCYGLUsHNF/b+la7oJT/LOkTRmBhjyk6JuX27
	 pEt+i9AOLvDMCRr7U5o9QLL6yFa0bDJoPfzCuFLcHX8nOZEC73lvzBrjEIGyexGV51
	 vJ+uOEn2RkJMw6ZXFJimhZDxLUdXUh3IlO3SbN9ZUi0HBbrsY1fN2akwAPC4lAAe5q
	 e5qNgMX0h2aZQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231106180422.170492-1-krzysztof.kozlowski@linaro.org>
References: <20231106180422.170492-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,sm8250: add SM8550 sound card
Message-Id: <169988433104.3280890.1283507627992945147.b4-ty@kernel.org>
Date: Mon, 13 Nov 2023 14:05:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: GJ3CQ5APK3PERPXNDEZEJX2R2OK2WLSA
X-Message-ID-Hash: GJ3CQ5APK3PERPXNDEZEJX2R2OK2WLSA
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GJ3CQ5APK3PERPXNDEZEJX2R2OK2WLSA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 06 Nov 2023 19:04:22 +0100, Krzysztof Kozlowski wrote:
> Add sound card for SM8550, which as of now looks fully compatible with
> SM8450.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: qcom,sm8250: add SM8550 sound card
      commit: c239b79315167d3e9b4b1e537b00e1ff5b87a317

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

