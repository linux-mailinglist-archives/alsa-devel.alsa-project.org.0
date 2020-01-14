Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 738FC13AD99
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 16:26:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13DB01AA0;
	Tue, 14 Jan 2020 16:25:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13DB01AA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579015565;
	bh=QJgXanh+OUcycj7+i/3Ag3qn8Z8urPKKYVRzPzdO67M=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NA48fBu9AlQfPH7Ig1MoDcrsWa8HfluxR4vGrFBfFjYQINFT2i7PhQBIq1tkV5iYA
	 DrXttO1FN3M+2HTxEfmWMzg0sBAb+Gukbp/MLosdKb46iXJr1bXfJw0SH8a/skETdo
	 qYaA+jjXsFRebrodglQ7ALXZeSt2Re2oXtdTy9C4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C2DAF8014E;
	Tue, 14 Jan 2020 16:24:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8021AF8014E; Tue, 14 Jan 2020 16:24:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C592CF800E9
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 16:24:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C592CF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="v09V1PPE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rEoc9W1Y5me0hlJHtN2Ga1IxVi4vhJcf/4W1tkjL5B0=; b=v09V1PPEsNa09xVriCdMmarR0
 ZkGZTINk4UsqIwO6nLabJGpjTn0SKwGZB7vhf9IbJgYdUfakoUpvv7FNbT3G1So7s7C2JMm19Sg33
 LeWHmzMa5eXBy2SVAeMY82K4CSsd8A4p4023+7ikUQZwMAwVjrNJ1lc5jgZWGO4lfoRYY=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1irO3D-00005Y-5Q; Tue, 14 Jan 2020 15:24:15 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id D71E4D04DF5; Tue, 14 Jan 2020 15:24:14 +0000 (GMT)
Date: Tue, 14 Jan 2020 15:24:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20200114152414.GX3897@sirena.org.uk>
References: <20200113204049.7819-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20200113204049.7819-1-pierre-louis.bossart@linux.intel.com>
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, Jack Yu <jack.yu@realtek.com>, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ASoC: rt715: use dev_to_sdw_dev() macro
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
Content-Type: multipart/mixed; boundary="===============7628116647762585950=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7628116647762585950==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sL7C0a98p/u5aVah"
Content-Disposition: inline


--sL7C0a98p/u5aVah
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 13, 2020 at 02:40:49PM -0600, Pierre-Louis Bossart wrote:
> The driver used a macro which was renamed during the joint
> Intel/SoundWire development, but since those renames were not merged
> by the SoundWire maintainer we have to revert to the original macros
> as done with the other Realtek codecs.

Morimoto-san already fixed this.

--sL7C0a98p/u5aVah
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4d3R4ACgkQJNaLcl1U
h9Ci9gf9E49pEhXGssgqaiaB57Pa/UPALeuqeX93Q+H6T4FV7861dSzl/LY8dKmv
PnA26CCZL2b/dhSM5REfcjqEWw97DRdKBdmeakNXKO/bdtSS2fuwzzouUUTAeMLG
UZaHEPZl5oQCSzW4YYUSfXcfNb2K4jc2FAn6HozfPp6BbBRtV9tv194I7zwqJEt7
q0WJFPABjMzikHCZX7mm8BNWhZxmeXVdNy+q4mXiQy56eqPQxBHyFUSrIuIn8wFj
IRQV5T9LqAPKZ/jaUnb1nXFKGw9D6VjzsSrt9/Dig8q2VokLBq7ZLNH/UlqTMoTb
CFHJ+Neon6mMSlzwxL1Qadxp5Fqk7w==
=sOiD
-----END PGP SIGNATURE-----

--sL7C0a98p/u5aVah--

--===============7628116647762585950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7628116647762585950==--
