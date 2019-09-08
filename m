Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B753ACEF2
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Sep 2019 15:41:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A74A71607;
	Sun,  8 Sep 2019 15:40:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A74A71607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567950086;
	bh=GA90nRfux7UPnPDKDXbHQ2QreLKMQonLIlscrMoD1wM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NHNI8IT6kKUG5Z4D4xJtG5fo9fes9NEmaWtYTtY9qz8hizFdjrSTALjXtmMdEBY0W
	 Ah2wA8RHrpxtrD4l+VPoDczhQ3VSMf6YMMcYVAfao5DMC1hxkZY/ngVbmULboCjXOM
	 RUhHs/+oNqdfk7KWv9Z4GM9rNb7WdognxmdGf1sw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA08BF802DF;
	Sun,  8 Sep 2019 15:39:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FF60F80368; Sun,  8 Sep 2019 15:39:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38205F800E6
 for <alsa-devel@alsa-project.org>; Sun,  8 Sep 2019 15:39:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38205F800E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="sA/qvg4j"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 46RC645Zncz1x;
 Sun,  8 Sep 2019 15:37:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1567949871; bh=8fLQi36Tz+m6T1IGU2o99fMZH+S8E20nfr7PHNk8hXg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sA/qvg4jwPtwyQevGJ8HoBbpqi6V3OlDj9+oyTk9ViTFrt42rElsXZe0ZB0KW4Nc2
 F3fjS2Uspan+uk8Kw8qkd9onZTTqRZfnnTC0au7b58hCo21ZZ/GEpi1YP+RG2fnhtw
 z/txiLBQu53JlibSkErrOOifSnY/fxY52OYA+T8h5KrYNVNVu0b9sX45Cgegjfojx7
 34MQ062JrKzcrUVDf42VKcU6B8+yMx9PFEApJdmnCy+awabU9gYKPDdX8YGds0p1ug
 Zf90m1KfXWyWPbu3uoT+S2Gwi66n3HaKQPSZrRR+9TrGqVZmtmidYOInOGW9hUTt6x
 817f0v4Vx3H9A==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.2 at mail
Date: Sun, 8 Sep 2019 15:39:30 +0200
From: mirq-linux@rere.qmqm.pl
To: Codrin.Ciubotariu@microchip.com
Message-ID: <20190908133929.GA32003@qmqm.qmqm.pl>
References: <cover.1566677788.git.mirq-linux@rere.qmqm.pl>
 <b56ebac96ad232e2d9871067b13654eb9223f28f.1566677788.git.mirq-linux@rere.qmqm.pl>
 <a42ede6e-4cc9-6dbf-4c58-71d2298fd3d5@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a42ede6e-4cc9-6dbf-4c58-71d2298fd3d5@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, arnd@arndb.de, lgirdwood@gmail.com,
 gregkh@linuxfoundation.org, Nicolas.Ferre@microchip.com,
 alexandre.belloni@bootlin.com, Ludovic.Desroches@microchip.com,
 broonie@kernel.org, 3chas3@gmail.com, robh-dt@kernel.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 6/6] ASoC: atmel_ssc_dai: Enable shared
 FSYNC source in frame-slave mode
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

On Mon, Aug 26, 2019 at 03:05:06PM +0000, Codrin.Ciubotariu@microchip.com w=
rote:
> On 24.08.2019 23:26, Micha=B3 Miros=B3aw wrote:
> > SSC driver allows only synchronous TX and RX. In slave mode for BCLK
> > it uses only one of TK or RK pin, but for LRCLK it configured separate
> > inputs from TF and RF pins. Allow configuration with common FS signal.
> > =

> > Signed-off-by: Micha=B3 Miros=B3aw <mirq-linux@rere.qmqm.pl>
> > =

> > ---
> >   v2: use alternate DT binding
> >       split DT and drivers/misc changes
> > =

> > ---
> >   sound/soc/atmel/atmel_ssc_dai.c | 26 ++++++++++++++++++++++----
> >   1 file changed, 22 insertions(+), 4 deletions(-)
> > =

> > diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ss=
c_dai.c
> > index 48e9eef34c0f..035d4da58f2b 100644
> > --- a/sound/soc/atmel/atmel_ssc_dai.c
> > +++ b/sound/soc/atmel/atmel_ssc_dai.c
> > @@ -605,14 +605,32 @@ static int atmel_ssc_hw_params(struct snd_pcm_sub=
stream *substream,
> >   		return -EINVAL;
> >   	}
> >   =

> > -	if (!atmel_ssc_cfs(ssc_p)) {
> > +	if (atmel_ssc_cfs(ssc_p)) {
> > +		/*
> > +		 * SSC provides LRCLK
> > +		 *
> > +		 * Both TF and RF are generated, so use them directly.
> > +		 */
> > +		rcmr |=3D	  SSC_BF(RCMR_START, fs_edge);
> > +		tcmr |=3D	  SSC_BF(TCMR_START, fs_edge);
> =

> Hmm, how would this work if capture and playback start/run at the same ti=
me?

Same as it did before this patch: as there is only one bi-directional link
between SSC and codec, whichever stream starts first defines the rate.

> > +	} else {
> >   		fslen =3D fslen_ext =3D 0;
> >   		rcmr_period =3D tcmr_period =3D 0;
> >   		fs_osync =3D SSC_FSOS_NONE;
> > -	}
> >   =

> > -	rcmr |=3D	  SSC_BF(RCMR_START, fs_edge);
> > -	tcmr |=3D	  SSC_BF(TCMR_START, fs_edge);
> > +		if (ssc->lrclk_from_tf_pin) {
> > +			rcmr |=3D	  SSC_BF(RCMR_START, SSC_START_TX_RX);
> > +			tcmr |=3D	  SSC_BF(TCMR_START, fs_edge);
> > +		} else if (ssc->lrclk_from_rf_pin) {
> > +			/* assume RF is to be used when RK is used as BCLK input */
> =

> This comment is not longer true...

Removed for next version.

> =

> > +			/* Note: won't work correctly on SAMA5D2 due to errata */
> > +			rcmr |=3D	  SSC_BF(RCMR_START, fs_edge);
> > +			tcmr |=3D	  SSC_BF(TCMR_START, SSC_START_TX_RX);
> > +		} else {
> > +			rcmr |=3D	  SSC_BF(RCMR_START, fs_edge);
> > +			tcmr |=3D	  SSC_BF(TCMR_START, fs_edge);
> > +		}
> > +	}
> >   =

> >   	if (atmel_ssc_cbs(ssc_p)) {
> >   		/*
> > =

> =

> Thanks and best regards,
> Codrin

Best Regards,
Micha=B3=A0Miros=B3aw
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
