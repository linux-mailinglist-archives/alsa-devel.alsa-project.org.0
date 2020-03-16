Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E24D186BB5
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Mar 2020 14:03:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C4F418C1;
	Mon, 16 Mar 2020 14:02:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C4F418C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584363822;
	bh=Yzwnzi3uaF8gj9/yCJvW9VM0AzQgFbUVHwgWexSTwuc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kl1hL5QAmaJoGcNiOKpgIW5of4MCDSnhsuhbajyJQKXnNf9yF1gGyciC/cumr/8y/
	 MnqI7B2rr0MAjoWyI+Kp9PQnObVuU+Ev0i6S4z9odbmWGdWAV4yDHBxDJMB8UH3u9C
	 3aNC4cAxd25ieB2xntNqaJEAXcJxXm0WNOVoAaoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D7F6F800CD;
	Mon, 16 Mar 2020 14:02:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 621ABF8015B; Mon, 16 Mar 2020 14:01:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 470DCF800D2;
 Mon, 16 Mar 2020 14:01:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 470DCF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IgbPfftO"
Received: by mail-wr1-x443.google.com with SMTP id 6so21101804wre.4;
 Mon, 16 Mar 2020 06:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8lPqGQkzYXIZixlU4/SVfz2TE5wMXf/RCUgZUuhdULg=;
 b=IgbPfftONkRv6WPIreACR2bk+m/5ncOUmuYz1FvSoWv3IFdKPqesEQtF3AmjfufF3v
 KDUos8UEtbyvmGiS+cg/wZW122KWo6t3aEyEbZbOg80r5i9QxXQgIeFuGjEeuy4gpGms
 dWOw6VercaCWMVyoQNGqkBHFe/UcmN0Jdues4qJGMUXR1FtbnT04eOQ32HKU0a3zsHyg
 KsxUfEDHHsSQANoDRP55V6A508zSugh+ch0LAFVdXPjSeB4kH86f0BC+JCQEHPdlIhM1
 wl/k5D6tS4AslEHtrweKPBrYsJjykMZR6KyJnkiFqsGBMIMtDyoNHuNiC0jkSKshEXmi
 nJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8lPqGQkzYXIZixlU4/SVfz2TE5wMXf/RCUgZUuhdULg=;
 b=NXPUdgudvQyprjKUkjxnPpXE1KvUs6Kizh8hshu7kSLmbqv41ty3mTQ3EpO76pwDdI
 RETLpKPI7IZ6jMZS1Id3xaLDDDZ56Oh9JyllNpVWYxBTVukeNJ8/2bcbe8asX7RbWqJ3
 PvmI8ITy91zBUhgMKK/HpGzgCPMNK51GK6nU3h1c20FaRnXbm4ovzwdd0Cw36gq/NIFs
 VOOxIDr81GD4x7FK6+sgDvrK9oyg87OE4/MfveQk9JtOFCaU8+3tBu54EKDx5rVc3l8/
 qaXlYRWjXgkT4UXLzltVr6Juuud+NmyinyfeQPtez1M9rhIh2PXkkEVX+0Ftw24WS60K
 G6aw==
X-Gm-Message-State: ANhLgQ3qgzuxAO/jUCW6CvGTFV4tW/ZKf9aFXCLgpnVwUklV+z6n+qJC
 ZeiFJ4Ib/1Bof2f8TtjQbkxGmjfAcvZ5P/tMIGE=
X-Google-Smtp-Source: ADFU+vv3todfLH0S9K1XiDE5C05k1QyRLPyjalBazFAliB47u26zAl+u/TDY/X5WKA04HAeVbCo967LdsqPd6PTKHdA=
X-Received: by 2002:adf:de84:: with SMTP id w4mr36663540wrl.350.1584363712015; 
 Mon, 16 Mar 2020 06:01:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200306111353.12906-1-daniel.baluta@oss.nxp.com>
 <20200306111353.12906-2-daniel.baluta@oss.nxp.com>
 <20200312202306.GA18767@bogus>
In-Reply-To: <20200312202306.GA18767@bogus>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 16 Mar 2020 15:01:40 +0200
Message-ID: <CAEnQRZCLa+NAk=3M84MxjgOzYQdJXGY9S84dU6HO8GG64Lm_mQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: Add FSL CPU DAI bindings
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "S.j. Wang" <shengjiu.wang@nxp.com>, Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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

