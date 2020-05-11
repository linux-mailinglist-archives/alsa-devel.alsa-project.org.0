Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41ECC1CE7DF
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 00:00:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C34691614;
	Mon, 11 May 2020 23:59:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C34691614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589234433;
	bh=gmEJmAAKb7NfmazgVlK0v6PRA8Af0GstNhHuJvVCAbE=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U74bbd0vncu3AU6PVJaZhR+E8sPjJlgy4yeiF/ssQzuJ9Ny7btDxQnA5Ti/haFIi4
	 7uSzeEEuKmrAI96gXIcZyIG3veOTAXpKdo/1VP0oT7g7rlKBMne9kOuRlFq+AlGmxN
	 drhHXWRqr8DOWigKBzJn+BJq9vsbkkmn20PSGDgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFC6AF800E3;
	Mon, 11 May 2020 23:58:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98E09F800E3; Mon, 11 May 2020 23:58:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BE77F800E3
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 23:58:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BE77F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gateworks-com.20150623.gappssmtp.com
 header.i=@gateworks-com.20150623.gappssmtp.com header.b="ZQGkawJ+"
Received: by mail-oi1-x229.google.com with SMTP id c12so15503986oic.1
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 14:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=eEUSptk1GatKrb0a1iAqXIYXFqLE7lyAa5MT51v2rEE=;
 b=ZQGkawJ+jCjW6LAc5nZbI2Hr3u1bb0evG0HJ+xnqivYPVBTS4Qs9vVa8/SVlYqXeFX
 /wZzus1KOuKPCfftdhrQe5RMrWDs+oO6dLwHYRWGu44xkbtmuC4S6Oe9bYPfv9Kp0QV9
 cYkeIasfgyUoIn7khMCr70L70Un6oAt6SA0gDCSOim2TPjF7Q1u+3ZCt5i4wD7CATncI
 zulryfGTq4OqZDjsg+gyl2HuN+M/hKtQwNOaFiyIYM9zepVH99T8rfD3ok7Jefr0E5R8
 CT9DnSftCl01LMIL10nW5EH2WhxMuZKHMbpfK+anGB3Ha7KZ/SpRCHm6ndyDrx1qmTJN
 /ISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=eEUSptk1GatKrb0a1iAqXIYXFqLE7lyAa5MT51v2rEE=;
 b=Ik6LaWjtNVXyRHj8Ve3QhvOnTjSOzjGPcfUbUBsPhpKE0fwwPDXBODhGDvgZrTsdDc
 GcRGBjPxj2Lcrbss8i/+hrrznZ/ZJIem0KetPw/6aWh8FHDxVTsWIJtQ11XFuuBO52iR
 dP09tAkbLUVMJsoermnLLRvx8FQ/MdIISLLlzC2YuSg2Y1AYHIusvOetlP7zmIH/CSvs
 eq6jfcULdtGzqWes0YBTe0ToAAIzE0rxlAg3D14mdcBFGTZ+FB7RsKaxEcMpHRStdldj
 sxDoSEM8IaGPH2IHRU9YuH6xD7aZZpFulKAf6pSOV9P7QD1C7B9zafY1MxhqdRzklHtR
 cxKA==
X-Gm-Message-State: AGi0PubTgKtDW8OFi1dWvSulWhr5htFbrtv3UoEQJSRw1cthF7BoQqnj
 UFu6W/7g+1iLeBRnKqtYj7Va/MViLL4xsV4CypWaTw==
X-Google-Smtp-Source: APiQypKBmcPK3Tp+dq6iwzDU5unntOJmkUm5O97uAC3f7qE2HTD5E2iFWazH8ubwfBYVgDux3eDNzQFv4SyyWP0VK6M=
X-Received: by 2002:aca:4f09:: with SMTP id d9mr22211179oib.172.1589234315608; 
 Mon, 11 May 2020 14:58:35 -0700 (PDT)
MIME-Version: 1.0
From: Tim Harvey <tharvey@gateworks.com>
Date: Mon, 11 May 2020 14:58:24 -0700
Message-ID: <CAJ+vNU3ekA76nXE7UV+kxA1DtbSMiRCnhTOy6RwixOrj1AoJug@mail.gmail.com>
Subject: imx8mm fsl_sai clock config failing
To: Timur Tabi <timur@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 NXP Linux Team <linux-imx@nxp.com>, Peng Fan <peng.fan@nxp.com>,
 Anson Huang <Anson.Huang@nxp.com>, Abel Vesa <abel.vesa@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

Greetings,

I'm trying to get imx8mm sai working with a tlv320aic3x codec on a new
board and am finding that the sai3 bus clock is getting derived from
the wrong source leading hw_params() to fail with 'fsl-sai
30030000.sai: failed to derive required Tx rate: 3072000'

In comparison to the imx8mm-evk I find it's clock gets configured as
desired yet I have the same device-tree configuration for sai3.

