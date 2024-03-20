Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0521288146D
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 16:21:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D35322CC;
	Wed, 20 Mar 2024 16:21:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D35322CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710948113;
	bh=1tGig6cMdiKntUIQI2Cqx4/KYJV/11C4ppZ+rg59blM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LDvl+ZKkpxUPk57q4EqbMO5e9K04wTcD8sKBKrg0Bcd57nrxy31t7t9LbRyRqM/CE
	 ojpHnJrzzvu58dC6ySZnSHLCX8AsTf8BmVUMLlu2hpOyVAYMH+O+6eMpi7YDHJODJZ
	 e97YDb2pW4zO7G7Z9XmC8FxQ9F5eGtVIhH3KH7sU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CFF4F8057E; Wed, 20 Mar 2024 16:21:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0571FF805AD;
	Wed, 20 Mar 2024 16:21:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFA81F804E7; Wed, 20 Mar 2024 16:21:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2CBE4F80088
	for <alsa-devel@alsa-project.org>; Wed, 20 Mar 2024 16:21:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CBE4F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VzZyDMRT
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9187ACE113A;
	Wed, 20 Mar 2024 15:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE3B8C433C7;
	Wed, 20 Mar 2024 15:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710948065;
	bh=1tGig6cMdiKntUIQI2Cqx4/KYJV/11C4ppZ+rg59blM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VzZyDMRTD6tiu8t50ps7WpB9F2ZgXz9wsf3Z1pWLWaVhFhGl+tOTmDDwtVpMdx6XX
	 jdYCKWoHwCZs9loN8cbi5K/+hop+jJQEQE0nhUFuYwTKUTfLff35CoTNr4JzN+IS9/
	 niFqFBP7OI8c8pCVAD4iUwsZemY4TlJOnNuuC+BrBui+8Bw2gN1CyKYoMqwny/a1YO
	 V1PVogkpeRKB+CDSbTxg6VXRWUFwf++QeHvGRhLWFiEgy/30AlaGi8VmMkWZDeeHcb
	 sueTSFUU78dR6iZInmbbdCebwwDxztEp19M1OzmsXGbSQr++TLM5tbGRXWLYccx3bm
	 S3NNG6oHJoyPA==
Date: Wed, 20 Mar 2024 15:21:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Xingyu Wu <xingyu.wu@starfivetech.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: cdns: Add drivers of Cadence Multi-Channel
 I2S Controller
Message-ID: <aeac0262-1054-4bc9-b5e9-653785305162@sirena.org.uk>
References: <20240320090239.168743-1-xingyu.wu@starfivetech.com>
 <20240320090239.168743-3-xingyu.wu@starfivetech.com>
 <1d0399d2-684f-490e-8711-f636e987a0b8@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V7Pu1AxS8JZcWuN0"
Content-Disposition: inline
In-Reply-To: <1d0399d2-684f-490e-8711-f636e987a0b8@linux.intel.com>
X-Cookie: Androphobia:
Message-ID-Hash: H76HPZHOKJDS6STEWJVAK6UXV2DYKOSN
X-Message-ID-Hash: H76HPZHOKJDS6STEWJVAK6UXV2DYKOSN
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H76HPZHOKJDS6STEWJVAK6UXV2DYKOSN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--V7Pu1AxS8JZcWuN0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 20, 2024 at 10:00:24AM -0500, Pierre-Louis Bossart wrote:

> > +	for (i = 0; i < CDNS_I2S_FIFO_DEPTH; i++) {
> > +		if (format == SNDRV_PCM_FORMAT_S16_LE) {
> > +			data[0] = p16[tx_ptr][0];
> > +			data[1] = p16[tx_ptr][1];
> > +		} else if (format == SNDRV_PCM_FORMAT_S32_LE) {
> > +			data[0] = p32[tx_ptr][0];
> > +			data[1] = p32[tx_ptr][1];
> > +		}

> what about other formats implied by the use of 'else if' ?

In general things like this should be written as switch statements.

--V7Pu1AxS8JZcWuN0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmX6/tsACgkQJNaLcl1U
h9BupQf/TIN+i7DTxIw1TfTwOUo18dvWHR8fAtRPMkNvvTXlDI+sAFwhdGomSgtj
7gHyw1/ZmMWHeGC6CffzXKwU4g3z/HyEidwFO6s2LdVxEvl2t8wE0Xo+c5Sgy9G/
iOdGpcwiRCqHh53rhK1UWdIP+paItr1ghPq6ySCASwQZFtvH7CMX4GWbNOEysO1V
6oQcPRwNkQ0k18dVdhsid+PvdPckEJVJGH8+H/YXeR/macDHMiyAJJEdTajQwAuX
iptwgUav7/bLABLR08oqMAaaczvDQgrhm0gRMdLqZQbgeTeq6Liap+HE039e3W9V
LUtcRjsLp6oOIB79EuRycmDey0JzUQ==
=f9S8
-----END PGP SIGNATURE-----

--V7Pu1AxS8JZcWuN0--
