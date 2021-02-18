Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB17431E6DE
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Feb 2021 08:25:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59018165E;
	Thu, 18 Feb 2021 08:24:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59018165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613633125;
	bh=twuKV+nv2WtkWAfp2lQkOhMkhtOBXYoOH0ED/VMSKJg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a12zjjwjHTzPxmUEZBRoIDeVTrVX0NZUoaVTvfFpC54FpFTGM5I+dbenNfBXZZ1g8
	 hobiyqGsE+2W4Q852ZWQ+d8rK3RkLYFXv2btiaHnqDX6Gzk1F9Rns1tYg6IqwFFQzI
	 0HV1Rplr6FMb8xAJ9J4hwtlRu4WEmJEeZZcZEhMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E26AEF8016E;
	Thu, 18 Feb 2021 08:23:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B45F3F800D0; Thu, 18 Feb 2021 08:23:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5ECABF800D0
 for <alsa-devel@alsa-project.org>; Thu, 18 Feb 2021 08:23:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ECABF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Qr+3L4Ej"
Received: by mail-qk1-x72c.google.com with SMTP id x14so1278157qkm.2
 for <alsa-devel@alsa-project.org>; Wed, 17 Feb 2021 23:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DMQ5f7QLDVBk/p2SiqG1fJ9qgjmg4Wvt4LKaLla7OLk=;
 b=Qr+3L4Ej72qJJCUzgwXnoe8zPmqTe6qAIrA9wxq09tbDV+0BJsv0uj1Xmt4kN0GWfp
 UI8iKGh6hST1VZsf2N+jbD5SGBeUIHhc5BCxqighrUK/Ih+wVBhuVZaOd5INd2oqfGL4
 jJbY8ItUecjLQSUNyn748dNMO4OftT3Uekj7jsQbJ3uvYZmRYdFN+C3dDPjotfTimi3u
 dYMJgv2G51C8ObnUsBMT550ob0cAYwzlY5ll659v03CFgjroC3k6iIZ0agwfo2X8htYB
 u4NzgebNkTccMwmDz1tswEL93PqROQQpFRn+XtDWpo+2LWJCwUSnHG7T5rd89nL5ST3h
 W3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DMQ5f7QLDVBk/p2SiqG1fJ9qgjmg4Wvt4LKaLla7OLk=;
 b=MTTalO/etbAoaHUR5RRADmF48/kmF8+QtGcNXPm0p0S2jAdY/3yb2rIUZfcfxcrY9+
 fCKe3Q94y7jreGNwKgQjjcMojCKkltrwSuM4yuKNv1jmUpouivYlytyaq00tSyxcdprS
 qbpY2Rb2lSHB+PK2ak7YiPwrU7WA/AIlI8AloEaRLe8APElyJSEQHqIHcCVljiu5WYhv
 oWxDeH8OPCilpLRfK4dzFiDKfjBf1Avlk0AEMB7UzqQrZz0nY+9YsFzxRmf6N+5kLb23
 3Ixss6CdJabj2VJkGcwydkmFulg0WA6s5P3B9d8fjcARJWIM31eKV9e3rhmHtocN0mCx
 UnJg==
X-Gm-Message-State: AOAM531mdMPVzCrc0HLyO/IgGjqHDj7lN1/bT5Gsw/XkRegHhpgvGX8i
 q3XUpUtWuRmwcgJIh9rPXs8F1NqEQaObMbLkSLo=
X-Google-Smtp-Source: ABdhPJylVF96WbxLINqVRFOjTFAGRMnVEk2QlGKbvhtHZHX/gaUOI3ZLpVhymTMSwzoULhFZK6nK3ZSKpvRjTLfioMc=
X-Received: by 2002:a37:a896:: with SMTP id r144mr3006847qke.121.1613633020261; 
 Wed, 17 Feb 2021 23:23:40 -0800 (PST)
MIME-Version: 1.0
References: <1612693435-31418-1-git-send-email-shengjiu.wang@nxp.com>
 <1612693435-31418-8-git-send-email-shengjiu.wang@nxp.com>
 <20210210221704.GA2894134@robh.at.kernel.org>
In-Reply-To: <20210210221704.GA2894134@robh.at.kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 18 Feb 2021 15:23:29 +0800
Message-ID: <CAA+D8ANOv91jr4381Acz1B2mZ6=Mx2J_2CMTGXmPKztv7bMjPA@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] ASoC: dt-bindings: imx-rpmsg: Add binding doc for
 rpmsg machine driver
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
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

On Thu, Feb 11, 2021 at 6:18 AM Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Feb 07, 2021 at 06:23:55PM +0800, Shengjiu Wang wrote:
> > Imx-rpmsg is a new added machine driver for supporting audio on Cortex-M
> > core. The Cortex-M core will control the audio interface, DMA and audio
> > codec, setup the pipeline, the audio driver on Cortex-A core side is just
> > to communitcate with M core, it is a virtual sound card and don't touch
> > the hardware.
>
> I don't understand why there are 2 nodes for this other than you happen
> to want to split this into 2 Linux drivers. It's 1 h/w thing.

This one is for the sound card machine driver.  Another one is
for the sound card cpu dai driver. so there are 2 nodes.

>
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../bindings/sound/imx-audio-rpmsg.yaml       | 48 +++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/imx-audio-rpmsg.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/imx-audio-rpmsg.yaml b/Documentation/devicetree/bindings/sound/imx-audio-rpmsg.yaml
> > new file mode 100644
> > index 000000000000..b941aeb80678
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/imx-audio-rpmsg.yaml
> > @@ -0,0 +1,48 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/imx-audio-rpmsg.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP i.MX audio complex with rpmsg
> > +
> > +maintainers:
> > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx-audio-rpmsg
> > +
> > +  model:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: User specified audio sound card name
> > +
> > +  audio-cpu:
> > +    description: The phandle of an CPU DAI controller
> > +
> > +  rpmsg-out:
> > +    description: |
> > +      This is a boolean property. If present, the transmitting function
> > +      will be enabled,
> > +
> > +  rpmsg-in:
> > +    description: |
> > +      This is a boolean property. If present, the receiving function
> > +      will be enabled.
> > +
> > +required:
> > +  - compatible
> > +  - model
> > +  - audio-cpu
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    sound-rpmsg {
> > +        compatible = "fsl,imx-audio-rpmsg";
> > +        model = "ak4497-audio";
> > +        audio-cpu = <&rpmsg_audio>;
> > +        rpmsg-out;
> > +    };
> > --
> > 2.27.0
> >
