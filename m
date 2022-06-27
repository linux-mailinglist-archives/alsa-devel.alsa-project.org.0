Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F73055BA12
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 15:32:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12F181693;
	Mon, 27 Jun 2022 15:31:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12F181693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656336746;
	bh=UDeiGExOL5itjqWmaoQuhP+5PogtCkGim3fL2xebeyc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DxjHMoXMV2idmBYkeNhUEtYYKOVaeMYbMvGtwocq4nfynJUz9poeHJ87nj2cbShB/
	 qpv8OPjd147TydvkktVGjneBTGWqX2fWA3c6VxvUh5qaKcq4WYey26UOa4yqC8F5E6
	 jDbBhT4nV7TuqDIkF39ueQdvdQxNQM8dkvLXIrvU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78FF4F8028D;
	Mon, 27 Jun 2022 15:31:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF3F6F8012F; Mon, 27 Jun 2022 15:31:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53407F80128
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 15:31:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53407F80128
Received: by mail-io1-f47.google.com with SMTP id p69so9519559iod.10
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 06:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=QYhUBm2fDCk91Yu6XF3jkA7KmooMdeJ8YT8X3liUnpQ=;
 b=bj6TcKuum4oekjITjDYbWHMxl93IidGEnlN9akiaVdXuindIR/PpYo69fuOeU7/NST
 oVmfSGbYZmDumTQxtSd/oiqJtEIJlKA6GfgN3DuiwoTWnrqacg0uw2pzPazLiWFNkNzx
 RK75Qjb9tcBD1xXPMIZQwSPpqj/MMED0qfG15SAbCdNCk+c5goXnPNGKxZDNeMU3MaUE
 SXLFf3xn4hUqX1DWrCy07MfXNTamyclEJiNXAMvj6YkejLdaf7Cj2T+mn3qDoSrwgbz2
 S7dtO40XD+YmC4qvSrNo5gkUWNly0/dAUrHEX6XeoXzBhGawDwlpEGiocvdz2904bJUa
 ZdpQ==
X-Gm-Message-State: AJIora/TMuinJxNsBZoDm+nDl1Fb1fD2lzZB0sTGBTroKdPCW6DV2afy
 znAZx4sq6JbvXJB2QXo4sQ==
X-Google-Smtp-Source: AGRyM1t5LTyR7mVbDtnvxUaO7kFkqXlKaKnkl6jX5y381d5nO3LPJEow6rHeBCy77jwPiTpVZyN44Q==
X-Received: by 2002:a6b:d309:0:b0:664:716c:d758 with SMTP id
 s9-20020a6bd309000000b00664716cd758mr6604131iob.157.1656336673455; 
 Mon, 27 Jun 2022 06:31:13 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a5d8041000000b00674f9fb1531sm5159907ior.30.2022.06.27.06.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 06:31:13 -0700 (PDT)
Received: (nullmailer pid 2285174 invoked by uid 1000);
 Mon, 27 Jun 2022 13:31:09 -0000
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1656294613-27867-1-git-send-email-shengjiu.wang@nxp.com>
References: <1656294613-27867-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: fsl,
 micfil: Convert format to json-schema
Date: Mon, 27 Jun 2022 07:31:09 -0600
Message-Id: <1656336669.670812.2285173.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org, shengjiu.wang@gmail.com
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

On Mon, 27 Jun 2022 09:50:13 +0800, Shengjiu Wang wrote:
> Convert the NXP MICFIL binding to DT schema format using json-schema.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> changes in v2
> - add decription of interrupts.
> 
>  .../devicetree/bindings/sound/fsl,micfil.txt  | 33 --------
>  .../devicetree/bindings/sound/fsl,micfil.yaml | 77 +++++++++++++++++++
>  2 files changed, 77 insertions(+), 33 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/fsl,micfil.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,micfil.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


audio-controller@30080000: clock-names: ['ipg_clk', 'ipg_clk_app', 'pll8k', 'pll11k', 'clkext3'] is too long
	arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb
	arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb
	arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb
	arch/arm64/boot/dts/freescale/imx8mm-emcon-avari.dtb
	arch/arm64/boot/dts/freescale/imx8mm-evk.dtb
	arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dtb
	arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dtb
	arch/arm64/boot/dts/freescale/imx8mm-kontron-n801x-s.dtb
	arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb
	arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dtb
	arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dtb
	arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dtb
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dtb
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.dtb
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dtb
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dtb
	arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb
	arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dev.dtb
	arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dahlia.dtb
	arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dev.dtb
	arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb
	arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb
	arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb
	arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb
	arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb
	arch/arm64/boot/dts/freescale/imx8mn-evk.dtb
	arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb
	arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb
	arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb

audio-controller@30080000: clocks: [[2, 183], [2, 182], [2, 38], [2, 39], [2, 6]] is too long
	arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb
	arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb
	arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb
	arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb
	arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb
	arch/arm64/boot/dts/freescale/imx8mn-evk.dtb
	arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb
	arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb
	arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb

audio-controller@30080000: clocks: [[2, 216], [2, 203], [2, 38], [2, 39], [2, 6]] is too long
	arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb
	arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb
	arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb
	arch/arm64/boot/dts/freescale/imx8mm-emcon-avari.dtb
	arch/arm64/boot/dts/freescale/imx8mm-evk.dtb
	arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dtb
	arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dtb
	arch/arm64/boot/dts/freescale/imx8mm-kontron-n801x-s.dtb
	arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb
	arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dtb
	arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dtb
	arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dtb
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dtb
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.dtb
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dtb
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dtb
	arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb
	arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dev.dtb
	arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dahlia.dtb
	arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dev.dtb

