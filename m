Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A41A512AFDF
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Dec 2019 01:10:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13E171708;
	Fri, 27 Dec 2019 01:09:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13E171708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577405409;
	bh=aiLRiDE4nf1dwG77jb2tZqd+76wRg0uaLlZ3ELg5Cro=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N5wMEBrb1D6V/FNbrkS3vXEjEDeppXibdtJeiO93NRtOBMFhT6f5P/LKGKXsprFex
	 z60alZmGadoZLpiNU49htPT8e9vLY9Ps0CP6VQpaYkU1Js1bvepJPEqhhP/WCiJ5u+
	 YHFDBFDTg7YvZPA/fzFdKndn/typebe7wu3yCM4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25BCCF80139;
	Fri, 27 Dec 2019 01:08:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AE71F80139; Fri, 27 Dec 2019 01:08:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35A08F8012D
 for <alsa-devel@alsa-project.org>; Fri, 27 Dec 2019 01:08:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35A08F8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="pHCrQKqQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uE4qWh5/0WKxsEHSPif5/olJ2P833zcR/Gusr/zxliw=; b=pHCrQKqQajN2UwNqWVriS5fi/
 bdxgs3o8iPcRjRcmkMIHbdNgMkmwfJ+WAkJowZEAhG1vR/rdhY5zHioqTSzw2ASI/EO1SpoPGEM0E
 X7M+37n1D9at5RB0qNblVkv8ZbFpcmsPity/LBRp10f5Gk+nAh5FUgWdUDv/BYrrWkyGk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ikdAx-00042P-2i; Fri, 27 Dec 2019 00:08:19 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 5036CD01A24; Fri, 27 Dec 2019 00:08:18 +0000 (GMT)
Date: Fri, 27 Dec 2019 00:08:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191227000818.GF27497@sirena.org.uk>
References: <20191204151454.21643-1-tiwai@suse.de>
 <s5h8smz79o8.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5h8smz79o8.wl-tiwai@suse.de>
X-Cookie: I have many CHARTS and DIAGRAMS..
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ASoC: core: Fix access to uninitialized
	list heads
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
Content-Type: multipart/mixed; boundary="===============1691018219276091991=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1691018219276091991==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SxgehGEc6vB0cZwN"
Content-Disposition: inline


--SxgehGEc6vB0cZwN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 26, 2019 at 09:50:15AM +0100, Takashi Iwai wrote:

> This patch seems forgotten?  5.5 still suffers from the mentioned
> bug.

It's in my fixes branch.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--SxgehGEc6vB0cZwN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4FS28ACgkQJNaLcl1U
h9CnaAf+NmqfgaPDUvSElwOgXbJCgCvUAIVvP935miAfBa9bcPyP12mZA5JXGbSC
+MvVl+bfUey4Z1mLdbiHyj2YRCkurhAF3kPnCWjh6quB0HxE8opvWdCsP4n8Q++N
tlMpovKwO/dg2q1FDQ0ZwpKe2RN9nr5yZThdIpmLJaPHYzap0pEloaA8OnS096NA
t1Xg5F0BqoYeC7i9UeANOREMeVQ31G/9ueyHZhXlNw398zR4GU+vqQTSNMPL6h+R
RA7v16X8Lt8eci66zUGmnXNdZodB7zRjxlFL0tlpU8Zd4WECnYinxV84tKpMDCDL
Iq4wmcs2pzFKulDYvLhDNfPvu1aG+A==
=bJGg
-----END PGP SIGNATURE-----

--SxgehGEc6vB0cZwN--

--===============1691018219276091991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1691018219276091991==--
