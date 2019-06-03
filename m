Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E513393A
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 21:44:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DA9B1669;
	Mon,  3 Jun 2019 21:43:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DA9B1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559591084;
	bh=w30iB7U5X91m8HoPseb9lDyTgiFtSutm7TwETwbHjBs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R1DeKmGa9TOAAllQvzDhULthdr6r3SmErLMwZ4kWG1bGmmqepJSjPwnhvAcIieVcw
	 xue0vgsmzcUoKG+MCOqUm57VtlYkxwxIFzGOcQFnWkEpisqRb/Eln8y1NZc24DB1Xc
	 fsnMDL2mzh2p8P3tXLEJcB7J5P+4EoQUT1TVfBvk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11A45F896DE;
	Mon,  3 Jun 2019 21:43:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FCCFF896DD; Mon,  3 Jun 2019 21:42:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61DEAF80774
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 21:42:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61DEAF80774
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="a98VLgOi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tIfrvoNIspI5CbqTkEV2gEODTfE7BNawMwUOeLc4PO8=; b=a98VLgOiYRjz72k0y9ipB08y2
 KdXOhsLbCb0GZQg4tl0ds165u9gRRWFROIotblTXX0AEJn5RtZHCZs2dAcP4ZwKmYVjhpawu89Pm+
 3sOdQYEY4CunR2NMqRtosxVuKNt6Bg18bETIqs1WLcb0a10csvKVzg6QMGGxEGxS6spY0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hXsr4-0003pk-1l; Mon, 03 Jun 2019 19:42:50 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 57C1A440046; Mon,  3 Jun 2019 20:42:49 +0100 (BST)
Date: Mon, 3 Jun 2019 20:42:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Gwendal Grignou <gwendal@chromium.org>
Message-ID: <20190603194249.GD2456@sirena.org.uk>
References: <20190603183401.151408-1-gwendal@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20190603183401.151408-1-gwendal@chromium.org>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-iio@vger.kernel.org, bleung@chromium.org,
 tiwai@suse.com, linux-kernel@vger.kernel.org, groeck@chromium.org,
 fabien.lahoudere@collabora.com, enric.balletbo@collabora.com,
 lee.jones@linaro.org, jic23@kernel.org, cychiang@chromium.org
Subject: Re: [alsa-devel] [RESEND PATCH v3 00/30] Update cros_ec_commands.h
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
Content-Type: multipart/mixed; boundary="===============0496705268630497194=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0496705268630497194==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/w6WUUxYkubDgwa5"
Content-Disposition: inline


--/w6WUUxYkubDgwa5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 03, 2019 at 11:33:31AM -0700, Gwendal Grignou wrote:
> The interface between CrosEC embedded controller and the host,
> described by cros_ec_commands.h, as diverged from what the embedded
> controller really support.

I'm not clear why I keep getting copied on this series or why it's being
resent?

--/w6WUUxYkubDgwa5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz1eDgACgkQJNaLcl1U
h9CUdAf+P7DPQoMLbmeun5gNLN/SYRZqIpBVijDS49/Z+3iKziqHNPbU20RonvSz
T4tnB1L5i1kpNoERu8p4Gi1EZZxci83XbMhdY3lFpB9g8hG1Rzbkr/hDNmW9gNRt
c8j7vHmPfUDkSFqW8q0xVFaUqKjA6bY/9fcnPQxjPO8JSI79pEEbWDW2Zl3rCjJU
HG9J9bJyyb1oi6aYeNaqW1yxlO0NGFMGOptkjnsMiFiezIyTXJvjyJkCRbDRvKO2
GONx71tvF+Yu5xgtjvHI4BvGRvTc7ACZHFzU1QddoviXcN5W8yQYRzUA22m0tQWk
/OZapcFla0zR1p4UibW4OXdzmbrOJA==
=MFOE
-----END PGP SIGNATURE-----

--/w6WUUxYkubDgwa5--

--===============0496705268630497194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0496705268630497194==--
