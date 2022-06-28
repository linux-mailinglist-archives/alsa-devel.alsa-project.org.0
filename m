Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B47FF55BDCD
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 05:22:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09763868;
	Tue, 28 Jun 2022 05:21:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09763868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656386542;
	bh=uYRZHBgHnTR8gnInDb3PqJiCpQOWDnBRfmNDWzodl+U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X/LXU438JD+WGu1hwU3I5W8wc/uoKuO/Msz7Z5b5MhdxCKcH7SbXnGAWiJhpjiUQs
	 a9CaNMXEE2HP5Ih9hmuH8ky/zwkGP7CRGQjQx0Yxzdg0s6Q4pVmaNn0vIXYj32W+Jx
	 jArus/pwJQ3/VnfA17Sowd/cr3XXkQZr7zmmR0ls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CCD8F80115;
	Tue, 28 Jun 2022 05:21:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5FB0F80167; Tue, 28 Jun 2022 05:21:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F387BF80115
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 05:21:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F387BF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SBmsV2jc"
Received: by mail-lf1-x130.google.com with SMTP id y32so19949680lfa.6
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 20:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x5E3nG2hieqflsrUuk87zpTHZ7TlPuvuzrUGDH/2wr0=;
 b=SBmsV2jcS1P4vG2MijUAl9P/iOSJFSwvNxWcnaYO64G3kk7di7VxxDqgFR7TCKNGNw
 Hwasb0ErZuft/ALiD8CHihaT9vZowINi/3PmkrOc0gg44UOcSUMAHeHLxYG9iyEUbEe7
 BtnNs86P8+mNTlP9O093xfWRQAiSEq2I5cyBDqif0dYBXZ/g65ky+ls5Ki+pSWbkMuKL
 LX991LXnf8vJVY8mKH8A4BkRJLiy18vJq7O9ldbfOfT2NKEuEI9eCykPNY2vsLSPBPCx
 PIVErYxOHNIfFDpPovFLfRO8JUEZpkBKoCRf0ZQTk4ynjIC/Etq9C1kEDx56mUfrP+tq
 USqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x5E3nG2hieqflsrUuk87zpTHZ7TlPuvuzrUGDH/2wr0=;
 b=Phn5FZpT/67xq/vdt1gTiIgnKsBpJYmsqIiLuES6K1H3sQytwx1i7ptJWpBrGY8tyD
 CfyXI/jvMaNqkO20EBOIZxzFI/ivnHElwCq4ACUXDdW5LZas2qAC0V+TDnlQeHavjsor
 D+oek+gv8cjLv3XevkEJI+iRNTKQXzF70LQmaMJtzPYDqbJUaz57BC8jf1O47yCU2pi6
 T1nmbng4Nw50EkAb2xmI5bKcdOGCdCIehkI5mzhP3s8YJDKZ8tLZIJrEGgx0UsDd2Kmt
 5dNZgKJDmP9JYrJEW/ySH+F86F6SxovgPdgNtDWGZFbUPhG59myyKJfMdgzScp/7+a0F
 Lu8A==
X-Gm-Message-State: AJIora85swnwugAkGDbVPi2AkxwygJ6r5lWN5sUxyUNKcKCx6FsSZuKj
 pcbmPCg8L38Zf0H9L6TDeBYpf2X79tc5SavtRbU=
X-Google-Smtp-Source: AGRyM1uYeW4YzWoQaIwLjXMJBp7K3V4eAAwWgpwd0lrHrvYIcb0F4rerh74yAV4XYOcsYWc1atLWXUTtmJYN23q6+fY=
X-Received: by 2002:a05:6512:1151:b0:481:1675:f343 with SMTP id
 m17-20020a056512115100b004811675f343mr6336033lfg.280.1656386467278; Mon, 27
 Jun 2022 20:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <1656294613-27867-1-git-send-email-shengjiu.wang@nxp.com>
 <1656336669.670812.2285173.nullmailer@robh.at.kernel.org>
In-Reply-To: <1656336669.670812.2285173.nullmailer@robh.at.kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 28 Jun 2022 11:20:56 +0800
Message-ID: <CAA+D8APqpGZhizTwHD8F_qhM=VmugiS+Q-yRvTH8e+K0_Q2dcg@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: fsl,
 micfil: Convert format to json-schema
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 krzysztof.kozlowski+dt@linaro.org
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

On Mon, Jun 27, 2022 at 9:31 PM Rob Herring <robh@kernel.org> wrote:

> On Mon, 27 Jun 2022 09:50:13 +0800, Shengjiu Wang wrote:
> > Convert the NXP MICFIL binding to DT schema format using json-schema.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> > changes in v2
> > - add decription of interrupts.
> >
> >  .../devicetree/bindings/sound/fsl,micfil.txt  | 33 --------
> >  .../devicetree/bindings/sound/fsl,micfil.yaml | 77 +++++++++++++++++++
> >  2 files changed, 77 insertions(+), 33 deletions(-)
> >  delete mode 100644
> Documentation/devicetree/bindings/sound/fsl,micfil.txt
> >  create mode 100644
> Documentation/devicetree/bindings/sound/fsl,micfil.yaml
> >
>
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
>
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
>
> Full log is available here: https://patchwork.ozlabs.org/patch/
>
>
> audio-controller@30080000: clock-names: ['ipg_clk', 'ipg_clk_app',
> 'pll8k', 'pll11k', 'clkext3'] is too long
>         arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-emcon-avari.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-evk.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-kontron-n801x-s.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dev.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dahlia.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dev.dtb
>         arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb
>         arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb
>         arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb
>         arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb
>         arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb
>         arch/arm64/boot/dts/freescale/imx8mn-evk.dtb
>         arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb
>         arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb
>         arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb
>
> audio-controller@30080000: clocks: [[2, 183], [2, 182], [2, 38], [2, 39],
> [2, 6]] is too long
>         arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb
>         arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb
>         arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb
>         arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb
>         arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb
>         arch/arm64/boot/dts/freescale/imx8mn-evk.dtb
>         arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb
>         arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb
>         arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb
>
> audio-controller@30080000: clocks: [[2, 216], [2, 203], [2, 38], [2, 39],
> [2, 6]] is too long
>         arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-emcon-avari.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-evk.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-kontron-n801x-s.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dev.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dahlia.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dev.dtb
>
> I will fix this issue in v3.

best regards
wang shengjiu
