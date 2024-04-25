Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECAC8B1F5C
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Apr 2024 12:39:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E284202;
	Thu, 25 Apr 2024 12:39:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E284202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714041550;
	bh=s0flc0O0ENfWyvDrw9EUrpvhWQMG2H4AQk5/xSXi9Dw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W9L7mNQJ6dlHuqCiHTHCF58lI2QEnHwFWrCvdipmjLE6AfqcV3h93TgfvJPiN2UuL
	 ftfJPOY/f86JkMSumhbNjAcbw1bfU4gnKnVlwQTA9txhvhReM6BFmLSAq+3RBYTMYx
	 g6k+qSati2N0cMqrTe/XUX+pixbFHkdtzfsSIl7g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52344F80579; Thu, 25 Apr 2024 12:38:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E365DF8057E;
	Thu, 25 Apr 2024 12:38:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78B8CF80423; Thu, 25 Apr 2024 12:38:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15490F801C0
	for <alsa-devel@alsa-project.org>; Thu, 25 Apr 2024 12:38:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15490F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=r2H7/B80
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 29DFD61DBD;
	Thu, 25 Apr 2024 10:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0076C113CE;
	Thu, 25 Apr 2024 10:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714041497;
	bh=s0flc0O0ENfWyvDrw9EUrpvhWQMG2H4AQk5/xSXi9Dw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=r2H7/B80LbmXbUwobGpFjbK/uHkJiSDy7N0XJdAWDAh4l8mZuGdqrQpJtcKT+kdQ7
	 AiE9BX2JqCRSz+9ordjnrN8awj/1lEX7HEiw+n9iCzvADATTwFzNZG8tW1+monKTlS
	 tr6fM7SSkZslpGTsr6n6EEF8FQzwqW1s2vmjwJXqgnxOUZP9zBi90O3yTEPnRvMNYu
	 Oj9Hq3kr2Rtu5gA+ldv7kBzGbzzzD8FIAYbVf+XBnALVK7MCQWAdNYraNC8NkXlcz2
	 4gKHq49/OyhhDb2vXe/4F1ZhQTIXPSvM2hQ/KigtwnxDobf0QNMWpOtsCd8WXFnKqc
	 237EvN37jx1EA==
Date: Thu, 25 Apr 2024 05:38:16 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org,
 Banajit Goswami <bgoswami@quicinc.com>, quic_pkumpatl@quicinc.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20240425091857.2161088-2-quic_mohs@quicinc.com>
References: <20240425091857.2161088-1-quic_mohs@quicinc.com>
 <20240425091857.2161088-2-quic_mohs@quicinc.com>
Message-Id: <171404149555.2167007.16345461403970586923.robh@kernel.org>
Subject: Re: [PATCH v3 1/7] ASoC: dt-bindings: document wcd937x Audio Codec
Message-ID-Hash: ALWDUQKPVONKQUHVC2X33J4WYMX6TBV7
X-Message-ID-Hash: ALWDUQKPVONKQUHVC2X33J4WYMX6TBV7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ALWDUQKPVONKQUHVC2X33J4WYMX6TBV7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Thu, 25 Apr 2024 14:48:51 +0530, Mohammad Rafi Shaik wrote:
> From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> 
> Document the Qualcomm WCD9370/WCD9375 Audio Codec and the soundwire
> devices can be found on Qualcomm QCM6490 based platforms.
> 
> The Qualcomm WCD9370/WCD9375 Audio Codec communicates
> with the host SoC over 2 Soundwire links to provide:
> - 3 TX ADC paths with 4 differential AMIC inputs
> - 6 DMIC inputs that are shared with AMIC input
> - 4 Microphone BIAS
> - RX paths with 4 PAs – HPHL/R, EAR and AUX
> - Stereo Headphone output
> - MBHC engine for Headset Detection
> 
> Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  .../bindings/sound/qcom,wcd937x-sdw.yaml      | 78 +++++++++++++++++++
>  .../bindings/sound/qcom,wcd937x.yaml          | 58 ++++++++++++++
>  2 files changed, 136 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml:30:11: [warning] wrong indentation: expected 4 but found 10 (indentation)
./Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml:34:13: [warning] wrong indentation: expected 6 but found 12 (indentation)
./Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml:34:17: [warning] too many spaces before colon (colons)
./Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml:46:13: [warning] wrong indentation: expected 6 but found 12 (indentation)
./Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml:46:17: [warning] too many spaces before colon (colons)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,wcd937x.example.dtb: codec: compatible:0: 'sdw20217010a00' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,wcd937x.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,wcd937x.example.dtb: codec: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/sound/qcom,wcd937x.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,wcd937x.example.dtb: codec: '#sound-dai-cells', 'qcom,micbias1-microvolt', 'qcom,micbias2-microvolt', 'qcom,micbias3-microvolt', 'qcom,micbias4-microvolt', 'qcom,rx-device', 'qcom,tx-device', 'reset-gpios', 'vdd-buck-supply', 'vdd-mic-bias-supply', 'vdd-px-supply', 'vdd-rxtx-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/qcom,wcd937x.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240425091857.2161088-2-quic_mohs@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

