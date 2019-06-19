Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E95674B74F
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 13:45:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68AAD16A8;
	Wed, 19 Jun 2019 13:44:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68AAD16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560944723;
	bh=u1b3Nn6ER60q6fzQhr+pf8JcEGMOP2c0jxUAyzlRu90=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XSWO+ff6VX9Tz6yTavuEhfmPpM0MrjDBckn/AjMi26JYSNkCZCMq6y8y3oT8LIYPL
	 7jL0tI6ZAOo1VwT2qBc2yHLsUhHG68PQzL2d/TnPM+8LofIZnZsTE97CGIZbw4SVJC
	 26kFF280uN7qasNI56j+UXUTs49LF6azy6c34UdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9763F896C7;
	Wed, 19 Jun 2019 13:43:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80179F896B8; Wed, 19 Jun 2019 13:43:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7396CF808AF
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 13:43:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7396CF808AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="GPOoCb7K"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=57qp21Rd838Utpx7s3eIN20MCkxADteDRKa8Zj+uohI=; b=GPOoCb7K6ltdmH0BLZGkDz5dV
 habLFNHzSrNDMsqw5zCSHoM0JCGbT45o158vZP9vCTk+YLG9zhonAeaaHWR48viol9wddv1rW6LfC
 KEjq1/c9EEBYnnGiGY6weypzGkif8XepKfu15qZmaSYRm7GyUml8f0i+o8Gs7YnCSUbgM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hdZ01-00075Z-5V; Wed, 19 Jun 2019 11:43:33 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id A06D6440046; Wed, 19 Jun 2019 12:43:32 +0100 (BST)
Date: Wed, 19 Jun 2019 12:43:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190619114332.GR5316@sirena.org.uk>
References: <874l4mt525.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
In-Reply-To: <874l4mt525.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] Question about pinctrl_pm_select_xxx()
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
Content-Type: multipart/mixed; boundary="===============8581529270060174900=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8581529270060174900==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YzytRCpZNWCht94M"
Content-Disposition: inline


--YzytRCpZNWCht94M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 19, 2019 at 04:22:11PM +0900, Kuninori Morimoto wrote:

> But, I can't find its paired pinctrl_pm_select_default_state().
> It looks strange for me. Is this really needed ??

It's in snd_soc_resume() for active DAIs, or otherwise when we open the
PCM.

--YzytRCpZNWCht94M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0KH+MACgkQJNaLcl1U
h9D7xQf+J95/dL5j3qJ5ylzIeHLWVUu/SZ5qfyDs5QXW3br7N8YztMFEYsusOPaW
DZ4DhuAZj64+5gxh/NnVXjAXvt34rXqHe7xYDbaQ6xIyjT8mvpuk1yvl3oD+94Yd
he9IMUso2q34RdRec6h1mqUxai+TdVHZPr5o2y0oGkyS2ojNKHV6ASg+2w78fcqO
gKJr5QNYEBqlnb/riaA4AbVzj08Qa2LTn+iCsG8bvbZhqJD3Rnqa7riDVdICmDfz
u9kU/cGIOwiH73ZzCbeg/7Cdu0IcXPRZpgkqy5J47bhKqaXeJFnYx/YvhMxOp3/B
pYG7C3ajtoleOQ8/K28rBVkfICqz7Q==
=H6sC
-----END PGP SIGNATURE-----

--YzytRCpZNWCht94M--

--===============8581529270060174900==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8581529270060174900==--
