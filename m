Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6FA8178BD
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 18:30:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31AA2AE9;
	Mon, 18 Dec 2023 18:29:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31AA2AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702920601;
	bh=71aBY2g687fY1ei3QKJuZYPBscgOTCn59XxQrrVnxZs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=bZgCtJLtcl2Jpk5KkAY8C9tDmdyoHktFIqe2ftuQycCN8RaJ/mFVTIOMlPcS6qG1e
	 79G2uP4oeG+UqSnMv2IbSSV3A6ImvlP8pbAZM6TkoIylOApjUvCdFMWdcYV/MVc8t4
	 GkaLGYpIq2log1xCyT+FrkdtdvOP9fj0LVvmXV7k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60EF7F80614; Mon, 18 Dec 2023 18:28:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CFB0DF80612;
	Mon, 18 Dec 2023 18:28:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB247F8056F; Mon, 18 Dec 2023 18:28:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61DB4F80425
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 18:28:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61DB4F80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Zu1JCP57
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 27B6CCE128C;
	Mon, 18 Dec 2023 17:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1036C433CA;
	Mon, 18 Dec 2023 17:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702920504;
	bh=71aBY2g687fY1ei3QKJuZYPBscgOTCn59XxQrrVnxZs=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Zu1JCP57xJMRG3pv/d+TTgL+/yuPxRnh8osA9xj3XEhlp+Uzcj+L69pZ/j9TzgHQl
	 UYDy1gonb7tV1tZxBi7Ck3bTPTEVs1XbsyeNNOAZ8Ht7CaiGFr+0jdwoNs8VlqyS/0
	 TMtB3nqLDx9rkAwlTmtpvGuCxZP68g5pVxHdaIBpppWj5fn1LWKetkDNO1uxT296KL
	 aUqn9bhsZFioPg2APmY5eT+fZ2/+ThYzJx+LMUehJQmisncDzuBCSruVTKpyq1dsZJ
	 J0cTfGMmtyVMsgpD21TvPi9joGBw1Ol+ePBV5MfW55WuX0mwdvesXZwwxMZPwK3fZP
	 Bkr+LBxwyKO4g==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231204100116.211898-1-krzysztof.kozlowski@linaro.org>
References: <20231204100116.211898-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: qcom: Add x1e80100 sound machine driver
Message-Id: <170292050070.89121.1154893046353970509.b4-ty@kernel.org>
Date: Mon, 18 Dec 2023 17:28:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: PXG4PIH2J2LBXKXVC2PMLDJZROGTJBXT
X-Message-ID-Hash: PXG4PIH2J2LBXKXVC2PMLDJZROGTJBXT
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PXG4PIH2J2LBXKXVC2PMLDJZROGTJBXT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 04 Dec 2023 11:01:15 +0100, Krzysztof Kozlowski wrote:
> Add sound machine driver for the soundcards on Qualcomm X1E80100 SoC,
> supporting up to four channel audio playback over Soundwire bus.  The
> driver is based on existing sc8280xp.c driver.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: qcom: Add x1e80100 sound machine driver
      commit: 6b9dc2da66578acff36401ba87fee93c2abf2a6e
[2/2] ASoC: dt-bindings: qcom,sm8250: Add X1E80100 sound card
      commit: 337d93b4285a92280edd7d0a910c3b7cbc70d717

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

