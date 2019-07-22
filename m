Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D9370CE8
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 01:01:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F07A185C;
	Tue, 23 Jul 2019 01:00:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F07A185C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563836467;
	bh=oma7dEzlM1VTCe7s9VTwu5NGkXpy0/SzwJYkxBCFnu0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YajYSAVge2grKUM7llJ+K5XxL/1159bmDv5XqhwqM2rSJfjp9j4fdp4pjmx9yeoIP
	 EntYvsEO8yTmjllo7IfxqYzZJ9r8GqJZaeAFh5SQfmzyatLAmeBdvg2CSjIcu1sT1x
	 LNESue6bEYy8oBSFdVQqiTsL0E8ZVYNaEEeU2btE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D426CF803D1;
	Tue, 23 Jul 2019 00:59:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0443F803D5; Tue, 23 Jul 2019 00:59:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B4BAF800E8
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 00:59:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B4BAF800E8
Received: by mail-io1-f68.google.com with SMTP id e20so47340756iob.9
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 15:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fDJqr6GWcr9ig5DA7FE+3vbG3kRwvM5Fll1NbT8oWRI=;
 b=S41QRdYgol6GQVB0rAuhMgWOzGHwduf5CdUfysajCZQbIjDeZB58MbOQTjJmCPOLWz
 8IjSXbsUoT/OBkKtlP23azUdHrpr0tDBdKZ5TzX6kgqjw/bCsm3+E/iuYhYX5iGToR/h
 9PPUymy337/Xsz7ckWH8QswYu7A/2rWYT6QpNEs/to5Q3VehLJ6mkFEhjeZILrohorVd
 ZbUbtP6mjU1wwzaQhXSqe9tCwyd9DALNF3RmxSwVUzXDI+8Ol0oc7A0iZdEuaadkDfag
 N68ER/lznAww0k3t7jPKm5ZfBcMz5LdmP26E0OrMRXgv6aup9UU2SBSdPIT16GG3VLli
 MACQ==
X-Gm-Message-State: APjAAAUXGziZtg94/MelzSkwls2c5RQhAH3fM4eCAO24IzaPW/BYwZRX
 C2pp87Ua8vhXMb+XyYZUpg==
X-Google-Smtp-Source: APXvYqz4SWOwnL5xGzRejeuam3XaiSK0jdjRPXaphY+2+qgXomogjRmjnBIPkwC4Uzh2OZmcWZmH4w==
X-Received: by 2002:a02:b90e:: with SMTP id v14mr37523500jan.122.1563836356179; 
 Mon, 22 Jul 2019 15:59:16 -0700 (PDT)
Received: from localhost ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id v13sm34048161ioq.13.2019.07.22.15.59.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 15:59:15 -0700 (PDT)
Date: Mon, 22 Jul 2019 16:59:14 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20190722225914.GB2917@bogus>
References: <20190702080920.22623-1-srinivas.kandagatla@linaro.org>
 <20190702080920.22623-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190702080920.22623-2-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org, lgirdwood@gmail.com,
 vkoul@kernel.org, broonie@kernel.org, srini@kernel.org
Subject: Re: [alsa-devel] [PATCH 1/6] ASoC: dt-bindings: add dt bindings for
 WCD9340/WCD9341 audio codec
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Jul 02, 2019 at 09:09:15AM +0100, Srinivas Kandagatla wrote:
> This patch adds bindings for wcd9340/wcd9341 audio codec which can
> support both SLIMbus and I2S/I2C interface.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/sound/qcom,wcd934x.txt           | 188 ++++++++++++++++++
>  1 file changed, 188 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd934x.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.txt b/Documentation/devicetree/bindings/sound/qcom,wcd934x.txt
> new file mode 100644
> index 000000000000..2b48c98b5b7d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.txt
> @@ -0,0 +1,188 @@
> +QCOM WCD9340/9341 Codec Bindings
> +
> +Qualcomm WCD9340/WCD9341 Codec is a standalone Hi-Fi audio codec IC, supports
> +Qualcomm Technologies, Inc. (QTI) multimedia solutions, including
> +the MSM8996, MSM8976, and MSM8956 chipsets. It has in-built
> +Soundwire controller, interrupt mux. It supports both I2S/I2C and
> +SLIMbus audio interfaces.
> +
> +Required properties with SLIMbus Interface:
> +
> +- compatible:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: For SLIMbus interface it should be "slimMID,PID",
> +		    textual representation of Manufacturer ID, Product Code,
> +		    shall be in lower case hexadecimal with leading zeroes
> +		    suppressed.  Refer to slimbus/bus.txt for details.
> +		    Should be:
> +		    "slim217,250" for SDM845/SDA845 SoCs with SLIMbus.
> +
> +- reg
> +	Usage: required
> +	Value type: <u32 u32>
> +	Definition: Should be ('Device index', 'Instance ID')
> +
> +- interrupts
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: Interrupts via WCD INTR1 and INTR2 pins

Example only has 1 irq.

