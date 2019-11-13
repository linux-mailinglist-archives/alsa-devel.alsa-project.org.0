Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2F2FB5D9
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Nov 2019 18:02:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D4851669;
	Wed, 13 Nov 2019 18:01:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D4851669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573664547;
	bh=s7QMDRzw2uvJ0F5+XugwnEjh7nr/BtB49elWtSrnytI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ImA+CI8lbmQs4eiN+em/Uabj7iCj5wlCFhuxtQrnheevxUSzhgwxH4o5UqXvdMTMy
	 mj/erXw2ibpWyMW9kiN+Wnxz/f+vq4vXQRS0H9Lvzh4eqayqDcJR+MjMQFC1x7zA6w
	 AX18pJyVj1+WvHgbdBGgqWcSQO01wPx2zc1XjP2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E896F80086;
	Wed, 13 Nov 2019 18:00:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0E66F80086; Wed, 13 Nov 2019 18:00:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26848F8007E;
 Wed, 13 Nov 2019 18:00:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26848F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="j33sSwFH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0NHzH3hpYIvUakDgXPMy6WsvjLTYMlQWMyrINcsl+1E=; b=j33sSwFHSP6R8ColR4DdxM4u/
 5eDcOVGRRaLAxa2A6DQQhwkzxJyqealRVfXz2VEZCWFH2wW8PV93vrFIbrHtj/JCeZnO+T6q4I3Wk
 OvOP6s5/h14b0leNngA+L+7Y3mkN3kd/TLc9l2QxyHCKKKBEk2uQ+3vnJhigxrtFrspu4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iUw0K-00047b-BS; Wed, 13 Nov 2019 17:00:28 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 382FD274303A; Wed, 13 Nov 2019 17:00:27 +0000 (GMT)
Date: Wed, 13 Nov 2019 17:00:27 +0000
From: Mark Brown <broonie@kernel.org>
To: "Harlozinski, Pawel" <pawel.harlozinski@linux.intel.com>
Message-ID: <20191113170027.GA4402@sirena.co.uk>
References: <20191112130237.10141-1-pawel.harlozinski@linux.intel.com>
 <20191112130237.10141-2-pawel.harlozinski@linux.intel.com>
 <20191112171022.GG5195@sirena.co.uk>
 <a65b78da-6faa-9b3d-312e-90c754a45626@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <a65b78da-6faa-9b3d-312e-90c754a45626@linux.intel.com>
X-Cookie: Type louder, please.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: cezary.rojewski@intel.com, patch@alsa-project.org,
 alsa-devel@alsa-project.org, tiwai@suse.de,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH] ASoC: rt274: Disable jack report IRQ with
 disabling jack
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
Content-Type: multipart/mixed; boundary="===============4182905817705859065=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4182905817705859065==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 13, 2019 at 02:55:53PM +0100, Harlozinski, Pawel wrote:
> On 11/12/2019 6:10 PM, Mark Brown wrote:
> > On Tue, Nov 12, 2019 at 02:02:37PM +0100, Pawel Harlozinski wrote:

> > >   		/* Disable jack detection */
> > >   		regmap_update_bits(rt274->regmap, RT274_EAPD_GPIO_IRQ_CTRL,
> > >   					RT274_IRQ_EN, RT274_IRQ_DIS);
> > > -
> > > +		disable_irq(rt274->i2c->irq);
> > >   		return 0;

> > Shouldn't the register update above be suppressing interrupts?
> For rt274 disable_irq is also needed, otherwise we're getting flood of irq's
> in case of not loaded machine board.

Through what mechanism is it needed?  If your machine driver is having
an impact on this I'm rather worried.

> > disable_irq() is a bit of a hammer and interferes with things like
> > possible share use.

> This irq should be handled in codec code anyway - control of jack detect
> events from non-codec code is done with set_jack.

The issue isn't that this is in CODEC code, the issue is that it's
usually very worrying to need to explicitly disable and enable an
interrupt at the controller level when the device appears to have
controls that should stop it asserting the interrupt when it's not
wanted.

> Similar solutions for jack report irq enable/disable flow are implemented in
> rt5640 and rt5651.

This may be an indication that those drivers should be improved rather
than that they should be copied.

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3MNqoACgkQJNaLcl1U
h9D7dwf7B1iTEeLycMXiPL/Hb3mQUqrziIEhUmU1cw6BQ3K/Ho0Vp1J1GVMx/HPW
xVR7TXNU05YgbvGTFCp/fN0qiC3KKs/h4DdiHiqCYg1LenwLmYFI4uPWWfpX3XZK
aOI4K5Q58QBUAt+jY/hkmArFi9TqhWwFRS4X/HV12tS0cqRqLu+aatQ8zcwDeiSh
85wWHkWa+iQ3UGpawLZUYAMjFzGSjw7va3jbXOqWTILXRPZyDKHnB8tasxvAWjOj
AQVOP4fSq+sTZqYEs/CfPI+/nURIkT/X8y+op6X4aBpKsuS4YQ1LAUEokTVPsV/w
4q/49o7HVWLQMYSMuGnfZ6bpgW5cjQ==
=D3rZ
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--

--===============4182905817705859065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4182905817705859065==--
