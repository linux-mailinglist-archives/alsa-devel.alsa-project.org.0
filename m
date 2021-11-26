Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FA245EF9E
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 15:12:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80D021947;
	Fri, 26 Nov 2021 15:11:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80D021947
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637935919;
	bh=nkFAIxeULxrats2gaz7/1idop7mscGD/FIM112d6pfA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mjC6jisPeyBAWUIIMTK1Hfd6NWR0nwYiVXc3LHvGRiINNZObvdFQBMdh1I7k6A6nB
	 L7ga0gauPmF97woa0lxXJOvkRkZt4w0pCUUUDjjkiJVEcMZHlmQs0X3o9yeJeSFyj0
	 OjAmvuhyujVGXNiP5wwjENCP9V+1Bk5bbMdw7QVo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CE77F80259;
	Fri, 26 Nov 2021 15:11:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FE65F801F7; Fri, 26 Nov 2021 15:11:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABE98F80087
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 15:10:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABE98F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jvMrld3r"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5B0F2B827E6;
 Fri, 26 Nov 2021 14:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 700EDC9305F;
 Fri, 26 Nov 2021 14:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637935857;
 bh=nkFAIxeULxrats2gaz7/1idop7mscGD/FIM112d6pfA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jvMrld3r86pnkmmsUpxYNCMv309pbCFFffGyJSEAHjHzkCfcdNMYGWBW3HZKPlNoG
 qqJ0tpOGGfVCQRTBUqYCDqn63NkOA4CpltUjCZNDmmoCvNSKCq3X6+OuLLByA90cvd
 pRTpzZWb3704Pac3JzvJ0ce8JOOK+pv0I1dq4pFboK5WwpkEieoXwjZ80ERIQkN6Ku
 zXHur6vtF6esxhf1R5wnsbvE6DwFhuaeS/ee0oSoh0ztU69gd5l9KkhHe3gLp0kdp8
 +6+ucaHpEJgIARWa6cveMjZaAxit1l+ylrsiR4bCS+t7TL3AUFQpajkz9nDU+iP76z
 yusRo7aqJzwhA==
Date: Fri, 26 Nov 2021 14:10:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v5 3/3] ASoC: Intel: Skylake: Use NHLT API to search for
 blob
Message-ID: <YaDq7L1Mu++3UBL7@sirena.org.uk>
References: <20211126140355.1042684-1-cezary.rojewski@intel.com>
 <20211126140355.1042684-4-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="KkvRHr5mrZ8BDmsl"
Content-Disposition: inline
In-Reply-To: <20211126140355.1042684-4-cezary.rojewski@intel.com>
X-Cookie: You fill a much-needed gap.
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.com, hdegoede@redhat.com,
 Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
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


--KkvRHr5mrZ8BDmsl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 26, 2021 at 03:03:55PM +0100, Cezary Rojewski wrote:
> From: Amadeusz S=C5=82awi=C5=84ski <amadeuszx.slawinski@linux.intel.com>
>=20
> With NHLT enriched with new search functions, remove local code in
> favour of them. This also fixes broken behaviour: search should be based
> on significant bits count rather than container size.

Acked-by: Mark Brown <broonie@kernel.org>

--KkvRHr5mrZ8BDmsl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGg6usACgkQJNaLcl1U
h9ATRgf/dWzJNXV9Ai58nKADpt+C6mv3WPUd9QDMuuIszrPOIAafVUaUcnZb1Cfz
OzGTFEcAK/euZUtB6QTY4DMM+6cJOKywpKWHziL4e3Q2ZKiz3jlTVPVWBjUNEYdI
e+3wVn0/XlkV4oEyvs7oUDWo3xCC46+8Zhz5jucsfv5uHq12HZWPRi+b3GACiLhh
ckdv0ZNyDXSP2SnGKBaAEuc/uf5lyKtX6K6/kECqV7XH68APL0zZDKYDoGXa9+EJ
VyzPrQMmEU/Iy9gXpgSEu77nskKy9T+aXPBZK3+sMfD9Gb1Qo1lnBKnmCvJMgpuW
37zT5lnunHM3aKISRbq/Sm5xg+clDQ==
=TVPY
-----END PGP SIGNATURE-----

--KkvRHr5mrZ8BDmsl--
