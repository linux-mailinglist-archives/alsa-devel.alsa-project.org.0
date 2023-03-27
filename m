Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0116CAA85
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 18:26:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9277E6C0;
	Mon, 27 Mar 2023 18:25:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9277E6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679934374;
	bh=unD6pYega6s5CQkww3CPD7tl6qXMraLPtIRmsTnEUWc=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O7j6TKKC57zQDa4yph1FEsQBQxBedz22tkXPZ9IXnKavI464/UjEIKtsWFM2MA4pi
	 QEMZlFk2DbqeBsINk/GjbS5gGr8F3GVmIta6WQ2FEOSAaVaUaPDZBDOH1WJ3uAXv5C
	 QSHcBnyo30nyVuLgR2LAgiugMmYfvTxWhk/20m88=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E7D8F8024E;
	Mon, 27 Mar 2023 18:25:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55E05F80272; Mon, 27 Mar 2023 18:25:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DEB0EF80114
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 18:25:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEB0EF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=URltIeet
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E6406B815D4;
	Mon, 27 Mar 2023 16:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51373C433EF;
	Mon, 27 Mar 2023 16:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679934309;
	bh=unD6pYega6s5CQkww3CPD7tl6qXMraLPtIRmsTnEUWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=URltIeetykqmfCF9B9J8aNMOj5WcgT2CW646BgVbcREu8Ic9Jyl2PNyE8UXVSxEKJ
	 EKUFSOtmbrWQFFXpgZth1SgB8gJTji0h83R7daMTA3R4plPWt77yXvrQsG3C6yiLWS
	 NkpR9rU/O5yHxhvRcTAe6dfA8hyrm53rjEpgabwW9YdRkMMoQkKwp1aOOPDqpvFfUk
	 4ei5KEZkWkHPxbHsQKkN/sm25s7BLpeHioQ1WlB5WRasgxxjKIrYfgijnqVT8qxBut
	 NbZKTwnQCVsLlw7c9NoyT0a0OoHpkuY/JdDHY45o111I6fdslRLVccV2AOOupcRLt/
	 UQax+B67fJAzA==
Date: Mon, 27 Mar 2023 17:25:06 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: soc-dapm.c: tidyup dapm_connect_dai_pair()
Message-ID: <ZCHDYq2GTwQ8Db8y@sirena.org.uk>
References: <87ilen6ni4.wl-kuninori.morimoto.gx@renesas.com>
 <5a284544-bc08-a7e3-7be3-48641762ba44@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k+r/C+OP+RRB6plJ"
Content-Disposition: inline
In-Reply-To: <5a284544-bc08-a7e3-7be3-48641762ba44@linux.intel.com>
X-Cookie: Single tasking: Just Say No.
Message-ID-Hash: M3H5267VTUT7CBEUOIBHBNGZYU45WQ3E
X-Message-ID-Hash: M3H5267VTUT7CBEUOIBHBNGZYU45WQ3E
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M3H5267VTUT7CBEUOIBHBNGZYU45WQ3E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--k+r/C+OP+RRB6plJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 27, 2023 at 10:09:27AM +0300, P=E9ter Ujfalusi wrote:
> On 27/03/2023 03:34, Kuninori Morimoto wrote:

> > +static int convert_stream(int stream)
> > +{
> > +	if (stream =3D=3D SNDRV_PCM_STREAM_CAPTURE)

> int get_cpu_stream_direction(struct snd_soc_dai_link *dai_link,
> 			     int stream)

> Add the comments here and use this to set the stream_cpu?

> The convert_stream() is an odd choice for the functionality.

I agree, I think the above is clearer.

--k+r/C+OP+RRB6plJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQhw18ACgkQJNaLcl1U
h9DuRAf+JtV7H7R1jPHnAXoyptKSjjdExq2eDXEc/pDrSKFChl57l7ffKH+MeGgk
VRfori0beJyeCyJ8JVW3DAogoAmacpVQSRX7MAz7yk0NmWSvaBUZnZzItYH2Zy43
7K5dENwrzEmvSVDC7E0qd/YfAxVntUrJZign1ocZCzvZgAeByYKcGYT4YjWRn0Ur
bF1juIkoOr/5aWXc02UuKzS9PAT76Dz0Sc95Vkubj8NszNEykHzmGW8ws1wwN4am
H2bx+SMi9LrZbFlus6Ux4j6npus4lwLCECFnBgd1Oo4uASa5o+hgUCNgr6CirWqJ
WL4M9m53MTottWpnfz9ACSx5mv/NNg==
=D62y
-----END PGP SIGNATURE-----

--k+r/C+OP+RRB6plJ--
