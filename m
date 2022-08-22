Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE66959BFB1
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 14:48:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3BE41680;
	Mon, 22 Aug 2022 14:47:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3BE41680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661172508;
	bh=45sAp7NJ5Cp2njuLK4XNvKlRVvcRksGwnpjWb0Min2U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hQFWv+j/u6FNLrZp17DN0mCswV5xr4FdnhmXapm6UClnVTubJbHURYyUDCuh2KCk1
	 x32CsEkFnVKk4IJqVTbOMMssDWxHnzqfo/VACxxcjd1mHAL76DNhbGOcnKNKjPIfIu
	 2pFRHNHTjC2US733hZ9FPyluKPBr+QNRXhLww3Hw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 364FBF800A7;
	Mon, 22 Aug 2022 14:47:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0659F8026A; Mon, 22 Aug 2022 14:47:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73C07F800A7
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 14:47:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73C07F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QPHQHw7X"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D34A361148;
 Mon, 22 Aug 2022 12:47:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D44D0C433C1;
 Mon, 22 Aug 2022 12:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661172441;
 bh=45sAp7NJ5Cp2njuLK4XNvKlRVvcRksGwnpjWb0Min2U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QPHQHw7XYZrenAs5qCyREmmfBceoRLmbWQfwLqlBQ5wzQrSkwqG9UNT1sx4QOb1Wy
 vRcEuTYz9n6tbcfncVaVkf5melaONOwjsKdn+GuyUEvrhEpNewYQa5MlOKqUrL1+h2
 eemx8iPdaOVmHOFbL+S+cuNaVC6TCpQwsvyJZ3GEXnCcUBS0GdnI3hwwnepn1sNKDe
 51J7i5j1rrY/yQJkd6eni20Uu3z3SCQGCEN4JhmVNWwOhav6qVOeVDqS2DoNk2v7mk
 tzxBqBajClRF1iZP28HfmOBok0poMQwGdpKri/HrCHRl0qvwvEp6mtAxpAyxeiaEP4
 4WPjBIFuZYQpw==
Date: Mon, 22 Aug 2022 13:47:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ASoC: dapm: Export new 'graph.dot' file in debugfs
Message-ID: <YwN61JsJZNqCT/Vf@sirena.org.uk>
References: <20220822095242.3779-1-povik+lin@cutebit.org>
 <YwN2Pd4Ez08yDFno@sirena.org.uk> <87bksccv7x.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="WIOPiZGstgIytBzh"
Content-Disposition: inline
In-Reply-To: <87bksccv7x.wl-tiwai@suse.de>
X-Cookie: Do not write in this space.
Cc: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-kernel@vger.kernel.org
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


--WIOPiZGstgIytBzh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 22, 2022 at 02:34:58PM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > There was a tool floating about in the past (last copy I knew about was
> > on Wolfson's git but they took that down) - can we not just continue to
> > do that?

> IMO such a conversion could be done in user-space gracefully.
> Or is any info missing in debugfs as of now to achieve that?

Yes, we should fill any blanks in the data that's present already.

> If any, we may put such a tool in the standard repo (e.g. alsa-tools),
> too.

Indeed.

--WIOPiZGstgIytBzh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMDetMACgkQJNaLcl1U
h9Ac+QgAhdjWb5JcUjMSz6beTHlNa/jbsyJiL7IKyCYZc11ipw8TpfGug2pwad6K
jGTPMuJielQfFZoaYZP1cEMiuxTilJrnQbxRuDEIf6lp6c2X/UNyHe0UIp/ZAuKX
Ef9eIHN9IrLII+gcmhhmN0jU7YY3PcrmCUmI5lFvHkXmPMR/JjLjLL0DEHu5S5Jl
Wq1/osIrHEjDGhxd8Z5ZPRS+MPBm7AD/1jyaGj4jlse0JqEq3hoQM3S3cuqLyevn
jbTrItUrfiWIZDWOmUk9bN7VIfDUg1TI3orZczGOD7719/wah0fy57PVczV5kRpA
HEjPVfJjap+2OuH1zL7tHARKZGs8iw==
=D+yb
-----END PGP SIGNATURE-----

--WIOPiZGstgIytBzh--
