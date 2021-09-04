Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6147400BB8
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Sep 2021 16:52:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20260186E;
	Sat,  4 Sep 2021 16:51:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20260186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630767162;
	bh=sD6bcvGVoUjHnglVG6laDaF/hszMdNZoj3If9mMfpUo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DIpbOqM+M6C/JyL24uC13g+0OvwMsQeDifY+74Oz0XXhl5aY5g0rJbFcyf+zTq5hR
	 WDS55gQkQXW2xpPvD8DX4pIkR2E72TA9DpuZegGVMFnkLlRWfju7SsUM1I+S913QUp
	 5UeP4TxQvZg1X5IF4b5qbv6UJWz2XGqRISFtL52Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D83CF8028D;
	Sat,  4 Sep 2021 16:51:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21D46F80269; Sat,  4 Sep 2021 16:51:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F36E0F80155
 for <alsa-devel@alsa-project.org>; Sat,  4 Sep 2021 16:51:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F36E0F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hqsCaXRi"
Received: by mail-wr1-x42e.google.com with SMTP id q14so2947973wrp.3
 for <alsa-devel@alsa-project.org>; Sat, 04 Sep 2021 07:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QuAjwG4QD/tyhAwpENnTdRM0gpwUf3SSs1urtonm/5o=;
 b=hqsCaXRi5oajodRiLPHYun8CWVH9oX5HsGLIzwG5boH9DFx0dHCAMG8GRdzpQJCJ9N
 LN7EBHaMgOJwJQIj3vcDYpLC3cd5UdsyVPbss1RwMrHtbm4Ee0bqATEn5ieoxpKqBuDW
 aHulBhJ7AngFtiFDlsY5bIu7oKh+cwyUTcA7lzlNluAgL4KdXdToSPyZQNpufoFrjidV
 MzfLFmd5MWZP/cAuuBuQMFbW/4Cut0DWrq0/BSc8gbMFGwEKY2kXbe9aEC3wlgX7wGHA
 hVkkhTcqYCT5GpY0FhjPQvzQiSGSayHiuOzHqrOBfRdELfBkxyOo+ho9YM76cdM6hEOg
 CODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QuAjwG4QD/tyhAwpENnTdRM0gpwUf3SSs1urtonm/5o=;
 b=iN5XXq3EqLuSuR0vhCPUEsWDwCbpFNHYmiVPLHEmxBIkkztvVN87iDsEhcnC2qxd05
 NeaBqW50mZhnyzSJc0VqUogkZiRJ9hJMwL/h08OzaydMyRhiF3TzegRR79zcAyOfLHg+
 XRbad+zqDSStS6j803wGFi4drq+2urBlXrpBv60oCYPlKiuRJcNLFVq947JhCtkAEexN
 SRtXy2ofHugH3yWg20kjlWYR5G97vbtGgK+HpygnkSQzQTssJ24Y/EwKC0OHfJkyp1Ed
 jifo/45opDsHZ3LVX8doiCog5HqQ64DWLwv5jt4FN8KM8D65vXaYdM6Wr3TJorRUJwhj
 PuzA==
X-Gm-Message-State: AOAM532w6biFlRsq2kNXBtOOLAxXvnT75xnTa7Gr3PWkWdq82B2tcob4
 uK7Sc+Gq53nMILU/ENiG3jrjuDLtVrchSHXjlOs=
X-Google-Smtp-Source: ABdhPJyW2q+CbgV9QbnLTyhMWnPi5rIdh11b+hIJQvDopYZ6pkVm5dd8/GgD2piV3vD8tChZ6JIo088AsyNvTtRg83o=
X-Received: by 2002:adf:d193:: with SMTP id v19mr4279370wrc.377.1630767068862; 
 Sat, 04 Sep 2021 07:51:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210903145340.225511-1-daniel.baluta@oss.nxp.com>
 <20210903145340.225511-3-daniel.baluta@oss.nxp.com>
 <YTJTF5VMOyG2iZb0@robh.at.kernel.org>
In-Reply-To: <YTJTF5VMOyG2iZb0@robh.at.kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Sat, 4 Sep 2021 17:50:56 +0300
Message-ID: <CAEnQRZC-GN9iEPk6-A_oKPHcCYj8_WeQC0TT_NpK_QntkmAqiQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: dsp: fsl: Add DSP optional clocks
 documentation
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, s-anna@ti.com,
 Shawn Guo <shawnguo@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Fri, Sep 3, 2021 at 8:11 PM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Sep 03, 2021 at 05:53:40PM +0300, Daniel Baluta wrote:
> > From: Daniel Baluta <daniel.baluta@nxp.com>
> >
> > DSP node on the Linux kernel side must also take care of enabling
> > DAI/DMA related clocks.
> >
> > By design we choose to manage DAI/DMA clocks from the kernel side because of
> > the architecture of some i.MX8 boards.
> >
> > Clocks are handled by a special M4 core which runs a special firmware
> > called SCFW (System Controler firmware).
> >
> > This communicates with A cores running Linux via a special Messaging
> > Unit and implements a custom API which is already implemented by the
> > Linux kernel i.MX clocks implementation.
> >
> > Note that these clocks are optional. We can use the DSP without them.
> >
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  .../devicetree/bindings/dsp/fsl,dsp.yaml      | 33 +++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> > index 7afc9f2be13a..1453668c0194 100644
> > --- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> > +++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> > @@ -24,16 +24,49 @@ properties:
> >      maxItems: 1
> >
> >    clocks:
> > +    minItems: 3
> >      items:
> >        - description: ipg clock
> >        - description: ocram clock
> >        - description: core clock
> > +      - description: esai0 core clock for accessing registers
> > +      - description: esai0 baud clock
> > +      - description: esai0 system clock
> > +      - description: esai0 spba clock required when ESAI is placed in slave mode
> > +      - description: SAI1 bus clock
> > +      - description: SAI1 master clock 0
> > +      - description: SAI1 master clock 1
> > +      - description: SAI1 master clock 2
> > +      - description: SAI1 master clock 3
> > +      - description: SAI3 bus clock
> > +      - description: SAI3 master clock 0
> > +      - description: SAI3 master clock 1
> > +      - description: SAI3 master clock 2
> > +      - description: SAI3 master clock 3
> > +      - description: SDMA3 root clock used for accessing registers
>
> Sigh, I just rejected this kind of thing for the other i.MX8 DSP
> binding[1].
>
> Add a reference to the h/w block and then get the clocks (and other
> resources) from there.

The H/W block is controlled by the DSP firmware. So, we don't want
to use the Linux kernel driver (thus the H/W block device tree node).

The only thing that we cannot control from the DSP firmware are the clocks
hence we handle them in the DSP node.

We moved the DAI clocks under the DSP node as I think you suggested here:

https://www.lkml.org/lkml/2020/3/12/969
