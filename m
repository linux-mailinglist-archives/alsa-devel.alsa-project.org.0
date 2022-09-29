Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE545EF6C2
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 15:40:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E52F1F2;
	Thu, 29 Sep 2022 15:39:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E52F1F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664458808;
	bh=MvWM3Ii2X9Cif1fHUkinmlf3P/bFJY184IbZkeBeWsc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PpD+wEIc/oZ2M7VHgLPRtH691U14uM/z5Q4R+vlHWkTMaES5b9J2VKCIW+Cuoa7Fg
	 T+DT0q/T12oUtsrxHzOy+wD1JqNPX9/+34VHGq6gTvECYwNjogWCUVZVV8cCAHxMuI
	 zijTF9G8ItsdolhERbUoR9pgaeg3QY1Zwih4IzyQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBEA1F80109;
	Thu, 29 Sep 2022 15:39:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF550F8023A; Thu, 29 Sep 2022 15:39:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C6D5F800AA
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 15:39:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C6D5F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YATga/Qy"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B41DBB8247B;
 Thu, 29 Sep 2022 13:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB3DCC433C1;
 Thu, 29 Sep 2022 13:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664458739;
 bh=MvWM3Ii2X9Cif1fHUkinmlf3P/bFJY184IbZkeBeWsc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YATga/QyyV7gVj3QipstAy/jhWT72uh34N9KGnjUuo+XP01ol40lchKItGgdv3NL0
 eUoqrz0xtCART53MKP3rHghgTa/xQUPAPgw6y7CD7Dw0ZQtpBHtmVfwewQd1Y7kpH9
 u2n0vEmX5cuaEyy1y9Rx4+x0BpAAuR/EmDDjE6NYDZCUVJhacglIOmTERB9PplyfNo
 e5kSuXqN0F/SwDs22XHm7E6w9elhuYzySZyNmto6CudSVpnMsn93ycYcJtMGpaO0Wa
 DaooMKj9q/cAFbE4GHvPx4zQg8G4Sk9w4aXyO+Kp70quRqX2vghoSG/P3X7s87cizH
 F9KRPPfSxe4Yg==
Date: Thu, 29 Sep 2022 14:38:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ASoC: core: clarify the driver name initialization
Message-ID: <YzWf74wbZg6SbxNN@sirena.org.uk>
References: <20220929080654.326311-1-perex@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VGYuhrptNMfTo8ht"
Content-Disposition: inline
In-Reply-To: <20220929080654.326311-1-perex@perex.cz>
X-Cookie: Inspired by a true story.
Cc: ALSA development <alsa-devel@alsa-project.org>
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


--VGYuhrptNMfTo8ht
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2022 at 10:06:54AM +0200, Jaroslav Kysela wrote:
> The driver field in the struct snd_ctl_card_info is a valid
> user space identifier. Actually, many ASoC drivers do not care
> and let to initialize this field using a standard wrapping method.

This breaks at least an arm multi_v7_defconfig build:

/build/stage/linux/sound/soc/soc-core.c: In function =E2=80=98snd_soc_bind_=
card=E2=80=99:
/build/stage/linux/sound/soc/soc-core.c:2055:36: error: =E2=80=98struct snd=
_soc_card=E2=80=99 ha
s no member named =E2=80=98dmi_longname=E2=80=99
 2055 |         if (card->long_name =3D=3D card->dmi_longname)
      |                                    ^~


> Also, it does not make sense to set the driver field to the
> card name composed from DMI. This card name is longer in most
> (all?) cases. Use a generic "ASoC-DMI" string here.

This should be a separate change, and DMI is a term specific to the
ACPI/EFI so I don't think we should be using it as a generic here, this
seems like a step back.  If we want to make a change there I'd expect it
to be more picking the actual card driver name.

--VGYuhrptNMfTo8ht
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmM1n+4ACgkQJNaLcl1U
h9CBgQf+IyuUspqFXs2J7ulny/sCCdWYCKHYatfFmMiplgPdanaXLtybUrseCA+M
7HDuxJoQzZFo+J9u01Y1tbLiQNnRV/Q4Ncr/zWeALkle98cCdwzXHJUzh3NCcZRv
bnUpCEmekkuOeZ0tHvuC3+3b5VznSRcuy4J1BtY0ux9NIno9UDWXpVUdCxiYGLr+
uRbNu2bpXOWRkbQ6p/SswH9c03jwBr9dehx2lAmztLr8eXaDD3pxOkNrVBhy4335
tuekZFiskv/pLjg9L8LofqrbdTOD2vVro9djBXtA79s59KG/c5jtMFWeoQ5YsbCT
KRI03Z6iRUTwSthFEiJgR8oMqTbNAg==
=WMYD
-----END PGP SIGNATURE-----

--VGYuhrptNMfTo8ht--
