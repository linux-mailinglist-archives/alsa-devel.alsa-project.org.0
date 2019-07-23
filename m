Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3BF71CFC
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 18:34:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E836818CD;
	Tue, 23 Jul 2019 18:33:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E836818CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563899654;
	bh=JZsTRnE5VI35/H9AtFTWFKDKG2hvrFR8f1Jhxj+opQ4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A1Rl2G+l8nTfVZjdmLFU6TvET4J55bk8QereGvSTxV3aNfZbKkzlRhpBkkgykHIuM
	 sV16yXRVJSOeezCAcFAjgpfyH2rbhnYa7HDN9T6NWYOOzrQy+NRJqLFeFN6U8p4Ype
	 4xhToU7T+YYp9WowNa0BDiRqt9toD6mSqqyIhecg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AF01F80447;
	Tue, 23 Jul 2019 18:32:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D556F80447; Tue, 23 Jul 2019 18:32:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8530CF80227
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 18:32:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8530CF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="fSYoPJM2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2Hd3baD1CEfaPrpmnms9Gk3HukyKFOF01/Wyevt42Vo=; b=fSYoPJM2E4IZOtQtLzK+A3kJ+
 jFyCqk+YG7P4QEAJ/jrcEoN/lG2uyRxtBwrXcCFmZ+wtvBgs+GjLlFNJW0pwZIr9R1yQt84guFu87
 VDQqXQGAN5KwIm2tW7Xu1TRF5Nv0Wmw/y7s9wFJPM46hfapCR+iXahchZ75fJlj5Cr2os=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpxg3-0004FZ-8S; Tue, 23 Jul 2019 16:30:11 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 3F2B32742B59; Tue, 23 Jul 2019 17:30:10 +0100 (BST)
Date: Tue, 23 Jul 2019 17:30:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190723163010.GK5365@sirena.org.uk>
References: <20190722141402.7194-1-pierre-louis.bossart@linux.intel.com>
 <20190722141402.7194-19-pierre-louis.bossart@linux.intel.com>
 <20190723111515.GD5365@sirena.org.uk>
 <cabe9c2b-359d-deb6-93ee-e42b1400ea27@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cabe9c2b-359d-deb6-93ee-e42b1400ea27@linux.intel.com>
X-Cookie: Avoid contact with eyes.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 18/21] ASoC: SOF: Intel: hda: fix link DMA
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
Content-Type: multipart/mixed; boundary="===============8681604099960430464=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8681604099960430464==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BFVE2HhgxTpCzM8t"
Content-Disposition: inline


--BFVE2HhgxTpCzM8t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 23, 2019 at 09:37:47AM -0500, Pierre-Louis Bossart wrote:
> On 7/23/19 6:15 AM, Mark Brown wrote:

> > In general fixes should come at the start of a series so that they can
> > be applied as such and sent to Linus without getting caught up with
> > dependencies on development work.

> Yes, but in this case we had two developers that changed the code and I
> couldn't really move code around too much.

Might be worth pushing back on them to pick a better base for their
fixes (and possibly work out a way to get that stuff sent out separately
rather than stuck with a big queue of other stuff).

--BFVE2HhgxTpCzM8t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl03NhEACgkQJNaLcl1U
h9Asngf/Ro6eQOO7WK5Qh0xxpUKRiLrWJJYcjJ7mvV2DJLBkcV07pe+3ukNaMUGU
tAzxGtGNcYUc/r21We8pkqKQPtaSHiqAJFoHh+EeY+lFXhV4TLkoSmbSUfziae+3
DI5RecWh6VnrWzZW2q6TD4okwk1bFcZWq4IKeA03xUSRwnGhZtaPENAD3wXS0EPs
/Cv4Iox50np7TIzPrc2ZGg6Z5i8+LmPJp6WPF/IiIIvWeR66HQI0BGSZzK99ZWpJ
3KU3ImFkc0/+e6DS971yu1SnUARf1E4cLJ0NgSldcpnJcadljyPu0Hi6HxgxCdiZ
7Dq3l5/k/3AgTZZ87narqo1LsQBBTw==
=cF/3
-----END PGP SIGNATURE-----

--BFVE2HhgxTpCzM8t--

--===============8681604099960430464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8681604099960430464==--
