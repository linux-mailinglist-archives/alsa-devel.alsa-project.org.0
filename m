Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 209F193F36D
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2024 12:58:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEC46B60;
	Mon, 29 Jul 2024 12:58:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEC46B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722250727;
	bh=rsai1WDbNUNphHRoS7Z+hKpaBA4Iq2R/l/XTuQ/R0bE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=omtFtxLAQ3UaTdH/vUaZc58ZAwc35crUMNtuErHOx02P4WH/5dehyeGjYOoUgrwrO
	 wP7Aa3EiPHj7khF+7MTaJx1iS6xFpdNvVg4LxtNZpUVGQ7gnWSAibyUKcUvx5hYNlm
	 Jm7A3CFeH+ul3ih6fmbkxQ9zoQd/Y4smGNhtzc10=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D2B9F805B0; Mon, 29 Jul 2024 12:58:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3788AF805B1;
	Mon, 29 Jul 2024 12:58:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04FB0F802DB; Mon, 29 Jul 2024 12:58:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F953F8007E
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 12:58:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F953F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com
 header.a=rsa-sha256 header.s=k1 header.b=OAHR5mQZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=NlU1
	KeWDVQKzAh1jEb0mrC7e+c0mfZHxd5Tmaj7++js=; b=OAHR5mQZvS3aO0VDTwQn
	F3kbpavwrGnfdwaGPNUgSALJ5SPCQDN0MIMfHrlkibXWzReQhduf9mX3nKTQ0WLD
	Hy5lEeFQVL8pmkX7EsnVwAyJ0Yxa5jC7JPxkDVNGsZGpfqi5hoczOXlR1UyQzaCj
	N5oFilFDF/4ItOq/gL1e6yApU575L9al+q4ROC0/TE0RmZXxlxXuxPBUf9K8tHCX
	LmW/YjG5xmxFNduUhceUq3IoZrBxreJH9JrG+HDbx1NOzhG7Sx7vceb6HKcjbg8Z
	oHtdQEioHVklKdLPTYerBZeHFr8mCnFlwfF6D5dnsgoe99lO56JiT+U7q0JpkS3y
	5g==
Received: (qmail 4076308 invoked from network); 29 Jul 2024 12:58:05 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 29 Jul 2024 12:58:05 +0200
X-UD-Smtp-Session: l3s3148p1@NohHvGAesLogAwDPXxLGAIH3oZkcU6AS
Date: Mon, 29 Jul 2024 12:58:04 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: alsa-devel@alsa-project.org, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/3] slimbus: use 'time_left' instead of 'timeout' with
 wait_for_*() functions
Message-ID: <Zqd1vHoEnxxolkn0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	alsa-devel@alsa-project.org, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20240430120102.29459-1-wsa+renesas@sang-engineering.com>
 <ZjDyWFlx2cjfi1MJ@hu-bjorande-lv.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+cknL3Al0OGm9pyy"
Content-Disposition: inline
In-Reply-To: <ZjDyWFlx2cjfi1MJ@hu-bjorande-lv.qualcomm.com>
Message-ID-Hash: WJUKAT3ZA53ML32N6AKKJSCIDOH76Z5P
X-Message-ID-Hash: WJUKAT3ZA53ML32N6AKKJSCIDOH76Z5P
X-MailFrom: wsa+renesas@sang-engineering.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WJUKAT3ZA53ML32N6AKKJSCIDOH76Z5P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--+cknL3Al0OGm9pyy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2024 at 06:30:00AM -0700, Bjorn Andersson wrote:
> On Tue, Apr 30, 2024 at 02:00:58PM +0200, Wolfram Sang wrote:
> > There is a confusing pattern in the kernel to use a variable named 'tim=
eout' to
> > store the result of wait_for_*() functions causing patterns like:
> >=20
> >         timeout =3D wait_for_completion_timeout(...)
> >         if (!timeout) return -ETIMEDOUT;
> >=20
> > with all kinds of permutations. Use 'time_left' as a variable to make t=
he code
> > obvious and self explaining.
> >=20
> > This is part of a tree-wide series. The rest of the patches can be foun=
d here
> > (some parts may still be WIP):
> >=20
> > git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/time_le=
ft
> >=20
> > Because these patches are generated, I audit them before sending. This =
is why I
> > will send series step by step. Build bot is happy with these patches, t=
hough.
> > No functional changes intended.
> >=20
>=20
> Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Thanks, Bjorn. Is Srinivas still pick slimbus patches?


--+cknL3Al0OGm9pyy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmandbgACgkQFA3kzBSg
KbaskRAAgHnV1i8eFtbuTKyO0gMzd1CCUEa3gnpaT196gJstpASz+YeK7r4j1o/j
HtEofmbsK8gF/4+hxEoZowAnM50t5vnjcQz5wAu7DyV2p6MLyvYV7iIU+Wai89k2
B9+Og/36PGDXvUWbrPJdX8GRBR92TZGlmalCi+wHc0rn8IPvuQ4a3ACuoQJ2G8K+
ryWxCq8NmzEsXPljzXnC/iz2whGlIY+ahNj5sgR74CZHH0xAGmGXcF/+Qs7Ha3bs
9Y00p7HpsSIvW8qoLfUug69pV6EeahETAsx5E+Ja1gXPZuJSedfyz4wieOKJOmk6
iZRrXIKmRuKAT9xfwWbrEuKGKaseRr6Y9+VFV879qejZi0rp+R2UE0g3tEco0IvO
KulP559zDKlmPzB7s7irX6I9o9gviqShjlue//QmOG6URUWTjV3zrx52RGmAEd45
L+CGQGClrEXgusOX6+fsUOnaUnomKLu9P53LsKT5ybNGht2YDJ4AhW0M0KgGr3j6
wLKZGckva40xuFDTHHZe6JfMzSq7zfJyJXZiDArx0Vo7Yc0mnSPcCODXFhT3zzJ1
HuziH0w+f2i/PD5wFU+Gulpm1rBz79lwJ83ovT+pxg3Kk4kiugb1O5rPTybfg6/g
EuBHOIl59f1J/B+OEWtfy/9qe8vfTQbPqfuzpYeV3ywpXRCSP7M=
=mgwZ
-----END PGP SIGNATURE-----

--+cknL3Al0OGm9pyy--
