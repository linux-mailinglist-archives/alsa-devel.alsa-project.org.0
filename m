Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE2F15AEA4
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 18:26:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E7F81678;
	Wed, 12 Feb 2020 18:25:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E7F81678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581528400;
	bh=ZKGSlu0HYuWsK4UI+Rw9L5wG9bqV++azsvZiJEOgFT8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DDzkxpKFmd0N/EYPzhMQt8t0JAmuSBMO0pOz6JXJUt/eCXQf623pLdOoiYadYf0qi
	 g/fryBo5Y+nfiMVc1DMLbMZuFRaiZMJ3as4Ww3sJJYAYgBt7LG458hx2uWiyeiC1q4
	 RPV6mNTEIGSZZlfgbO0OY1+Dg4Z7vjSnwxOJXEgk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74F15F800F0;
	Wed, 12 Feb 2020 18:24:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A82FF80157; Wed, 12 Feb 2020 18:24:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92818F800F0
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 18:24:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92818F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mLVtOPey"
Received: by mail-ua1-x942.google.com with SMTP id 59so1149965uap.12
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 09:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jCGxfylxy3MldAt/reEr7p2HcESXZ2SEVCL7ze7sb8M=;
 b=mLVtOPeyTrlGTAOEBO32ZUHoFId8CdOxxgdZYat1MHSCbZKEoRcEDicBnpT71GntOI
 jE9GscwR8WoZBDG3NW2w5NV4KY4Y8KfFRmaVsjrpAkVgBIy1+dNvlJV4eDDZDPfUqKVK
 oorEhZlJcQWCPlGU6yTKKyzkjd8lVDC09X8BRQFifOVlbdeW8BUCX8oUY+gdFrqV43ve
 A7HVKdPyoFHMCkXVqFcQSKxCEkspuET12AzZarmTfBeGT1hUgL0I2kOfIADygzgcXX0I
 HilyTVF18ofv8eL17GJwyyCw6bLnd7ieFA+NvVspb+P0wA90z7swiFmFjYi2DXaQkKOH
 2Y2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jCGxfylxy3MldAt/reEr7p2HcESXZ2SEVCL7ze7sb8M=;
 b=S4wfED5PGDUAiZDD9/ahBFut6qTBFztqkjHTa7GHELEAv0fJIuobHFrCMi88vCEu3k
 EnNHpryCNeQLB5SFqvu0Ft+PEYeYJCoxgwsw/ILKEXdEkgXw0/PdYNKucnACo42X5J0t
 BGB5rcG2R9QNmd/+mLfPgQTXoiELPRccolppmvseyzE7j6+Il4Ity5LoIPiHp3JmXl3q
 ND1e7bhhkF0bCvy2//yqiNi2ULBOKOev0qjtr8mTmd7N+0H0MpVhOILX1Ckd+99cnQls
 wyOWHouCPkXP8TvhVHWVTIE+NGMfY64ILjlpXsh7ThFXI0alJVIWZKa855ZYL3ohobDQ
 N1tQ==
X-Gm-Message-State: APjAAAWlG1QoofXx8Lso8F+KtUaW1CcOIPgVon1mWXsfXnfKQ+HyVjrg
 /8z3mTMETLJwiA1kLhpnQopX3kH0OJnzwIcEuqQ=
X-Google-Smtp-Source: APXvYqyAepvFaN7GJfHPGtS87hCZr+gc51607hAiqYlgiF4eorNgglWZn4G42TMyi4n7UoLDOJ1DHv82wxTfkbU3tGs=
X-Received: by 2002:ab0:66d6:: with SMTP id d22mr5082237uaq.92.1581528292397; 
 Wed, 12 Feb 2020 09:24:52 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581475981.git.shengjiu.wang@nxp.com>
 <1ae9af586a2003e23885ccc7ef58ee2b1dce29f7.1581475981.git.shengjiu.wang@nxp.com>
In-Reply-To: <1ae9af586a2003e23885ccc7ef58ee2b1dce29f7.1581475981.git.shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 12 Feb 2020 14:24:40 -0300
Message-ID: <CAOMZO5Do=dzh4WXvm44mB7-PeesWuA6qRtMXwHCH9piXd1dZEw@mail.gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [alsa-devel] [PATCH 2/3] ASoC: dt-bindings: fsl_easrc: Add
	document for EASRC
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

On Wed, Feb 12, 2020 at 1:35 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> EASRC (Enhanced Asynchronous Sample Rate Converter) is a new
> IP module found on i.MX815.

i.MX815 in an internal terminology. Please avoid it on the commit log.

>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,easrc.txt   | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,easrc.txt
>
> diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.txt b/Documentation/devicetree/bindings/sound/fsl,easrc.txt
> new file mode 100644
> index 000000000000..0e8153165e3b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,easrc.txt
> @@ -0,0 +1,57 @@
> +NXP Asynchronous Sample Rate Converter (ASRC) Controller
> +
> +The Asynchronous Sample Rate Converter (ASRC) converts the sampling rate of a
> +signal associated with an input clock into a signal associated with a different
> +output clock. The driver currently works as a Front End of DPCM with other Back
> +Ends Audio controller such as ESAI, SSI and SAI. It has four context to support
> +four substreams within totally 32 channels.
> +
> +Required properties:
> +- compatible:                Contains "fsl,imx8mn-easrc".
> +
> +- reg:                       Offset and length of the register set for the
> +                            device.
> +
> +- interrupts:                Contains the asrc interrupt.
> +
> +- dmas:                      Generic dma devicetree binding as described in
> +                            Documentation/devicetree/bindings/dma/dma.txt.
> +
> +- dma-names:                 Contains "ctx0_rx", "ctx0_tx",
> +                                     "ctx1_rx", "ctx1_tx",
> +                                     "ctx2_rx", "ctx2_tx",
> +                                     "ctx3_rx", "ctx3_tx".
> +
> +- clocks:                    Contains an entry for each entry in clock-names.
> +
> +- clock-names:               "mem" - Peripheral clock to driver module.
> +
> +- fsl,easrc-ram-script-name: The coefficient table for the filters
> +
> +- fsl,asrc-rate:             Defines a mutual sample rate used by DPCM Back
> +                            Ends.
> +
> +- fsl,asrc-width:            Defines a mutual sample width used by DPCM Back
> +                            Ends.
> +
> +Example:
> +
> +easrc: easrc@300C0000 {
> +       compatible = "fsl,imx8mn-easrc";
> +       reg = <0x0 0x300C0000 0x0 0x10000>;
> +       interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
> +       clocks = <&clk IMX8MN_CLK_ASRC_ROOT>;
> +       clock-names = "mem";
> +       dmas = <&sdma2 16 23 0> , <&sdma2 17 23 0>,
> +              <&sdma2 18 23 0> , <&sdma2 19 23 0>,
> +              <&sdma2 20 23 0> , <&sdma2 21 23 0>,
> +              <&sdma2 22 23 0> , <&sdma2 23 23 0>;
> +       dma-names = "ctx0_rx", "ctx0_tx",
> +                   "ctx1_rx", "ctx1_tx",
> +                   "ctx2_rx", "ctx2_tx",
> +                   "ctx3_rx", "ctx3_tx";
> +       fsl,easrc-ram-script-name = "imx/easrc/easrc-imx8mn.bin";
> +       fsl,asrc-rate  = <8000>;
> +       fsl,asrc-width = <16>;
> +       status = "disabled";
> +};
> --
> 2.21.0
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
