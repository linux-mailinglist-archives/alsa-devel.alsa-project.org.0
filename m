Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 130714EC417
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 14:31:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B7DF1AB2;
	Wed, 30 Mar 2022 14:30:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B7DF1AB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648643485;
	bh=wMFzbAJ1w3I769LKcQvR0OeV1wjnRKl15NqgNqHjMPM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E/NuW2keONez0xK3Lbd/cnL9bH88955Wl2gbJxuqIqybX66K77gSsQwVpeiusE634
	 KYOTtld87y+2F3EkiqFfmbPgzNZ+HT3tCGlHJ+v3LzqO66hu6Vs9GvKbQRC99a8jxE
	 Ua7ChOgW/aQ6rp/YUKtL/rIb1FAVmhMrH2teHhcA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0069EF8025A;
	Wed, 30 Mar 2022 14:30:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 073F1F80254; Wed, 30 Mar 2022 14:30:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 018CFF800F2
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 14:30:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 018CFF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Jooz5o26"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1D955B81B75;
 Wed, 30 Mar 2022 12:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B08C340EE;
 Wed, 30 Mar 2022 12:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648643410;
 bh=wMFzbAJ1w3I769LKcQvR0OeV1wjnRKl15NqgNqHjMPM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jooz5o26y2T7lucnkeTlKNAUZ6dwp3eoPFEtxeqpOFFaLNFKr5oWouRbAlRA4eOpU
 R4GJT0rTVrF95heK9efPmE+2RKbqxBBb6hW6ti3o4Ay0qwCGCcQIlzuGopfhxvI9YH
 6DVldjBxxNxJPB+tlFbmflOjHnioNZtEYaeFwyij4glVPevgwWQqQH7h7V9QCYoVdX
 Z7ZLTB/E+L+UkqVieV7+/kkd6Z5x7SR+N4vLdwkNov88B3292HF1u+xGFVA0p8gpyH
 boOy/oJPqR5/jKoH+gw1Xrxj22CghA0VjZ1uVJ8x2X38JcHH8koY+2XJ4zOiENX9/Q
 x+1IXAavckAzw==
Date: Wed, 30 Mar 2022 13:30:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [v7 2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of
 speaker
Message-ID: <YkRNSoBKFvYYyZLu@sirena.org.uk>
References: <20220324064511.10665-1-jiaxin.yu@mediatek.com>
 <20220324064511.10665-3-jiaxin.yu@mediatek.com>
 <20220329223002.uo7kiemopkh7ak4x@notapiano>
 <dee3fbb7c9f0c3e1f11143db1d6fc4381cab827f.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jOMai26txzsrB1Jf"
Content-Disposition: inline
In-Reply-To: <dee3fbb7c9f0c3e1f11143db1d6fc4381cab827f.camel@mediatek.com>
X-Cookie: Two is company, three is an orgy.
Cc: devicetree@vger.kernel.org, linmq006@gmail.com,
 =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 Tzung-Bi Shih <tzungbi@kernel.org>, matthias.bgg@gmail.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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


--jOMai26txzsrB1Jf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 30, 2022 at 10:33:06AM +0800, Jiaxin Yu wrote:

> "(Although I think this would technicallybreak the ABI?)"
> ==> I can't understand this question, could you help explain it in more
> detail.

Making a previously optional property required means that systems that
previously worked may stop working unless they update their DT, DTs may
be distributed separately to the kernel and perhaps even baked into
firmware or similar.

--jOMai26txzsrB1Jf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJETUkACgkQJNaLcl1U
h9DbEwf+JUOC5DnLCotwK80wPY+Rv+Fxpva35UGKpU+JgyM/o50OQtmaefr3nyZ7
rItM7lPU81Hj7CJv0/hKjwsTmIVugxE7tOao1mBV9wLaStQfn2tx79wtLhiSYeNH
Ig0F79Jy0tY/TnytxA7d8XYUzguiwLqQIBbC6VHIYfO08FdMyloI+3SILPHK1VM+
SN23X+R9nG0CJImoNZMP1DDGodHkB9u+YhhB66cULenBpGMVNDKU1cPLTytp3nvP
bDz70kaMHgFqMgY01LMzQ/1TBfRMm7isoInZl6nGUnDOo9pCzmctaPZyBgRQ5mod
XaHgRucIShC8OJ16S0YCPs8CfbgvvQ==
=2Po5
-----END PGP SIGNATURE-----

--jOMai26txzsrB1Jf--
