Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF89C369894
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Apr 2021 19:40:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A4EC16E5;
	Fri, 23 Apr 2021 19:39:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A4EC16E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619199629;
	bh=dPYsrCXD4xlAodpzETWKGuyJZXqpBZB6Pfhoh+r5ihk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ekDQEY7ruUkGZ60CQhSN6W8jbvyroGB5mHvJ1os6ga1VVAOwzsz3tBRUB0WMsBiau
	 fUnIE0YXDdoHoK1PLFq5QUXoBwqNMVgqkTWhSTVRkGrFzU9jVsTlYPU6DcC1kW+WV7
	 HUg42IJGh/LR6gIvzKlh+t3RWeTx/A0HhiLqFv1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7051F80256;
	Fri, 23 Apr 2021 19:39:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C81D2F80227; Fri, 23 Apr 2021 19:38:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3E91F800AE
 for <alsa-devel@alsa-project.org>; Fri, 23 Apr 2021 19:38:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3E91F800AE
Received: by mail-oo1-f51.google.com with SMTP id
 i9-20020a4ad0890000b02901efee2118aaso3263323oor.7
 for <alsa-devel@alsa-project.org>; Fri, 23 Apr 2021 10:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A0MHQhU0eBU2kkHw8aXCklvLDh3uIKAnsJkWYtRfwVM=;
 b=ZF8vhAvOTez8gjF3lUmh+Nah9OPyJjRqE6O+oV4WQ+mOGQdPgO4gtIGOsJpxQKN98l
 btWGK2qRxY13vxrwEtjJchhYBRkRnOXNeJJxUpK9/rL04uUWzNQ46ApSRnQw1gL5b0Ie
 XfeZikaO2wF0EXJZeYeTV4v3RIFiUgUYMCzM2GI2sF/8ztPUFPDSYmy4Dh3BmTn5ZdHj
 /VO5lj4jnvYg3SulE1/cAdOI4hQFP65Hba2DNtKIflvz9ha1QT+qoRbAgQYCXMFIzxW1
 nbvwH4qZcwlK050676cZ88DXsW5cad9Yd5W0iuYPS3X/PUYTCg8cdEyl6eX9gDWIj31U
 4elw==
X-Gm-Message-State: AOAM530+BPzwvywFloUHzi/j7cFCrTMv8USiUYhu8j70CUJsZeBt4R95
 MOmrq9eRkVQBRQ0GmCVglQ==
X-Google-Smtp-Source: ABdhPJybWIzwfgeSqCSv8HrgGH2LKZdKV4Yw1ikoy/j7G8srfuFi/gbh4lepwOmZIy1Aiy4Nj8yHSQ==
X-Received: by 2002:a4a:e153:: with SMTP id p19mr3872886oot.52.1619199532595; 
 Fri, 23 Apr 2021 10:38:52 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g5sm1401495oiy.24.2021.04.23.10.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 10:38:51 -0700 (PDT)
Received: (nullmailer pid 1307573 invoked by uid 1000);
 Fri, 23 Apr 2021 17:38:50 -0000
Date: Fri, 23 Apr 2021 12:38:50 -0500
From: Rob Herring <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [v8 3/4] dt-bindings: Add Rockchip rk817 audio CODEC support
Message-ID: <20210423173850.GA1300233@robh.at.kernel.org>
References: <20210421175906.31977-1-macroalpha82@gmail.com>
 <20210421175906.31977-3-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210421175906.31977-3-macroalpha82@gmail.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 heiko@sntech.de, devicetree@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-rockchip@lists.infradead.org, broonie@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, jbx6244@gmail.com,
 lee.jones@linaro.org, maccraft123mc@gmail.com
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

