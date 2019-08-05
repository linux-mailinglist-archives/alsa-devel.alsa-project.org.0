Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 073C0824A4
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 20:06:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D7C61672;
	Mon,  5 Aug 2019 20:05:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D7C61672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565028368;
	bh=CLrozC+B74jlXkFCUaYCr4EjyvjZJPI6IOIU4983P+A=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dGDuW27J3s6vZsAD8bAHzvx2nPog2KkwPCNz7JIc2cHSgSD/kguydU67VfxBaqZLh
	 y2MOl4kGQxnsqDaMN4Of378Yyk8wQiNXB1qrSdRWGkXfGlEJ1/XQyYg5+P3/dF857d
	 lT2pemiwqqe5Bor5dwtkx2UWsItCnf45qILvnnmg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDF05F80535;
	Mon,  5 Aug 2019 20:04:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C16AF80533; Mon,  5 Aug 2019 20:04:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEBEAF8011B
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 20:04:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEBEAF8011B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="xl29ppbP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j1sdpCSt3SjG000A/AtmMgE6HbtVnQdy8hn8enWT4Qo=; b=xl29ppbPaqfEe3fEYefnxXKRz
 i4/THC5j3FmbzvnvXJx7FmsXINiH5OPBb3x24Nf+/OsMVyFuI5dvQWBTazBRvnvYjEbN4tspuYAm2
 pXK5/LvnmV7uOIBvsFIevUMdn42Rl0MYigumgVwpX3IgdPwswnnp8FWNZGyVtgE9NdKVA=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1huhLH-00012u-78; Mon, 05 Aug 2019 18:04:19 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 37B672742D06; Mon,  5 Aug 2019 19:04:18 +0100 (BST)
Date: Mon, 5 Aug 2019 19:04:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190805180418.GL6432@sirena.org.uk>
References: <20190805131327.GF6432@sirena.org.uk>
 <s5hef1zpkke.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5hef1zpkke.wl-tiwai@suse.de>
X-Cookie: Place stamp here.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [alsa-devel] [GIT PULL] ASoC updates for v5.3
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
Content-Type: multipart/mixed; boundary="===============6538984463515962306=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6538984463515962306==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3xQkynibq3FKlJyM"
Content-Disposition: inline


--3xQkynibq3FKlJyM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 05, 2019 at 07:51:29PM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > The support for new sample rates in the max98373 driver is a fix for the
> > fact that the driver declared support for those rates but would in fact
> > return an error if these rates were selected.

> Hm, the commit b9da500bde81 looks strange.

> The author and sign-off isn't with a proper name, and moreover, the
> patch modifies the file permissions.

Eh, the name looks perfectly fine for a Chinese name and matches the
e-mail address well enough - it's a slightly unusual transliteration but
if that's how ther want to do it I see no reason to complain, it's their
name.  File permissions are a mistake though, I can send an incremental
patch for that?  Kind of surprised none of the bots or people scanning
for stuff noticed it.

--3xQkynibq3FKlJyM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1Ib6EACgkQJNaLcl1U
h9C76ggAhTM7+c2mbQR867sI9M/hngwXjPpBzC3IVZ8c1SkSANznr0v/ICupYIRw
1AqbWhRv5o5OK/hEOARouGa8VuFqavkqYA7S6hRX9RnueDigEgBbYTQZfZzKMAJ5
tWJFhE0OPg4mZQHoHxDsuK7BL/tV4bHOmFVVqOvgUWTBJ7mG1lzxqzCSv5JeUKtt
e3tCqpu04rRJvzZO3Ecm3cIVUV/O3rLNH4V14Lcqo/quWsHxkxieNm5pPej+klul
2DmU8AwehGKlgBLGj94NcFcwxOBAIRd0QEdQinPBNRP1tG2w+4OKXqaj1Qloydtn
UiZXk+edmc7fOiElA8UA9ojl3Yc73w==
=9qPF
-----END PGP SIGNATURE-----

--3xQkynibq3FKlJyM--

--===============6538984463515962306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6538984463515962306==--
