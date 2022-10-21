Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53993607307
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 10:55:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E5E1BADE;
	Fri, 21 Oct 2022 10:54:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E5E1BADE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666342530;
	bh=1ysldIFTXcVA2ZKWQVgKDPYi16Qh13iskg0H+FnBZNE=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=senZPdzwzbZLuTir7O7WN4HSrH1590kmJTaknZs3/XCrbYNKHaCDDQwUb9wqYWHx8
	 +2+y6ihG2ZIfREq2+fgiKDd5z5GXuA3uf1M4M5V1lJk7ctsgNbZjiTQefBnyYJguWu
	 IMNd3ANJ+WS/2+VMfudO7Xmx/MlQxq+Qr4f9mEwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A1C0F8053C;
	Fri, 21 Oct 2022 10:54:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CE5FF80543; Fri, 21 Oct 2022 10:54:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00454F8053D
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 10:54:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00454F8053D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="s4vuaj6J"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20221021085412epoutp01a39ac2b8b15e5f52d8c02a1279f452ed~gCaHHSTZi2100421004epoutp01z
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 08:54:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20221021085412epoutp01a39ac2b8b15e5f52d8c02a1279f452ed~gCaHHSTZi2100421004epoutp01z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1666342452;
 bh=5U6kbdEwtstzuJzqj8njNs2aevGge2h2etECD8bzp58=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=s4vuaj6JdcOh5bVH2FC8GRmX4JsNeZT2ZI7nF3EpKdjqNmFQyXXYs7XCtBNY3umj2
 oQJHKV915VnDCSNlqEhYKTtfH+GXXI5lSv55RG/DNVTOhRZqkJq34xkqeXFWHfY0oh
 Bzy1Rb2362ba32p+F2kxFA75lHv5C/tETI1M8iYQ=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20221021085412epcas5p4301f28acc7e3dd811f5421029590f5ff~gCaGoVoYr2099120991epcas5p4w;
 Fri, 21 Oct 2022 08:54:12 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.178]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4Mtyv52Vrhz4x9Q8; Fri, 21 Oct
 2022 08:54:09 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 25.81.56352.13E52536; Fri, 21 Oct 2022 17:54:09 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20221021084938epcas5p402b6c1dc47137914fabcbb655ffa85ef~gCWIEbas72051320513epcas5p4y;
 Fri, 21 Oct 2022 08:49:38 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221021084938epsmtrp126e775ab3dc74f229417bf94211c6ea7~gCWIDk6752558625586epsmtrp1n;
 Fri, 21 Oct 2022 08:49:38 +0000 (GMT)
