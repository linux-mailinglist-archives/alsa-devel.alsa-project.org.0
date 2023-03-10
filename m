Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA9D6B4568
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 15:33:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23E6F18AE;
	Fri, 10 Mar 2023 15:32:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23E6F18AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678458814;
	bh=tkKZBBJlDi+Lv14fqzqj7YdyQrDSujAEGK1YCj0W8kI=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cp9PgohbnxR3DlQGe4ESUVchDNvxYMlqduPgY1gPH6W9opi/PvZXly8NljH4XNW5b
	 M3A4eTAuaJuYJJSuf5+b1zNbJqY0RAyDIKUSHPFKqKmBJg+aV4eEDS5Z9Qjr/jOSyH
	 xt6VLJBCS21QS1vPMClFTnX4VfNmgD3Xh6bWshcw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59A9BF80236;
	Fri, 10 Mar 2023 15:32:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9D32F8042F; Fri, 10 Mar 2023 15:32:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 773D3F800DF
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 15:32:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 773D3F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NmDlUq+/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E242361745;
	Fri, 10 Mar 2023 14:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A81C4339B;
	Fri, 10 Mar 2023 14:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678458753;
	bh=tkKZBBJlDi+Lv14fqzqj7YdyQrDSujAEGK1YCj0W8kI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NmDlUq+/+mTB6mVUEBoqkLC5cDbTsAkNTxUKVFSgnzil12x68P6QSNJVlX+nH6uON
	 FPF4lRlmhj5lhHBqawKV71aMAj6UaiTBNrGz9q6F7a12obceEQ+rjVUCfTPRKzKg2B
	 KcXY57fK4KRYYVGaTCbWMloeEil1dwRxVp/nwuaq7Wtqi3VinghTC07eeyY7nw7uM2
	 ZKaQHGJ4j9tyUbfKygX3dnf2XkKChNOvNa89DsbMkInGfVohE81m2A4zhRyhCO9Lri
	 GvfAQXML2fBypSdRDe3Nu+ksaQPcmZdFA25XWTi4HdSElRxrrkf3MzuAhdQD6l6GGJ
	 E1iSQb+u/+EtQ==
Date: Fri, 10 Mar 2023 14:32:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [RESEND][PATCH 0/2] ASoC: cppcheck fixups
Message-ID: <ZAs/fjWkCsq6U9vz@sirena.org.uk>
References: <87fsad2kzn.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jub5xImiUuUpi2DZ"
Content-Disposition: inline
In-Reply-To: <87fsad2kzn.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Single tasking: Just Say No.
Message-ID-Hash: THYNAJNSG3EYRIPAZR3VMNUQDTHC3UT7
X-Message-ID-Hash: THYNAJNSG3EYRIPAZR3VMNUQDTHC3UT7
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/THYNAJNSG3EYRIPAZR3VMNUQDTHC3UT7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--jub5xImiUuUpi2DZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 10, 2023 at 06:12:13AM +0000, Kuninori Morimoto wrote:
>=20
> Hi Mark
> Cc Takashi
>=20
> This is resend of posted patch.
> This patch-set fixes the issues which is reported by cppcheck.

Your subject line says these are ASoC patches but they're
actually ALSA patches - perhaps this cased Takashi to miss them?

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.

--jub5xImiUuUpi2DZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQLP30ACgkQJNaLcl1U
h9C9OQf/WE2WVSTXQWUjCS95YKDr9ROlnnpbv+V8/qTTxtjiVAQ0nNFzwQfC+8sF
mM6PRbU+1MhYg8z6ApG8RMzgTTBvnx0M3Iq+cnYb5eWALZ8xRpa4Uc8vLQv3I/bw
9UgDp9ba1gUHdE8BAYJNUwSb3Kv4uX8VZG77zvzlR0ecS0gl1qpERMN4qYbSA/wO
cETZMJVfh6ImmJI4Lc2JBkbNxh2/HBMehf4K8qcDkwZC0eziLFVqaj76qQGyVfA2
sUuQ4ThnFeNjx/aj/5O4iV90eaepuwuaT2I61HFBCDL38aG+zmMpJYOEsSdfF3en
J4Ul8cypqzh5q+srNz77kLROVptViA==
=I9ku
-----END PGP SIGNATURE-----

--jub5xImiUuUpi2DZ--