Here is my board's dts:
/ {
...
        sound {
                compatible = "simple-audio-card";
                simple-audio-card,name = "tlv320-audio";
                simple-audio-card,format = "i2s";
                simple-audio-card,frame-master = <&cpudai>;
                simple-audio-card,bitclock-master = <&cpudai>;
                simple-audio-card,widgets =
                        "Line", "Left Line Out Jack",
                        "Line", "Right Line Out Jack";
                simple-audio-card,routing =
                        "Left Line Out Jack", "LLOUT",
                        "Right Line Out Jack", "RLOUT";

                cpudai: simple-audio-card,cpu {
                        sound-dai = <&sai3>;
                        dai-tdm-slot-num = <2>;
                        dai-tdm-slot-width = <32>;
                };

                simple-audio-card,codec {
                        sound-dai = <&tlv320aic3105>;
                        clocks = <&clk IMX8MM_CLK_SAI3_ROOT>;
                };
        };
};

&i2c2 {
...
        tlv320aic3105: codec@18 {
                #sound-dai-cells = <0>;
                pinctrl-names = "default";
                pinctrl-0 = <&pinctrl_tlv>;
                compatible = "ti,tlv320aic3x";
                reg = <0x18>;
                reset-gpios = <&gpio4 4 GPIO_ACTIVE_LOW>;
                ai3x-micbias-vg = <2>; /* MICBIAS_2_5V */
                /* Regulators */
                DRVDD-supply = <&reg_3p3v>;
                AVDD-supply = <&reg_3p3v>;
                IOVDD-supply = <&reg_3p3v>;
                DVDD-supply = <&reg_1p8v>;
        };
}

&sai3 {
        pinctrl-names = "default";
        pinctrl-0 = <&pinctrl_sai3>;
        assigned-clocks = <&clk IMX8MM_CLK_SAI3>;
        assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
        assigned-clock-rates = <24576000>;
        status = "okay";
};

and /sys/kernel/debug/clk/clk_summary from my board:
 osc_24m                              7       10        0    24000000
        0     0  50000
...
    audio_pll1_ref_sel                0        0        0    24000000
        0     0  50000
       audio_pll1                     0        0        0   650000000
        0     0  50000
          audio_pll1_bypass           0        0        0   650000000
        0     0  50000
             audio_pll1_out           0        0        0   650000000
        0     0  50000
                sai3                  0        0        0    25000000
        0     0  50000
                   sai3_root_clk       0        0        0    25000000
         0     0  50000
^^^^ note 25000000 instead of requested 24576000

And Here is the imx8mm-evk dts:
/ {
...
        wm8524: audio-codec {
                #sound-dai-cells = <0>;
                compatible = "wlf,wm8524";
                pinctrl-names = "default";
                pinctrl-0 = <&pinctrl_gpio_wlf>;
                wlf,mute-gpios = <&gpio5 21 GPIO_ACTIVE_LOW>;
        };

        sound-wm8524 {
                compatible = "simple-audio-card";
                simple-audio-card,name = "wm8524-audio";
                simple-audio-card,format = "i2s";
                simple-audio-card,frame-master = <&cpudai>;
                simple-audio-card,bitclock-master = <&cpudai>;
                simple-audio-card,widgets =
                        "Line", "Left Line Out Jack",
                        "Line", "Right Line Out Jack";
                simple-audio-card,routing =
                        "Left Line Out Jack", "LINEVOUTL",
                        "Right Line Out Jack", "LINEVOUTR";

                cpudai: simple-audio-card,cpu {
                        sound-dai = <&sai3>;
                        dai-tdm-slot-num = <2>;
                        dai-tdm-slot-width = <32>;
                };

                simple-audio-card,codec {
                        sound-dai = <&wm8524>;
                        clocks = <&clk IMX8MM_CLK_SAI3_ROOT>;
                };
        };
};

&sai3 {
        pinctrl-names = "default";
        pinctrl-0 = <&pinctrl_sai3>;
        assigned-clocks = <&clk IMX8MM_CLK_SAI3>;
        assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
        assigned-clock-rates = <24576000>;
        status = "okay";
};

and /sys/kernel/debug/clk/clk_summary from imx8mm_evk:
 osc_24m                              7       10        0    24000000
        0     0  50000
...
    audio_pll1_ref_sel                0        0        0    24000000
        0     0  50000
       audio_pll1                     0        0        0   393215995
        0     0  50000
          audio_pll1_bypass           0        0        0   393215995
        0     0  50000
             audio_pll1_out           0        0        0   393215995
        0     0  50000
                sai3                  0        0        0    24576000
        0     0  50000
                   sai3_root_clk       0        0        0    24576000
         0     0  50000
^^^^ note 24576000 as requested

Any ideas what I'm doing wrong here?

Note that even though the imx8mm-evk appears to configure its clock
correctly I still have not been able to play audio out the wm8524 and
the system appears to hang during playback as if BCLK/MCLK were not
clocking.

Perhaps there is something not supported yet upstream with regards to
IMX8MM SAI?

Best Regards,

Tim