On Wed, Apr 21, 2021 at 12:59:05PM -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Create dt-binding documentation to document rk817 codec.
> New property name of rockchip,mic-in-differential added to control if
> the microphone is in differential mode or not.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
> Changes in v8:
>  - Added additional documentation for missing properties of #sound-dai-cells,
>    interrupt-parent, and wakeup-source for mfd documentation.
>  - Corrected order of elements descriptions in device tree documentation.
>  - Changed name of "mic-in-differential" to "rockchip,mic-in-differential".
>  - Changed name of sound card from "rockchip,rk817-codec" to "Analog".
>  - Removed unused resets and reset-names from the i2s1_2ch node.
> Changes in v7:
>  - Removed ifdef around register definitions for MFD.
>  - Replaced codec documentation with updates to MFD documentation.
>  - Reordered elements in example to comply with upstream rules.
>  - Added binding update back for Odroid Go Advance as requested.
>  - Submitting patches from gmail now.
> Changes in v6:
>  - Included additional project maintainers for correct subsystems.
>  - Removed unneeded compatible from DT documentation.
>  - Removed binding update for Odroid Go Advance (will do in seperate series).
> Changes in v5:
>  - Move register definitions from rk817_codec.h to main rk808.h register
>    definitions.
>  - Add volatile register for codec bits.
>  - Add default values for codec bits.
>  - Removed of_compatible from mtd driver (not necessary).
>  - Switched to using parent regmap instead of private regmap for codec.
> Changes in v4:
>  - Created set_pll() call.
>  - Created user visible gain control in mic.
>  - Check for return value of clk_prepare_enable().
>  - Removed duplicate clk_prepare_enable().
>  - Split DT documentation to separate commit.
> Changes in v3:
>  - Use DAPM macros to set audio path.
>  - Updated devicetree binding (as every rk817 has this codec chip).
>  - Changed documentation to yaml format.
>  - Split MFD changes to separate commit.
> Changes in v2:
>  - Fixed audio path registers to solve some bugs.
> 
>  .../devicetree/bindings/mfd/rk808.txt         | 188 ++++++++++++++++++
>  1 file changed, 188 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/rk808.txt b/Documentation/devicetree/bindings/mfd/rk808.txt
> index 04df07f6f793..e27fb2c1ebe0 100644
> --- a/Documentation/devicetree/bindings/mfd/rk808.txt
> +++ b/Documentation/devicetree/bindings/mfd/rk808.txt
> @@ -14,6 +14,8 @@ Required properties:
>  - compatible: "rockchip,rk817"
>  - compatible: "rockchip,rk818"
>  - reg: I2C slave address
> +- interrupt-parent: Should contain a phandle to the correct interrupt
> +		    controller node.

This can be in any parent node, so generally not required. IOW, you 
don't need to document it.

Otherwise,

Acked-by: Rob Herring <robh@kernel.org>

(Really, this should be converted to schema, but given it's on v8 
already that can come later.)

