Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D25EE77B960
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 15:07:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2DE0208;
	Mon, 14 Aug 2023 15:06:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2DE0208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692018451;
	bh=4DceL9KcHwWQ+Cgmj5RYuHHEBdgdMe9pj2q7texqDIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jDUuPQC8bpPsUKAxKvnPid42ymC0npdCK9arQ998oqoibzXAcyEq1FLIwKkmuGr9a
	 2R/UnAyHXM5m2v39HNRHxPu4s8+ptl2bG2p+8ZWqzjuJpixAcj/zNs3fT23WOb/9qa
	 727FqHq1/VgDEdT5p8x4x1QpSX35h+yJgH1lpvxU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 378D9F80510; Mon, 14 Aug 2023 15:06:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00D35F80254;
	Mon, 14 Aug 2023 15:06:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A094F8025F; Mon, 14 Aug 2023 15:06:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4714F80074
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 15:06:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4714F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TITz5O/3
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1037F61217;
	Mon, 14 Aug 2023 13:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02580C433C7;
	Mon, 14 Aug 2023 13:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692018392;
	bh=4DceL9KcHwWQ+Cgmj5RYuHHEBdgdMe9pj2q7texqDIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TITz5O/3gIKn5GUU3om6d4hipptoJo9YS0ebS1rOaIJBI7XZKnxYY3k1d5abuJoRn
	 WILPfL9Wka9Ir1ohTb5vgdOsWXzZicfvz84jYLbNurywPIwusswHbkx1BS01rtJXNV
	 JITK09jY8uMyjbztdsZlYvuibLfx6QHLLI/FiT+4f6lOvlfPOheLWXR3mGfW4ge3H3
	 lwB9qpniN6g2DVzVEsW2TyyUGMrasGy53V535bCDkHprpV1LjFh8nJ2d5IdLQdUJKE
	 W5LiGvSuEh9TN8E/9lJtlEZ9bEnEi03oroJLJzUfoS3RH3BI2xO2ycB4w0F5AeXwvz
	 nrGiQwoxNwyhg==
Date: Mon, 14 Aug 2023 14:06:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>
Subject: Re: [PATCH 20/25] ASoC: qcom: Convert to generic PCM copy ops
Message-ID: <c7fbc486-8e3d-46f9-88f2-e15f35e66149@sirena.org.uk>
References: <20230814115523.15279-1-tiwai@suse.de>
 <20230814115523.15279-21-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vxNJttPmjSY0Llhd"
Content-Disposition: inline
In-Reply-To: <20230814115523.15279-21-tiwai@suse.de>
X-Cookie: FACILITY REJECTED 100044200000
Message-ID-Hash: JDF3MICJ7PH5F5L2ZJTRPLMDYIW5E2DW
X-Message-ID-Hash: JDF3MICJ7PH5F5L2ZJTRPLMDYIW5E2DW
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JDF3MICJ7PH5F5L2ZJTRPLMDYIW5E2DW/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--vxNJttPmjSY0Llhd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2023 at 01:55:18PM +0200, Takashi Iwai wrote:
> This patch converts the qcom lpass driver code to use the new unified
> PCM copy callback.  It's a straightforward conversion from *_user() to
> *_iter() variants.
>=20
> Note that copy_from/to_iter() returns the copied bytes, hence the
> error condition is inverted from copy_from/to_user().

Reviewed-by: Mark Brown <broonie@kernel.org>

--vxNJttPmjSY0Llhd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTaJtMACgkQJNaLcl1U
h9BaHAf8CmSE+u2aE3htHE9hbFad/tLmWLTNyST1EuzVnzF2gCUsGbMbEFxSUvqn
YmKboT1SXtQRr+tvSAmb+CCHgMN/krVgb57xi6wC8uI8SlVa7Hld99Ki14ugHtGk
PdQ3qSCEUNSSMOSKDzMu6hdUiE3gISeeBn/z4BY28qcGNtGGfXJFig1Zq5HJaXnn
jN9QZAHEVsg/vHof8nYY9p0a7FdxNBlN39l1gM/0lm+rNgY+dqSXbeh4mMv5MLjj
RGocfUX+hD8gO9OcqmpOcs8gk0ImWk+COWd/1Td4+AvZOMd82tptu615whIADpV6
fhQyTz/bYwb+YTSEoR2b316L4Y/n5w==
=Xez9
-----END PGP SIGNATURE-----

--vxNJttPmjSY0Llhd--
