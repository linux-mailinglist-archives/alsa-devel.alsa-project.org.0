Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDB06899FF
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 14:46:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 493B3F7;
	Fri,  3 Feb 2023 14:45:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 493B3F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675431974;
	bh=Wy9AG3K14zxfoptbmsfeEPp7B0QajzYRcPSYgD6sS9U=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=tmAJHYnlXMqki47PjTd3JPc4+stRH3N/8CBBZIT3N4TT6k1zqZ2UH5wdH60qpdmsl
	 dlz6vxb8mEl1u/drQ02bbPNb6CxhRu9VEJFsd7UpvzR3uDHuv16wWw2Cku1U2U9OOt
	 +FYhdwSZ95q0q/Ts6mDMq0JzUMD5TI0R/1gQ776c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EB3BF80254;
	Fri,  3 Feb 2023 14:45:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A775F800E3; Fri,  3 Feb 2023 14:45:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13042F800E3
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 14:45:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13042F800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IVX/4FUk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6D7EEB82ABC;
 Fri,  3 Feb 2023 13:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07716C433D2;
 Fri,  3 Feb 2023 13:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675431908;
 bh=Wy9AG3K14zxfoptbmsfeEPp7B0QajzYRcPSYgD6sS9U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IVX/4FUkA4eGysc/L3Byu8nQ1t6WweFMKY1v79CHby8//Fxt+7NbzX14csykuwjGr
 J2KjvUkas2yEs2QW0XTCi1+6xLZWbilWIt1XwR1/pb59yV0dW1on0bLfp8BaR08P+e
 H/CujClHD55QOFdEzuR5tvD60zIIqqJFxopZ5DGg86aXhG3yTX3M+VuaNiHt6iuQvQ
 Zhr42yfItxaWTuw9S3Nmdvs9WaR2TZZaSmC4et0zQ241a6wqb9l1g15jKIFrfyVRLz
 FoBRCXmWxlXvStgFSu8CSptF4O7lQHP/YkrlWS7jDYhgGWWDi+QFtE5PQn+qqLhqUd
 nBfdCbnjG4wIw==
Date: Fri, 3 Feb 2023 13:45:02 +0000
From: Mark Brown <broonie@kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH][next] ASoC: uapi: Replace zero-length arrays with
 __DECLARE_FLEX_ARRAY() helper
Message-ID: <Y90P3kik6ONZg3U4@sirena.org.uk>
References: <YzIzUjUuJKf0mkKg@work>
 <fcd83e77-a3fb-9061-771a-8509ea6f5950@embeddedor.com>
 <Y9wmnfTi/p4FuRmd@sirena.org.uk>
 <bb43c410-bd8c-66fe-19a1-0f41442838eb@embeddedor.com>
 <Y90ExljX2qCsowhu@sirena.org.uk>
 <652684af-bd10-99da-1ed8-104407493428@embeddedor.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="a+RL9goM+en75Ex9"
Content-Disposition: inline
In-Reply-To: <652684af-bd10-99da-1ed8-104407493428@embeddedor.com>
X-Cookie: No animals were injured.
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
Cc: alsa-devel@alsa-project.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-hardening@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--a+RL9goM+en75Ex9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 03, 2023 at 07:27:03AM -0600, Gustavo A. R. Silva wrote:

> I think we have run into this same issue (you not being listed in the
> MAINTAINERS file) at least once in the past, right? (thinkingface)

> IMHO, the sensible solution for this is to keep the MAINTAINERS file
> up-to-date. So, get_maintainer.pl can continue to be useful for people.

Sure, feel free to send an update...

--a+RL9goM+en75Ex9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPdD90ACgkQJNaLcl1U
h9Dg2Qf/dc15eT5JBy548fG5ghzHAthljy6CLlz2riJJ5d+aSaHFP2ozN3R/3yeF
hekVU8fH9qUuXDnP9/mno2TU769tac3aNP7lr1iVTW8hlXi9W3ya8XtRg40cAPRz
rnDs9hfIigQnDnxpcfGSXkEqpVt14seZHfQSHIXF9GO+lZztPRcZ0IlTRm+3BB2g
lPlMwGRfiHjS4/knP4zpurCO7n7sBJIfX+lLySlOk74J2O3s3nM9M7XlXLggCMoX
zqSzSsk4mO1pkYHJ4LnxAhE55TdGgGfvFmPAPPVu/BDPemXfIf5W2vTcim3IU0vM
qdxpb16RGx6lETBw+SUik+epxfrMKw==
=Ltsr
-----END PGP SIGNATURE-----

--a+RL9goM+en75Ex9--
