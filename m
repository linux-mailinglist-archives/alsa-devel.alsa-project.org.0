Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA28A746E0
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 08:10:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25CA41AB0;
	Thu, 25 Jul 2019 08:09:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25CA41AB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564035020;
	bh=cgxXP6NB34wlfSJF7zA1Pc6KguxxAqDaRY7QVnUeNDU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N+JrrqOcNB23XK3XwNo5AkkRQ81qXfV7Fb7UaCixjCLPKXzqL6jIGxyW0h4p62jFL
	 63SYbffXRkUHzwYQAvMI5O6ae1+74Do7FTaLUqSDlb7yXDzMlsFkKw2fI+4DgIn0ZW
	 mJw2kp0iC1z53UZpMaQCZOFfaokrOZFIjznX13fU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CAF2F80447;
	Thu, 25 Jul 2019 08:08:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AD0CF803D0; Thu, 25 Jul 2019 08:08:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C40CF800E8
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 08:08:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C40CF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YHuUocaS"
Received: by mail-wr1-x441.google.com with SMTP id x1so34345505wrr.9
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 23:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=latsD49SbH6+14WTREJoq/H2WKuYcXOmWv0v0lWZfMo=;
 b=YHuUocaSQuBDb4/+my9nanv/AIgj+H3gXw2FWCnDH18O9Sxm/qfJ9hBycuupuqsSyr
 Q2hxlHfOF6YK5++nJOuJ8DLpjgJGuNXVTDmwX/x5y+LW/6V58NoDGh0T01lHBL+NYZ78
 vVuL+uUhoUtrI4C1goiEMpKcZSb3X15aPhKzXl/3m/LwQJXBld/2BmTftSa0eZepVxSE
 W/Gh62II2Zc3TIErxNyRyA9hVZXru9veJ5Hg3red1HKi6ClYcvoOaatdWlTX8HXduuHJ
 XaXgyLk4oLHkdPQhyKzBjIRfv+UgBBf5AetkBMThgK3FIuXommwlOf7PS4DNf+YZZmXW
 Nr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=latsD49SbH6+14WTREJoq/H2WKuYcXOmWv0v0lWZfMo=;
 b=Gj5TihwOOrHWO24q8+oiusPfp8M30KC21Rsna0jlmIb1QV1CWJ+D8VUs8IkY4huYkQ
 Hv4mUGhNWidQ6IMUEszl4++Juf88ybdrbBCrXlUGBmdaMv6j4aPZrnlA0Du7TTaE6FbA
 KrpUzukxGxXUlRRdXQLnQUlPab3Gn2iqb3oiMs4YqbxCkvL64vTjK/dKGypcE6+iMz6x
 vCRQXckOt74TkSj1nZ3hy5TYpn8QrXWPjj9YOMIQ4b79J05u5P0Ef0S4LQ8JyEITXgnz
 lMthTIyjcvdmqVKx1r9xQXXW3oXIygqVkOMatm9Az+GgHaUblrGellCqAnklzgXPwmTX
 dkKg==
X-Gm-Message-State: APjAAAWjc0azpiQLevErSXLUoMpEHlMfiHj9m9d4UlomtUHgCnFErEoT
 b5Z+xzkSKPitqYvpUGk2Ulba2hBSJeC9S2nCtjs=
X-Google-Smtp-Source: APXvYqygKTZcpAUad4xCLhuwEwjXgMEOhsMCmrgBhao93Fa2kJ6wTZaNsdznhI1yMHhycn2/c4/j+qf52ggAwTcXS60=
X-Received: by 2002:adf:f450:: with SMTP id f16mr60328116wrp.335.1564034909544; 
 Wed, 24 Jul 2019 23:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
 <20190722124833.28757-7-daniel.baluta@nxp.com>
 <20190724231342.GB6859@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20190724231342.GB6859@Asurada-Nvidia.nvidia.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 25 Jul 2019 09:08:18 +0300
Message-ID: <CAEnQRZDt7b54YAu7w6vbGi9=OXk6rRv2k2y0tjL_GN4j1m3XdA@mail.gmail.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [alsa-devel] [PATCH 06/10] ASoC: dt-bindings: Document dl_mask
	property
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

On Thu, Jul 25, 2019 at 2:14 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Mon, Jul 22, 2019 at 03:48:29PM +0300, Daniel Baluta wrote:
> > SAI supports up to 8 data lines. This property let the user
> > configure how many data lines should be used per transfer
> > direction (Tx/Rx).
> >
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/sound/fsl-sai.txt | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > index 2e726b983845..59f4d965a5fb 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > +++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > @@ -49,6 +49,11 @@ Optional properties:
>
> > +  - fsl,dl_mask              : list of two integers (bitmask, first for RX, second
>
> Not quite in favor of the naming here; And this patch should
> be sent to the devicetree maillist and add DT maintainers --
> they would give some good naming advice.
>
> From my point of view, I feel, since data lines are enabled
> consecutively, probably it'd be clear just to have something
> like "fsl,num-datalines = <2 2>", corresponding to "dl_mask
> = <0x3 0x3>". I believe there're examples in the existing DT
> bindings, so let's see how others suggest.
>

Your suggestion looks good to me. Anyhow, after reading again the
documentation it seems that datalines are not always required to
be consecutive.

The need to be consecutive only when FIFO combine mode is enabled.
Will fix the documentation in the next version.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