>  - interrupts: the interrupt outputs of the controller.
>  - #clock-cells: from common clock binding; shall be set to 1 (multiple clock
>    outputs). See <dt-bindings/clock/rockchip,rk808.h> for clock IDs.
> @@ -23,6 +25,7 @@ Optional properties:
>    default output clock name
>  - rockchip,system-power-controller: Telling whether or not this pmic is controlling
>    the system power.
> +- wakeup-source: Device can be used as a wakeup source.
>  
>  Optional RK805 properties:
>  - vcc1-supply:  The input supply for DCDC_REG1
> @@ -63,8 +66,16 @@ Optional RK809 properties:
>  - vcc9-supply:  The input supply for DCDC_REG5, SWITCH_REG2
>  
>  Optional RK817 properties:
> +- clocks:	The input clock for the audio codec
> +- clock-names:	The clock name for the codec clock. Should be "mclk".
> +- #sound-dai-cells: Needed for the interpretation of sound dais. Should be 0.
> +
>  - vcc8-supply:  The input supply for BOOST
>  - vcc9-supply:  The input supply for OTG_SWITCH
> +- codec:	The child node for the codec to hold additional properties.
> +
> +- rockchip,mic-in-differential: Telling if the microphone uses differential
> +				mode. Should be under the codec child node.
>  
>  Optional RK818 properties:
>  - vcc1-supply:  The input supply for DCDC_REG1
> @@ -275,3 +286,180 @@ Example:
>  			};
>  		};
>  	};
> +
> +	rk817: pmic@20 {
> +		compatible = "rockchip,rk817";
> +		reg = <0x20>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <RK_PB2 IRQ_TYPE_LEVEL_LOW>;
> +		clock-output-names = "rk808-clkout1", "xin32k";
> +		clock-names = "mclk";
> +		clocks = <&cru SCLK_I2S1_OUT>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pmic_int>, <&i2s1_2ch_mclk>;
> +		wakeup-source;
> +		#clock-cells = <1>;
> +		#sound-dai-cells = <0>;
> +
> +		vcc1-supply = <&vccsys>;
> +		vcc2-supply = <&vccsys>;
> +		vcc3-supply = <&vccsys>;
> +		vcc4-supply = <&vccsys>;
> +		vcc5-supply = <&vccsys>;
> +		vcc6-supply = <&vccsys>;
> +		vcc7-supply = <&vccsys>;
> +
> +		regulators {
> +			vdd_logic: DCDC_REG1 {
> +				regulator-name = "vdd_logic";
> +				regulator-min-microvolt = <950000>;
> +				regulator-max-microvolt = <1150000>;
> +				regulator-ramp-delay = <6001>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <950000>;
> +				};
> +			};
> +
> +			vdd_arm: DCDC_REG2 {
> +				regulator-name = "vdd_arm";
> +				regulator-min-microvolt = <950000>;
> +				regulator-max-microvolt = <1350000>;
> +				regulator-ramp-delay = <6001>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt = <950000>;
> +				};
> +			};
> +
> +			vcc_ddr: DCDC_REG3 {
> +				regulator-name = "vcc_ddr";
> +				regulator-always-on;
> +				regulator-boot-on;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +				};
> +			};
> +
> +			vcc_3v3: DCDC_REG4 {
> +				regulator-name = "vcc_3v3";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt = <3300000>;
> +				};
> +			};
> +
> +			vcc_1v8: LDO_REG2 {
> +				regulator-name = "vcc_1v8";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1800000>;
> +				};
> +			};
> +
> +			vdd_1v0: LDO_REG3 {
> +				regulator-name = "vdd_1v0";
> +				regulator-min-microvolt = <1000000>;
> +				regulator-max-microvolt = <1000000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1000000>;
> +				};
> +			};
> +
> +			vcc3v3_pmu: LDO_REG4 {
> +				regulator-name = "vcc3v3_pmu";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <3300000>;
> +				};
> +			};
> +
> +			vccio_sd: LDO_REG5 {
> +				regulator-name = "vccio_sd";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <3300000>;
> +				};
> +			};
> +
> +			vcc_sd: LDO_REG6 {
> +				regulator-name = "vcc_sd";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <3300000>;
> +				};
> +			};
> +
> +			vcc_bl: LDO_REG7 {
> +				regulator-name = "vcc_bl";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt = <3300000>;
> +				};
> +			};
> +
> +			vcc_lcd: LDO_REG8 {
> +				regulator-name = "vcc_lcd";
> +				regulator-min-microvolt = <2800000>;
> +				regulator-max-microvolt = <2800000>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt = <2800000>;
> +				};
> +			};
> +
> +			vcc_cam: LDO_REG9 {
> +				regulator-name = "vcc_cam";
> +				regulator-min-microvolt = <3000000>;
> +				regulator-max-microvolt = <3000000>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt = <3000000>;
> +				};
> +			};
> +		};
> +
> +		rk817_codec: codec {
> +			rockchip,mic-in-differential;
> +		};
> +	};
> -- 
> 2.25.1
> 