X-AuditID: b6c32a4b-5f7fe7000001dc20-31-63525e31eb57
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 4B.D4.18644.22D52536; Fri, 21 Oct 2022 17:49:38 +0900 (KST)
Received: from FDSFTE070 (unknown [107.116.189.86]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20221021084935epsmtip1426827a59937fb73ac13f5c1894f1a5d~gCWFXFPSF0067100671epsmtip1V;
 Fri, 21 Oct 2022 08:49:35 +0000 (GMT)
From: "Padmanabhan Rajanbabu" <p.rajanbabu@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
 <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <s.nawrocki@samsung.com>,
 <perex@perex.cz>, <tiwai@suse.com>, <pankaj.dubey@samsung.com>,
 <alim.akhtar@samsung.com>, <rcsekar@samsung.com>, <aswani.reddy@samsung.com>
In-Reply-To: <c11f92be-1d86-17e4-e3bb-05e7b17d5fc8@linaro.org>
Subject: RE: [PATCH 5/6] arm64: dts: fsd: Add I2S DAI node for Tesla FSD
Date: Fri, 21 Oct 2022 14:19:34 +0530
Message-ID: <04ba01d8e52a$0d55bee0$28013ca0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKFI9qd/qMOsyXBjKz4d8Q6MS4QvwIMhU34AXuYdz8DFSTEIKyLIU2w
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA01TfUwTdxjO73q9HhrIWVj4rWasuUgWyIBWS7kaYGYiqdMY4jLiSDa8tTfK
 KNdbWyoff4hsK0JAIKZIG4QBggajdIisFluxfCx+BPzAunTiZMOMTVkEFmanc2s52PjveZ/3
 efK+z+8DF4j9mAQvZM2MkaX1JLYBHRxJSEiSf7xfI6v9Pop61DaIUVO3fQjlu3BRRNlmZjGq
 fXRCSB2bmxFQnichbnnqKELddbdiVMukF6E6L/4homrcDULKccslpL7yjIqokafVQsr55zmw
 g1A7l6ow9SXHtEjd31uDqR/4L2Nq73wPpj420AvUfQP3UPVSf1wOnleUrmNoLWOUMqzGoC1k
 CzLIPe/n78xPVcrkSXIVlUZKWbqYySCz9uYkZRfqQxFIqYXWl4SoHNpkIlMy042GEjMj1RlM
 5gyS4bR6TsElm+hiUwlbkMwy5u1ymWxrakh4sEh3xTaIcPXxpT+edIBK0BRXCyJwSCjgX/fm
 hbVgAy4mhgD8taEH4YtFABcDQ6KwSkwsARjsqlhzjL28gPK8G8DLfjlvmAOwq9a3YsCINNjp
 6QbhRgwxhcDg2Wo0XAgIK4Ce2+dCHRyPIDLhq9HysCGaUMOqlx5hmEaJeOjo3hKmIwkV9DgC
 CI83wWv22ZXBAuJN+O18q4BfSAqDj3uEYRxDZMOxvmUhr4mFY8E6QXgsJJ7hsK2jGeUNWdDV
 YUd4HA1/+25AxGNJKL51FRtg88IXGI9LoXXBuap/Bw5PtaLhPQVEAuxzp/D0G9B2/TzCz42C
 9S9mV+WR0NW2huNh3+l+wOPN0HvfAxoB6VgXzbEummNdBMf/074GaC94neFMxQWMKZXbxjKH
 /rtvjaG4H6w88MQ9LvDTo2fJPoDgwAcgLiBjIrnfczTiSC1dVs4YDfnGEj1j8oHU0HE3CSSv
 aQyhH8Ka8+UKlUyhVCoVqm1KORkb2dWSqBETBbSZKWIYjjGu+RA8QlKJfGIuV6HXD+ceP/Kp
 152Te23kxMIl68mlaLvkrdI8K3sTWDsHkvM2gnencwvpU8VyZtN+f82VuLoX4yqJsF7fVUW2
 vX228bPOMtvzWHLyYKM9vyhjbGLi0N0HfR3OmPM/R7xn3Oz1tle7drWNFZWlL99sGo9qf1W5
 eLTixtNdRFrSL9rtHFvB3Y9qEP8zPRjYG0tZdtjOHB66c9yyM5iylHW1XnjAR27dnWY8NbNv
 Xuqs+xtxtFhuxWU2eys5/+KTwh+sc1+OfGjr/kCZVb9c8HyL0z589bRu4iPLiY0SLmgt//yO
 Gx1OzDtCG3brHurGv8medAckD2u10d3cY+ONAImadLQ8UWA00f8CSEuguGkEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRmVeSWpSXmKPExsWy7bCSnK5SbFCywZcuZYsH87axWVy5eIjJ
 4tDmrewWUx8+YbOYf+Qcq0Xfi4fMFntfA8W+Xelgsri8aw6bxYzz+5gsFm39wm7Ruauf1WLW
 hR2sFq17j7BbHH7Tzmqx4ftaRgcBjw2fm9g8ds66y+6xaVUnm8eda3vYPPa9Xcbm0bdlFaPH
 +i1XWTw+b5IL4IjisklJzcksSy3St0vgytg/dRtTQa9qxf25sxgbGCfKdTFyckgImEgc/bOZ
 pYuRi0NIYAejxJ/D25khEtIS0/v3sEHYwhIr/z1nhyh6xijxo/UzO0iCTcBcYtHepYwgCRGB
 R0wSc+c/YgNxmAW6GCWO/13JDNHymVHi5/ofQBkODk4BO4l/R6pAuoUFPCSa/uxlBQmzCKhK
 zFqqAhLmFbCU2DvrFhOELShxcuYTFhCbWUBbovdhKyOELS+x/e0cqEsVJH4+XcYKYosIuEkc
 Xf+NFaJGXOLozx7mCYzCs5CMmoVk1Cwko2YhaVnAyLKKUTK1oDg3PbfYsMAoL7Vcrzgxt7g0
 L10vOT93EyM4krW0djDuWfVB7xAjEwfjIUYJDmYlEd6CdwHJQrwpiZVVqUX58UWlOanFhxil
 OViUxHkvdJ2MFxJITyxJzU5NLUgtgskycXBKNTDl8XDaLtukIPcu/3HZunfbGzo4Lhy5M7ur
 cU343wtbFB9039nZynFDYV9ZDIf4G9bqFq6jN6XefFBT7v+9/M6v7VciE8/cM7n1KSd5i7mm
 C+fe019Ep/irLndnuxyWJR/xbCrjg80K03OUA7lZ1++y+Lg5183WQDDgRJGzvvjta+lzCjNq
 Ttq6vm1/aOhiUm29dV6Ga0zZDJ3KCe7mvOzb9RLjnjgIHpLYZqpS4/chRWZxZJZE52eD5e62
 tv1MDAej+fhYLU22r27tOsWZ0nXki8bHX9MUL2wxu/RiX1t34kqdAmv7OYXnKpJtug+qPXa/
 YeFc9mHeq6O7WNXOyvIElL6/IRNcvZczxMnxlBJLcUaioRZzUXEiALmcMvpTAwAA
X-CMS-MailID: 20221021084938epcas5p402b6c1dc47137914fabcbb655ffa85ef
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221014104911epcas5p394100ff6ed53be32c4d64c7e23e48833
References: <20221014102151.108539-1-p.rajanbabu@samsung.com>
 <CGME20221014104911epcas5p394100ff6ed53be32c4d64c7e23e48833@epcas5p3.samsung.com>
 <20221014102151.108539-6-p.rajanbabu@samsung.com>
 <c11f92be-1d86-17e4-e3bb-05e7b17d5fc8@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
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



> -----Original Message-----
> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@linaro.org]
> Sent: 16 October 2022 08:44 PM
> To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>;
> lgirdwood@gmail.com; broonie@kernel.org; robh+dt@kernel.org;
> krzysztof.kozlowski+dt@linaro.org; s.nawrocki@samsung.com;
> perex@perex.cz; tiwai@suse.com; pankaj.dubey@samsung.com;
> alim.akhtar@samsung.com; rcsekar@samsung.com;
> aswani.reddy@samsung.com
> Cc: alsa-devel@alsa-project.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-samsung-soc@vger.kernel.org
> Subject: Re: [PATCH 5/6] arm64: dts: fsd: Add I2S DAI node for Tesla FSD
> 
> On 14/10/2022 06:21, Padmanabhan Rajanbabu wrote:
> > Add device tree node for I2S0 and I2S1 CPU DAI instances for Tesla FSD
> > board
> >
> > Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
> > ---
> >  arch/arm64/boot/dts/tesla/fsd-evb.dts      |  8 +++++
> >  arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi | 14 ++++++++
> >  arch/arm64/boot/dts/tesla/fsd.dtsi         | 38 ++++++++++++++++++++++
> >  3 files changed, 60 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> > b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> > index 1db6ddf03f01..c0a4509499ab 100644
> > --- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> > +++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> > @@ -41,3 +41,11 @@
> >  &ufs {
> >  	status = "okay";
> >  };
> > +
> > +&tdm_0 {
> 
> Alphabetical order against other label-overrides.
Okay
> 
> > +	status = "okay";
> > +};
> > +
> > +&tdm_1 {
> > +	status = "okay";
> > +};
> > diff --git a/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> > b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> > index e3852c946352..ff6f5d4b16dd 100644
> > --- a/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> > +++ b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> > @@ -339,6 +339,20 @@
> >  		samsung,pin-pud = <FSD_PIN_PULL_UP>;
> >  		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
> >  	};
> > +
> > +	i2s0_bus: i2s0-bus {
> 
> Does not look like you tested the DTS against bindings. Please run `make
> dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
> for instructions).
I'll double check and run dtbs_check to see if I'm hitting any errors.
> 
> > +		samsung,pins = "gpd1-0", "gpd1-1", "gpd1-2", "gpd1-3",
> "gpd1-4";
> > +		samsung,pin-function = <FSD_PIN_FUNC_2>;
> > +		samsung,pin-pud = <FSD_PIN_PULL_DOWN>;
> > +		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
> > +	};
> > +
> > +	i2s1_bus: i2s1-bus {
> > +		samsung,pins = "gpd2-0", "gpd2-1", "gpd2-2", "gpd2-3",
> "gpd2-4";
> > +		samsung,pin-function = <FSD_PIN_FUNC_2>;
> > +		samsung,pin-pud = <FSD_PIN_PULL_DOWN>;
> > +		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
> > +	};
> >  };
> >
> >  &pinctrl_pmu {
> > diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi
> > b/arch/arm64/boot/dts/tesla/fsd.dtsi
> > index f35bc5a288c2..5decad45a1b6 100644
> > --- a/arch/arm64/boot/dts/tesla/fsd.dtsi
> > +++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
> > @@ -32,6 +32,8 @@
> >  		spi0 = &spi_0;
> >  		spi1 = &spi_1;
> >  		spi2 = &spi_2;
> > +		tdm0 = &tdm_0;
> > +		tdm1 = &tdm_1;
> 
> Why?
Sorry, these aliases are not used right now. I'll remove it.

> 
> >  	};
> >
> >  	cpus {
> > @@ -809,6 +811,42 @@
> >  			status = "disabled";
> >  		};
> >
> > +		tdm_0: tdm@140e0000 {
> 
> Node names should be generic, so this looks like i2s.
> https://protect2.fireeye.com/v1/url?k=2cfaa5af-4d874de8-2cfb2ee0-
> 74fe485fff30-cb16acc0c0c574e9&q=1&e=fc8e3b54-a0ef-475e-a4f2-
> 83626a86ac8a&u=https%3A%2F%2Fdevicetree-
> specification.readthedocs.io%2Fen%2Flatest%2Fchapter2-devicetree-
> basics.html%23generic-names-recommendation

Thank you for the link. I could only find audio-controller in the list and
not i2s. so I believe I can use audio-controller node name. Please correct
me otherwise.
> 
> > +			compatible = "samsung,exynos7-i2s";
> > +			reg = <0x0 0x140E0000 0x0 0x100>;
> > +			interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
> > +			dmas = <&pdma1 14>, <&pdma1 13>, <&pdma1 12>;
> > +			dma-names = "tx", "rx", "tx-sec";
> > +			#clock-cells = <1>;
> > +			#sound-dai-cells = <1>;
> > +			clocks = <&clock_peric PERIC_HCLK_TDM0>,
> > +				 <&clock_peric PERIC_HCLK_TDM0>,
> > +				 <&clock_peric PERIC_PCLK_TDM0>;
> > +			clock-names = "i2s_opclk0", "i2s_opclk1", "iis";
> 
> Does not look like you tested the DTS against bindings. Please run `make
> dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
> for instructions).
I'll double check and run dtbs_check to see if I'm hitting any errors.
> 
> Best regards,
> Krzysztof
Thank you for reviewing the patch


