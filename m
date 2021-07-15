Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 719D13CA112
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 17:01:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F06E01679;
	Thu, 15 Jul 2021 17:00:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F06E01679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626361276;
	bh=WMxp2mwdoS59oGTgmTOoatfl2kEPCVJQHmcJAPofolE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WnOH4e9oyXYnyCeLIExYj4UKL0lVtnxOxnlozTAqySpHGbZ57BVnUOtHgHrIoMPV5
	 LSi+K5FzQ1Y+vBeiZT++McOzcvm1HvP+dnnbcCa7g7p8A5SrmqdnsyQG11DrbO083Z
	 Y6kdtCREUmvIejGs+Q7FxvHghDADLYQUbEg4RLhQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60F40F80229;
	Thu, 15 Jul 2021 16:59:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2C3EF80217; Thu, 15 Jul 2021 16:59:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50008F800D3
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 16:59:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50008F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZBmp0De0"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0250E60FE7
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 14:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626361175;
 bh=WMxp2mwdoS59oGTgmTOoatfl2kEPCVJQHmcJAPofolE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZBmp0De0rFI6Db5Ijr5HTiY9MlYZE8GbKeXRy88vvId1Pka3/KFbWGhadfkefsaxw
 TUuP0TpgkJr8bAZxOetm379o/n+g3Sh+ku01hioD6KxzgbFKX0Kz8tp6SHmJy3E2M1
 MPRM+eZ1eULpOUZq6U+JVgAm0I0vEt0jkp4e4xaz9UMaxsYyz0MdpGVAyq2JjE4KKy
 de5F19VOZsA+iNxYIJGqWSUZMjIlEaqMFp37/sZ3NX1pnvkw3aljXz865NXG7JLHr2
 I5G2WDPhsZwl89eKztyo3cjFLdl1MN1hC0f52w6+LdyFXlr9mnVcAzlg5eEL6hv1Am
 mmpnIop7GB5Xg==
Received: by mail-ed1-f44.google.com with SMTP id h8so8581388eds.4
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 07:59:34 -0700 (PDT)
X-Gm-Message-State: AOAM532y7prLGe6rXd3qod96muVc498nPnfUQzRKpnrls65tHhfu3ysW
 tu9NNe+Jb7iUJjoTYLPMODS943CALrujGsKxIg==
X-Google-Smtp-Source: ABdhPJxVlRe46NOy1Ube4hjuFH34iW+65Ma8iQickH4l8U2hHk9BLGF4gQPCHr6bzZ9JPx4mTaQ83Em5YixfhRrxDE8=
X-Received: by 2002:aa7:cb19:: with SMTP id s25mr7688335edt.194.1626361173534; 
 Thu, 15 Jul 2021 07:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210715141802.880911-1-daniel.baluta@oss.nxp.com>
 <20210715141802.880911-4-daniel.baluta@oss.nxp.com>
In-Reply-To: <20210715141802.880911-4-daniel.baluta@oss.nxp.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 15 Jul 2021 08:59:21 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+r0Tw46=iW8etyR9H=V7M+sE=dguqsEMm3R4B=Xg=qSA@mail.gmail.com>
Message-ID: <CAL_Jsq+r0Tw46=iW8etyR9H=V7M+sE=dguqsEMm3R4B=Xg=qSA@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: dsp: fsl: Document newly introduced fsl,
 properties
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 kai.vehmanen@linux.intel.com, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
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

On Thu, Jul 15, 2021 at 8:18 AM Daniel Baluta <daniel.baluta@oss.nxp.com> wrote:
>
> From: Daniel Baluta <daniel.baluta@nxp.com>
>
> Document firmware-name, tplg-name and machine-drv-name properties.

That's obvious from the diff.

Why do you need these?

>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  .../devicetree/bindings/dsp/fsl,dsp.yaml      | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> index 7afc9f2be13a..8095aa178e7c 100644
> --- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> +++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> @@ -60,6 +60,22 @@ properties:
>        used by DSP (see bindings/reserved-memory/reserved-memory.txt)
>      maxItems: 1
>
> +  firmware-name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      If present, name of the file within the firmware search path containing
> +      the DSP firmware loaded by SOF at DSP boot time.
> +
> +  tplg-name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      Should contain the audio topology file name loaded by SOF driver.

Is this some format the DSP requires? Why do we need a separate file?
This is defined by the board or user config?

> +
> +  machine-drv-name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      Contains the ASoC machine driver name used by SOF to handle DSP audio scenario.

Umm, no.

> +
>  required:
>    - compatible
>    - reg
> @@ -69,6 +85,8 @@ required:
>    - mboxes
>    - mbox-names
>    - memory-region
> +  - tplg-name
> +  - machine-drv-name
>
>  additionalProperties: false
>
> @@ -90,4 +108,6 @@ examples:
>          mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
>          mboxes = <&lsio_mu13 2 0>, <&lsio_mu13 2 1>, <&lsio_mu13 3 0>, <&lsio_mu13 3 1>;
>          memory-region = <&dsp_reserved>;
> +        tplg-name = "sof-imx8-wm8960.tplg";
> +        machine-drv-name = "asoc-simple-card";
>      };
> --
> 2.27.0
>
