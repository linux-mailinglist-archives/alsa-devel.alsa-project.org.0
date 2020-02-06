Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31636154394
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 12:55:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E56316A5;
	Thu,  6 Feb 2020 12:54:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E56316A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580990121;
	bh=PDa4WoV8gwCudO3NZPOR+V7xHTvkuiOhmCKXSRDWyVQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bm6qHSBUxcO738S4cEEbPkTeg+36knR/j7FZnNKoZuEoWr3JxbKY6/VOi8719hwlY
	 SZXsiRmT5FkDsF7N33qANOBBgVj1lcJtxDVHKWu2Qv8zwoDGhsYezI23BhNgewTghh
	 BEZu01tp5PdFRTOK8adbK+Mbp2rcrGn8POiGptms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A16F7F80059;
	Thu,  6 Feb 2020 12:53:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5DA9F80162; Thu,  6 Feb 2020 12:53:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8851BF800C6
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 12:53:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8851BF800C6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="pUITjQ3p"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1xvY/LZ5+BcQR7weHhsZteZ6jqaIUuGsop854FUfj5c=; b=pUITjQ3pQFD1iGesatTI0LM13
 pCcXLRX9bb5tSwiqiTWuNpk5m+4SiA0S57VmhPAdwTSBtgv0KOVM47iFSL72Yz6J641+LdTpBylLs
 USXeRP3xOr2yG6Ggs6B9Nb8mLaNdfC2esiFrcoEjxaxqDBEUg/uVfMwYaCNpzXoCbM/gw=;
Received: from fw-tnat-cam3.arm.com ([217.140.106.51]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1izfiw-0001df-WF; Thu, 06 Feb 2020 11:53:35 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 5D3EFD01D7F; Thu,  6 Feb 2020 11:53:34 +0000 (GMT)
Date: Thu, 6 Feb 2020 11:53:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Prashant Malani <pmalani@chromium.org>
Message-ID: <20200206115334.GO3897@sirena.org.uk>
References: <20200205190028.183069-1-pmalani@chromium.org>
 <20200205190028.183069-12-pmalani@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200205190028.183069-12-pmalani@chromium.org>
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Guenter Roeck <groeck@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [alsa-devel] [PATCH v2 11/17] ASoC: cros_ec_codec: Use
	cros_ec_cmd()
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
Content-Type: multipart/mixed; boundary="===============1058287103047193659=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1058287103047193659==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wmfuW8osuO2pi9jF"
Content-Disposition: inline


--wmfuW8osuO2pi9jF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 05, 2020 at 11:00:16AM -0800, Prashant Malani wrote:
> Replace send_ec_host_command() with cros_ec_cmd() which does the same
> thing, but is defined in a common location in platform/chrome and
> exposed for other modules to use. This allows us to remove
> send_ec_host_command() entirely.

Acked-by: Mark Brown <broonie@kernel.org>

--wmfuW8osuO2pi9jF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl47/j0ACgkQJNaLcl1U
h9Cy5wf/Zyo5kGxMlBNTGiB1Kyc98OfbEGfmx/48+5hLnPqdcYy9Gef8m3gVlQPs
6No9zS9XjFOYA4kfxQGhcTc7EeOtwZ6DFVUi37wPQqrrnFXeP32LjyakdbF1gfjV
M4b1veTxJ+JJt9nSkgZpISzeQkP0wAjy+gy/cQH41BPv52X3jVP1CxpaqX67bQSj
cnqbJQK2BXFhr7/EoxxXZTEiV1e9zP2Se5xSpZGnaXjzIGpu+McGxRowQ6LL/29u
xCFWXss8tY+PDRomjc9OnYFIAKkXDtCDvC3nObn1j2GzoyNsxlxJiSeYkm5abfxZ
YaEuSMCW4PRRF1XG6ixWpt2jbgYLRQ==
=4B9v
-----END PGP SIGNATURE-----

--wmfuW8osuO2pi9jF--

--===============1058287103047193659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1058287103047193659==--
