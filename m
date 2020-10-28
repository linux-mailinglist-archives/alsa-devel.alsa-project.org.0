Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7578729CDF2
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 06:22:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 091C51679;
	Wed, 28 Oct 2020 06:21:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 091C51679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603862531;
	bh=pGLP0jmOG3tQr29aV/YTRZGKynf6EtzkQjjxn4zNKvg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bYZBirRoWGVeb8KXYq0OW/xPmEybg+98r7O1V8T8j9He/+UdUwsf3/pClVEASbG9/
	 yxMrUigQm3eJC3XM3gSfasouYdSVUOov4QejvTr6/5y5oy8aoMpz3LQrUkeYx/M1BE
	 HMyRZrsrgqAyGdS0wDCj7qWmIkJYu7RJD45bFNG4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FF14F80249;
	Wed, 28 Oct 2020 06:20:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0614F80212; Wed, 28 Oct 2020 06:20:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9BB0F800E1
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 06:20:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9BB0F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="h+5kSOxB"
Received: by mail-qk1-x744.google.com with SMTP id s14so3527147qkg.11
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 22:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JSBDVbjHhG9zeA/DTxswLuBUaX5GcRcOqrQA1xpDRcw=;
 b=h+5kSOxB4GU1lVQmKzLTMGS3FgSifN/Mfq/0gj+H7igLwNR2BWGbiOu6RuWpSpISiF
 wNS7JvCbzMi/MNMyND3Vkxv70NZ5+Q/+niWJ336qL6gskOKDde7y4plolWM68vlIQEJV
 NaQFkVgokW7Zmkz06EqnKwFGWBxo5286pYvcXV8dJfFWlGUP8O9ve+3Gq/T5UiyawvJy
 9I62Pfmsi6d4QVEMOhwtoC0vcAfLa9BohovkPY0FsvOI4gxe75tPG1rjqL1c+VhqdFyG
 UIcIz/48UkcifbD2ePb2dOcDxzWQaw44JU3KYDaGX2prOubHEKBQU5n5RB+WHuaAVVUE
 5Qqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JSBDVbjHhG9zeA/DTxswLuBUaX5GcRcOqrQA1xpDRcw=;
 b=bJwN3/qtY8qDNdVneZEHoWwvEhZ/Vxvy4i1KGW41tYrbLwhC8SIrUqlIZ9oRLN9XyZ
 94k2A61nmyN9qd29TQlcnumn3zLdgY+0ADuW2rlqM4JsVx/E2Z+8vgBwawTL8DxRlaw9
 lZWXnkITBf9pCvB1D/LmKy9/9WE1HBPIcBvzG8s1uiCJirjJispO+obMQdd1KZmjg3kG
 80Tl6prRoFKMPGNQ/QMzFZJLZhS9/aldsXbLhxZ4DcolVIDS6DVQBOipFBBV2VrZcrmP
 dv0T+NcQvad9tKb8//0EbMB0Sqe8jZx9fHCK/+9InOGeG/kjamilTH7kQqzraYAtk0o2
 86Tw==
X-Gm-Message-State: AOAM530g3HDOYjPEqaIrBbREoovv4YLyit1pjHdq6VwAye/zXGlLIkja
 FaIC28uDK8trASD17JfPCRGw7YoQ7tX1/71CxC8=
X-Google-Smtp-Source: ABdhPJzO2p30F4Yjj/o8ZcbkZ7ROKT5TBXHUaz1VkKheGp0FBnljBOOn55tfm5sGYlheoJilNa86PQue9aYJYtAfjGo=
X-Received: by 2002:a05:620a:657:: with SMTP id
 a23mr5712705qka.121.1603862425444; 
 Tue, 27 Oct 2020 22:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <1603708855-2663-1-git-send-email-shengjiu.wang@nxp.com>
 <20201027110840.GA23076@kozik-lap>
In-Reply-To: <20201027110840.GA23076@kozik-lap>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 28 Oct 2020 13:20:14 +0800
Message-ID: <CAA+D8AOvhYDK=NHxQGxb-GLPaRsPn0uZsBZqswxACfMz+eQQHg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl_aud2htx: Add binding doc for
 aud2htx module
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Tue, Oct 27, 2020 at 7:09 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Oct 26, 2020 at 06:40:54PM +0800, Shengjiu Wang wrote:
> > AUD2HTX (Audio Subsystem TO HDMI TX Subsystem) is a new
> > IP module found on i.MX8MP.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../bindings/sound/fsl,aud2htx.yaml           | 67 +++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/fsl,aud2htx.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,aud2htx.yaml b/Documentation/devicetree/bindings/sound/fsl,aud2htx.yaml
> > new file mode 100644
> > index 000000000000..18548d0889a8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/fsl,aud2htx.yaml
> > @@ -0,0 +1,67 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/fsl,aud2htx.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP Audio Subsystem to HDMI RTX Subsystem Controller
> > +
> > +maintainers:
> > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^aud2htx@.*"
>
> aud2htx is not a generic class of a device so it should not be enforced.
>
> > +
> > +  compatible:
> > +    const: fsl,imx8mp-aud2htx
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Peripheral clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: bus
> > +
> > +  dmas:
> > +    items:
> > +      - description: DMA controller phandle and request line for TX
> > +
> > +  dma-names:
> > +    items:
> > +      - const: tx
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - dmas
> > +  - dma-names
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/imx8mp-clock.h>
> > +
> > +    aud2htx: aud2htx@30cb0000 {
> > +             compatible = "fsl,imx8mp-aud2htx";
>
> Wrong indentation. Most of examples are indented with 4 spaces.
>
ok, I will update it.

best regards
wang shengjiu
