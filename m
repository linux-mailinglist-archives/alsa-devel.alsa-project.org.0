Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A306A6D06C5
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Mar 2023 15:32:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD7881F7;
	Thu, 30 Mar 2023 15:31:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD7881F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680183132;
	bh=v8AtPPr2npAFWTLwZhYml/BlOepM7LWNbVlANAVOCtg=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SLM+zb0mxgqUfzE2Uk0M6tpHEcc/PYCeVY/opLXfmrxEZgNklpz0UEmg0/pF8Ehzn
	 9ksyHSDAyqIQ6d4/P3ix3rMyBobNQjYY6lOIZFrG0nUN3Y5M+I1SibMM9944YseIvb
	 i/fIHArhdBl9N53WPPMPXMcxVJdUozotsn8LtM5g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A5C4F8021D;
	Thu, 30 Mar 2023 15:31:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19CF2F80290; Thu, 30 Mar 2023 15:28:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40769F80272
	for <alsa-devel@alsa-project.org>; Thu, 30 Mar 2023 15:28:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40769F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uortMvtc
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D938A62080;
	Thu, 30 Mar 2023 13:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F12C433EF;
	Thu, 30 Mar 2023 13:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680182915;
	bh=v8AtPPr2npAFWTLwZhYml/BlOepM7LWNbVlANAVOCtg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uortMvtcdtdqnx0Y8n5Qs4F9ErnSxttq/nRUtqbVq9vZpzq6wAAZ4Dshr6cqcHpb6
	 nH1y0MXpMPsIquNjIdG0NIA1YsfS3ydxDu9u0oRI3DB0FQytofcHLhKFdY5TGIgEE5
	 DBkLno/7MT19g206Osn/IhZOk0vjoxEOpfGZatuyctJzn5Q3RtSCWt0mVnan/F0geQ
	 A8ejzHrOAMhk3lE3NOCZUZbMZ3nYB7YGHpZI63Q7iTd8xzCXd7z9B+Z2lypc2x8Vlv
	 LpTCOaz/G9ayCN6YYlcWhxsMMkv8ltlQXCaffLebVLmZgy9/Vq9FNFNVFGikjtbpme
	 x5YRdOnuTkHHg==
From: Mark Brown <broonie@kernel.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230330071333.24308-1-krzysztof.kozlowski@linaro.org>
References: <20230330071333.24308-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [RESEND PATCH] ASoC: dt-bindings: qcom,lpass-rx-macro: correct
 minItems for clocks
Message-Id: <168018291034.3345013.1034943488652302497.b4-ty@kernel.org>
Date: Thu, 30 Mar 2023 14:28:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: CO7LFJBDYKMIIYBENDPT2GF2DSFGX32D
X-Message-ID-Hash: CO7LFJBDYKMIIYBENDPT2GF2DSFGX32D
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: stable@vger.kernel.org, Rob Herring <robh@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CO7LFJBDYKMIIYBENDPT2GF2DSFGX32D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 30 Mar 2023 09:13:33 +0200, Krzysztof Kozlowski wrote:
> The RX macro codec comes on some platforms in two variants - ADSP
> and ADSP bypassed - thus the clock-names varies from 3 to 5.  The clocks
> must vary as well:
> 
>   sc7280-idp.dtb: codec@3200000: clocks: [[202, 8], [202, 7], [203]] is too short
> 
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: qcom,lpass-rx-macro: correct minItems for clocks
      commit: 59257015ac8813d2430988aa01c2f4609a60e8e7

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

