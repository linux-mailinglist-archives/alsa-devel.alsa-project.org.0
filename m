Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D550464DA0A
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Dec 2022 12:09:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 724A321ED;
	Thu, 15 Dec 2022 12:08:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 724A321ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671102572;
	bh=otXxm55EM0gptTM4VLPHIyJ/tLPdBuolhb0wODRxQCQ=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HcuvewmL6qLLU2tsIgy8AEMrFs+yBwbSuup4Kbx31/yP3EySm+HVnR3VYXaPb3wvQ
	 bWbctNW5HZVyAsXyGuT/iuJngYzfo/zq5OCdLkED8hVeVT79F/vZ3h6Xxho0in9hEn
	 TEqrZYR68vHonuGijZ+1zSQ8OTB2f8tJOpkm2l7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C5C5F804F3;
	Thu, 15 Dec 2022 12:08:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B611F804ED; Thu, 15 Dec 2022 12:08:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7C1CF801D5
 for <alsa-devel@alsa-project.org>; Thu, 15 Dec 2022 12:08:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7C1CF801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Lx+5SojM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 04C9CB81698;
 Thu, 15 Dec 2022 11:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7F06C433EF;
 Thu, 15 Dec 2022 11:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671102509;
 bh=otXxm55EM0gptTM4VLPHIyJ/tLPdBuolhb0wODRxQCQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lx+5SojMH5fis6ZcnVj5HLBZCgmYcUwLC/eplUDlxbSOwrzCrMfp511K+Qmh4+k3f
 0TeSWNVEbGokD1O0cD+HPh3XUI/3HInp2wJne6bcHVy9yevrQbqYb6YK8aCyHsfOxx
 BFAJgaXilny7T8DoZAHjclIXd1SEovEHXTSPRfDvXwTwQ7uD52YKfGTCT7QPgamUtb
 4Gh0CoypR7uJ0nJn4uE9RTizZWeJ0sHF5BtFPut8sCogrRihgx4WDYPTpPOrr0CsAE
 TPs/ttlxnccV3Mxnopsbyr3uG63QMwEZQqfKyc04EPPWYw+BVy6F9T9T7hcRnUrnZ5
 k8Xtu13arpQ4w==
Date: Thu, 15 Dec 2022 11:08:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH v2 1/3] ASoC: wm8940: Remove warning when no plat data
 present
Message-ID: <Y5sAKNV4p4G5VVtP@sirena.org.uk>
References: <20221214123743.3713843-1-lukma@denx.de>
 <20221215093615.3794156-1-lukma@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SFRj7qQIoixq6PZz"
Content-Disposition: inline
In-Reply-To: <20221215093615.3794156-1-lukma@denx.de>
X-Cookie: Today is what happened to yesterday.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Stephen Kitt <steve@sk2.org>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--SFRj7qQIoixq6PZz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 15, 2022 at 10:36:13AM +0100, Lukasz Majewski wrote:
> The lack of platform data in the contemporary Linux
> shall not be the reason to display warnings to the
> kernel logs.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--SFRj7qQIoixq6PZz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmObACcACgkQJNaLcl1U
h9DSXQf9EkpxJ5dy2QkgnI9yJH0jtMm/WEJp0BP3BJ9Ka5U3Hc1MI7QlSJSZzisW
DNpojEv9KQAa44ZApBjCVSmtf5gcS3nH6hGKTa3Ry8Q3MrJlGNJoroTSzefJOONw
1h1Fvo4VLGqqHwmZeJ78nYPUlANvu6AITv/BxrOORiMMoCwgHGX2wRbd9rcHIn3b
OyADFZdv/oCT+pwJ4iFhgmO3f2OWyHRa/CyydB+q+7wMUolWYMQBlHMhp0RjXeUk
trDz7kDK4O/DI0d7lbexgjevycQLZFHqMD7L4lgfPermbNbvYwX7/kcMJ+YZZInI
9ib5D8iy4OfhxlLtfpme7Z5spcPrPA==
=0n0n
-----END PGP SIGNATURE-----

--SFRj7qQIoixq6PZz--
