Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4246ACF7C8
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 13:08:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAC8415E2;
	Tue,  8 Oct 2019 13:07:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAC8415E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570532914;
	bh=XoukFCdTjLO3NjcMDBXHCmD2+hNhxgtkJGKhXekLFIo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bP+rCFB+Q6aNh1wVRxmN7WCTHVZleOZFsytYhBh+N7t+K7CD6ujqCQtnT3i5/m4Mo
	 WZVhf2M6GYyKnZpPeKRR0NIapTJ9P2GMV1IhbEjC/CRsbvHRKPTf0WfkHg38nlIwYq
	 A/IqHVwxpv4BK4g85ow9uOYkVqJpBftYtfXUDeok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F522F8045E;
	Tue,  8 Oct 2019 13:06:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6ABE3F80113; Tue,  8 Oct 2019 13:06:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BB99F80113
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 13:06:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BB99F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="TaovEU+H"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c0a2chX4VAvtbSqAeBw3P/EwH1b7nS9q7iWbEjgfD+k=; b=TaovEU+HJae8EYFeWr96Aok5Y
 cHohnDk5ySpwb5Y+oP9O3yF58qimNY8w2OG4z+pJwvTBpNjUWgglm5NP+xl9kEzpSLpB3HhB2d5rw
 PjnxRXwatmCTtJC37dmRErt/2/+XAkbYDB7DlVwGOTzqJoURaQlpmQgbOBEfyZCGR0dRY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHnKG-00086U-Lr; Tue, 08 Oct 2019 11:06:44 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id EB5132742998; Tue,  8 Oct 2019 12:06:43 +0100 (BST)
Date: Tue, 8 Oct 2019 12:06:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Cheng-yi Chiang <cychiang@chromium.org>
Message-ID: <20191008110643.GD4382@sirena.co.uk>
References: <8f933cee57fc4420875e1e2ba14f1937@realtek.com>
 <20191008105138.GC4382@sirena.co.uk>
 <CAFv8NwJ+g+ESJJ5JxaLHADhBASKsjTE7pqY=HhcZZcT2Yy+Ygw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFv8NwJ+g+ESJJ5JxaLHADhBASKsjTE7pqY=HhcZZcT2Yy+Ygw@mail.gmail.com>
X-Cookie: Do not disturb.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rt1011: export r0 and temperature
	config
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
Content-Type: multipart/mixed; boundary="===============0827135793017167061=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0827135793017167061==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rqzD5py0kzyFAOWN"
Content-Disposition: inline


--rqzD5py0kzyFAOWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 08, 2019 at 06:59:57PM +0800, Cheng-yi Chiang wrote:

> The calibration data (R0 values and temperature) were measured and
> written to VPD in the factory. When machine driver initializes sound
> card, it reads the value from VPD and uses the exported API to set
> calibration value for codec. The purpose is to protect speaker. This

So the VPD is not part of the CODEC?  One question would be why the
CODEC driver doesn't directly read this information.

--rqzD5py0kzyFAOWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2cbcMACgkQJNaLcl1U
h9DMhQf+NJpu4cUgUPFZdp9igSfLG3LYHaAYCJp3usKR+iAxZKonNQQ9+JloQzkD
cG1NNf/xrTbPzpNsUgxTbclBQnHVGs4T/a/UgyZ/hbdW4sUVZxqNVXeY6ddx5qWI
cIjR7jJXuM8xxq6A+74wD81Y6MlU5Ile19azCFqckVrilmvAu15kwtEqkT6NJNbv
gDwifhEaXJcbrTVJCPglYgMGQLjC6NDcgUSAF0Jf9Oyd/We4DcIr8lorOn3qf74l
YGz5cW6Oki3ScZv2y8NSowFlNjH49qq5poc7mFmWsRfY/Fpy3CgelSYKzBBZiuqk
JJjh4h62oYWt0v96XH4RgYhkglRLbA==
=dfnZ
-----END PGP SIGNATURE-----

--rqzD5py0kzyFAOWN--

--===============0827135793017167061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0827135793017167061==--
