Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E08F4C08
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Nov 2019 13:45:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 963F2166E;
	Fri,  8 Nov 2019 13:45:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 963F2166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573217154;
	bh=NFie4XuJr30D1ut8StxMcl9pjWBPV08CG9dMsfQYek0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jq5TBGyw/h+M/Xj2pbTCtQz8YoSXTtK9x9kc5/vSRROvP4GBsReO/HwZxyfjbqeFM
	 Ggij4xaa2HU6KBxrxMEpHINLIq8t33cZ88vPAwxEV6yDv5urL9NhmpyirbwIpQhBM7
	 aAzw3amCMhAvoT4QrzfY0YCM2xkMe4BJ2o+LrgRg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE30FF8045F;
	Fri,  8 Nov 2019 13:44:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68A18F803D0; Fri,  8 Nov 2019 13:44:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 140F2F80111
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 13:44:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 140F2F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="MnAjPXJM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vb6sulDITUZ/2miwyL8dm6KA9eJZHHxbMMj6uUNRs+0=; b=MnAjPXJMYZ9t0ffzIBxOyprBB
 JpNUrpZh7Fe5kpn6yEZNlzeoRdRYlkBgY1jrCU7tHb49GBwX/08sqClCmgAygms4nYqt37eaesMnu
 WjfLqNVGAhMaJd9XPZc5OR4Uzj3cQRGesKzZWbmXlmJ6MW09lCpC1DDrsQBkcBqP5EL0g=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iT3cM-0007Gk-OS; Fri, 08 Nov 2019 12:43:58 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id E5C0C2740C6C; Fri,  8 Nov 2019 12:43:57 +0000 (GMT)
Date: Fri, 8 Nov 2019 12:43:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191108124357.GC5532@sirena.co.uk>
References: <20191108094641.20086-1-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <20191108094641.20086-1-tiwai@suse.de>
X-Cookie: Life is like a simile.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 0/8] ASoC: memalloc cleanups
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
Content-Type: multipart/mixed; boundary="===============7828958823311598662=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7828958823311598662==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Md/poaVZ8hnGTzuv"
Content-Disposition: inline


--Md/poaVZ8hnGTzuv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 08, 2019 at 10:46:33AM +0100, Takashi Iwai wrote:
> Hi,
>=20
> this is a patch series for ASoC to clean up ALSA memory allocation API
> usages.  It's based on my recent API changes found on for-next branch
> for 5.5 merge, so please give ACK if it's OK, so that I can merge them
> into my sound git tree.

Acked-by: Mark Brown <broonie@kernel.org>

--Md/poaVZ8hnGTzuv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3FYw0ACgkQJNaLcl1U
h9BspAf8DbasqMh0CQ4rUlCzs/koWXzPgK5QZwE07X0DE8rS/9TRk8xRBkGecHcM
VJnZrX8FbuR+Yi9P6G30Ji4sy11k7ChLItmZBXTKwM32tyMLzfe/uCS12FNmDDhv
Ypyo+CoDCdQjo5sBrRJhvNlK0DmaDAWtuf3mFLzbUoIsWgSoowwagt9m5VVyeftg
06IuD4KioXQIAaSoLab08cIvdT2ShJBYcV781COafSSszPiT3kReu75z0UqEn+J3
ReblmL3EdZZEBurXTvwHg4CONeX0wp6g+QcSXb82UbU972xn7oW4HWjDoVkuspX7
+cYe8D8BNLrkkiHmuj/prtwrgSFARA==
=9PeJ
-----END PGP SIGNATURE-----

--Md/poaVZ8hnGTzuv--

--===============7828958823311598662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7828958823311598662==--
