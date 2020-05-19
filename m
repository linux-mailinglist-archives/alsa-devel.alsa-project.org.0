Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 498E41D956F
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 13:40:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E59431735;
	Tue, 19 May 2020 13:39:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E59431735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589888418;
	bh=V4Pf3G0nJRIZxOcmlYms33+AVzNlgwE6TdTiO0dJCH4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dxn3s+THLo7wJ5iNkIQcC8s7+1rxAuaynUhxGFwtH28SZUalnnXrwrOOFvg9sjohw
	 A2h2Oi/xq3H0p89TwN70cPxieBLZzIhuwM1yWkK8TC1nl+1YXybPOWeFK4aHPmOKQS
	 cQsuO9sTlw4mJeAf8+il7geluwdWLkDW/b+LGQ9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2459F801A3;
	Tue, 19 May 2020 13:38:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25511F80229; Tue, 19 May 2020 13:38:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97A1BF80132
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 13:38:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97A1BF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jILmREc8"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C4984207D8;
 Tue, 19 May 2020 11:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589888323;
 bh=V4Pf3G0nJRIZxOcmlYms33+AVzNlgwE6TdTiO0dJCH4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jILmREc8+Z2lbS/poYuDLRxLVoih6LdoFDizQyRTi2iD1hLa7uGGp8K1efoTS7vFN
 cPW7OW1qGTVZnB8pJO1eeHbZV6SA/iYT18MC/F85evulxzRzBaibO6vCvcjcxKUzan
 TqrM/NzlzNgE66QJ4zeCp5ywqnsMamIhVjbPle2I=
Date: Tue, 19 May 2020 12:38:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH v3 00/14] Add Renoir ACP driver
Message-ID: <20200519113840.GG4611@sirena.org.uk>
References: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="p7qwJlK53pWzbayA"
Content-Disposition: inline
In-Reply-To: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
X-Cookie: Do not write below this line.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, Alexander.Deucher@amd.com, alsa-devel@alsa-project.org
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


--p7qwJlK53pWzbayA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 19, 2020 at 01:16:50AM +0800, Vijendar Mukunda wrote:
> This adds an ASoC driver for the ACP (Audio CoProcessor)
> block on AMD Renoir APUs.

The issues I found here were relatively minor so I'll go ahead and
apply, overall this looks good - please submit incremental patches for
the issues.

--p7qwJlK53pWzbayA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7DxUAACgkQJNaLcl1U
h9CUswf/WHrQr6LYKQS8lVQMn2moWhuW8TTxK3xAXztG/uMSjZwtGjRz2gtY7kRM
4vyosEuXSdzLwk6zPyPgqZ0FBa6FonsK/E4Vf1NjP8zyfkk4MWfAQIUDwEViHbKT
PWZMF24/qs5R8L4KcHIuHgdRGCchgsnJXXpcRfgES5xZa1Q7NNgYARYkvKE20nvv
eValp/iG3CBhf4WBgBlf7dJHdYrjY9F+8umOS4S7JoVuhZbnBCjW4fMz9afqDL14
mGtMzxFnR4Z6+vZP6KlrfxLDvRrSXegpiq123pEC32FJGAtUhZS+ru4/xLSYzSxb
UfEWVPgE3vHl0AAbgXoLwuFF/HiGtw==
=jIbR
-----END PGP SIGNATURE-----

--p7qwJlK53pWzbayA--
