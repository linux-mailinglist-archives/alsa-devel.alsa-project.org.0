Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3629A23A2F0
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 12:53:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCF79166B;
	Mon,  3 Aug 2020 12:52:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCF79166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596452010;
	bh=ACZ/ZGRaPUI2z5RqRCc5uHOjppVPBvjqY+ekgc1FSvs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JEw6KcRitMYC+8tcPjite19cnmDj24pDBa9XZMABnZ+1ifRwTimdv9TQ/t9Caav7F
	 6EhJUdX6XsLZ/XQ1Ddaic5qLNUtzVHnQcq8TzZsPO275oCEex/N5nJtwksdUs1qXq1
	 bBwZ1DKlXQY7L1ZWN0A2FOYhbN2QU4m0Chl+WM60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AFF0F80234;
	Mon,  3 Aug 2020 12:51:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 883B8F80148; Mon,  3 Aug 2020 12:51:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AFFBF80148
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 12:51:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AFFBF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tY6Ktofj"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D0852064B;
 Mon,  3 Aug 2020 10:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596451903;
 bh=ACZ/ZGRaPUI2z5RqRCc5uHOjppVPBvjqY+ekgc1FSvs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tY6KtofjyGkoDxlmdaiuEpt6X9K84+2P5Drr4yoqeXTCc9p9VEoMT2sWvbxjNVztl
 kur9wvTmAG+svjMcmrzvnnI53qG1NOWj708Y5jFQt6gDlKP5Bp1Cwsmzr4eZgkJOe/
 Fm3zwIJKM74zriYzxagLVUqpDCSht+lhNSybfyww=
Date: Mon, 3 Aug 2020 11:51:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH] ASoC: wm8962: Do not access WM8962_GPIO_BASE
Message-ID: <20200803105122.GC4502@sirena.org.uk>
References: <20200717135959.19212-1-festevam@gmail.com>
 <CAA+D8AM8EKowXs_0nyNKMa0odyEAF=Sgu8y2n48pGFnEbE0Mpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="p2kqVDKq5asng8Dg"
Content-Disposition: inline
In-Reply-To: <CAA+D8AM8EKowXs_0nyNKMa0odyEAF=Sgu8y2n48pGFnEbE0Mpg@mail.gmail.com>
X-Cookie: They just buzzed and buzzed...buzzed.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


--p2kqVDKq5asng8Dg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 03, 2020 at 10:07:06AM +0800, Shengjiu Wang wrote:

> WM8962_ADDITIONAL_CONTROL_4 should not be removed
> from the readable registers,  after this change, there is distortion
> on output sound. but this patch has been merged.

If there's an issue please submit an incremental patch fixing this.

> "[PATCH RESEND] ASoC: wm8962: Do not access WM8962_GPIO_BASE"
> that patch is correct.

If the two patches differ clearly that wasn't a resend :/

--p2kqVDKq5asng8Dg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8n7CkACgkQJNaLcl1U
h9DI/Af+K05B4ann59M1hjtOplSwDx7BbXgZ6r4u9p/oP4OwMRqDU+hqole/1iQI
+w20rGSkNVque8he+uanlg6wCKUsrccJS0KmLZGV4XkGbn4THTqsD+JlDi93HKSi
dt8aibL57mBI8IhX708s5DQ7rVeARwHY/h4+R7tzkHA+3e8KW2INyb++KrJgcKdr
azuUQjS06jc317oak+Odj0BEyaPliRa4V44FoaER470fz1kGYQ0BPl1AwnweV5HD
QuZT6i4QIL7uxKDGRlgiGdYt83FsXDq7VU5ftICRQU4piiYB1848AnxvgaY86xbl
3cTa7KeXU549JzvjG1QZgzLi4AO0Dg==
=wCkk
-----END PGP SIGNATURE-----

--p2kqVDKq5asng8Dg--
