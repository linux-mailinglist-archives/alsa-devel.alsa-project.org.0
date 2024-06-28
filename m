Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 317D691C2D4
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 17:43:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 770F82346;
	Fri, 28 Jun 2024 17:43:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 770F82346
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719589432;
	bh=ymvFz0WiHcyx8yRoT9Izl+kSBov6O15ewnJVOROeaBE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RuVh6P9duBmR8Wejo2cqivMFdJ773N5Opv+g0E+ZlWqxHqwPUT9Osv80LZMg98D7P
	 fpXEioRsZTpHsYIwz8w4uf4Sh+uo/HO6U/7KEG1+VJVIdeQvI7ugFQ1ex7+cSA1lwP
	 ehEanvHCF5fu6hFac+xTHtjOsaCJUYnLDBpTZuaA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CF4BF805B5; Fri, 28 Jun 2024 17:43:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA1CEF805AF;
	Fri, 28 Jun 2024 17:43:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A67A6F80423; Fri, 28 Jun 2024 17:42:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 349DCF80154
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 17:42:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 349DCF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rzY8Jmtw
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B46DDCE3CBF;
	Fri, 28 Jun 2024 15:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3050C116B1;
	Fri, 28 Jun 2024 15:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719589317;
	bh=ymvFz0WiHcyx8yRoT9Izl+kSBov6O15ewnJVOROeaBE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=rzY8JmtwoJdmMtk9RXZxz8vnwgshHYk7ndL2ZeeDIB8Y/LDD+LnD3Xhu3jRlF/MSR
	 XQNQ862xw/gQbwO8MNvKUl90+jqBoyr6ZmBhgfQWQF7L02ArzBcA6ZcCzTAii+NhcW
	 Kc12z6630APpVbOyfpVkw1/ERzpAYUAWWQqzIyCfSmf2nVOIBPvxef242o7MsLKsdn
	 WpdwOxQWSM5bjA+FHh++46yVvY8n2VQpQ/q3qFLhWQ1LbZVNM8bd8sI8+RxWGxowyc
	 cdBcME+0xYyLcuVzGSo/UEWm9eV4cR9GDqZNECO4TlkYQ8PLNnvGn1X2DlkztqxDz/
	 Q/VFvez8+lr8Q==
Date: Fri, 28 Jun 2024 09:41:56 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: devicetree@vger.kernel.org, elder@linaro.org, conor+dt@kernel.org,
 tiwai@suse.com, andersson@kernel.org, perex@perex.cz, lgirdwood@gmail.com,
 bgoswami@quicinc.com, broonie@kernel.org, caleb.connolly@linaro.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org, krzk+dt@kernel.org,
 srinivas.kandagatla@linaro.org, dmitry.baryshkov@linaro.org,
 krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org
In-Reply-To: <20240628010715.438471-1-alexey.klimov@linaro.org>
References: <20240628010715.438471-1-alexey.klimov@linaro.org>
Message-Id: <171958904690.3122888.14426656364563321881.robh@kernel.org>
Subject: Re: [PATCH 0/7] qrb4210-rb2: add HDMI audio playback support
Message-ID-Hash: WURCGMCODD2MEJQR5K5I7S4GQ2OYG2ER
X-Message-ID-Hash: WURCGMCODD2MEJQR5K5I7S4GQ2OYG2ER
X-MailFrom: robh@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WURCGMCODD2MEJQR5K5I7S4GQ2OYG2ER/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 28 Jun 2024 02:07:08 +0100, Alexey Klimov wrote:
> First time I am doing anything like this. This series adds
> mising pieces here and there to allow addition of sensible
> sound card in qrb4210-rb2.dts and enable HDMI audio playback there.
> 
> It is planned in future to add support for other outputs and capture --
> analog audio support.
> 
> The series depends on Srini's sm4250 lpi pinctrl driver:
> c2e5a25e8d88 (pinctrl: qcom: Introduce SM4250 LPI pinctrl driver, 2024-06-22)
> 2ffa7a354662 (dt-bindings: pinctrl: qcom: Add SM4250 pinctrl, 2024-06-22)
> As far as I understood it was already accepted and will go through pinctrl tree.
> 
> Alexey Klimov (7):
>   ASoC: dt-bindings: qcom,sm8250: add qrb4210-rb2-sndcard
>   ASoC: qcom: sm8250: add qrb4210-rb2-sndcard compatible string
>   ASoC: qcom: sm8250: add handling of secondary MI2S clock
>   arm64: dts: qcom: sm6115: add apr, its services and simple sound node
>   arm64: dts: qcom: sm6115: add LPASS LPI pin controller
>   arm64: dts: qcom: sm6115: add description of lpi_i2s2 pins
>   arm64: dts: qcom: qrb4210-rb2: add HDMI audio playback support
> 
>  .../bindings/sound/qcom,sm8250.yaml           |   1 +
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts      |  73 ++++++++++++
>  arch/arm64/boot/dts/qcom/sm6115.dtsi          | 112 ++++++++++++++++++
>  sound/soc/qcom/sm8250.c                       |  19 +++
>  4 files changed, 205 insertions(+)
> 
> --
> 2.45.2
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y qcom/qrb4210-rb2.dtb' for 20240628010715.438471-1-alexey.klimov@linaro.org:

arch/arm64/boot/dts/qcom/qrb4210-rb2.dtb: /soc@0/pinctrl@a7c0000: failed to match any schema with compatible: ['qcom,sm4250-lpass-lpi-pinctrl']





