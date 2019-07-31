Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 561617C25A
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 14:55:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA76B16DD;
	Wed, 31 Jul 2019 14:55:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA76B16DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564577757;
	bh=+A4Y6L+Wcdn7Hpr199FeqD7hGf7ybtVDeDsK9Zj9uNw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NcUACLrblLnlhVvGp6+die3q3+R79gRV4PzhQpUisMOSo5lsDxoQMixD1ujfCv0eC
	 Vdmwan1kDsUY3Dj+XlheTU4hclCdesKDo4R/eIOCcxWUswF25a99SL2aztUFLRqBGo
	 XDJfJUaiEWY7MlzvW1fPN51G42FLHJTeMCKjJ/vM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30713F80214;
	Wed, 31 Jul 2019 14:54:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BA02F80483; Wed, 31 Jul 2019 14:54:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DC5DF800C0;
 Wed, 31 Jul 2019 14:54:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DC5DF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="tdwg0O4b"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hbbMMfWi75+Dxhj5X8uGKcuoGItzZWC/ENrNq1fc2mw=; b=tdwg0O4bR66olDf8rL/VOPZl0
 UKuE06QucBVslz73FfsoclVqWarqJU/2DCQ9XkTzK97ix/PaG2FBSTG/ssfA6k30ABJSPV/adm+xX
 t7Zqc9eHFNEgYowayt5yOLZ9koRQajRalhK6g7Mc5r7x9d3HsIjrJSq1BrHGY4PYqRFck=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hso6s-0002GK-IS; Wed, 31 Jul 2019 12:53:38 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 62CDC2742C99; Wed, 31 Jul 2019 13:53:37 +0100 (BST)
Date: Wed, 31 Jul 2019 13:53:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Message-ID: <20190731125337.GC4369@sirena.org.uk>
References: <CAEnQRZBPnmg6c762+CjXBmsW8=aVfL9iJJgV_7VRjgaNMf-Srw@mail.gmail.com>
 <5c835d3ee9b2dcb4bfcbd0af5b68e09401ee8bf1.camel@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <5c835d3ee9b2dcb4bfcbd0af5b68e09401ee8bf1.camel@linux.intel.com>
X-Cookie: FEELINGS are cascading over me!!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, sound-open-firmware@alsa-project.org
Subject: Re: [alsa-devel] Audio miniconf + sof meeting at ELCE, Lyon
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
Content-Type: multipart/mixed; boundary="===============5464173358881371023=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5464173358881371023==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+nBD6E3TurpgldQp"
Content-Disposition: inline


--+nBD6E3TurpgldQp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 31, 2019 at 10:32:00AM +0100, Liam Girdwood wrote:
> On Tue, 2019-07-30 at 23:04 +0300, Daniel Baluta wrote:

> > Will you be in Lyon for ELCE this year? I'm very interested in
> > participating
> > to an (eventual) audio miniconf meeting. Maybe we can also do a
> > separate
> > SOF meeting if they are enough people interested.

> Yes, Mark is planning the audio conf, we are looking at ELCE or
> gstreamer.

> I'm now getting costs and availability from the Linux Foundation so we
> should hopefully have an update soon.

Linux Foundation are likely to be an issue as they insist on people
having a ticket to one of their events to go to anything they're
hosting and neither Takashi nor I will be going to anything.

--+nBD6E3TurpgldQp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1Bj1AACgkQJNaLcl1U
h9BrNQf/Ts7CFOLBDOm9TNYaMuTHSypEsDu1ST+rwmnyOga5UshbMb55noZ07HXS
ypBCmSU8cnNg3vogUc99emHPnmzWeyUm+JONxNuMsQZFZoq1lMelE94JoMyerhsm
eEzv/82+kYv9Bp5HfIUIIdHorPBjKZleaXgjPflf1T/mXbnDM+HbFRkjBvxfoSIv
5wwK7wzv8tNW80VtP2kOPAZzZY7swhY4GQFRPJeSU72krAVPuPdk5lCjPtZB0Vvp
cCeEk9MhxudsOt5TIElr7J3lxgN1W6IeKifZEQ40Z9HgyzIMykCBp2sCWpjIsdM+
hM3DSIuhyX6qz/n1XW8pTFLdUDnJZg==
=OqfR
-----END PGP SIGNATURE-----

--+nBD6E3TurpgldQp--

--===============5464173358881371023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5464173358881371023==--
