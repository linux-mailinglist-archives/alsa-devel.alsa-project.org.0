Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F92471D0E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 18:45:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC21718BC;
	Tue, 23 Jul 2019 18:44:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC21718BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563900305;
	bh=TCaVTvZzwAt3NV8afp+5rjGWI2w7IDt66PlQdOvc8ok=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FVjQdcVK6Lp4vALc1jNA9iSoSOPOufhRibp1WVquOKt+xMum+n3H4JRfc9UwQULZJ
	 dMMs2qQFQkY0dEncJw1IiioaTxs6A0yDA8+m3kBjqWM378kS+qvKbEPJs5t+ruvOQB
	 a764BnONJSu4U3u68T85mjRooGY0kINL7/khRg1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD83DF80227;
	Tue, 23 Jul 2019 18:43:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADD4BF80227; Tue, 23 Jul 2019 18:43:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C1F4F80227
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 18:43:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C1F4F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="JxGPKQKB"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 45tPQB4zkKzB2;
 Tue, 23 Jul 2019 18:41:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1563900115; bh=ZZwiCfYf8YznhGG9G4iEwxfev7xiXtEADi1F1gKHj6k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JxGPKQKBO2bwcpM4Bmd0DfRaEN3mGVGdm+ir/41DKYHtl//sSTWbSgMDAf6HBuLxp
 Jw4i2Tc8iGiOpQDoVRxN03x78yASKOWxQBTmjy6BXF+CB6/e3Vb9qPQkGBRDeCk85P
 t95MhwqbctiJk7YYU2zvTdpg+BOWki/aYV8FCN+slL03EolXIA/FpxjEsXuF9DQ4fq
 lTNK/P4sakfBBLNvSq3J+6lwmK8Ton6+02bFITBViLZxIT/TVHkjpLih9n0iMxwt28
 EsInVXvtzHpw5SEy1lX9vCyaPOtX2V1a70JkxibyQ+0DAQ72uvdE4cwfwr82FsCXO+
 9utzbXRvhr4Bw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date: Tue, 23 Jul 2019 18:43:12 +0200
From: mirq-linux@rere.qmqm.pl
To: Codrin.Ciubotariu@microchip.com
Message-ID: <20190723164312.GA4772@qmqm.qmqm.pl>
References: <cover.1563819483.git.mirq-linux@rere.qmqm.pl>
 <ee65cc7b889b2a8d1139d1d25977842c956d1cf4.1563819483.git.mirq-linux@rere.qmqm.pl>
 <1f3a4256-58de-27a4-8095-54fc6baa6d89@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1f3a4256-58de-27a4-8095-54fc6baa6d89@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, alexandre.belloni@bootlin.com,
 lgirdwood@gmail.com, Nicolas.Ferre@microchip.com, tiwai@suse.com,
 Ludovic.Desroches@microchip.com, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 1/5] ASoC: atmel: enable SSC_PCM_DMA in
	Kconfig
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

On Tue, Jul 23, 2019 at 01:36:37PM +0000, Codrin.Ciubotariu@microchip.com w=
rote:
> On 22.07.2019 21:27, Micha=B3 Miros=B3aw wrote:
> > Allow SSC to be used on platforms described using audio-graph-card
> > in Device Tree.
> > =

> > Signed-off-by: Micha=B3 Miros=B3aw <mirq-linux@rere.qmqm.pl>
> > ---
> >   sound/soc/atmel/Kconfig | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/sound/soc/atmel/Kconfig b/sound/soc/atmel/Kconfig
> > index 06c1d5ce642c..9ef9d25bb517 100644
> > --- a/sound/soc/atmel/Kconfig
> > +++ b/sound/soc/atmel/Kconfig
> > @@ -25,7 +25,7 @@ config SND_ATMEL_SOC_DMA
> >   	default y if SND_ATMEL_SOC_SSC_DMA=3Dy || (SND_ATMEL_SOC_SSC_DMA=3Dm=
 && SND_ATMEL_SOC_SSC=3Dy)
> >   =

> >   config SND_ATMEL_SOC_SSC_DMA
> > -	tristate
> > +	tristate "SoC PCM DAI support for AT91 SSC controller using DMA"
> =

> Could you please make something similar for SND_ATMEL_SOC_SSC_PDC? Also, =

> I think that it should select ATMEL_SSC, to be able to use =

> simple/graph-card with SSC.

Hmm. The Kconfig dependencies seems overly complicated, do you mind if I
get rid of most of the entries in the process?

Best Regards,
Micha=B3=A0Miros=B3aw
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
