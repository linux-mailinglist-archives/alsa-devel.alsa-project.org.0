Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8B115BFBB
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 14:51:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFB2A16A5;
	Thu, 13 Feb 2020 14:50:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFB2A16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581601874;
	bh=5LTjvV5gVgQVPgEscDU9z4LKlAuAU0AlLqGAJp6SDXk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fRxrKamA4vCSGhv8P2pOMdpTZSnDh6wRYc8Ub/ozaztzYVH0L7NkTpnQx3/nvf/wI
	 yiwJUe7B8okPk3LLTnhzjELVPDlxEawNUu8CNcZx41J/S6P3wljv02pvs/T7HKJG8Z
	 ZOH4Q7rwHjdH1jOJQ9bmf7UVuBxzrblUFFL2iHj4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E78A0F80146;
	Thu, 13 Feb 2020 14:49:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7CBEF80145; Thu, 13 Feb 2020 14:49:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 62115F80138
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 14:49:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62115F80138
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A5841FB;
 Thu, 13 Feb 2020 05:49:27 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F1FC53F68F;
 Thu, 13 Feb 2020 05:49:26 -0800 (PST)
Date: Thu, 13 Feb 2020 13:49:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Message-ID: <20200213134925.GF4333@sirena.org.uk>
References: <20200213032728.199462-1-tzungbi@google.com>
 <20200213112003.2.I1d568b0c99742c6e755d051aadfd52e4be3cc0a5@changeid>
 <20200213122448.GD4333@sirena.org.uk>
 <CA+Px+wUCaLYrYR_Ff6tJGWaE+w=Nk=4JFJYu8zfT_MXZ2YR+UQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+Px+wUCaLYrYR_Ff6tJGWaE+w=Nk=4JFJYu8zfT_MXZ2YR+UQ@mail.gmail.com>
X-Cookie: Academicians care, that's who.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Dylan Reid <dgreid@google.com>, Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] [RESEND PATCH 2/4] ASoC: mediatek: mt8183-da7219:
 pull TDM GPIO pins down when probed
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
Content-Type: multipart/mixed; boundary="===============5677911211588957813=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5677911211588957813==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JSkcQAAxhB1h8DcT"
Content-Disposition: inline


--JSkcQAAxhB1h8DcT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 13, 2020 at 09:42:25PM +0800, Tzung-Bi Shih wrote:
> On Thu, Feb 13, 2020 at 8:24 PM Mark Brown <broonie@kernel.org> wrote:
> > we might want to have some general pinctrl integration

> I have no idea what it could be so far.  But I am willing to help if
> you have some draft ideas.

Off the top of my head if we have standard names for the states then we
could make DAPM widgets for the pinctrl stuff, probably like the
regulator supply ones since typically there's multiple AIF widgets per
physical interface.

--JSkcQAAxhB1h8DcT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5FU+QACgkQJNaLcl1U
h9CGswf/V7zm9D2sanigk36QMwu59qcefX2ljwQO2NQon3r5OEEGRoyJgQubOh43
JvuY/H/dikrXT2Qi5mkofz0aF07JLtfs61whYDGU/wZ/mSKUgDyCFxXJZvG/ve1L
l72ipcL5lsvAotbkDdYsPefqkrrX6AZUlG7LrehvaIwM8bHMNPOpGs/lmlI6s2oC
IJTfOLPBKDKU8IeirefrqC0s9vUGwijeUNlKtHrKvQzYk4Tcw4UZERqu2kEpCJJI
xt2VLaZ4lqK/Vn7yv3qFpPNwCA3AFilVdqdVm5lvzOM2+DKNwRaFJfE58jg5QXRy
534CtOdDQyMHmyCzedks9xvbJ0radg==
=2KN3
-----END PGP SIGNATURE-----

--JSkcQAAxhB1h8DcT--

--===============5677911211588957813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5677911211588957813==--
