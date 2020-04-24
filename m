Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 493131B7275
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 12:48:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEA9916C7;
	Fri, 24 Apr 2020 12:47:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEA9916C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587725321;
	bh=IewgKVWJvxyhdE4TKcCYoEvv7xD+0FgI7QpltLoN86M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dl9oXReZbZfzg2aZJVyx1kP4nv60nX+BPkzqJkbf/o1F4eTajiE1fP4MQiSd4U2Wa
	 6/uRAopripAHewJDKLOrM5GVAiU5O7UG0VfA1mbia7Rva1x/uJ4Xy7ot/nOCKEnh+3
	 PCOY94ApWLSFUg8jAc8s+AhJhhXB+1Ox1FqdQWB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10FDBF800BE;
	Fri, 24 Apr 2020 12:47:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98244F80142; Fri, 24 Apr 2020 12:46:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1ABE1F80116
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 12:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ABE1F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GP0EHgRP"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 146732064A;
 Fri, 24 Apr 2020 10:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587725209;
 bh=IewgKVWJvxyhdE4TKcCYoEvv7xD+0FgI7QpltLoN86M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GP0EHgRP62u/B+a36tX2U1F85Xn34FBjvigS/Dh48dUQcn+s+5WAOzeGnKIQb/g91
 ZUpE4Znj6F+mCM+3S7ncf/anWckRzANZL1ebbEG8WmnbkOplFDkoNtXpONO8UnKm4m
 ORzXELHjJGWh9a9316DHpqzcxadJBitPQ8SJUh5o=
Date: Fri, 24 Apr 2020 11:46:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm8962: Force suspend/resume during system
 suspend/resume
Message-ID: <20200424104646.GC5850@sirena.org.uk>
Mail-Followup-To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, tglx@linutronix.de,
 allison@lohutok.net, info@metux.net, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <1587708727-13657-1-git-send-email-shengjiu.wang@nxp.com>
 <20200424104347.GJ44490@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="m51xatjYGsM+13rf"
Content-Disposition: inline
In-Reply-To: <20200424104347.GJ44490@ediswmail.ad.cirrus.com>
X-Cookie: Information is the inverse of entropy.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 tiwai@suse.com, lgirdwood@gmail.com, tglx@linutronix.de, info@metux.net,
 allison@lohutok.net
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


--m51xatjYGsM+13rf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 24, 2020 at 10:43:47AM +0000, Charles Keepax wrote:

> intended to put the CODEC into runtime suspend. I am guessing the
> reason you have problems is because of the driver doing its own
> pm_runtime operations in set_fll, which probably takes an extra
> reference preventing the power down. Is a more complex fix
> correcting the interaction with DAPM the correct solution here?

Or just updating the machine driver to turn off the FLL when shutting
down (or even when the device is idle in general).

--m51xatjYGsM+13rf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6iw5YACgkQJNaLcl1U
h9DD5Qf/aNoM7gNzCjtutvsHglTVC2IeVikq5qWepEIkjE2Za8SbDHTb+o+EFvnR
D21oMf1biEpUZitXu5tFrk+vhCLLXD+lsPathUE0suZubm1tUrmsEyLmZ5tzWO5R
LE/KIAA0VGzkInIq8ywzUP15Yu8ruUMFfDWiKpFWn8t8yFfkOqWhH5VpvE59b0za
dixQK3ngHIh2D37+GxZ0iJWDpaF0mmk1qfn8wAKYWp3RxMCTbNRcRfzZm+qXkGPd
QUJnnN3+dovMnbR1U838fb9x83DjFndOOCGoRbNJ9NA6mPuB1Ubpu/e6QE8d0BOT
7G3qLT5B4KrGBSIaRbBzSj9flX7Snw==
=SsMB
-----END PGP SIGNATURE-----

--m51xatjYGsM+13rf--
