Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E5072D41
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 13:17:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 583E9193A;
	Wed, 24 Jul 2019 13:16:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 583E9193A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563967046;
	bh=lPEAbMCdm4VB34BIVogHViGIyDIeGTm34HqJmLd/BJc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SWDR3cGGImwpiH2YVbjqWBWscrQc+uRAFECCHML0/LQ5/kYzHn/iWxZh3wNUgm+9w
	 iQq3wePSKc1EJAHYriO/+34M90NiegQHtOPEDpo/tOGpKefSb3lkiC4n224SAuOgHM
	 WzXgfAr0KuNsFNPe0RZz+cMNOuXz5Mbr1cUJv2zc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B67D4F803D1;
	Wed, 24 Jul 2019 13:15:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52336F803D1; Wed, 24 Jul 2019 13:15:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D652DF800E8
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 13:15:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D652DF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="Sy0CeVBf"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 45tt5f53nWzB2;
 Wed, 24 Jul 2019 13:14:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1563966855; bh=crDZnb4rV8/+4rBFzlZzmE/TiuO2diLzt3XIkj43td8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sy0CeVBfsAKf0dtgAo84JCRBVfk8gIgp5Anqp5044H+b8+Z/I4qEE/74pK05vjBfn
 pPH5PTLmXhd//3tZZvFaqV9fW2XoRBhath5fodRr2zZlZ0sN2CPLY4hDVbzffu4BHc
 xDT1gOKCrGLxynD+l/IC+kppwWb7oeF84Roos0RqSOKKLvqvk/FOD55RYMOeHzaKeB
 2jx/IcWQ3xEi7troETWolsKRGGWBLlM3om1Cn2NwXj42izuFGKmyZFrVaJ5vSQtJfp
 l/KrwI1RdumQbqo8UEiGWSVP2G5JGUEM1+lJ16OCalkxj9T2ekMeqgJM9a609IjgRv
 dG+l3A4ZE+ilQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date: Wed, 24 Jul 2019 13:15:33 +0200
From: mirq-linux@rere.qmqm.pl
To: Codrin.Ciubotariu@microchip.com
Message-ID: <20190724111533.GA23736@qmqm.qmqm.pl>
References: <cover.1563819483.git.mirq-linux@rere.qmqm.pl>
 <ff244c1b626fc9c63b4a1fa4e09eeaa579e683d9.1563819483.git.mirq-linux@rere.qmqm.pl>
 <df304453-575f-5925-8d09-f6094c55f8be@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <df304453-575f-5925-8d09-f6094c55f8be@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, alexandre.belloni@bootlin.com,
 lgirdwood@gmail.com, Nicolas.Ferre@microchip.com, tiwai@suse.com,
 Ludovic.Desroches@microchip.com, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 2/5] ASoC: atmel_ssc_dai: rework DAI format
	configuration
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jul 24, 2019 at 10:35:29AM +0000, Codrin.Ciubotariu@microchip.com w=
rote:
> On 22.07.2019 21:27, Micha=B3 Miros=B3aw wrote:
> > Rework DAI format calculation in preparation for adding more formats
> > later.
> > =

> > Note: this changes FSEDGE to POSITIVE for I2S CBM_CFS mode as the TXSYN
> > interrupt is not used anyway.
> > =

> > Signed-off-by: Micha=B3 Miros=B3aw <mirq-linux@rere.qmqm.pl>
> > ---
> >   sound/soc/atmel/atmel_ssc_dai.c | 283 +++++++++-----------------------
> >   1 file changed, 79 insertions(+), 204 deletions(-)
> > =

> > diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ss=
c_dai.c
> > index 6f89483ac88c..b2992496e52f 100644
> > --- a/sound/soc/atmel/atmel_ssc_dai.c
> > +++ b/sound/soc/atmel/atmel_ssc_dai.c
[...]
> > +	if (atmel_ssc_cbs(ssc_p)) {
> > +		/*
> > +		 * SSC provides BCLK
> > +		 *
> > +		 * The SSC transmit and receive clocks are generated from the
> > +		 * MCK divider, and the BCLK signal is output
> > +		 * on the SSC TK line.
> > +		 */
> > +		rcmr |=3D	  SSC_BF(RCMR_CKS, SSC_CKS_DIV)
> > +			| SSC_BF(RCMR_CKO, SSC_CKO_NONE);
> > +
> > +		tcmr |=3D	  SSC_BF(TCMR_CKS, SSC_CKS_DIV)
> > +			| SSC_BF(TCMR_CKO, SSC_CKO_CONTINUOUS);
> > +	} else {
> > +		rcmr |=3D	  SSC_BF(RCMR_CKS, ssc->clk_from_rk_pin ?
> > +					SSC_CKS_PIN : SSC_CKS_CLOCK)
> > +			| SSC_BF(RCMR_CKO, SSC_CKO_NONE);
> > +
> > +		tcmr |=3D	  SSC_BF(TCMR_CKS, ssc->clk_from_rk_pin ?
> > +					SSC_CKS_CLOCK : SSC_CKS_PIN)
> > +			| SSC_BF(TCMR_CKO, SSC_CKO_NONE);
> > +	}
> > +
> > +	rcmr |=3D	  SSC_BF(RCMR_PERIOD, rcmr_period)
> > +		| SSC_BF(RCMR_CKI, SSC_CKI_RISING);
> =

> You can also add here SSC_BF(RCMR_CKO, SSC_CKO_NONE) and remove it from =

> the if-else above;

I left it to keep symmetry between TX and RX code. I can pull it here if
you prefer that way.

> > +
> > +	tcmr |=3D   SSC_BF(TCMR_PERIOD, tcmr_period)
> > +		| SSC_BF(TCMR_CKI, SSC_CKI_FALLING);
> > +
> > +	rfmr =3D    SSC_BF(RFMR_FSLEN_EXT, fslen_ext)
> > +		| SSC_BF(RFMR_FSEDGE, SSC_FSEDGE_POSITIVE)
> > +		| SSC_BF(RFMR_FSOS, fs_osync)
> > +		| SSC_BF(RFMR_FSLEN, fslen)
> > +		| SSC_BF(RFMR_DATNB, (channels - 1))
> > +		| SSC_BIT(RFMR_MSBF)
> > +		| SSC_BF(RFMR_LOOP, 0)
> > +		| SSC_BF(RFMR_DATLEN, (bits - 1));
> > +
> > +	tfmr =3D    SSC_BF(TFMR_FSLEN_EXT, fslen_ext)
> > +		| SSC_BF(TFMR_FSEDGE, SSC_FSEDGE_POSITIVE)
> > +		| SSC_BF(TFMR_FSDEN, 0)
> > +		| SSC_BF(TFMR_FSOS, fs_osync)
> > +		| SSC_BF(TFMR_FSLEN, fslen)
> > +		| SSC_BF(TFMR_DATNB, (channels - 1))
> > +		| SSC_BIT(TFMR_MSBF)
> > +		| SSC_BF(TFMR_DATDEF, 0)
> > +		| SSC_BF(TFMR_DATLEN, (bits - 1));
> > +
> > +	if (fslen_ext && !ssc->pdata->has_fslen_ext) {
> > +		dev_err(dai->dev, "sample size %d is too large for SSC device\n",
> > +			bits);
> > +		return -EINVAL;
> > +	}
> > +
> >   	pr_debug("atmel_ssc_hw_params: "
> >   			"RCMR=3D%08x RFMR=3D%08x TCMR=3D%08x TFMR=3D%08x\n",
> >   			rcmr, rfmr, tcmr, tfmr);
> > =

> =

> You are adding support for SND_SOC_DAIFMT_DSP_A | =

> SND_SOC_DAIFMT_CBM_CFS. If this is intended, please make a separate =

> patch. If not, then:
> =

> printk(KERN_WARNING "atmel_ssc_dai: unsupported DAI format 0x%x\n",
> 			ssc_p->daifmt);
> return -EINVAL;

Hmm. I guess this is actually a good side effect. I can't see a way to
contain this change that doesn't involve adding code that's immediately
removed in next patch. So would you agree to just mentioning this in
commit message?

Best Regards,
Micha=B3 Miros=B3aw
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
