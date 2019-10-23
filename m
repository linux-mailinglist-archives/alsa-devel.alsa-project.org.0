Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF4FE2276
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 20:25:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42D151654;
	Wed, 23 Oct 2019 20:24:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42D151654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571855110;
	bh=lSUKVkRZka6mjKM44GwYvdguw5alkK1OH9Fc0DwoIsI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mChZUdg77esIRrW89BaAH2grPp95r4hcYvodSSxv+aNzRaMxoP1HlqopTvuJIEZry
	 3q/rAjED8l7Csd3Qc6HpjlWQSSZBTHrsaLeCS1O6pyE24HGVLuLMdx0YKz8wRzE90H
	 24HeCSMj/mug6ou9M+C5Ov4AAsIVgyYbZsbjNHJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC77FF80321;
	Wed, 23 Oct 2019 20:23:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C84FF80368; Wed, 23 Oct 2019 20:23:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8824F80112
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 20:23:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8824F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="X+JGUuel"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u5hRKF+h8Gy91CW+b9a74EtsoCFozZV84a3mQliXVHc=; b=X+JGUuelWB0Kn4R0TIKBD3tQm
 M7thRbLfdNryNZkVJJ5CQHWAdVvu2rvVC7XpB2tGFSES4OT7djX+CrFInYQfknrl3eCCSqJDSzs3H
 aJU8HepFCdb/lHa1agIeY0+fwxW6BtYNsHoGGj9xoQxD0/gXyYALQ9v8SZxxyN5xOPQLM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNLHx-00015H-Tq; Wed, 23 Oct 2019 18:23:17 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 0EBB12743021; Wed, 23 Oct 2019 19:23:16 +0100 (BST)
Date: Wed, 23 Oct 2019 19:23:16 +0100
From: Mark Brown <broonie@kernel.org>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Message-ID: <20191023182316.GM5723@sirena.co.uk>
References: <VE1PR04MB64794B718CAA0CBAB38C3918E3680@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <VE1PR04MB64794B718CAA0CBAB38C3918E3680@VE1PR04MB6479.eurprd04.prod.outlook.com>
X-Cookie: MMM-MM!!  So THIS is BIO-NEBULATION!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "jiada_wang@mentor.com" <jiada_wang@mentor.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Russell King <rmk+kernel@armlinux.org.uk>
Subject: Re: [alsa-devel] Question about "957ce0c6b8a1 ASoC: soc-pcm: check
 symmetry after hw_params"
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
Content-Type: multipart/mixed; boundary="===============8259960660637020064=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8259960660637020064==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vdqwC0msT4ilQ2it"
Content-Disposition: inline


--vdqwC0msT4ilQ2it
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 22, 2019 at 09:28:38AM +0000, S.j. Wang wrote:

Copying in Russell who noticed what sounded like the same issue today.

> > On Wed, Oct 16, 2019 at 03:05:16AM +0000, S.j. Wang wrote:

> > >      The soc_pcm_params_symmetry can't take effect, because its
> > > position is after the change of cpu_dai->rate.

> > >    Is this an issue?

> > I think so, yes.

> Thanks, but how to fix it?  because I don't really understand this
> commit want to do, it is hard for me to send a fixed patch.

> Or shall we revert it?

Right, so that was attempting to fix a nasty DPCM case with fixups but
it does that with a lot of collateral damage which is causing more harm
than good.  I think we need to revert and change things so that we don't
attempt to enforce symmetry on anything that has fixups, anything that
has fixups probably needs to open code some constraints but the chances
are that they will be able to rewrite anything the front end does so
most probably don't need anything.

Can you code something up here and test it on a DPCM system?

--vdqwC0msT4ilQ2it
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2wmpQACgkQJNaLcl1U
h9Ds+ggAg/l2m/tJrU5aWhP3TLc+hYArhpEfEsxcoOw8LQ1JCIgWkAa4X1CBeZMe
wEqb6YmrCi2JuC5IM32eGbO4M9TVEqQmI+HZMv2CVC/TKmb4Xn+TxeqwOMpumNnU
BeBEb4Br1rPQGMhxvCKSQFLRXqRqndkhT3Osp8Kf+WnSY/7qa9jmXvNn82Po52V6
fn7lbtGgdtLySN4h0n04XXwV5Aar6bjyympmPA22IEP7G2V5/xHFGNU7Xcat9IZB
OlksQz0DfODIQTobhhBFaXXA/xPAuHq4yqij0h+AW3l5RojodoI6qJ4GGQZ+ewm1
3OQ340IgfLdrRNasR3DTigNhS5baZw==
=o/VT
-----END PGP SIGNATURE-----

--vdqwC0msT4ilQ2it--

--===============8259960660637020064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8259960660637020064==--
