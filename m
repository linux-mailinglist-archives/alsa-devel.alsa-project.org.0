Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B34ADF5E2
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2019 21:21:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E62B31660;
	Mon, 21 Oct 2019 21:20:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E62B31660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571685670;
	bh=GSZtQd0XxIeTRAxxuCkdMcmLhPT8soklZ1/IbD3SbWQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i84EcL+VXkHE5kYi19Q7lRVxPHqcdjew3cC/8BIl+RJYYpW5gnngrOMs5Ra/on3BB
	 a7LEysJOzJAYcicfy/lksz+KsmBwfq43QJrDT1koUdrCNUi+QxsD94lkqSKK3PYAs3
	 8J3mDlrbRGQ6jXIU7C2F/sblEp8zoEVdkJPnNYjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBE4AF80393;
	Mon, 21 Oct 2019 21:19:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3769AF80368; Mon, 21 Oct 2019 21:19:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF172F80112
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 21:19:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF172F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="mBLChD9P"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=brqHLSqW034xUjg25k96LodDI1WD7RVmXUV/2qyESS8=; b=mBLChD9PsMfgYTGwhVgyGlTK4
 XDOFrB4bUzi2YqZdkidvvj4WhFCmpmvKG0hDHVfdwGbtF6fY1yuRSSb2kOaH6my7yXxjvG1OtaJPu
 QONo4v9CNc9p4W/Bz2Pg0Fbq0pn9kEP+Mi3vA5LZ0l0fIRzXIFfcZZ0/IAmUrOunhAA84=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iMdD0-0004in-2j; Mon, 21 Oct 2019 19:19:14 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 910CF274301C; Mon, 21 Oct 2019 20:19:13 +0100 (BST)
Date: Mon, 21 Oct 2019 20:19:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20191021191913.GI4691@sirena.co.uk>
References: <201910110016.g5AIyc2E%lkp@intel.com>
 <f6f9a0a1-2a24-300d-ef15-eb3f678f2f63@ti.com>
MIME-Version: 1.0
In-Reply-To: <f6f9a0a1-2a24-300d-ef15-eb3f678f2f63@ti.com>
X-Cookie: Why are you so hard to ignore?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, kbuild test robot <lkp@intel.com>,
 kbuild-all@01.org
Subject: Re: [alsa-devel] [asoc:for-5.5 122/122]
 sound/soc/codecs/tas2562.c:195:14: sparse: sparse: restricted
 snd_pcm_format_t degrades to integer
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
Content-Type: multipart/mixed; boundary="===============8108567882362069855=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8108567882362069855==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BWWlCdgt6QLN7tv3"
Content-Disposition: inline


--BWWlCdgt6QLN7tv3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2019 at 07:13:38AM -0500, Dan Murphy wrote:
> On 10/10/19 11:41 AM, kbuild test robot wrote:

> >     190	static int tas2562_set_bitwidth(struct tas2562_data *tas2562, i=
nt bitwidth)

> The only fix I can see here is to change bitwidth to snd_pcm_format_t as

> But that still gives this sparse warning.=A0 The way the code below is
> written=A0 to be consistent throughout the drivers so are these warnings =
false
> positives?

I think so, yes.  Or at least I can't see any sensible way to stop this
anyway.

--BWWlCdgt6QLN7tv3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2uBLAACgkQJNaLcl1U
h9DUrgf/eyj3S/jItbvdnLw4GBBWhs6veLOW2LrptEdoaNy7YgzV8PkkJ63BPF0O
u+8VdeGBvqHZopzMtRyN8a6XlVOt5nZGICeiLecGAb94BqFONwvd4qKUfIDtuipo
1C3Ly38LFqi7X25UK6xREYa5vt7/+Yqs3FWg8SMdyzHSoesAx4gZvLB7f2s93sQR
kX9Ynt4zNInp7fxNVoS+1RucHU4NytG/vyS+zY/28PXgmP49tfLby5vk38QANjoV
fQUYUEobKXzXdHDCShjF1Cf86DPtKuBwkuqvArua4NVA0akz+bz7WCuZ1mWsIp+b
hSLSU4qziaFAZLxyaHEvQ2ch/w017g==
=DdKw
-----END PGP SIGNATURE-----

--BWWlCdgt6QLN7tv3--

--===============8108567882362069855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8108567882362069855==--
