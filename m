Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA1E296CC
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 13:12:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06BA716D9;
	Fri, 24 May 2019 13:12:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06BA716D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558696370;
	bh=eP8se3+lCziggWbYD5hHo5r8Dxf7igeE4Y4dxg4sOeA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Idm6eXd3D86xbZZvZwkKbYU/muRYgvDEtaICXFZQSAElMidEmWSxIzyYxRPObhq0n
	 3/5Qr3VgnfnXBEo5gQOQ2SK6AQAPSct0JX44bd7qCxbPTT6K7zQnNXDVipxGH6hZjB
	 XgFcIWrzF5pjRrERKLsBnlYUdV6/tMmsidJ+SWcs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CDE7F8962F;
	Fri, 24 May 2019 13:11:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AFC4F89630; Fri, 24 May 2019 13:11:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F713F806F7
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 13:11:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F713F806F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="NEjqqlOs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6LU7sDJKxPMA6OFCSaUXHyqjt8vt2VZhmSa0y+SVYGI=; b=NEjqqlOstTB1P+pLf2ReDgqAP
 Qlva+QxzNTcWA2+n6SO1OhUe8ldQHcVMCK8O4wZOt7E0xptV7GqbhFu/oTzUSAZD5iEBV0ypM5vVs
 27z2md8tfsvRAgyjtiNMqctJ2EfYTARqGCRUnMrmLcyAo49tAqgZ0mvXP9+WU6DTyTyCo=;
Received: from 188.29.164.87.threembb.co.uk ([188.29.164.87]
 helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hU86C-00036y-Ss; Fri, 24 May 2019 11:10:57 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 4E5BC440046; Fri, 24 May 2019 12:10:54 +0100 (BST)
Date: Fri, 24 May 2019 12:10:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <20190524111054.GA2456@sirena.org.uk>
References: <1558688044-22025-1-git-send-email-jonathanh@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <1558688044-22025-1-git-send-email-jonathanh@nvidia.com>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-tegra@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] Revert "ASoC: simple-card: Fix
 configuration of DAI format"
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
Content-Type: multipart/mixed; boundary="===============6032801987962183983=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6032801987962183983==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 24, 2019 at 09:54:04AM +0100, Jon Hunter wrote:
> Revert commit 069d037aea98 ("ASoC: simple-card: Fix configuration of
> DAI format"). During further review, it turns out that the actual issue
> was caused by an incorrectly formatted device-tree node describing the
> soundcard.

Please use subject lines matching the style for the subsystem.  This
makes it easier for people to identify relevant patches.

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzn0TsACgkQJNaLcl1U
h9D7hgf+KnlthPCAcNyZh9TNU0VlaxTKG3nZmDHU6QQg/BOOt48b+aWZBg7UIuHi
ii8RJQsiBLnRhDUs8COFEcoyDMwlCaFcyn31Gtfno7H2IvZgWHgN9zff1hkibOZ+
571fGi0LS3x+5htd4wNPQQdNSai7uSTVR4NYGl2jh9H3fLLRU16PatCRlT5xQoyO
lEc+c6Ag/greLJbHgoT5bJf0GSOTaGcATCI2NWmTx86dyZ568Fs7gEDKGph7Md8h
NGMHhk8Wew0avn6epDR2opQhXFP1pqD9KK/TUm0GgRX0x2gqauePZeq6W2ucgQD1
CuA1xZr3ytSJsWyVaP1GGMEPph0iRw==
=NXV0
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--

--===============6032801987962183983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6032801987962183983==--
