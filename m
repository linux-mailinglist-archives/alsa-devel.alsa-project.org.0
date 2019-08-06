Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 425F483762
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 18:56:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4C9415E5;
	Tue,  6 Aug 2019 18:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4C9415E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565110581;
	bh=wzvVRpRg3YUbXtHp7UpfTr0KnK0J9YfmVtQZev1QXqw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O6qtepTFnTpH0u6K5AxRoK4Vb13DzHVLbKdIvPasB9zFdaMOpAL2GtehBUzYb/CKM
	 sL407sPQ24q0FJdK5CpQ0O/N8CQKYAYuWCl90mZPGY6XjxxokfEsVg7Xg7O0mPPM5g
	 q8Kwe8U/6mA7RSdNr1wZInmp20Czl8pVLULUloZw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AB57F804CB;
	Tue,  6 Aug 2019 18:54:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE835F80483; Tue,  6 Aug 2019 18:54:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98378F800F4
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 18:54:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98378F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="w6MgB4Nr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D6UkvmMJvrmooBck230CoDmQIZWNRSlSpCRDOC80Dqw=; b=w6MgB4NrnRmIGhoZ30gHUhrOZ
 9f0DoK0XNBzwlRkUt+DZPfZ7Ku9v1XE4iABdkaCfKZo5ByjdgckH9De21PpMXDlAWestP9tUn5yX+
 QDwgM1eENRyq88NKa0n1jxYEEe875bi1+0Z77bkPCLNlUFCZGlGuEY6rnc/cYEpF27aK8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hv2jI-0005Bc-0Q; Tue, 06 Aug 2019 16:54:32 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id F23892742B67; Tue,  6 Aug 2019 17:54:30 +0100 (BST)
Date: Tue, 6 Aug 2019 17:54:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190806165430.GE4527@sirena.org.uk>
References: <871rxz3x7e.wl-kuninori.morimoto.gx@renesas.com>
 <87y3072iib.wl-kuninori.morimoto.gx@renesas.com>
 <f7a47bad-b680-cbd2-2341-7be081ac4b2c@linux.intel.com>
 <20190806162258.GD4527@sirena.org.uk>
 <d80703b2-be84-608d-0048-1f24a1fe7ebd@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <d80703b2-be84-608d-0048-1f24a1fe7ebd@linux.intel.com>
X-Cookie: All men have the right to wait in line.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] [PATCH 02/28] ASoC: soc-core: set
 component->debugfs_root NULL
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
Content-Type: multipart/mixed; boundary="===============2662377586668074435=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2662377586668074435==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IU5/I01NYhRvwH70"
Content-Disposition: inline


--IU5/I01NYhRvwH70
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 06, 2019 at 11:46:28AM -0500, Pierre-Louis Bossart wrote:
> On 8/6/19 11:22 AM, Mark Brown wrote:

> > ...with this, the two in combination add protection against a double
> > free.  Not 100% sure it's worth it but I queued the patch since I
> > couldn't strongly convince myself it's a bad idea.

> I was only referring to the first test, which will be duplicated. see bel=
ow.
> The second part is just fine.

> {
> 	struct dentry *child, *parent;
>=20
> 	if (IS_ERR_OR_NULL(dentry))
> 		return;

Oh, I see it's got a NULL test in it.  TBH I don't think it hurts to
check in the caller, it avoids someone having to check to make sure that
the NULL check is in the function.

--IU5/I01NYhRvwH70
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1JsMYACgkQJNaLcl1U
h9DuJgf/TuotBtghx6a4Qp7kdbnrgurCNu5qlYUF+WIJf0XHQQEk0IHOtFDALJrG
Y7q/s9ea7VPPcr2/Jqao4Y4dalSuRguobLBeQg4bG+CC/kFb9L2DTwzxkflgmebn
BDk4l+uEqzyea0s/x50b6c2rlf1OrpWElllgqF63okJzFYfhw7usLkH0+AnhYWJA
Fqo5uBzx/pY0N/QXTQbzdYpkMwobrp3GKtaexZ3/w4kt+GFPWdgQsoH0N42CaY4f
jGYR9AN/tCQdO+v6Md+wnz/qVud9s0KwJiIKIHWZfPbm6vi6o9o6i9LgqUY0K5Xk
Fep26C/sZIkDlfX0sX0v+9vbmLuf1A==
=9Es5
-----END PGP SIGNATURE-----

--IU5/I01NYhRvwH70--

--===============2662377586668074435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2662377586668074435==--
