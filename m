Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D09B62CC
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 14:09:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01D1C1672;
	Wed, 18 Sep 2019 14:08:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01D1C1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568808553;
	bh=znIvvVeCSdG1dnaIZWYgn/KdKCWQ9L/eqXH6psOab1I=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PchUSY29BHgfD41+1lBtHS3jVmlvURAFUpz9IJNmMISuvglFTv9yQFNVTw9A5laHO
	 isUKo/ZV3GDzhQny3PrMDo2m4LkQAhGB0DtFVse4NG20NeYfaKUEIigMD8fD/6YMsu
	 kItnpPWturMDQrGAwMeg+JrvJMzbDQLUo7vHvrXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFD78F8053A;
	Wed, 18 Sep 2019 14:07:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BB83F80534; Wed, 18 Sep 2019 14:07:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93639F804FF
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 14:07:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93639F804FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="fp194b2I"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sQAxrfKu/Y88r0D3fEOPIXJ3U9rPLWaX7UOrFXM/NBI=; b=fp194b2IhJF/vg7HyD5ln0Lvd
 QST717mPPPUjoivkAXi4gTYn4070shQw67lrYlZ1cUq4luBP+nMbO/RJghX7BubzIURprozcqtlRU
 uy3wYGO1jUYo106Ro76ZouhoW/zUySwRQl+epRFKchnGlwLD8k9h5th2KS0n03Jk0uZEE=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iAYkK-00054O-JM; Wed, 18 Sep 2019 12:07:44 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 16F472742927; Wed, 18 Sep 2019 13:07:44 +0100 (BST)
Date: Wed, 18 Sep 2019 13:07:44 +0100
From: Mark Brown <broonie@kernel.org>
To: "Liao, Bard" <bard.liao@intel.com>
Message-ID: <20190918120743.GG2596@sirena.co.uk>
References: <20190916210353.6318-1-yung-chuan.liao@linux.intel.com>
 <87ef0ewhnd.wl-kuninori.morimoto.gx@renesas.com>
 <567A313375B6F043A9BE3A1D9B8C6E7F0B49706B@SHSMSX101.ccr.corp.intel.com>
 <878sqmw8nh.wl-kuninori.morimoto.gx@renesas.com>
 <567A313375B6F043A9BE3A1D9B8C6E7F0B4970C2@SHSMSX101.ccr.corp.intel.com>
 <875zlqw411.wl-kuninori.morimoto.gx@renesas.com>
 <567A313375B6F043A9BE3A1D9B8C6E7F0B4970DE@SHSMSX101.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <567A313375B6F043A9BE3A1D9B8C6E7F0B4970DE@SHSMSX101.ccr.corp.intel.com>
X-Cookie: The devil finds work for idle glands.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "tiwai@suse.de" <tiwai@suse.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: core: delete component->card_list in
 soc_remove_component only
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
Content-Type: multipart/mixed; boundary="===============7182600608273124795=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7182600608273124795==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EXKGNeO8l0xGFBjy"
Content-Disposition: inline


--EXKGNeO8l0xGFBjy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 18, 2019 at 06:13:54AM +0000, Liao, Bard wrote:

> The original patch has been applied by Mark. Should I send a patch on top
> of the original patch or overwrite the original one?

Send an incremental patch on top of the one that's already applied
please.

--EXKGNeO8l0xGFBjy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2CHg4ACgkQJNaLcl1U
h9DK/gf9FwL33h2M7X/xZd7bN7VRpCmR8hOMExMO6kL4VaGKEwujZT8wviahzpqS
ZkVE1yxK5TFlewORD+v15sKTABRTqgHkdxu68TIlIeEbcBslXgYSSXsXluJMU+4a
t6rHPwmKf1cor/qJOu09GB/Y46DTcbXotuGlo9eSCO8IG00V9PoD8Iy2n0eJ8YbK
j6u0KOEC40DRqmHKyQxuojkLtm+nqT4Q0zpoPlcYR8O1KqxYHb+nUhRajHVZWcdl
Cpgj+Ol9qqUHtN1JR4WajcwJRKFVpuo10Dn18uW75QQfipjdCWRCh1qM+eP2HBHg
Cz4gT8N56ynsWspxtCgFD4b0hgiFWg==
=0Wz/
-----END PGP SIGNATURE-----

--EXKGNeO8l0xGFBjy--

--===============7182600608273124795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7182600608273124795==--
