Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BA561F700
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 16:02:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7131E1D7;
	Mon,  7 Nov 2022 16:01:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7131E1D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667833350;
	bh=Gwl817qdWCkyUsypT+mBMX99k8wTF8oxqsN3mD/crgM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sCReeSjpznDExYt+b07mK1aoRO1cVL63s3rXdV+c2cpGFGzprPB5az/rpM/ZEt+7o
	 vwgGG/wkztRCun+N3rCbbp5c97FnihKLDokIhcQ/2HKMp1taYnjtVrzh8x1cEd36zM
	 qmi0uVO1IZPodVrocReP1lj79ZQZb1IGG0OEPzf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10E21F804BD;
	Mon,  7 Nov 2022 16:01:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B44B8F8025A; Mon,  7 Nov 2022 16:01:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C338F800AE
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 16:01:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C338F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tHijNVUt"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1711761147;
 Mon,  7 Nov 2022 15:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7765BC433C1;
 Mon,  7 Nov 2022 15:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667833288;
 bh=Gwl817qdWCkyUsypT+mBMX99k8wTF8oxqsN3mD/crgM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tHijNVUt0qfZl48XvsISPf+Ifk1Yumatus3hQzyZpbyAI3YNHCGgtSd9bruG9GXka
 GSyntLryCBQCgtcsDPLRKHMlDr01rDuaJdMF0LXhdHt+fZUsOwMv21OzS1xJgGPbbc
 IwdlO/7kpJ5IiaNnUzKeEwH4Q639bdtQNsqtRhcOlEaxqvmrA9qPdL5qvaDvhvshuv
 ZFVh4WElKAUq+2yeNWdfPWLhm9JW9H8Aneb+iU5QEune6lrnYbj2cj8kZcLKDKQAfY
 J42Ynul1ZxrntPLOwrkjooUynerPeu2TQ8wrTvKw6J1l/xdmNU4E6XFlRie/Zvh6n+
 XIOGJ80Fb96ww==
Date: Mon, 7 Nov 2022 15:01:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Subject: Re: [PATCH] CHROMIUM: ASoC: amd: acp: Add tdm support for codecs in
 machine driver
Message-ID: <Y2kdwms39CQUMQp/@sirena.org.uk>
References: <20221028103443.30375-1-venkataprasad.potturu@amd.corp-partner.google.com>
 <Y1u1vj0K3m33wCTd@sirena.org.uk>
 <b384e012-31c5-8412-8b05-cd026c5d6a0f@amd.com>
 <Y2EttkwUvMReQcqg@sirena.org.uk>
 <ca006546-9b0c-34df-2a33-a4f10b68f815@amd.com>
 <Y2JVWmJsprt0xnKH@sirena.org.uk>
 <7b97682d-5cf1-8be1-9c62-41c9fbd89018@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="u3jPCXTCofiGGOee"
Content-Disposition: inline
In-Reply-To: <7b97682d-5cf1-8be1-9c62-41c9fbd89018@amd.com>
X-Cookie: Minimum charge for booths.
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.corp-partner.google.com>,
 Vijendar.Mukunda@amd.com, vsujithkumar.reddy@amd.com,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
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


--u3jPCXTCofiGGOee
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2022 at 04:04:40PM +0530, Venkata Prasad Potturu wrote:
> On 11/2/22 17:02, Mark Brown wrote:

> > Why would the user choose one value or the other, and why would this
> > choice be something that only changes at module load time?  If this is
> > user controllable I'd really expect it to be runtime controllable.
> > You're not explaining why this is a module parameter.

> Different vendors/OEM's use the same hardware as one need I2S mode and ot=
her
> need TDM mode, using common driver=A0 to support=A0 I2S and TDM mode with=
 this
> parameter.

If a given board needs a specific configuration we should be configuring
based on identifying the board, not hoping that the user somehow knows
that this configuration is required and can work out how to do it.  If
this is purely a software setting depending on the software stack
running on the device then it should be selected at runtime by that
software as part of the use case management.

--u3jPCXTCofiGGOee
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNpHcEACgkQJNaLcl1U
h9Actwf/XNs2J7Ffddfy8nVY0H6pR5ug6RjoG3sOjBiBm3NonuNjnBmAD1rYCjOW
t6KnGt1Q656Eyz6ycPZz09PDIWT80wv/zYbzGU2fyk3hpyZzG8AhJrU0AybvRSmI
g/mEgzC3X0aOnXRm4eF4oTdBxab6weg+LbwSASDByPOP710bNQtM/0MjKd6Jpz3C
iY7XJj4BrVynqak3IbjwY1hgX94yY/ZeRUbDE8/iC4+z/F0ORoQCM85xJ3UZgC8a
ikYvz4jJcumSQMeSwuOoQF4xLo7dvF0NSnm5V/DiXO0T3eEwJm193lLxTExEjhhG
YW/u9RRJjDiRsLpN2zCJ0TMJk6rvMQ==
=WKwD
-----END PGP SIGNATURE-----

--u3jPCXTCofiGGOee--
