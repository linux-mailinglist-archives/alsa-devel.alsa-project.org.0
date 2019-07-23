Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D53A722FB
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 01:27:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 178DA18EC;
	Wed, 24 Jul 2019 01:26:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 178DA18EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563924420;
	bh=eQrissVxB+YKCtwIbTOQtePKG/KpPRUquSGi5cq9DHU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ixIajzxesHz/1/fC7XCiHK6o8insGvcNHQojP5lauqLQDGfM1zlb8JqdRiE0QGEMV
	 dNQjQn1/asPPOaWQ+lak2PljY0FsT5JBK8RPUsq+gtAYAYF2wv8AayHEO3vISdf8SO
	 BkOwto4UqGxI1WSipkM3p6mYsPl3SRbvAhh64UdU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 356BBF80447;
	Wed, 24 Jul 2019 01:25:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58EEAF80447; Wed, 24 Jul 2019 01:25:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1470F800E8
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 01:25:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1470F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="KQexC5NP"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 45tZKv1lqSz97;
 Wed, 24 Jul 2019 01:23:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1563924228; bh=PsMkB31xmOEHmggeV+jW/eQ5Zn/mEj0Olm8poEZtXRE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KQexC5NPk+Dhy6o50TCg0fEfO5UhahECn+A8OCvtBfq+ECcatL0Y89NdPDOALGjLl
 jGn5HAgn3oluaZqjqSYN5MOg/t0W5ptY0xVXEJvV77eZ0EHQAngPyx6BFzLD52n1T5
 el7gduO8B7mpvlQk6cB1f283fBuYGznyS2aBuCcwLQJzFquKyjeZQ36Pi35a4t67Th
 dFD0Tat/pYsjSQOebZvpQWk9zs0p91XscP0YA+1LFt95Z4NX2zHp4THcl7gnhWfT/8
 OymlTzV5fCkntglhNCdaqfPflr9nog1Ht92W2M8a19BwpT81AHJgVzP6rHlJ57AlD9
 qVABgBV1bv3tA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date: Wed, 24 Jul 2019 01:25:05 +0200
From: mirq-linux@rere.qmqm.pl
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Message-ID: <20190723232505.GA21811@qmqm.qmqm.pl>
References: <cover.1563819483.git.mirq-linux@rere.qmqm.pl>
 <ee65cc7b889b2a8d1139d1d25977842c956d1cf4.1563819483.git.mirq-linux@rere.qmqm.pl>
 <1f3a4256-58de-27a4-8095-54fc6baa6d89@microchip.com>
 <20190723164312.GA4772@qmqm.qmqm.pl>
 <20190723183915.GJ24911@piout.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723183915.GJ24911@piout.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Nicolas.Ferre@microchip.com, tiwai@suse.com, Ludovic.Desroches@microchip.com,
 broonie@kernel.org, Codrin.Ciubotariu@microchip.com,
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

On Tue, Jul 23, 2019 at 08:39:15PM +0200, Alexandre Belloni wrote:
> On 23/07/2019 18:43:12+0200, mirq-linux@rere.qmqm.pl wrote:
> > On Tue, Jul 23, 2019 at 01:36:37PM +0000, Codrin.Ciubotariu@microchip.c=
om wrote:
> > > On 22.07.2019 21:27, Micha=B3 Miros=B3aw wrote:
> > > > Allow SSC to be used on platforms described using audio-graph-card
> > > > in Device Tree.
> > > > =

> > > > Signed-off-by: Micha=B3 Miros=B3aw <mirq-linux@rere.qmqm.pl>
> > > > ---
> > > >   sound/soc/atmel/Kconfig | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > =

> > > > diff --git a/sound/soc/atmel/Kconfig b/sound/soc/atmel/Kconfig
> > > > index 06c1d5ce642c..9ef9d25bb517 100644
> > > > --- a/sound/soc/atmel/Kconfig
> > > > +++ b/sound/soc/atmel/Kconfig
> > > > @@ -25,7 +25,7 @@ config SND_ATMEL_SOC_DMA
> > > >   	default y if SND_ATMEL_SOC_SSC_DMA=3Dy || (SND_ATMEL_SOC_SSC_DMA=
=3Dm && SND_ATMEL_SOC_SSC=3Dy)
> > > >   =

