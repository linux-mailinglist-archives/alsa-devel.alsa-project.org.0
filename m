Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB03B43A2
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2019 23:57:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C6F41677;
	Mon, 16 Sep 2019 23:56:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C6F41677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568671029;
	bh=uqI2A8Mb2XVpDeRtg+98s5nn046t6FN3RRgNR2n5AaU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XzBXmMa4UsEu5lYwPf9zDjOT4qxJSZadB3PLwD4nkhbw1AWTaM3gVxns9yOvdhpCW
	 PDWpywUC3MGIQvGp1QhK//fuiHi/jSiJ6YbqXp/WqQ2QROMnV9ZzxeHLstHooq3UO1
	 dguz1BvVWtrafpp6+US2+9iJoU7mAzUyx2u6t4FQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D463F80535;
	Mon, 16 Sep 2019 23:55:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6881F80506; Mon, 16 Sep 2019 23:55:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA270F801DA
 for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2019 23:55:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA270F801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="bQjWmt7c"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b6Caq+T7s5uJYLSK4i/BJl+MMRKUFhC+Ci3qKF8EHYE=; b=bQjWmt7cagNLvIYxpZo5Pc+jh
 MrPMLyplGqoOfx3av/kSr2N5lu0mvnzj0qutsrteC7xOPPrJWwR9d1Bq2kfTiG0SkRN9A5vO/vB0l
 7MaEwjojejuMkM+wVY4EMM+fJ4y+HgV2grHawZpJJNK+oKrV1hxY9BOAQvNzZU59ASH44=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i9yxq-0005pC-5y; Mon, 16 Sep 2019 21:55:18 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id EE39A2741A12; Mon, 16 Sep 2019 22:55:16 +0100 (BST)
Date: Mon, 16 Sep 2019 22:55:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Curtis Malainey <cujomalainey@google.com>
Message-ID: <20190916215516.GL4352@sirena.co.uk>
References: <20190906194636.217881-1-cujomalainey@chromium.org>
 <20190906194636.217881-6-cujomalainey@chromium.org>
 <20190911102503.GV2036@sirena.org.uk>
 <CAOReqxhjf0YeUhCF9N8YOReZC11k01R+TR7N6J51fZV6YXBc4g@mail.gmail.com>
 <20190912092600.GF2036@sirena.org.uk>
 <CAOReqxi+tGx3wSjOLE0cdwpVMhqF8Aj0_PW=s_8JMd_Puws5CQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOReqxi+tGx3wSjOLE0cdwpVMhqF8Aj0_PW=s_8JMd_Puws5CQ@mail.gmail.com>
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>,
 ALSA development <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Bard Liao <bardliao@realtek.com>, Curtis Malainey <cujomalainey@chromium.org>
Subject: Re: [alsa-devel] [RFC 05/15] ASoC: rt5677: Auto enable/disable DSP
	for hotwording
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
Content-Type: multipart/mixed; boundary="===============2635831907348020156=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2635831907348020156==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d6Ruhs/CrrKSNzcV"
Content-Disposition: inline


--d6Ruhs/CrrKSNzcV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 16, 2019 at 02:29:32PM -0700, Curtis Malainey wrote:

> I will work to add variable inputs, in the samus use case it doesn't
> make much sense to use the hotword without the pcm open since that
> audio needs to be captured. How would userspace received the detection
> without the pcm open?

They broke it, they get to keep all the pieces.  Equally, if they have a
functional use case that differs to your hard coded one they aren't
prevented from using it.

--d6Ruhs/CrrKSNzcV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2ABMMACgkQJNaLcl1U
h9Bvdwf/af4SBl7R1SQ3rFIldvgCUIaRZ/8+nzf3wLOiOL03fEbv+ncx3NJW99J3
qhLRGaI+Qwkob9Bdc1/5RzXtjn345s9BP6zDv9K8v8LvX0gCYkg+b2ClO3WvPOv+
8kUb0s/18H164iSCyIPrryrz491Fw136qxL2e7Oo3Xn982wZqgoIRMppMXJzQgv4
v+NcMyuqHHXqgydUnXrDPAvpu85xInTqoJ93oC5ItQLb1YvWGwmSaz/7WdznsRY5
z0iMo6x6SagobceTsi6S49gqty7qlfh1Bje2EaoX8jD81FyxJm0NEE4+bloaavO4
iZtFBkTZXffJq4Rz9cpjk6HXwp98TQ==
=j1wt
-----END PGP SIGNATURE-----

--d6Ruhs/CrrKSNzcV--

--===============2635831907348020156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2635831907348020156==--
