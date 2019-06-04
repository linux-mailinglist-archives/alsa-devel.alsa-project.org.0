Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C5134AC5
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 16:47:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 071DC166A;
	Tue,  4 Jun 2019 16:46:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 071DC166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559659632;
	bh=fZkqOMkMxSeZJQCFqVRxIlrbYcaK00MyuI1KkmWAUhw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nq+bgmwyXlCYyq97SKiFFqBwisNZv7ADSHgRhDpFW1VpmvwnSxxRR5Ajp/gdTDHJF
	 uR1D1/rOT5eP41KbJziWqaYmi1za4IMKLU2XTfSlie4QVjywmcdgLWZtlkFzrSrf9z
	 l3hNEnfA63c+eHIK1+dJrIqmKbo5yYq5d/fZi3g0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96048F896F8;
	Tue,  4 Jun 2019 16:45:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F755F896F7; Tue,  4 Jun 2019 16:45:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8132FF89673
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 16:45:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8132FF89673
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="IINgz0Wv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N28LjJkz/Mx7r43eirlH7u4WWvO5iyeKXFG3ckomDW0=; b=IINgz0Wv1nxvpFB4EdBRt3GPR
 BIgOEMg69TUSP8LNtkgFxC5fQtoAn7quvxOvuYgNCQn8VE21LD84sKKNii1mNXZu3NxcigGTLP13L
 Nv6NmS0WC3v7cTI0CWqgzKX6MQkEPW0ADhZMT5kjmtn3smBZkvsLBO8mmASeuS3hPweM4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYAgg-0006D5-Eu; Tue, 04 Jun 2019 14:45:18 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id AD932440046; Tue,  4 Jun 2019 15:45:17 +0100 (BST)
Date: Tue, 4 Jun 2019 15:45:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190604144517.GF2456@sirena.org.uk>
References: <20190604085449.13195-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20190604085449.13195-1-maxime.ripard@bootlin.com>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH] ASoC: sun4i-i2s: Change SR and WSS
	computation
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
Content-Type: multipart/mixed; boundary="===============6868209092444212989=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6868209092444212989==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PLVMksexArUZ/iL3"
Content-Disposition: inline


--PLVMksexArUZ/iL3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 10:54:49AM +0200, Maxime Ripard wrote:
> The current computation for the SR (sample resolution) and the WSS (word
> slot size) register parameters is based on a switch returning the matching
> parameters for a given params width.

This doesn't build for me with current code:

  CC      sound/soc/sunxi/sun4i-i2s.o
sound/soc/sunxi/sun4i-i2s.c:169:28: warning: =E2=80=98struct sun4i_i2s=E2=
=80=99 declared inside parameter list will not be visible outside of this d=
efinition or declaration
  s8 (*get_sr)(const struct sun4i_i2s *, int);
                            ^~~~~~~~~
sound/soc/sunxi/sun4i-i2s.c:170:29: warning: =E2=80=98struct sun4i_i2s=E2=
=80=99 declared inside parameter list will not be visible outside of this d=
efinition or declaration
  s8 (*get_wss)(const struct sun4i_i2s *, int);
                             ^~~~~~~~~

and lots of similar stuff.

--PLVMksexArUZ/iL3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz2g/wACgkQJNaLcl1U
h9BCIgf/WLTKo7F+GH5yembRxj+jHQz35TZZPqb9mhx/Hyogn+/+bF5LeqEi8hKq
L7Mpzf0KyzhKz/VDRGc3TlsLihsQ0okqybE+/PlOS3Y7DRvd115KYLsOdfVYOucD
bF48im6bMWWARcoIyK6B2vAYx9y28Z4qUgLcJGOcLVwwCC1K/nq6A9kFul0lXXs6
44SRqWz911MOpt3VCP2FHpMnjiHcJP9nZ0pRZTmaV057lQCthPaCNuz+r5nzGy/Z
Oh8Q+0DbkTmOriia5YZ6OY83lRYHBKFEPtc3nf3zuxgesObEJdvPVRur6ZGZSNDL
tKXQOFITXAVWrTfyE+Z809Bz1jgX5g==
=cwPD
-----END PGP SIGNATURE-----

--PLVMksexArUZ/iL3--

--===============6868209092444212989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6868209092444212989==--
