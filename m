Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F75C1DE549
	for <lists+alsa-devel@lfdr.de>; Fri, 22 May 2020 13:24:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8B781887;
	Fri, 22 May 2020 13:23:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8B781887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590146659;
	bh=s2PbnFXR5D0z57uDHVfARP9meCSlYB6AJ0WXeKcoSoc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lInRAoAybYsAb2YYThsWwlpJdY/8xteJSSfoP1Aniosl6UTSqgGDUcMeXhfTCqu6z
	 wk3ez9D5HNkLx3mzZQje4GRlu+k/MafrbhWzB/sDFy+4JpW/JExuTWaRsleR4Pm3hu
	 MLg2WNSQnfyU3neSqGfBFkffm9sQZDFwgZePVCYM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8697F80213;
	Fri, 22 May 2020 13:22:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC5D7F801F9; Fri, 22 May 2020 13:22:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 781B7F80140
 for <alsa-devel@alsa-project.org>; Fri, 22 May 2020 13:22:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 781B7F80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CP36g9MH"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 08B202065C;
 Fri, 22 May 2020 11:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590146551;
 bh=s2PbnFXR5D0z57uDHVfARP9meCSlYB6AJ0WXeKcoSoc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CP36g9MHFaJmUJNiwIPzCzxPKCz/NrJx7v4us/UKXY8jn+rT2EZSmNW41l+GoC1Qt
 cvsS12TSffV1C8LLDHssy2IBIpPUe9AZKCZI/vcJlO19bpz7yyCXZaQtk1DpHeNvXH
 Jqnv9mdap+yqF8W3mkFGI3cCP8XD+C7QrwA1nPXQ=
Date: Fri, 22 May 2020 12:22:28 +0100
From: Mark Brown <broonie@kernel.org>
To: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH v2] ASoC: amd: put off registering mach platform_dev to
 avoid -517 err
Message-ID: <20200522112228.GD5801@sirena.org.uk>
References: <20200522081738.11636-1-hui.wang@canonical.com>
 <20200522110811.GB5801@sirena.org.uk>
 <DM6PR12MB2633D541378EB715AC18531C97B40@DM6PR12MB2633.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4zI0WCX1RcnW9Hbu"
Content-Disposition: inline
In-Reply-To: <DM6PR12MB2633D541378EB715AC18531C97B40@DM6PR12MB2633.namprd12.prod.outlook.com>
X-Cookie: C for yourself.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hui Wang <hui.wang@canonical.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--4zI0WCX1RcnW9Hbu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 22, 2020 at 11:13:43AM +0000, Mukunda, Vijendar wrote:

> Does sound card registration failure at boot time due to modules loading order can be considered as bug ?

No, this is totally normal.  If it failed to bind ever then that'd be a
problem but this is just deferring.

--4zI0WCX1RcnW9Hbu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7HtfQACgkQJNaLcl1U
h9Boywf/Qmaf22wtjebIYiWhHpEVH0AdzFdTtUY9Xl5bWAgnklGD5b8FEdzeC0pC
4g1iVadT2ErY8fxi2G3QmbxVkFSGRcynRGEZ6racwGMLMnTucHUPeDVLZhf2ecN0
JOONhsfiTQPdy0SGqGvYn91oT0amyG1yQDJXNeu++7oS4D8iX1Ah8EQC8ykupDMW
/PbodZYM68r9reayp9toYzXLAW4QL9FKO4Iw3cmH4Zm2Jn0ZeUz2PCmZFeE0WsAM
+NJ99B9qdgyDhdZke0zBR/s8rebemD6/SjUcxt20Cv7WiZxCqFMyKWY3hYf1E1iO
8ao2X8fy3K7OrT/N8KE3l4KbXYvgIA==
=rZX7
-----END PGP SIGNATURE-----

--4zI0WCX1RcnW9Hbu--
