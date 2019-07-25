Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAD0756DA
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 20:26:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 262971F08;
	Thu, 25 Jul 2019 20:25:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 262971F08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564079182;
	bh=DGKEynqLxPfWym4iWFIe9QliwBlXcXIn234kBgr64lY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XhATOLMn3V92A3lI6bW4BvMk4ZR3n2ht++Dg2tm2H2hxuEkW4Izke/PM7ZH+SuOr9
	 AwkSJwE/7PsF1LC23P2gr6Ze7S3947G0+x3sRfdatArhKjNb1z3rUByNVw2onqGL/V
	 MjKJwjiUvcG9yMZZPBwct9zOfLb06U7gk3rpoPgI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F25CCF80448;
	Thu, 25 Jul 2019 20:24:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C81DDF803D0; Thu, 25 Jul 2019 20:24:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56F6FF8015A
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 20:24:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56F6FF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="cJOO3zNG"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 45vgZ428mGzB2;
 Thu, 25 Jul 2019 20:23:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1564078989; bh=Wl70UkyUa1QvKhLDkVLuyu9SXp2lERXzmYfUoIOpTPs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cJOO3zNGNVmaEvljMlngn2KI1M1W+V6qNDrY6leJ6qyr+0WBnC33koMwEL87UtP2T
 Mfx6EK+g+fCpOMbYj8t6hw94F0H2W2UrIVlAUd9mNLUlKUNBZXX2FcA5Y9weYH1Faq
 hM3v2Y4F0iFpyoDLB2Q4e9q6ph3Fn2LrXhLaIr34Y5ZEME5q9SR6McDvIGC5PfEtq6
 AFTf8QRt0y5xVK9LJ/4yLq4H7ujtGwVY99gCJFOwCy9LJIihqF0rKoit3v3x5S3NRE
 pOEEQc4uTF0s53/RMpjv9iifiBxekbDlSChFXMBUwB2O5I9P+J6oojWgyEs+Yku6a5
 y7TVjs/i/tJBw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date: Thu, 25 Jul 2019 20:24:27 +0200
From: mirq-linux@rere.qmqm.pl
To: Codrin.Ciubotariu@microchip.com
Message-ID: <20190725182427.GA16245@qmqm.qmqm.pl>
References: <cover.1563819483.git.mirq-linux@rere.qmqm.pl>
 <107e0cfd11a31ce1558e941612e183100022930d.1563819483.git.mirq-linux@rere.qmqm.pl>
 <eabb96e7-1567-3ee1-a00e-f241c5f23c1c@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eabb96e7-1567-3ee1-a00e-f241c5f23c1c@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, alexandre.belloni@bootlin.com, tiwai@suse.com,
 Nicolas.Ferre@microchip.com, lgirdwood@gmail.com,
 Ludovic.Desroches@microchip.com, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 5/5] ASoC: atmel_ssc_dai: Enable shared
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

On Thu, Jul 25, 2019 at 03:02:34PM +0000, Codrin.Ciubotariu@microchip.com w=
rote:
> On 22.07.2019 21:27, Micha=B3 Miros=B3aw wrote:
> > SSC driver allows only synchronous TX and RX. In slave mode for BCLK
> > it uses only one of TK or RK pin, but for LRCLK it configured separate
> > inputs from TF and RF pins. Allow configuration with common FS signal.
[...]
> > @@ -613,10 +607,30 @@ static int atmel_ssc_hw_params(struct snd_pcm_sub=
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
> > +	} else {
> >   		fslen =3D fslen_ext =3D 0;
> >   		rcmr_period =3D tcmr_period =3D 0;
> >   		fs_osync =3D SSC_FSOS_NONE;
> > +		if (!ssc->shared_fs_pin) {
> > +			rcmr |=3D	  SSC_BF(RCMR_START, fs_edge);
> > +			tcmr |=3D	  SSC_BF(TCMR_START, fs_edge);
> > +		} else if (ssc->clk_from_rk_pin) {
> > +			/* assume RF is to be used when RK is used as BCLK input */
> > +			/* Note: won't work correctly on SAMA5D2 due to errata */
> > +			rcmr |=3D	  SSC_BF(RCMR_START, fs_edge);
> > +			tcmr |=3D	  SSC_BF(TCMR_START, SSC_START_RECEIVE);
> =

> Did you find a platform in which this mode works?

To be exact: according to the errata, TX is delayed improperly. So if you
use only RX (SSC side receives) direction, you're fine.

Best Regards,
Micha=B3=A0Miros=B3aw
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