> +
> +- interrupt-names:
> +	Usage: required
> +	Value type: <String array>
> +	Definition: Interrupt names of WCD INTR1 and INTR2
> +	Should be: "intr1", "intr2"
> +
> +- reset-gpios:
> +	Usage: required
> +	Value type: <String Array>

Really?

> +	Definition: Reset gpio line
> +
> +- slim-ifc-dev:
> +	Usage: required
> +	Value type: <phandle>
> +	Definition: SLIM interface device
> +
> +- clocks:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: See clock-bindings.txt section "consumers". List of
> +                three clock specifiers for mclk, mclk2 and slimbus clock.
> +
> +- clock-names:
> +	Usage: required
> +	Value type: <string>
> +	Definition: Must contain "mclk", "mclk2" and "slimbus" strings.
> +
> +- vdd-buck-supply:
> +	Usage: required
> +	Value type: <phandle>
> +	Definition: Should contain a reference to the 1.8V buck supply
> +
> +- vdd-buck-sido-supply:
> +	Usage: required
> +	Value type: <phandle>
> +	Definition: Should contain a reference to the 1.8V SIDO buck supply
> +
> +- vdd-rx-supply:
> +	Usage: required
> +	Value type: <phandle>
> +	Definition: Should contain a reference to the 1.8V rx supply
> +
> +- vdd-tx-supply:
> +	Usage: required
> +	Value type: <phandle>
> +	Definition: Should contain a reference to the 1.8V tx supply
> +
> +- vdd-vbat-supply:
> +	Usage: Optional
> +	Value type: <phandle>
> +	Definition: Should contain a reference to the vbat supply
> +
> +- vdd-micbias-supply:
> +	Usage: required
> +	Value type: <phandle>
> +	Definition: Should contain a reference to the micbias supply
> +
> +- vdd-io-supply:
> +	Usage: required
> +	Value type: <phandle>
> +	Definition: Should contain a reference to the 1.8V io supply
> +
> +- qcom,micbias1-lvl:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: Should be voltage in milli Volts for micbias1 output
> +	Supported values are in inbetween 1800mV-2850mV
> +
> +- qcom,micbias2-lvl:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: Should be voltage in milli Volts for micbias2 output
> +	Supported values are in inbetween 1800mV-2850mV
> +
> +- qcom,micbias3-lvl:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: Should be voltage in milli Volts for micbias3 output
> +	Supported values are in inbetween 1800mV-2850mV
> +
> +- qcom,micbias4-lvl:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: Should be voltage in milli Volts for micbias4 output
> +	Supported values are in inbetween 1800mV-2850mV
> +
> +- clock-output-names:
> +	Usage: required
> +	Value type: <string>
> +	Definition: Should be the "mclk", corresponding to name
> +			of the clk output.
> +
> +- clock-frequency:
> +	Usage: required
> +	Definition: Indicating the frequency of mclk output.
> +
> +- interrupt-controller:
> +	Usage: required
> +	Definition: Indicating that this is a interrupt controller
> +
> +- #interrupt-cells:
> +	Usage: required
> +	Value type: <int>
> +	Definition: should be 1
> +
> +- #clock-cells:
> +	Usage: required
> +	Value type: <int>
> +	Definition: should be 0, as there is only one clock out supported.
> +
> +#sound-dai-cells
> +	Usage: required
> +	Value type: <u32>
> +	Definition: Must be 1
> +
> +Example:
> +
> +wcd9340: audio-codec@1{
> +	compatible = "slim217,250";
> +	reg  = <1 0>;
> +	reset-gpios = <&tlmm 64 0>;
> +	slim-ifc-dev  = <&wcd9340_ifd>;
> +	vdd-buck-supply = <&vreg_s4a_1p8>;
> +	vdd-buck-sido-supply = <&vreg_s4a_1p8>;
> +	vdd-tx-supply = <&vreg_s4a_1p8>;
> +	vdd-rx-supply = <&vreg_s4a_1p8>;
> +	vdd-io-supply = <&vreg_s4a_1p8>;
> +	qcom,micbias1-lvl = <1800>;
> +	qcom,micbias2-lvl = <1800>;
> +	qcom,micbias3-lvl = <1800>;
> +	qcom,micbias4-lvl = <1800>;
> +
> +	interrupt-parent = <&tlmm>;
> +	interrupts = <54 IRQ_TYPE_LEVEL_HIGH>;
> +	interrupt-names  = "intr1";
> +	interrupt-controller;
> +	#interrupt-cells = <1>;
> +
> +	#clock-cells = <0>;
> +	clock-frequency = <9600000>;
> +	clock-output-names = "mclk";
> +	#sound-dai-cells = <1>;
> +
> +	pinctrl@42 {
> +		compatible = "qcom,wcd9340-pinctrl";
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		gpio-ranges = <&wcdpinctrl 0 0 5>;
> +		reg = <0x42 0x2>;
> +		...
> +	};
> +
> +	soundwire@c85{

Child nodes need documenting.

> +		compatible = "qcom,soundwire-v1.3.0";
> +		reg = <0xc85 0x40>;
> +		...
> +	};
> +};
> -- 
> 2.21.0
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
