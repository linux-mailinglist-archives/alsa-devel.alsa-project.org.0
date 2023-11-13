Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2B07E9E28
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 15:08:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5832A4E;
	Mon, 13 Nov 2023 15:07:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5832A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699884491;
	bh=SDRkAHDc9itV6f8oK3mmT3NDiKoKnApjwxqUguLBXSc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gr/zRYj3fvtUbBL7B8eHkiFAhbS1izjx4Hefg4e1IZeChBZt+fxTnM32s77u3ErDY
	 GvouhEU2j4WRBGagz0KEc20Xl1uzZuCmJK+d2HfTivDJizcLF1veUQVAA80DfkBlMV
	 i07esKn2EAQGn/B6za75SbLY5kh7lrEyeSDpsRoY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A50EDF805A9; Mon, 13 Nov 2023 15:05:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0578AF805A0;
	Mon, 13 Nov 2023 15:05:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33C23F80571; Mon, 13 Nov 2023 15:05:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D55E1F801D5
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 15:05:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D55E1F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eQ39f0kf
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 250E360F0B;
	Mon, 13 Nov 2023 14:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2037CC433C8;
	Mon, 13 Nov 2023 14:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699884328;
	bh=SDRkAHDc9itV6f8oK3mmT3NDiKoKnApjwxqUguLBXSc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eQ39f0kfOVpu/qAfrUSSjm1/kH70Wjyj/nuLbKGQjmmxpZrAUk4atDwXMiHA8aNvQ
	 9AX1Ti9j5L8+cYg3vAmMEjhlmzid81xcWJW74eOZjr7A3oJR6zWo3SWROpvNFBm3wr
	 p8QUEdK9Q2+4frfLTj6U1vR0yWmJxKMtztCK42b9Jaj6kskprL4qRxraFhIQgZ/vMe
	 my2VtyxAR+XtUu8s+f5pHlnKF9iyjLYXsVgcxLAV2ti/5THFhpakJNVpPBBGVM/Guk
	 nK3JmHmtqyAV+ZlPQQvn/hF4QFNsXeU4mqpbO0UcTuIFJwwEpR1BEotN1urJiumaW5
	 72PNTTxKhDcTg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Ryan Lee <ryans.lee@analog.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20231107101610.13728-1-krzysztof.kozlowski@linaro.org>
References: <20231107101610.13728-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: use "soundwire" as controller's
 node name in examples
Message-Id: <169988432341.3280890.10229585948785487186.b4-ty@kernel.org>
Date: Mon, 13 Nov 2023 14:05:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 7FSMNUWQFGSWDZZ6VAWHWSRAH2TRXJGE
X-Message-ID-Hash: 7FSMNUWQFGSWDZZ6VAWHWSRAH2TRXJGE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7FSMNUWQFGSWDZZ6VAWHWSRAH2TRXJGE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 07 Nov 2023 11:16:10 +0100, Krzysztof Kozlowski wrote:
> Soundwire Devicetree bindings expect the Soundwire controller device
> node to be named just "soundwire".  Correct examples, so the incorrect
> code will not be re-used.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: use "soundwire" as controller's node name in examples
      commit: dc29d3d253f1f3513a916f0b4271569223860c71

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

