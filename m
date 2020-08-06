Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F63123D9F3
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Aug 2020 13:30:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8CD61663;
	Thu,  6 Aug 2020 13:30:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8CD61663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596713453;
	bh=SXBG3d+40joIiETd4BEf9KDW1I5AsutaJSgaQGqb84k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LuyGg7pngsgautVZKDd1g0eBScL9WhZxMso8ZLYsFUjPgEK55sicMu0d4kae9Olwi
	 PUrY0wYh9ojn9djkuU6H34g7c5hrBvbsRvwrct8+Fgz1mWY1AE5OMnPt7RjieEidp+
	 EqxgKtPtzjNaiMwxkLrMeES0ZFJvZe7t+uBQRxv8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0278F80086;
	Thu,  6 Aug 2020 13:29:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C931CF80159; Thu,  6 Aug 2020 13:29:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 599F4F80086
 for <alsa-devel@alsa-project.org>; Thu,  6 Aug 2020 13:28:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 599F4F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GhjzyO5t"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4FAAF20855;
 Thu,  6 Aug 2020 11:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596713335;
 bh=SXBG3d+40joIiETd4BEf9KDW1I5AsutaJSgaQGqb84k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GhjzyO5t2lZbx98Q4lcj/h975RF5zZJUyBjr+rFxL4lOT4zkMZ+laBDYkGRDrNGcD
 AuWB7JBjFZDDD8OD3InXu+oEKrgfO/dhCmOmGpz7N9lQ9YzpQUis7j5JPU9cYSi1FU
 +aLOSKQ+1x1WjqtDMFGVRCEsS5xQ/qF2OFHxa4Zw=
Date: Thu, 6 Aug 2020 12:28:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Subject: Re: [PATCH] ASoC: amd: Replacing component->name with codec_dai->name
Message-ID: <20200806112831.GA6442@sirena.org.uk>
References: <20200806101451.7918-1-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline
In-Reply-To: <20200806101451.7918-1-Vishnuvardhanrao.Ravulapati@amd.com>
X-Cookie: Hedonist for hire... no job too easy!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Akshu Agrawal <akshu.agrawal@amd.com>
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


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 06, 2020 at 03:44:12PM +0530, Ravulapati Vishnu vardhan rao wrote:

> Replacing string compare with codec_dai->name instead of comparing with
> codec_dai->component->name in hw_params.

Why?

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8r6V8ACgkQJNaLcl1U
h9C99wf+Iwfs3UAnESFIX3Jun3tiCmnkiuI29dljakUab4crGEgKNWCADublBHk/
8d8piOMAHBtWET14c2kaaCFv8h+6R8YxULrI5lPtMpCt9HZ+AiE4WozIy40VoWk9
u3DhDuk69o5ghnTlETNo5fdtYURPk45dZ6mgZYKlVX/vuIZLtGOK5n+UJT3yCn8p
5tbr/j4E8nIkTHhicgYAB62oSvedeRZeFuuGD6LodfgIexQsNVke8UEXgHftCkrd
Tnxx3YUc8eEPomhMY/v8S33ICO9Y6P5jabrGZSFKLaI5Bc1236r2SPAhPMYep9bO
IKSc8vpRI5xBjJhnVrX+BNUjFTNFpw==
=bFdy
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
