Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A648C80D11A
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 17:21:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FBAEA4A;
	Mon, 11 Dec 2023 17:21:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FBAEA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702311706;
	bh=tgoKaQNovHS9RWp3+K6M2LkRytAhgXwHG6PjpqOenpU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p5GUC6M8oYUS3BU3tKh3vglDoG5QlCuWrBIHJsJ9o5uFEmkb8sqwlU4/bHZgRJxp5
	 QJNPqdBAwi8L1o9PsQxKYBYEXP9c8h3PV0OqxMKsJBVboJXMf3tUQpKuM3g+dkghaX
	 +TxXGCbBAeo4tbL6mWyIQJcRImwPfwbGjzMI/Vfg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0578F805A0; Mon, 11 Dec 2023 17:21:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 497E7F8016E;
	Mon, 11 Dec 2023 17:21:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DB24F80166; Mon, 11 Dec 2023 17:20:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D67DF80114
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 17:20:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D67DF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IhwDGvMD
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 37706CE12B4;
	Mon, 11 Dec 2023 16:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A08C433C7;
	Mon, 11 Dec 2023 16:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702311610;
	bh=tgoKaQNovHS9RWp3+K6M2LkRytAhgXwHG6PjpqOenpU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IhwDGvMDayZhO/ouKOmDaaOJzNx/xwMIjs9YhcTCcKs+t6IObyGFBnqQRsygnWr3/
	 g8LzhS5VFgM9/a6Dce6Uqb/y5hcsD/2R2ap+NbMQGlvJjQLhjbPNJhppNcVSCciB/p
	 YDlLzd8uaya95w/+DaKbPa55aUs7hW0YF1bx49uOY4HFCG7BbjKNGpN808LQ0EZOnP
	 4FgU7ocVEVgoDDxqI0DE5Uf5KKImlv0jsMu9OZpuxGPCCa8fAL9Hsk1uTR67sGVzpr
	 pRSmAieOqPpI3s4IwjjaxlyX31RaEMJa1bdhhOfpeERwX+9iNrSoCpHy+3JQU9Ish3
	 f9k5ov4vq0YYA==
From: Mark Brown <broonie@kernel.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20231129113014.38837-1-krzysztof.kozlowski@linaro.org>
References: <20231129113014.38837-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add SM8650
 LPASS RX
Message-Id: <170231160677.85457.6870068020415164910.b4-ty@kernel.org>
Date: Mon, 11 Dec 2023 16:20:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: I2FR2UJ2WPUTLU42DV5XJ7P7QTNFAJUH
X-Message-ID-Hash: I2FR2UJ2WPUTLU42DV5XJ7P7QTNFAJUH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I2FR2UJ2WPUTLU42DV5XJ7P7QTNFAJUH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 29 Nov 2023 12:30:11 +0100, Krzysztof Kozlowski wrote:
> Add bindings for Qualcomm SM8650 Low Power Audio SubSystem (LPASS) RX
> macro codec, which looks like compatible with earlier SM8550.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add SM8650 LPASS RX
      commit: 0bfa20b18acbcdd133d41e04e07a2d78bcc04bc5
[2/4] ASoC: dt-bindings: qcom,lpass-tx-macro: Add SM8650 LPASS TX
      commit: 5a5085c9ce381f92399c755be6deaf1d76ad57e8
[3/4] ASoC: dt-bindings: qcom,lpass-va-macro: Add SM8650 LPASS VA
      commit: f243ef746d0ace20fe092fc1ee9987ecf003f7a4
[4/4] ASoC: dt-bindings: qcom,lpass-wsa-macro: Add SM8650 LPASS WSA
      commit: ab8921e1da8fdca14192c44775151f50c1cdb763

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

