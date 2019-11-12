Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D5CF9951
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 20:05:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C4451670;
	Tue, 12 Nov 2019 20:04:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C4451670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573585535;
	bh=CEAvhUJz3H8galBebmZDUB8jojGM7FWBMcEpXcLAm+k=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BfAn95CMSoR5Z3xP2t/YLb6qB46OGwazQe59uXhsEXUbQ+XVnK7kBamUqc/HYkYIJ
	 Zn72Sljh3KBLjcxQwDxX0gVPjPcgrJZ4geXAe2hWfo/Xhp93NEnWjBuCHqdLe5MhaV
	 taUEGGZRp2KsOG+4H5ugzL142JBc9ldXkQknRxJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC32CF805FC;
	Tue, 12 Nov 2019 20:03:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B29F9F80507; Tue, 12 Nov 2019 20:03:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68510F8044C
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 20:03:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68510F8044C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="GgBD6I37"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9ho6aTfGsayP62ujJnIgly+I/Kel3JCpxy7iq94QX80=; b=GgBD6I37FQ412nEJHJy530mPn
 cX8SV+9TAkTQANISNSMzdgNKbEsY8rhNMZWZBs+fKy2PLwITN9lbcOrUJ1jTpBtfVX3Xh50HHQAAb
 X35jN1aCDwaTyh29ofpJCROGZXP9Zoh1TpEKw1BBE8rzOkqzbfpq2V6U7K/L0qLfYAIs4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iUbRn-00009Z-Bu; Tue, 12 Nov 2019 19:03:27 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 8DCB5274299F; Tue, 12 Nov 2019 19:03:26 +0000 (GMT)
Date: Tue, 12 Nov 2019 19:03:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191112190326.GJ5195@sirena.co.uk>
References: <87ftj23jph.wl-kuninori.morimoto.gx@renesas.com>
 <877e4e3jni.wl-kuninori.morimoto.gx@renesas.com>
 <8ed58ca1-0f9d-63e8-ba5d-28ee5209aee5@linux.intel.com>
 <87pnhx8xjl.wl-kuninori.morimoto.gx@renesas.com>
 <87o8xh8wyz.wl-kuninori.morimoto.gx@renesas.com>
 <87mud18ukk.wl-kuninori.morimoto.gx@renesas.com>
 <73feb970-bca5-b736-ce44-d44dacab02d1@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <73feb970-bca5-b736-ce44-d44dacab02d1@linux.intel.com>
X-Cookie: As famous as the unknown soldier.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] [PATCH v3 06/19] ASoC: soc-core: add
 soc_unbind_dai_link()
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
Content-Type: multipart/mixed; boundary="===============5626066633277267198=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5626066633277267198==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ed/6oDxOLijJh8b0"
Content-Disposition: inline


--ed/6oDxOLijJh8b0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 12, 2019 at 11:11:32AM -0600, Pierre-Louis Bossart wrote:

> +       for_each_rtd_components(rtd, rtdcom, component) {
> +               pr_err("plb: %s processing component\n", __func__);
> +               if (!component)
> +                       pr_err("plb: %s component is NULL\n", __func__);

Could you perhaps add traces of which components are being accessed at
each stage?  We might want to go through and just add something like
that in the code anyway to help figure things out.

--ed/6oDxOLijJh8b0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3LAf0ACgkQJNaLcl1U
h9BqDwf/Zfs7LuVSd43rwPDaPnTUJQfxSIqjet95S+6Bq/wYFZTukny0EPbRLjGM
eOArNZS63BPxVLw6rFDUHaV71i2642dyyrhuUGu16HC1jIHk6hygudxAtknt7DNS
+HT2TbXNvgslU4zgQBtE7Mw4gokqWyKxlcQDt3ZSzWcP3nkONC2nRcW18dQrqJbg
9ghMDIytQvHLRa+ROp42hLN7RcIQwbxP2yBmKRANyFz7L7BaPVcDP0ClwIxpxODm
aMuKqCzA28GLxUaauJbxKwqfLN2HiSZuoKKEYDLwRfRHVdIjShAgtlBFC5d/aXyC
9MAiaeqMSQ0ZWTmnMb+J+OpRjcfsCg==
=K76U
-----END PGP SIGNATURE-----

--ed/6oDxOLijJh8b0--

--===============5626066633277267198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5626066633277267198==--
