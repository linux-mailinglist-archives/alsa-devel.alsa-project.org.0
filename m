Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B64D9077FD
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:14:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7043EDF8;
	Thu, 13 Jun 2024 18:14:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7043EDF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718295284;
	bh=KOWpJtHBV4XE8VhY7yrO/kJc+8536QocG6HEWhHlh4g=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O9kfgXM2CpyoCX+FwdMyVhaXSiqNGGsRyF6zkA6zIzy19+IoPu7QQJiOp67Lj2d7b
	 lcjX0jj4Yt292jAZKsvM9tCFUM9sMlIj5B81kOIpYIxrmdRfdU+g5B2mTxoCsJL9m4
	 Wu9EgNO/w0jf3jaYpGEfxg91oyTiiKvU5x3Nq9iI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABCFAF89923; Thu, 13 Jun 2024 18:05:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BCE4DF8992B;
	Thu, 13 Jun 2024 18:05:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 600AAF8057A; Tue, 11 Jun 2024 14:35:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 00F27F80579
	for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2024 14:35:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00F27F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Nhcx8DHA
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45BCZWRd047923;
	Tue, 11 Jun 2024 07:35:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718109332;
	bh=KOWpJtHBV4XE8VhY7yrO/kJc+8536QocG6HEWhHlh4g=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Nhcx8DHA/kSRjceH/kbOpERTMx87jQRTzlsoYjbgvjz43SrXNNW7tR4t4/Hqg797q
	 VCqL4tvR7/jF9LSr4Vma2FpVhXWhxrFIvfYoifJWz8mVRLcl6nDraflpVRXs9+aBwU
	 Kh1o2mfDAMVuzIuHQ4Zj5iGtNz5MqvehV0L4n3lI=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45BCZWuJ116422
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Jun 2024 07:35:32 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Jun 2024 07:35:31 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Jun 2024 07:35:31 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45BCZV1O121832;
	Tue, 11 Jun 2024 07:35:31 -0500
Date: Tue, 11 Jun 2024 18:05:30 +0530
From: Jai Luthra <j-luthra@ti.com>
To: Mark Brown <broonie@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Liam
 Girdwood <lgirdwood@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Devarsh Thakkar <devarsht@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Jayesh Choudhary <j-choudhary@ti.com>
Subject: Re: Re: [PATCH v2 1/2] ALSA: dmaengine: Synchronize dma channel in
 prepare()
Message-ID: <e55jugzdtzgiqvvmvtgyp3rovthvl3ky2o4quuxvswt3w5nshr@stuqxwmbpnpo>
References: <20240610-asoc_next-v2-0-b52aaf5d67c4@ti.com>
 <20240610-asoc_next-v2-1-b52aaf5d67c4@ti.com>
 <3557bd0f-86b4-4dce-90dd-59303f4f1154@metafoo.de>
 <ZmgpUFy5-_5n_zyd@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a2pm5t3dxnjeog5a"
Content-Disposition: inline
In-Reply-To: <ZmgpUFy5-_5n_zyd@finisterre.sirena.org.uk>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MailFrom: j-luthra@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: Q5NVANC7JBRCRMKELAREX5DDKH7SIBJ3
X-Message-ID-Hash: Q5NVANC7JBRCRMKELAREX5DDKH7SIBJ3
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:05:05 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q5NVANC7JBRCRMKELAREX5DDKH7SIBJ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--a2pm5t3dxnjeog5a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lars, Mark,

On Jun 11, 2024 at 11:39:12 +0100, Mark Brown wrote:
> On Mon, Jun 10, 2024 at 05:45:52PM -0700, Lars-Peter Clausen wrote:
> > On 6/10/24 03:56, Jai Luthra wrote:
>=20
> > > Sometimes the stream may be stopped due to XRUN events, in which case
> > > the userspace can call snd_pcm_drop() and snd_pcm_prepare() to stop a=
nd
> > > start the stream again.
>=20
> > > In these cases, we must wait for the DMA channel to synchronize before
> > > marking the stream as prepared for playback, as the DMA channel gets
> > > stopped by snd_pcm_drop() without any synchronization.
>=20
> > We should really implement the sync_stop() PCM callback and let the ALSA
> > core let care of the sync.
>=20
> Good point, that's a better idea.

Thanks for the suggestion, sending a v3 with the change.

Peter,
I've kept your R-by intact as it is a minor change.


--=20
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

--a2pm5t3dxnjeog5a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmZoRI8ACgkQQ96R+SSa
cUWdgg/8CE3gIScDM3oCtEbZLGwD4OSB1rjOChUtnO5P0OPRFipfhafhKyDsKtcZ
JlU9aFk+lazrHXLzQNrR2Uz9ljyhm1fc3FH+OCi04cTlRlu6Eees02ZwbQaSGV1g
kDQumGpedl0oh5+dc5eTypM3CzJpmTIumJYruaGqQzj0f9P2gyOMuvrlVorwQef7
Q3aWIZOJrj+F0hAchTFUN+1jW9IGnQJLnr1kPTurHP8wntJGjMV8bE00Jji5iZCE
/zxtqWpMB/tG8Utl41W6dV3UJ7esQFhtX+xyihclFEVfvHli+k6HNtIG4aPAf82K
LNzhGRLDAeUq7EmPk7x3GHVkRhJ2A4RbLBSfYhhHOEfO7B+WPnZqCCj9WjL1UUwJ
of3PUoqDV6jHX0kkzb+2Oe0p4YtcIUhlwBWlFXJd4Pe8tGd6ISc2IznTGCViun0P
YHVH5hWEBf4iuax1gvCiaRCE/VUJIQNs6gMTNlwq/6HiP9yJQm4C8v7rgPFZz8a4
QzfaCwpopSB1husKft8lmrLb8brM1ca4iHTuqJToZuQ4dEsOI7GvNodhuVY1XVGE
YJrze66Vn1qZMJHj1zJ3P8bbqWX5I4VuhcOKUv7BoPLMotefjCPUrLQ/F+xcwW3Q
TbFHBLZBaR3lYNgBq/b0D6LebzUzhCwqBQNAwlosRMs7KmgpZi0=
=iOPb
-----END PGP SIGNATURE-----

--a2pm5t3dxnjeog5a--