> > > >   config SND_ATMEL_SOC_SSC_DMA
> > > > -	tristate
> > > > +	tristate "SoC PCM DAI support for AT91 SSC controller using DMA"
> > > =

> > > Could you please make something similar for SND_ATMEL_SOC_SSC_PDC? Al=
so, =

> > > I think that it should select ATMEL_SSC, to be able to use =

> > > simple/graph-card with SSC.
> > =

> > Hmm. The Kconfig dependencies seems overly complicated, do you mind if I
> > get rid of most of the entries in the process?
> > =

> =

> Unfortunately, it is just complicated enough. This is done to support
> all the possible configurations. Removing them will lead to linking
> errors.
> =

> After having that discussion back in March, I had a very quick look and
> didn't send a patch because I still had linking issues. It is not
> impossible but it required more time than I had.

Can you try patch below if it covers the configurations you mention?
This uses Kconfig's m/y resolution instead of open-coded defaults.

Best Regards,
Micha=B3 Miros=B3aw


diff --git a/sound/soc/atmel/Kconfig b/sound/soc/atmel/Kconfig
index 06c1d5ce642c..f118c229ed82 100644
--- a/sound/soc/atmel/Kconfig
+++ b/sound/soc/atmel/Kconfig
@@ -12,25 +12,31 @@ if SND_ATMEL_SOC
 config SND_ATMEL_SOC_PDC
 	tristate
 	depends on HAS_DMA
-	default m if SND_ATMEL_SOC_SSC_PDC=3Dm && SND_ATMEL_SOC_SSC=3Dm
-	default y if SND_ATMEL_SOC_SSC_PDC=3Dy || (SND_ATMEL_SOC_SSC_PDC=3Dm && S=
ND_ATMEL_SOC_SSC=3Dy)
-
-config SND_ATMEL_SOC_SSC_PDC
-	tristate
 =

 config SND_ATMEL_SOC_DMA
 	tristate
 	select SND_SOC_GENERIC_DMAENGINE_PCM
-	default m if SND_ATMEL_SOC_SSC_DMA=3Dm && SND_ATMEL_SOC_SSC=3Dm
-	default y if SND_ATMEL_SOC_SSC_DMA=3Dy || (SND_ATMEL_SOC_SSC_DMA=3Dm && S=
ND_ATMEL_SOC_SSC=3Dy)
-
-config SND_ATMEL_SOC_SSC_DMA
-	tristate
 =

 config SND_ATMEL_SOC_SSC
 	tristate
-	default y if SND_ATMEL_SOC_SSC_DMA=3Dy || SND_ATMEL_SOC_SSC_PDC=3Dy
-	default m if SND_ATMEL_SOC_SSC_DMA=3Dm || SND_ATMEL_SOC_SSC_PDC=3Dm
+
+config SND_ATMEL_SOC_SSC_PDC
+	tristate "SoC PCM DAI support for AT91 SSC controller using PDC"
+	depends on ATMEL_SSC
+	select SND_ATMEL_SOC_PDC
+	select SND_ATMEL_SOC_SSC
+	help
+	  Say Y or M if you want to add support for Atmel SSC interface
+	  in PDC mode configured using audio-graph-card in device-tree.
+
+config SND_ATMEL_SOC_SSC_DMA
+	tristate "SoC PCM DAI support for AT91 SSC controller using DMA"
+	depends on ATMEL_SSC
+	select SND_ATMEL_SOC_DMA
+	select SND_ATMEL_SOC_SSC
+	help
+	  Say Y or M if you want to add support for Atmel SSC interface
+	  in DMA mode configured using audio-graph-card in device-tree.
 =

 config SND_AT91_SOC_SAM9G20_WM8731
 	tristate "SoC Audio support for WM8731-based At91sam9g20 evaluation board"
-- =

2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