Thanks Rob for review. See my comments inline:

<snip>

> > +# SPDX-License-Identifier: GPL-2.0
>
> Dual license new bindings please:
>
> (GPL-2.0-only OR BSD-2-Clause)

Ok, will do.

>
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/fsl,dai.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Generic CPU FSL DAI driver for resource management
>
> Bindings are for h/w devices, not drivers.

Indeed. I think I will change it to something like this.

title: 'FSL CPU DAI for resource management'

The explanation are already in patch 2/2 of this series but let e
explain again what I'm
trying to do here and let me know if this makes sense to you.

Digital Audio Interface device (DAI) are configured by the firmware
running on the DSP. The only
trouble we have is that we cannot easily handle 'resources' like:
clocks, pinctrl, power domains from
firmware.

This is because our architecture is like this:

M core [running System Controller Firmware]
            |
            |
A core [Linux]<----> DSP core [SOF firmware]

In theory, it is possible for DSP core to communicate with M core, but
this needs a huge
amount of work in order to make it work. We have this on our plans for
the future,
but we are now trying to do resource management from A core because
the infrastructure is already in place.

So, the curent driver introduced in this series acts like a Generic
resource driver for DAI device. We can
have multiple types of DAIs but most of them need the same types of
resources (clocks, pinctrl, pm) sof
for this reason I made it generic.


>
> > +
> > +maintainers:
> > +  - Daniel Baluta <daniel.baluta@nxp.com>
> > +
> > +description: |
> > +  On platforms with a DSP we need to split the resource handling between
> > +  Application Processor (AP) and DSP. On platforms where the DSP doesn't
> > +  have an easy access to resources, the AP will take care of
> > +  configuring them. Resources handled by this generic driver are: clocks,
> > +  power domains, pinctrl.
>
> The DT should define a DSP node with resources that are part of the
> DSP. What setup the AP has to do should be implied by the compatible
> string and possibly what resources are described.

We already have a DSP node: Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
but I thought that the resources attached to DAIs are separated from
the resources
attached to the DSP device.

In the great scheme of ALSA we usually have things like this:

FE         <----->       BE

In the SOF world FE are defined by topology framework. Back ends are
defined by the machine driver:

On the BE side we have:
- codec  -> this is the specific code
- platform -> this is the DSP
- cpu -> this is our Generic DAI device

Now, I'm wondering if we can get rid of cpu here and make platform
node (dsp) take care of every
resource (this looks not natural).

Perhaps Mark, Liam or Pierre can help me with this.


>
> Or maybe the audio portion of the DSP is a child node...
>
> > +
> > +properties:
> > +  '#sound-dai-cells':
> > +    const: 0
> > +
> > +  compatible:
> > +    enum:
> > +      - fsl,esai-dai
> > +      - fsl,sai-dai
>
> Not very specific. There's only 2 versions of the DSP and ways it is
> integrated?

As I said above this is not about the DSP, but about the Digital Audio
Intraface. On i.MX
NXP boards we have two types of DAIs: SAI and ESAI.

<snip>

> > +  pinctrl-0:
> > +    description: Should specify pin control groups used for this controller.
> > +
> > +  pinctrl-names:
> > +    const: default
>
> pinctrl properties are implicitly allowed an don't have to be listed
> here.

Great.

>
> > +
> > +  power-domains:
> > +    $ref: '/schemas/types.yaml#/definitions/phandle-array'
>
> Don't need a type.
>
> > +    description:
> > +      List of phandles and PM domain specifiers, as defined by bindings of the
> > +      PM domain provider.
>
> Don't need to re-define common properties.
>
> You do need to say how many power domains (maxItems: 1?).

We support multiple power domains, so technically there is no upper
limit. What should I put here in this case?
>
> > +
> > +  fsl,dai-index:
> > +    $ref: '/schemas/types.yaml#/definitions/uint32'
> > +    description: Physical DAI index, must match the index from topology file
>
> Sorry, we don't do indexes in DT.
>
> What's a topology file?

Topology files are binary blobs that contain the description of an
audio pipeline. They are built
are written in a specific format and compiled with alsa-tplg tools in userspace.

Then loaded via firmware interface inside the kernel.

https://www.alsa-project.org/wiki/ALSA_topology


thanks,
Daniel.
