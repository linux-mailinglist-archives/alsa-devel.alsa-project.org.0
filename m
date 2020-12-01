Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D482CA6D1
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 16:19:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAEAE17C7;
	Tue,  1 Dec 2020 16:18:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAEAE17C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606835948;
	bh=dGfNSOBgGRBJkk/Dgt6x48Q5cXIZYVgrqNOCHjMDkls=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JfHem9tuJ6g21uRCezi7EEsJIH4ooJAZ2VPItsEbxqs3opVjIpQSK3MhTa02lWgR0
	 owX6UX9YaoCZOZRBsOLDY48mqivV9ilNE2YqiACU6GqOw0WDLD+islN8wq0qi9Czwo
	 sUS+j9xEIUsRdzxV5dJxq2yZRCJH6krNRZEXhSGo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0104F80139;
	Tue,  1 Dec 2020 16:17:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 493F8F8016C; Tue,  1 Dec 2020 16:17:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E603F80139
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 16:17:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E603F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jm01DLEJ"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 835362084C;
 Tue,  1 Dec 2020 15:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606835835;
 bh=dGfNSOBgGRBJkk/Dgt6x48Q5cXIZYVgrqNOCHjMDkls=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jm01DLEJUVd9ljYXUFOFnvDXYouaD7xBo/EfaVWKNbXZaKWnA8Enq2kgNj3Dzr65D
 9+v/oLboL5EjgttiJnoat4rw1L/ku95iNEl3J7Dtn4AlshxKZvoGi4tm95B8LEE38b
 6KKT/FCY/dFGKul8AkDWrjXE1u12QzCJedmi23XQ=
Date: Tue, 1 Dec 2020 15:16:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Shane Chien <shane.chien@mediatek.com>
Subject: Re: [RFC] ASoC: Add compatible for mt6359-sound device
Message-ID: <20201201151645.GI5239@sirena.org.uk>
References: <1606801293-19472-1-git-send-email-shane.chien@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xQR6quUbZ63TTuTU"
Content-Disposition: inline
In-Reply-To: <1606801293-19472-1-git-send-email-shane.chien@mediatek.com>
X-Cookie: Who was that masked man?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 chipeng.chang@mediatek.com, wsd_upstream@mediatek.com, fan.chen@mediatek.com,
 linux-kernel@vger.kernel.org, jiaxin.yu@mediatek.com, jeter.chen@mediatek.com,
 tzungbi@google.com, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Hsiung.Wang@mediatek.com
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


--xQR6quUbZ63TTuTU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 01, 2020 at 01:41:33PM +0800, Shane Chien wrote:

> However, if the device is not given a comaptible,
> of_node of struct device is null. I cannot use
> devm_iio_channel_get such iio interface to get
> auxadc value from iio channel. Because during
> using devm_iio_channel_get, of_node of mt6359-sound is a
> input parameter of of_iio_channel_get_by_name.
> If the of_node is null, devm_iio_channel_get will
> eventually return ENODEV error.

I would expect the IIO channel to be requestable using the top level
device for the MFD - part of the deal here is that the function drivers
for the MFD know they're part of the MFD so can look at their parent
device for some things (eg, this is how regmaps are normally obtained).

--xQR6quUbZ63TTuTU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/GXlwACgkQJNaLcl1U
h9BAOwf/YpwGU5QaZRcMFXBXVD7bkQtu2EutCs5svrbEIbr3lA1niZuznQAxi+6a
EJCmeJQMOhfM1eWqoPsMR8Ys1EKuWKLwG6YQWS08MaQnTYWfxbrUOVojFD58OzaL
hQo4Yi/3k08L2Hne44kqKBRtlKsOUinIUZi3Bfd+kApSW1EpnKsSr91qfyTJRFrx
7qBCTxt2qNnd47lDqIrDEm72iyFR9SyCAttQJCGBnqm6ByFEhZgGQh92GOZfWG/w
Ubq9Y3f3nY08xj3kCQD+H8HAjTPh8zdtXk5oJe8X80j9FyZDbQ01GlFkcnWeL7+p
cc8ntzCYuiapNx0EQQhYBOrTDUkX8Q==
=4ZF0
-----END PGP SIGNATURE-----

--xQR6quUbZ63TTuTU--
