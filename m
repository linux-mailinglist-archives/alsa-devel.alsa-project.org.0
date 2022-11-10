Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D065A6248B7
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 18:53:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CE6C166F;
	Thu, 10 Nov 2022 18:52:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CE6C166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668102826;
	bh=ZcPykWIpk5s9e2vrwgKLdGAbKNXsc6ph7Iki+uGNScI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qDHYz08toCAxmT0MHG4Fk6qNsYfJHL4NrKd5zXuFbo1uPQMm67d4uS9mFhsswUAnF
	 /5xf0goKSrJDrKEy3luZU2FYZYBmMmnukJ7gWZF+djsZxstu2LL6AusLzqMHDTqh68
	 9nvCO3Lw6FxuVsAoQ6cj9SBy7auEyHeUmt8Y0gXQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08D45F80114;
	Thu, 10 Nov 2022 18:52:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7439F8021D; Thu, 10 Nov 2022 18:52:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E29D1F80162
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 18:52:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E29D1F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eX5VHpfK"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 7F7D1CE2365;
 Thu, 10 Nov 2022 17:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ADDEC433D7;
 Thu, 10 Nov 2022 17:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668102756;
 bh=ZcPykWIpk5s9e2vrwgKLdGAbKNXsc6ph7Iki+uGNScI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eX5VHpfKEkecT9GuAts45R9ncQL9B5R5WATKgbSybrNpCdXfgDTBsI6bpwMa8qVhs
 sOrW2sVJnZQPbMWxs2YEbPQsLKOXBuRHTDneNJWvUH3pKErpwdTSGYQ2KPNzNZ03bK
 XF6dmFjPm+BqNs0jRRdxe9yKZOVKAuYP30s/yHmPYtcN0VJ9kIe9+4BmqCDjd6km12
 H6JAl+T9Led3/vmfvLwOETztJk2hBVE4BBl/zlA+dVEW6Ck1cc+s5ZCqa4OhoOM8g0
 5j3RhlPwjWKgg3qIKY/eK3l4IY/c7ZHRS3ZOYxrnCH+DjUGhnRynLnb2PS+7r9OG2M
 6GOLkufX7Ahuw==
Date: Thu, 10 Nov 2022 17:52:31 +0000
From: Mark Brown <broonie@kernel.org>
To: "yang.yang29@zte.com.cn" <yang.yang29@zte.com.cn>
Subject: Re: [PATCH v2] ASoC: SOF: remove duplicated included sof-audio.h
Message-ID: <Y206Xxh6EzMtsjy5@sirena.org.uk>
References: <202211092130548796460@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OHRMaM+i9JxFzi/y"
Content-Disposition: inline
In-Reply-To: <202211092130548796460@zte.com.cn>
X-Cookie: Dieters live life in the fasting lane.
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 xu.panda@zte.com.cn, yung-chuan.liao@linux.intel.com,
 linux-kernel@vger.kernel.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--OHRMaM+i9JxFzi/y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 09, 2022 at 09:30:54PM +0800, yang.yang29@zte.com.cn wrote:
> From: Xu Panda <xu.panda@zte.com.cn>
>=20
> The sof-audio.h is included more than once.

This doesn't apply against current code, please check and resend:

Applying: ASoC: SOF: remove duplicated included sof-audio.h
error: corrupt patch at line 21
error: could not build fake ancestor
Patch failed at 0005 ASoC: SOF: remove duplicated included sof-audio.h


--OHRMaM+i9JxFzi/y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNtOl4ACgkQJNaLcl1U
h9ALFgf9FR0vOAT5WQ7DCtUvqLitOITfGWOYrwq7eWwF9PK4fpF1seAXZHZ+ffMK
iQbp0DjxvkmVHhZE1KyCOnbbOQlcEcLKH0ogA1xLM78ZMa6kikhl+WtUU+D7wpOJ
SRC/Ln6au0SLTrnQxCJpm/M+8fb2mRkVAS5EW1PWXORKJZUE1YlPcfHDE/KV1FT9
tqvYnUJko3psg+uOl2EqIIQok7EB1x5IlgniiyaNz92w5dlJuo0gUBkYGRn1s+LT
A/CikTl4u5IwmK9Ev7U8+Y8QV9EQKhXi9h3ooIPSNbYMmrJEFh5xBQVmRvr47+v9
2/Vsd96qer2Wf8xYnsZsQs1DM53DvA==
=aTqP
-----END PGP SIGNATURE-----

--OHRMaM+i9JxFzi/y--
