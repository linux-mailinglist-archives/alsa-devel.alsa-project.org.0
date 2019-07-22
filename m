Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B551703B9
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 17:27:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A167A1829;
	Mon, 22 Jul 2019 17:26:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A167A1829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563809219;
	bh=5f2wDbntvlE2o02o1tci7ikl+L+oRUb7m6U5kqV0b78=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HUtMQanJfzFXDBNAl4JBmXLB5G903by74lLZw60NZ9auhm4kecOq7E1x943zCeHls
	 8foVQJ79GttbbRhRNA7EWL3PpLq6E12La0QshkDnLl4kkV6T1K4qOPu99gzkWfZF7V
	 FXsTtdA1vmgeZshja4oLQ+249YN4UbWepQ/aG/aw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40688F800F5;
	Mon, 22 Jul 2019 17:25:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13178F803D1; Mon, 22 Jul 2019 17:25:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3198F800F5
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 17:25:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3198F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="n5fpAvXC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8uGkJGVxbMFF5D1ciuvZESlziSkzL/APCRuCcowjQuU=; b=n5fpAvXCbJ/AeqSnqM4Ckw33F
 SJ8r1kuMOyVJjS6aiO6kPscuP9hcSuxoULVgmZj6IqdD14Ap+egNhlABfJnILQRHTdyb4SsxVZnRy
 ah9Tn8kuzAi6iSEF6wS3wmQFBZrmDdlFKjuW0eJKVrVUjh9D+m01GsBPG4thvBYHwsWIE=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpa9O-0008P4-TG; Mon, 22 Jul 2019 15:22:54 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 1E24B27416F9; Mon, 22 Jul 2019 16:22:54 +0100 (BST)
Date: Mon, 22 Jul 2019 16:22:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Curtis Malainey <cujomalainey@google.com>
Message-ID: <20190722152254.GF4756@sirena.org.uk>
References: <20190711002838.35363-1-cujomalainey@chromium.org>
 <20190722122208.F2A0427429D9@ypsilon.sirena.org.uk>
 <CAOReqxjuZW8SP2JaReQNVej5=8qx7J_JfHPUAE9UhhME6_yVrg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOReqxjuZW8SP2JaReQNVej5=8qx7J_JfHPUAE9UhhME6_yVrg@mail.gmail.com>
X-Cookie: No skis take rocks like rental skis!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>,
 ALSA development <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: Re: [alsa-devel] Applied "ASoC: rt5677: remove superfluous set" to
	the asoc tree
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
Content-Type: multipart/mixed; boundary="===============0904676439110807891=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0904676439110807891==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hUH5gZbnpyIv7Mn4"
Content-Disposition: inline


--hUH5gZbnpyIv7Mn4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 22, 2019 at 07:16:28AM -0600, Curtis Malainey wrote:

> Can you please remove this patch? I made an error in my testing and
> the patch should not be applied.

As covered in the mail you're replying to:

> > If any updates are required or you are submitting further changes they
> > should be sent as incremental updates against current git, existing
> > patches will not be replaced.

So send a revert explaining what the problem is.

--hUH5gZbnpyIv7Mn4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl011M0ACgkQJNaLcl1U
h9BA/gf9EuLkt2SvEPYRSRoZj/gqyKN4Q9AZkfO1G5QS6Bnt5Wj1NoNyrFx0Ujnj
0izvRVLg6QoqCrBXxG+cvBZIysjkCPfFLjmVkVSHS2xmc/VH3w3Da2ddgnHAZaTm
TYMUk9VwZLohyU40eG5+62ZQqyQNsC3THAUZ/JSFvKs5a7qmUQ7BNgIz8iX5lhiD
Pm4A2v6NeTCjaQoK4+NhJq702tJutQYMbNXlLeGZnAq1y9BCuT1+hcfuD47vw7Jj
5Ra/dSnzw5z5qsjGTliGy8rgp8HV+RoN+B7G/ObUft4ggVZKE3jL4u6+GFlIbZuD
OiUuXe+B+ir7sQCqpHEE/ADFyxz3Zw==
=0s6k
-----END PGP SIGNATURE-----

--hUH5gZbnpyIv7Mn4--

--===============0904676439110807891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0904676439110807891==--
