Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F2AE864A
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 12:07:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAAED221D;
	Tue, 29 Oct 2019 12:06:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAAED221D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572347249;
	bh=S9HqGE6zmLOfikDSCrw3WFYfxGVD9Psw1KGPM8JrWsU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P967BZPxGkOVTgH6eK8j0pux8/zeFuj4R2lTlQl790acF4vPO6BxUQZOkcOCaqdaj
	 N8hB37JUGQEAyIkj/V5iqwk1JK83rRvj5QFPZTfaO3U+kZT2KL/V5WxXJD3eId3xRo
	 9Uq8P8cDl6XkYbebBzF7UmOfsXdBFnZSuDxzn3T4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29DF8F803CF;
	Tue, 29 Oct 2019 12:05:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D237F80392; Tue, 29 Oct 2019 12:05:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0994F800E7
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 12:05:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0994F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="OP/7Y4EY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XxiHtIhod+yCsF8mVDZtUYlcmhnJISlqww92ZNlpFgk=; b=OP/7Y4EY2r9HfjydoXmy5i6hM
 sp5gEyQVcbefKaBMJF7/Oc8xg0OJbFGp1If8A9kq/OG8hU8NtNVHgWlL365ggeAr/kEJC9BRtu0OB
 rEBg2es51H2P5EW9aAJ10S6BK35eR497oA29dFjn8GtJY2oshhTclwKXRKT6ihuLL2zzo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iPPJk-00024q-Qx; Tue, 29 Oct 2019 11:05:40 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 1314A2742157; Tue, 29 Oct 2019 11:05:39 +0000 (GMT)
Date: Tue, 29 Oct 2019 11:05:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191029110538.GA5253@sirena.co.uk>
References: <20191028185112.GA22457@sirena.co.uk>
 <s5hk18oty5j.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5hk18oty5j.wl-tiwai@suse.de>
X-Cookie: When does later become never?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Curtis Malainey <cujomalainey@google.com>,
 Patrick Lai <plai@codeaurora.org>, Daniel Baluta <daniel.baluta@gmail.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [alsa-devel] [ANNOUNCE] Draft schedule for 2019 Linux Audio
	miniconference
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
Content-Type: multipart/mixed; boundary="===============5791146175859594641=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5791146175859594641==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2019 at 09:26:00PM +0100, Takashi Iwai wrote:

> May I add one more topic, about the standardization / conformance test
> of kcontrol strings?  Sorry for the late action.

Sure.

> > If you're planning to attend please fill out the form here:
> >=20
> >     https://docs.google.com/forms/d/e/1FAIpQLSd6FV-tWYZ1fHlCmyzQhG98OtY=
H9W9GX-1dQ88mnLxVRGyPww/viewform?usp=3Dsf_link

> I suppose this is needed only for those who still hasn't registered,
> right?

Right.

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl24HQAACgkQJNaLcl1U
h9DgFgf8C8dxUoFPmsWrKTFb2NjfVN5hLWZtai7HxpGIgTJZZqARtixobfV2bScg
lV8hsAMggAjqDvUpYLKKlsigXA/pQ9PIdf9qf9pNiJvI/AKTkL2/gBaqKS7LSZej
mqdE8hw0MQnhgMRWQnOM7cSj6SwfeaEFqUImtkO7NOYG1pszacwQT7UkhPVe1IA7
o1qLEqUz18RV8nsVCaR81p0qhn0cRQRDhNk4koIY23MX4UVOVHQ8a63UHXK+db/p
3D2ShITFSJtWvwA/EkTCbmDnA73tZXEUTbAC4MTHcbb8vvide65Jg4xiomrYAQOB
WAP5QV1xJi9EIU1aDzOWtnz9WuthWw==
=dmdW
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--

--===============5791146175859594641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5791146175859594641==--
