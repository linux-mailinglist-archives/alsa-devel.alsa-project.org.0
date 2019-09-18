Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D8BB676C
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 17:47:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2691682E;
	Wed, 18 Sep 2019 17:46:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2691682E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568821649;
	bh=JUoYm4IRT0QJnLle6YIOzlUu0iG+fCR5jW0dgSFBEmc=;
	h=Resent-From:Resent-Date:Resent-To:Resent-From:Resent-Date:
	 Resent-To:Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kqC/BI6vr7obQXRLhQcPs7gugMVm9LX1GedFnoUEekc4kR/kLl4j8sTFA0DMnQSSb
	 Est6vul6DsErn4bIum7S2eP7QiK+kwHK7FrrlzEZNeOI7ZmVZSSWhkbBRfR8Twi14k
	 GDQ1rLE5fiheQ6/1ijKFNtQfiJZOc/G9LfwcqVbg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF401F80527;
	Wed, 18 Sep 2019 17:45:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9567F80506; Wed, 18 Sep 2019 17:45:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1923DF800C1
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 17:45:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1923DF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="kHbodfzI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Resent-To:
 Resent-Message-ID:Resent-Date:Resent-From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Sender:
 Resent-Cc:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rUMoNwWNL1z50CS0M7MdxnWSzCW+XJ3JElR3BYk0YZo=; b=k
 HbodfzIuqbb9rgQosgPwzx/SjdHlUBgD6Ms4IlBzwEG0j3HivMRGDuGKNa378u99AX1j9fQCEDT2E
 PBU06Fkt/o+JaY5jXH2N/UCV0bEsrpR5xxa1XrG7X0K2bkDGzuTdpcmT2Eyrsof7c24KeGK69G9il
 Ik5NNf1GiQdLF19Q=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>) id 1iAc9C-00068n-4Q
 for alsa-devel@alsa-project.org; Wed, 18 Sep 2019 15:45:38 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 9DEF32742927; Wed, 18 Sep 2019 16:45:37 +0100 (BST)
Resent-From: Mark Brown <broonie@sirena.co.uk>
Resent-Date: Wed, 18 Sep 2019 16:45:37 +0100
Resent-Message-ID: <20190918154537.GQ2596@sirena.co.uk>
Resent-To: alsa-devel@alsa-project.org
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>) id 1iAbPQ-0005ho-I3
 for alsa-devel@alsa-project.org; Wed, 18 Sep 2019 14:58:20 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id F10BF2742927; Wed, 18 Sep 2019 15:58:19 +0100 (BST)
Resent-From: Mark Brown <broonie@sirena.co.uk>
Resent-Date: Wed, 18 Sep 2019 15:58:19 +0100
Resent-Message-ID: <20190918145819.GL2596@sirena.co.uk>
Resent-To: alsa-devel@alsa-project.org
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iAZT5-0005DC-0Q; Wed, 18 Sep 2019 12:53:59 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 666D12742927; Wed, 18 Sep 2019 13:53:58 +0100 (BST)
Date: Wed, 18 Sep 2019 13:53:58 +0100
From: Mark Brown <broonie@kernel.org>
To: "Liao, Bard" <bard.liao@intel.com>
Message-ID: <20190918125358.GJ2596@sirena.co.uk>
References: <20190916210353.6318-1-yung-chuan.liao@linux.intel.com>
 <87ef0ewhnd.wl-kuninori.morimoto.gx@renesas.com>
 <567A313375B6F043A9BE3A1D9B8C6E7F0B49706B@SHSMSX101.ccr.corp.intel.com>
 <878sqmw8nh.wl-kuninori.morimoto.gx@renesas.com>
 <567A313375B6F043A9BE3A1D9B8C6E7F0B4970C2@SHSMSX101.ccr.corp.intel.com>
 <875zlqw411.wl-kuninori.morimoto.gx@renesas.com>
 <567A313375B6F043A9BE3A1D9B8C6E7F0B4970DE@SHSMSX101.ccr.corp.intel.com>
 <20190918120743.GG2596@sirena.co.uk>
 <567A313375B6F043A9BE3A1D9B8C6E7F0B497238@SHSMSX101.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <567A313375B6F043A9BE3A1D9B8C6E7F0B497238@SHSMSX101.ccr.corp.intel.com>
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
Content-Type: multipart/mixed; boundary="===============9012152473322077969=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============9012152473322077969==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I3tAPq1Rm2pUxvsp"
Content-Disposition: inline


--I3tAPq1Rm2pUxvsp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 18, 2019 at 12:31:10PM +0000, Liao, Bard wrote:

> May I use your signed-off as first author since that is your idea? :)

Suggested-by also works for situations like this (and is a bit better if
you didn't get sent an actual patch).

--I3tAPq1Rm2pUxvsp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2CKOUACgkQJNaLcl1U
h9DJJwf+MelApo69LfNngQmqGRr1UicX8imEGwpIIDWO6oDXmrVp0gzIRpV2zTLw
Ao9QJuSYQX5Gf75XME5pTGkaMyyBkxlKoIZPClGiDlioH4KOBoKJUMBIzvPGPfqc
qa1n8+BBuElFMYuflBAhNuhXOVdo83QNFVfxq3/sVfAzaizHkQumppoqBLo/ZTZk
viAgsM1vEZyGbcpzO72yCm/o46Hat69nfpZoRJNgw2qfMUYEAghR4YDswY6i9A4X
+XauEQ6n3eJco2uPlYa6XYYRjMUWcDhK3WDiAojMs0YjzNjD/ipKtQrdWhj7wLMM
qXf6oOhriFDcXGvrT+qTBqabBvWibg==
=EPyo
-----END PGP SIGNATURE-----

--I3tAPq1Rm2pUxvsp--

--===============9012152473322077969==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============9012152473322077969==--
