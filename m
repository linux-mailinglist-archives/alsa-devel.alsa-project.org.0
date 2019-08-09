Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FCB87DCB
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 17:13:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C62B0165F;
	Fri,  9 Aug 2019 17:12:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C62B0165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565363618;
	bh=dWuq7MHd6ErrNcrlYSB9HA6OSdUWtwoMFSHfSH9iQ+E=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iJ6pXC4LsgQP0w6WCcp8/WDdwHLSq1N2H6g+8DTSBlJlgpv0PAyZCayQW1qnSG5FL
	 ktpQfBg+qx/0X35WRYL1L+Mo37XBdQcsZ6P+MD4TWsyzMLvgndMw8QmfUyT8HzrBN3
	 M0ze5yEjB81DWdah3O84d+YLp5MZiyY36okLHiik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35023F80391;
	Fri,  9 Aug 2019 17:11:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EEEBF803F3; Fri,  9 Aug 2019 17:11:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F5CAF8036B
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 17:11:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F5CAF8036B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="BgXLagGs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SDiIIHKH0mX658u0Bi3gbyG4ZfmHZmMJYPG0jCzNrec=; b=BgXLagGsCCDO+CndeZCSapQIy
 4vE6jKaJzLxlw/TpDuBdqGGwL6/81JMKa+G0qlH66Rp+HamYHe/CFCvic9oDLKFosM6bt3iiZkYuY
 QuYP8cPyoEPoEh9C8nMfO1gl5MlR/ABhlIKmJHO+czmQesczdjLGdAewTGEzrO3qDWp4c=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hw6YT-0006Kp-MY; Fri, 09 Aug 2019 15:11:45 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 3C6DE274303D; Fri,  9 Aug 2019 16:11:45 +0100 (BST)
Date: Fri, 9 Aug 2019 16:11:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190809151145.GE3963@sirena.co.uk>
References: <20190809095550.71040-1-yuehaibing@huawei.com>
 <20190809110100.71236-1-yuehaibing@huawei.com>
 <s5ha7cih53w.wl-tiwai@suse.de> <s5h7e7mh50z.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5h7e7mh50z.wl-tiwai@suse.de>
X-Cookie: Klatu barada nikto.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, YueHaibing <yuehaibing@huawei.com>,
 yang.jie@linux.intel.com, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2] ASoC: SOF: Intel: Add missing include
	file hdac_hda.h
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
Content-Type: multipart/mixed; boundary="===============3984859086076906011=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3984859086076906011==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tVmo9FyGdCe4F4YN"
Content-Disposition: inline


--tVmo9FyGdCe4F4YN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 09, 2019 at 02:55:40PM +0200, Takashi Iwai wrote:
> Takashi Iwai wrote:

> > Reviewed-by: Takashi Iwai <tiwai@suse.de>

> Actually I'm going to take this again on top of
> topic/hda-bus-ops-cleanup branch of my tree, so Mark, feel free to
> pull onto yours again.

I think I already applied it locally.

--tVmo9FyGdCe4F4YN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1NjTAACgkQJNaLcl1U
h9DRgQf/banNE1r4/WH27CPDpaxiqMQAQ8YwOySnqsMBgHlOnsO/s4SrwaIkKh+N
x6LbKhkkpRjDAsZ8ILqu4//DkrksxmWFs/j+XRHbPsbVsBTNReoshGfUQOrpjToN
qIEiYP2IOOO6UVozNlDWNarf2SOBTKKskNi6c2RmZBGJ8mvr58DYtezmtX13vVa/
MO4Zh2cEba+IV1d9RkNn5rARlLrAGt63o7/NsN+7GN4Bm3rUVy5KhBWdijO4KGlY
FgVFmbsw1e4bYyqwcLBrVb+I3D9KYLzKXo6tr8q1lYix+LurW0aBMGyn06UjLQ05
Gwg+/E7FTiFQo9cozC7H2xnQI5uB1Q==
=rnwt
-----END PGP SIGNATURE-----

--tVmo9FyGdCe4F4YN--

--===============3984859086076906011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3984859086076906011==--
