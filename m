Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4E828542B
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Oct 2020 23:54:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 260F416F1;
	Tue,  6 Oct 2020 23:53:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 260F416F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602021269;
	bh=Euzof6VoYk9PmMPR4S6HKgcU1s4GNt3wAURtgNcGMn0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=csKOdWHSxs/C8Jko8yNeHy238miCB71vgKwIkWfMZVl8Jxch8X1Hi+oYAn6ZKI1ai
	 2wbh17HBCOF5vBT1rZg4mvbVDo0UbJ0662TIBnFa/cRcBTsPGt64o+rEJ2SjHeJVNd
	 BiuQ1YWaUYo5Nj6RiTmuqEtKmHrhMC7+sA5lH4I4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6B1FF8012A;
	Tue,  6 Oct 2020 23:52:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89EADF80128; Tue,  6 Oct 2020 23:52:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEC37F80128
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 23:52:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEC37F80128
Received: by mail-oi1-f193.google.com with SMTP id x69so209786oia.8
 for <alsa-devel@alsa-project.org>; Tue, 06 Oct 2020 14:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CcowxvKV3WPMTnQe2ODLkjn+TeOaM7f9s2ye2HeLgEs=;
 b=K0647iBPYymW0T7drXNTdJC2OI9a0qZFWTtyCIgOPWyRtm8V3Y3y1fY202n0r9r5O1
 3CzjKhtkAfd2CfQh4tpCeMAX+3m7My8J0Hy041kAGNftGk5HOSJnHqHHSg9vXrPptZjF
 vUv8d+6DTJQcTqUZjMvE2Mz/9gP7NAMUABodXUgUCEHMh7S9UeiB4NehEXoudTajhf3Z
 XGUBEXJgqEeyD7tP+RGaEL0F6wy5Rf98U3D7dNJnFtOdJz70KRKb39BGkrxREQ1Euo0r
 MzVyiAzJR0sDdEGMA9SyrGuxQWbwaLqHd2+BSd/ON0kaQ+wjDdqHxJxlpn7cbIN6LVpo
 THTw==
X-Gm-Message-State: AOAM530fHT+uu9vr/vqLU5ebn0TDvuE1UdLtA0ZgGOO2gGiz2dGyiWkx
 1WQXy+UbSS39xGbFVgTEJw==
X-Google-Smtp-Source: ABdhPJwUYZPWu4CvjIXHGqFaPHnbZqi7GzNoq59DJGGDL5CgdF+QZtiSAGWIgck1biOWKEdih7g3Ig==
X-Received: by 2002:aca:654b:: with SMTP id j11mr201016oiw.77.1602021161406;
 Tue, 06 Oct 2020 14:52:41 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 68sm27509otu.33.2020.10.06.14.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 14:52:40 -0700 (PDT)
Received: (nullmailer pid 2914439 invoked by uid 1000);
 Tue, 06 Oct 2020 21:52:39 -0000
Date: Tue, 6 Oct 2020 16:52:39 -0500
From: Rob Herring <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: fsl: add ac97 fixed mode support
Message-ID: <20201006215239.GA2912752@bogus>
References: <20201005111644.3131604-1-primoz.fiser@norik.com>
 <20201005111644.3131604-2-primoz.fiser@norik.com>
 <CAOMZO5CQkh06TfKj3qR9P+0ZQOQo07NAg8v9j==KMrLCWBn0mg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5CQkh06TfKj3qR9P+0ZQOQo07NAg8v9j==KMrLCWBn0mg@mail.gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Primoz Fiser <primoz.fiser@norik.com>, Shengjiu Wang <shengjiu.wang@gmail.com>
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

On Mon, Oct 05, 2020 at 08:35:58AM -0300, Fabio Estevam wrote:
> On Mon, Oct 5, 2020 at 8:16 AM Primoz Fiser <primoz.fiser@norik.com> wrote:
> >
> > Add devicetree bindings documentation for operating SSI in AC'97
> > variable/fixed mode of operation.
> >
> > Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> > ---
> >  Documentation/devicetree/bindings/sound/fsl,ssi.txt | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,ssi.txt b/Documentation/devicetree/bindings/sound/fsl,ssi.txt
> > index 7e15a85cecd2..abc5abe11fb9 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,ssi.txt
> > +++ b/Documentation/devicetree/bindings/sound/fsl,ssi.txt
> > @@ -43,6 +43,11 @@ Optional properties:
> >  - fsl,mode:         The operating mode for the AC97 interface only.
> >                      "ac97-slave" - AC97 mode, SSI is clock slave
> >                      "ac97-master" - AC97 mode, SSI is clock master
> > +- fsl,ac97-mode:    SSI AC97 mode of operation.
> > +                    "variable" - AC97 Variable Mode, SLOTREQ bits determine
> > +                    next receive/transmit frame
> > +                    "fixed" - AC97 Fixed Mode, SSI transmits in accordance with
> > +                    AC97 Frame Rate Divider bits
> 
> It would be good to mention what is the default mode when such
> property is absent.

Then perhaps it could be boolean?

Rob
