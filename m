Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F33D76553
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 14:11:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BEE02043;
	Fri, 26 Jul 2019 14:10:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BEE02043
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564143105;
	bh=iLTFzu552tu7K5iNPeYmi0HY19pQZbJ4RioSXXOZaGM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VJQYNUeXhzV3GB4Pfloia2qJaW/NXmqzes7/3BNmIxzV/PBc/aPggXOxAhb34jFWY
	 C5kbVg0FPvHhy2G3TSIkaht+eieoOKA7XEv4ICmDEUBg8sf/3F7ZEWFVp6yh60rFBu
	 kzgyK+KZtmisKXMFWRfqWa041gdqrOZMeZefa8DI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0E9BF80483;
	Fri, 26 Jul 2019 14:08:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C2AFF8048D; Fri, 26 Jul 2019 14:08:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F909F80481
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 14:08:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F909F80481
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="OMurcdll"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 45w7B94bnbzB2;
 Fri, 26 Jul 2019 14:07:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1564142851; bh=+BQ1LKYu6336M0FwVYPvUJaJNhiZCTl8l1SiH8AfHx0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OMurcdllC7deHb/blzpx+dNiTmUEOSYZ2oXROzw++3sNCSVGERNm+epHMAwk6eYm4
 KIYCjj+k5b6MLb9V7srqudq6QpwFi/fABzNh3KJGPYGZ/N4G+cppm166W+sMXDUOca
 AOAGGKSzOSyAtnqO56DwbKgfvvURDKgEeeXdvLZSdYmOVzKUDqx9zXDoA4MzMhxNSd
 SZABB14mjedRIXqW0vcACL3N6AaWVCXjP6ZXgZwS5/Z1BzNeZZcjtVr5ZAQ2i6eqMc
 lCJY4s4O9VgZcSx0mfqVZ+jUPmfA9GdTBIxAgfJNJkcTKByRJ8xHNx+zhzIYn5Umid
 4vdhwL2wM1ulw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date: Fri, 26 Jul 2019 14:08:49 +0200
From: mirq-linux@rere.qmqm.pl
To: Codrin.Ciubotariu@microchip.com
Message-ID: <20190726120849.GA1078@qmqm.qmqm.pl>
References: <cover.1563819483.git.mirq-linux@rere.qmqm.pl>
 <107e0cfd11a31ce1558e941612e183100022930d.1563819483.git.mirq-linux@rere.qmqm.pl>
 <eabb96e7-1567-3ee1-a00e-f241c5f23c1c@microchip.com>
 <20190725182427.GA16245@qmqm.qmqm.pl>
 <6fdbcec1-346f-9ebf-34e7-83b0ceaba404@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6fdbcec1-346f-9ebf-34e7-83b0ceaba404@microchip.com>
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

On Fri, Jul 26, 2019 at 10:33:29AM +0000, Codrin.Ciubotariu@microchip.com w=
rote:
> On 25.07.2019 21:24, mirq-linux@rere.qmqm.pl wrote:
> > On Thu, Jul 25, 2019 at 03:02:34PM +0000, Codrin.Ciubotariu@microchip.c=
om wrote:
> >> On 22.07.2019 21:27, Micha=B3 Miros=B3aw wrote:
> >>> SSC driver allows only synchronous TX and RX. In slave mode for BCLK
> >>> it uses only one of TK or RK pin, but for LRCLK it configured separate
> >>> inputs from TF and RF pins. Allow configuration with common FS signal.
> > [...]
> >>> @@ -613,10 +607,30 @@ static int atmel_ssc_hw_params(struct snd_pcm_s=
ubstream *substream,
> >>>    		return -EINVAL;
> >>>    	}
> >>>    =

> >>> -	if (!atmel_ssc_cfs(ssc_p)) {
> >>> +	if (atmel_ssc_cfs(ssc_p)) {
> >>> +		/*
> >>> +		 * SSC provides LRCLK
> >>> +		 *
> >>> +		 * Both TF and RF are generated, so use them directly.
> >>> +		 */
> >>> +		rcmr |=3D	  SSC_BF(RCMR_START, fs_edge);
> >>> +		tcmr |=3D	  SSC_BF(TCMR_START, fs_edge);
> >>> +	} else {
> >>>    		fslen =3D fslen_ext =3D 0;
> >>>    		rcmr_period =3D tcmr_period =3D 0;
> >>>    		fs_osync =3D SSC_FSOS_NONE;
> >>> +		if (!ssc->shared_fs_pin) {
> >>> +			rcmr |=3D	  SSC_BF(RCMR_START, fs_edge);
> >>> +			tcmr |=3D	  SSC_BF(TCMR_START, fs_edge);
> >>> +		} else if (ssc->clk_from_rk_pin) {
> >>> +			/* assume RF is to be used when RK is used as BCLK input */
> >>> +			/* Note: won't work correctly on SAMA5D2 due to errata */
> >>> +			rcmr |=3D	  SSC_BF(RCMR_START, fs_edge);
> >>> +			tcmr |=3D	  SSC_BF(TCMR_START, SSC_START_RECEIVE);
> >>
> >> Did you find a platform in which this mode works?
> > =

> > To be exact: according to the errata, TX is delayed improperly. So if y=
ou
> > use only RX (SSC side receives) direction, you're fine.
> =

> I know, but there are other platforms with SSC, which don't have this =

> errata, like sam9x35 or sama5d3. Have you tested this mode, RK input, RF =

> input, RD starts on edge detect, TF input, TD starts synchronously with =

> receiver?

No, I have only SAMA5D2 available to test.

Best Regards,
Micha=B3=A0Miros=B3aw
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
