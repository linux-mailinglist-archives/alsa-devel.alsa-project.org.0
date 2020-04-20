Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B741B092E
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 14:17:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFAE31681;
	Mon, 20 Apr 2020 14:16:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFAE31681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587385058;
	bh=KAzqVOiBIS81KFOL/ZJs57J/pOhM6Nz0EdO47rpBahQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o4taIfKFeFRmleqf9fIkTDomwPMoMxHxpl6rb0ZaVVRB1uENjq2u1OTE7zLI5/NEH
	 4HpjBk7Ix/e9qoAM1BK2zH07vyU4T2D+wjVW5OHjtSau9sv74MUUySLNzL3YVcplzk
	 FrGMqkGgG9rRskrM/WUlj8IS2zX7AHbhuJ3wKhQk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7885BF800C8;
	Mon, 20 Apr 2020 14:15:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85542F801D9; Mon, 20 Apr 2020 14:15:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66B58F8012F
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 14:15:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66B58F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OVUZ0vT+"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8FB68206F4;
 Mon, 20 Apr 2020 12:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587384945;
 bh=KAzqVOiBIS81KFOL/ZJs57J/pOhM6Nz0EdO47rpBahQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OVUZ0vT+MNyDotB/kUL/W1MHKii0VS0DFhwEdJP7CHIsDu0nylLuynDiVl0iiwoEh
 cHbidcQkS2iffAT+AwZoAp6T87FYHO8WISJi1GWOuDjbYy3Yt2etqfMVgx3tOIAZ7A
 VUXIId2MSpkDjtMF3oZHnoLkBlWI79V1qjGjWQSY=
Date: Mon, 20 Apr 2020 13:15:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: add Microsemi ZL38060 binding
Message-ID: <20200420121542.GB6507@sirena.org.uk>
References: <20200417221341.31428-1-TheSven73@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Content-Disposition: inline
In-Reply-To: <20200417221341.31428-1-TheSven73@gmail.com>
X-Cookie: Can you MAIL a BEAN CAKE?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>
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


--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 17, 2020 at 06:13:40PM -0400, Sven Van Asbroeck wrote:

> +maintainers:
> +  - Jaroslav Kysela <perex@perex.cz>
> +  - Takashi Iwai <tiwai@suse.com>

This is supposed to be people maintianing this specific binding, not the
subsystem.

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6dkm0ACgkQJNaLcl1U
h9AdMAf8DV+bgCiPRbrXjlrtlD8glMuBmPvbGRJ0CEppUWue177NY94iTrmvkN4X
uFP01XKCX0l4HavAVFxf4ODnSGuwmQBuyEQKYF+DMqRexq0CZlOM3Z8BH11kJTnj
PZJoAXRziDJ1kEGBFttHLJRMyBCCKHRpTj0kq8WS5kh1OKCka/XXqKrPmm1m1nbM
xFRR6Efn4Ksensm5ddQSNNMjcdbjkXfmVSRtJAqNk94cogGULnKFqxUs4ca87aYp
P7h4YRWpNFXjDXV7FAssqSjcqksfpp8IMuD1uxwrnCM02P3L8Fz6Etucs8WdHjws
JQuDggV5UbMJzC1QNOCg2O1y6S4lKA==
=VMQX
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--
