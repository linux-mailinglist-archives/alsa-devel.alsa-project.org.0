Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0FC36607C
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Apr 2021 21:58:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57A9C1696;
	Tue, 20 Apr 2021 21:57:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57A9C1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618948699;
	bh=sXgak4bShUAlOJl6RJgC+jBf9eZHBquc1CLjkVE4HZ4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BOVLrnaTnq1WqjDRbzUYL84D5n72lht+sMlJSYeDbzJO5V+YWTsiBm9BnYzNy1gnc
	 KYeHrFx7wkNbZSfVs3H6C7flTQLajg/TW7nDLzey5aspyVNjMO+FTQDX73LahGb2xm
	 cOYSG46KCCQUpcyK2Zc5L7lXIfOxRdtn9H4IYDqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1232F80273;
	Tue, 20 Apr 2021 21:56:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99E90F80253; Tue, 20 Apr 2021 21:56:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 060DAF8014D
 for <alsa-devel@alsa-project.org>; Tue, 20 Apr 2021 21:56:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 060DAF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="N8jJfeG9"
Received: by mail-ej1-x62c.google.com with SMTP id u21so60121417ejo.13
 for <alsa-devel@alsa-project.org>; Tue, 20 Apr 2021 12:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wXFtoKa4A9wR85HULtd8naWK+51HB2/UPn0+gbcQvGw=;
 b=N8jJfeG9gsgBdzDrllZ5Dl95V3ZFa2C9N/QvPK681qcXEGBP1a4xK/V5JOdL4uSPR2
 bW5YI0Vy2P9Ama1vf/D1VidtKy+xIVVIIY81EjyYj+ZqHdlWn0j8iO3jtIv9FvsKc57I
 KQThbz8nnfT90frF1+vS3kdJZOl4l6xasCVlZkzWsVo1JpO+Imy+ElAWPjwe9qn1BwNt
 4DWm5wWmel8UH4LhuUgJrcq1pzwSKO0J5mb8+ejyWNpy2oQBdw4dn3xJKpetLDrfCnuL
 meibvdXx5W20MSCSDYVveVdyeFAfrbOV2QjaG7XZdPVgM4jxGC71NIFcuFrsQX5LpMmf
 A4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wXFtoKa4A9wR85HULtd8naWK+51HB2/UPn0+gbcQvGw=;
 b=qFhi9NLbz2AqOsCWvJJrTptjd5wzSbB7iOrTl0qacYsiB4scKqrogRmSq5fWnCDV3R
 +PwN/FmW3s7AA7UcnOFpADxSW/l+g2fuGS1t1izYDIK+1s6L6EMybuup4glLKFPZENpx
 ERy+RnRvZpM4RHnev+JhM/+v4G686kaF46XK4MHfUKV8Igx3yuZL/MbZFD5z04J2Fxvn
 Z+HmZ2O1RRjUpeW1yoXM+nUzeVEU0l5gahVcRkFEXAiROEYXtS6NbXX6oNIOjBeomMky
 A4JhIdX17V00gxHmG/SjV+L+vYKLRDSKUBAX0jeZAk24alikdoZ7xRVqIjV4Qz1rUPsS
 sBOw==
X-Gm-Message-State: AOAM530LuQNQ168Ojuw0NPwGeBJMP5qyAEjekv4Z0GqjHfQWpPgcN0hk
 l+eHLRxfOA9JwIPvNkEGAjw=
X-Google-Smtp-Source: ABdhPJwM6M2UQx8s6wyd3V9paZeYW0+zTujJHqwLwvHTq2kOVCOCv7b7IRWfAvMRi+r7tEU1JRN1fA==
X-Received: by 2002:a17:906:d154:: with SMTP id
 br20mr28836830ejb.28.1618948598722; 
 Tue, 20 Apr 2021 12:56:38 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id o6sm84419edw.24.2021.04.20.12.56.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 12:56:38 -0700 (PDT)
Subject: Re: [v7 3/4] dt-bindings: Add Rockchip rk817 audio CODEC support
To: Chris Morgan <macroalpha82@gmail.com>, alsa-devel@alsa-project.org
References: <20210420160747.22942-1-macroalpha82@gmail.com>
 <20210420160747.22942-3-macroalpha82@gmail.com>
From: Johan Jonker <jbx6244@gmail.com>
Message-ID: <375b3145-70cc-9351-76f5-b9a159dc244f@gmail.com>
Date: Tue, 20 Apr 2021 21:56:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20210420160747.22942-3-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: pierre-louis.bossart@linux.intel.com, heiko@sntech.de,
 devicetree@vger.kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 lgirdwood@gmail.com, linux-rockchip@lists.infradead.org, broonie@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, lee.jones@linaro.org
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

Hi Chris,

Some comments. Have a look if they are useful.

On 4/20/21 6:07 PM, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Create dt-binding documentation to document rk817 codec.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
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
>  .../devicetree/bindings/mfd/rk808.txt         | 181 ++++++++++++++++++
>  1 file changed, 181 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/rk808.txt b/Documentation/devicetree/bindings/mfd/rk808.txt
> index 04df07f6f793..31eaabd2e179 100644
> --- a/Documentation/devicetree/bindings/mfd/rk808.txt
> +++ b/Documentation/devicetree/bindings/mfd/rk808.txt
> @@ -63,6 +63,11 @@ Optional RK809 properties:
>  - vcc9-supply:  The input supply for DCDC_REG5, SWITCH_REG2
>  
>  Optional RK817 properties:
> +- clocks:	The input clock for the audio codec
> +- clock-names:	The clock name for the codec clock. Should be "mclk".

#sound-dai-cells:

Needed for the interpretation of sound dais.
Should be 0.

Add empty line

> +- codec:	The child node for the codec to hold additional properties.

This is a nodename and not a property. Add below "vcc9-supply".

> +- mic-in-differential: Telling if the microphone uses differential mode. Should
> +		       be under the codec child node.

This goes in a subnode. Maybe add indent a bit?
"mic-in-differential" is a property specific for Rockchip.

Ask rob+dt for exact name.
Maybe this has to change to "rockchip,mic-in-differential"
Update code as well!

Add new added property names explicit in your commit message, so rob+dt
can review more easy.


>  - vcc8-supply:  The input supply for BOOST
>  - vcc9-supply:  The input supply for OTG_SWITCH
>  
> @@ -275,3 +280,179 @@ Example:
>  			};
>  		};
>  	};

Maybe add separator/title?

> +
> +	rk817: pmic@20 {
> +		compatible = "rockchip,rk817";
> +		reg = <0x20>;

> +		interrupt-parent = <&gpio0>;

Missing in properties.

> +		interrupts = <RK_PB2 IRQ_TYPE_LEVEL_LOW>;
> +		clock-output-names = "rk808-clkout1", "xin32k";
> +		clock-names = "mclk";
> +		clocks = <&cru SCLK_I2S1_OUT>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pmic_int>, <&i2s1_2ch_mclk>;

> +		wakeup-source;

Missing in properties.
Is this common for all rkXXX?

> +		#clock-cells = <1>;

> +		#sound-dai-cells = <0>;

Missing in properties.

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

Add empty line, like the rest.

> +		rk817_codec: codec {

> +			mic-in-differential;

See comment above.
rockchip,mic-in-differential ??

> +		};
> +	};
> 

