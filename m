Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC0289E048
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Apr 2024 18:23:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEE192BC0;
	Tue,  9 Apr 2024 18:23:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEE192BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712679820;
	bh=FDlhhqXXUUqRdmMllo+GQgjl5AGe5DPOH7xrc8MnbNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p/T8baGFTGmM25G3whPnIgBL7nGqU0pmCgdXGGMZuODRoDq6Jy54GI7QwyB14R4Yg
	 VXKrzL9kwih7BitrdrS4DUgs/NZ4rc50ac+lTwZBhwdzMeUFaNRCuNlXo1ygKZd2qI
	 VUYhD3wl3Ovo0DQ6TT9o/sQ3P5WP+HsFFztVq47Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DE48F805AA; Tue,  9 Apr 2024 18:23:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4F8FF80588;
	Tue,  9 Apr 2024 18:23:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE80CF8026D; Tue,  9 Apr 2024 18:23:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E9C0F800C9
	for <alsa-devel@alsa-project.org>; Tue,  9 Apr 2024 18:22:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E9C0F800C9
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruEFH-00088H-7A; Tue, 09 Apr 2024 18:22:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruEFG-00BKt2-Jf; Tue, 09 Apr 2024 18:22:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruEFG-00H3s3-1e;
	Tue, 09 Apr 2024 18:22:50 +0200
Date: Tue, 9 Apr 2024 18:22:50 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	kernel@pengutronix.de
Subject: Re: [PATCH] slimbus: Convert to platform remove callback returning
 void
Message-ID: <z2s24xyecxdbjmqbpysj2m4ebjad2yeuma33pvzduiyv5ap4t7@psz4d4wyrjwa>
References: <20240225001911.46196-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ex24qbuczfox3i6r"
Content-Disposition: inline
In-Reply-To: <20240225001911.46196-2-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: MVRONBVHE3MSAJTW6QTQ2NXP4LKQCC3N
X-Message-ID-Hash: MVRONBVHE3MSAJTW6QTQ2NXP4LKQCC3N
X-MailFrom: ukl@pengutronix.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MVRONBVHE3MSAJTW6QTQ2NXP4LKQCC3N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ex24qbuczfox3i6r
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sun, Feb 25, 2024 at 01:19:12AM +0100, Uwe Kleine-K=F6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>=20
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>=20
> Trivially convert the slimbus drivers from always returning zero in the
> remove callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

gentle ping. Who feels responsible to apply (or give feedback to) this
patch?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ex24qbuczfox3i6r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYVa1kACgkQj4D7WH0S
/k6nigf/eVi4R2FNm3XqCNfxM9brE7q7OzW+rZU4vQRkRIhPlz5q47EvNR0XXOAa
Cb652PeaaCpdgN16UEfwu+glm9tZpJgiYsdDlDyvDUPmjTnFJMMUm/EbEEmfGAi0
58ITc92RazK9LauLiahI9+fIy5X8B4lku7WE9VakDvJFe4f80XEtN81ExsZUk5nT
GrycHvWgxwAP0Dn+Nd/Bp7QbbucAYYbgOEiYOSxXo4+l4UEjmV5eCBL9JIDt2X7W
7wm/XgefnDgACffRsNbCc45h2eTK1GCGX28Wf57G5FdxqFMhIWHKxvK3rICsnP1l
J3/YEhJUPZKuJMDzQQqhrb7ML87KeQ==
=LxR+
-----END PGP SIGNATURE-----

--ex24qbuczfox3i6r--
