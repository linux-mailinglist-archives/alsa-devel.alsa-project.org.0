Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB8513AD3C
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 16:14:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23A231A95;
	Tue, 14 Jan 2020 16:14:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23A231A95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579014897;
	bh=CED/vxhiUCIUignQROSzVjp+/eQN9YmkiPrydknd/7c=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KxYOYfjYPAmEUXzvn1NCkj7RGWdsExJiCze/ck+cHStu7MbcrDEMp6AEWsXdvtci/
	 rwPjacj37nDVsfmLkAsvSNRz4c5rVl4fmp5O/gDbRqy0TZTVwlVB4E1N1EpfTbdsy6
	 jFD4ak8aNIk2vZ+V4d+5S1L95w/ZSuvOT//KeTg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0E76F8014D;
	Tue, 14 Jan 2020 16:13:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BD56F8014E; Tue, 14 Jan 2020 16:13:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46496F800E9
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 16:13:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46496F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="iF0LZewF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jTlXI8kft1x8ivM7r+JXr+zBGAn9DCkalxd+5g7od74=; b=iF0LZewF/zy5NVmrLcF77gZGw
 hDtJX/xseSy5+PJw16FMZvXfH/qXiVfoadewk+RoPJBXRXOSbrcwZQn1Uv4vIaOmUTqJaVyenh2Y2
 8UAoT5kk5vXRkew2aViq7Bw/RQzKixtrJSDI3JrejVLvKmw5wDwYdwE4Q2p9Mp2poRb3Y=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1irNsQ-0008WE-5R; Tue, 14 Jan 2020 15:13:06 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 77A46D04DF5; Tue, 14 Jan 2020 15:13:05 +0000 (GMT)
Date: Tue, 14 Jan 2020 15:13:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20200114151305.GV3897@sirena.org.uk>
References: <87ftgihlic.wl-kuninori.morimoto.gx@renesas.com>
 <87h80yfs4h.wl-kuninori.morimoto.gx@renesas.com>
 <87ftgifoh3.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
In-Reply-To: <87ftgifoh3.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 17/16] ASoC: soc-core: remove bus_control
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
Content-Type: multipart/mixed; boundary="===============1070320830706586005=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1070320830706586005==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vKcNkqnJHUUp475E"
Content-Disposition: inline


--vKcNkqnJHUUp475E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 14, 2020 at 05:10:00PM +0900, Kuninori Morimoto wrote:

> I noticed that this [17/16] patch (Yes, It is strange)
> has compile warning.
> I will repost this patch later.
> Please ignore it. This means, please care [01/16] - [16/16] only.

Perhaps that 17/16 thing was trying to tell you something :)

--vKcNkqnJHUUp475E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4d2oAACgkQJNaLcl1U
h9BZ5Af+LA7rMWFOYp63UpmJPtc2oPTFQ+TL4nDOn6zgm6VFDJQ7863ootyVxiuB
+/ainu5W+bYLRqI+W8TzrYyp0237mrMd5KjQGWuZk3pXi2YRSbFJQeQK+3mGwx0Q
KJzXcMiygQc9Ki8PSlHXlcZVJPWu0Pec9LuY1J02W+PHkXgaZ6rzSv6+jzyEUz9G
X+x5YxK4UsJoDFYBcBdAlEI46mHycpzbJtZyqjAYnjwS7LtdVLuj6OB1L2sibvBm
/1+x6jxls0yh34+xb+NJU4aoKAFZxUAl2EM+5zgR8KRx/KXuLWbdvufB9U+Xt9fo
edvGR1np2eEAVyWbB0RFSJBQWfyuEQ==
=EMX2
-----END PGP SIGNATURE-----

--vKcNkqnJHUUp475E--

--===============1070320830706586005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1070320830706586005==--
