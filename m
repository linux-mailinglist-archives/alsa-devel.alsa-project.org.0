Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 929521EC255
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jun 2020 21:05:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ABCA165F;
	Tue,  2 Jun 2020 21:04:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ABCA165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591124734;
	bh=rjpg+Cd8C7kl/bDKSDmEIu0cpcg4zhOQwcUImpZGNTs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QF01ub2DK3tSu1BDICAkxGr/NsKUARUmwakxExNH9u1CBAfBZbLsOfgWXz9iv9axD
	 wym5giWG7yJpRfzVTa5y2UKiSMOyLnow5gcRRKZqjXwt867vzv5nSGCcuvnQg7sngi
	 igzbSdoys6IFk5dLyHGZeCNmOSRhJ4H8hDQfOr4w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90AC9F80272;
	Tue,  2 Jun 2020 21:03:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27178F8026F; Tue,  2 Jun 2020 21:03:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6175F800B8
 for <alsa-devel@alsa-project.org>; Tue,  2 Jun 2020 21:03:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6175F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XUDV1ipA"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5E569206A2;
 Tue,  2 Jun 2020 19:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591124616;
 bh=rjpg+Cd8C7kl/bDKSDmEIu0cpcg4zhOQwcUImpZGNTs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XUDV1ipAfshvFousTQnhGHlK0I35Dui94AXUjaOSsC2/htdOdfIVYPSXDEUDHLCVR
 jrX1mt+p/HsBSncKaXejFn/7bI3ngH9t9ihjnmzTG+3jNYtqkxdcFfJ7+enJGRAuU7
 LfgSdvg1t6sijak8wduPuY7GkUQaHnUHhhUupC6o=
Date: Tue, 2 Jun 2020 20:03:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [GIT PULL] ASoC updates for v5.8
Message-ID: <20200602190334.GK5684@sirena.org.uk>
References: <20200601121323.GB45647@sirena.org.uk>
 <s5hblm2iq1k.wl-tiwai@suse.de> <s5h8sh6iiyg.wl-tiwai@suse.de>
 <s5hv9k9fmha.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Xsn3knLL3qrmRbVI"
Content-Disposition: inline
In-Reply-To: <s5hv9k9fmha.wl-tiwai@suse.de>
X-Cookie: We are not a clone.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Steve Lee <steves.lee@maximintegrated.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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


--Xsn3knLL3qrmRbVI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2020 at 06:42:25PM +0200, Takashi Iwai wrote:

> But, looking more at the code around that line, I could spot many
> other bugs.  You cannot trust the firmware file and you must check the
> size.  The current code can trigger out-of-bound accesses and crash
> very easily when a malformed firmware file is tossed; e.g. just put an
> empty file (or a huge file) as dsm_param.bin.

Yeah, it's not great - the potential impact is limited by regmap which
will bounds check attempts to write beyond the last register (though now
I look again we're using unsigned values so we should definitely be
limiting the lower size) but it would be better to limit it to just the
registers that should be being configured.  Possibly even just to one
valid file length if it's always all the same registers being configured.

Steve?

--Xsn3knLL3qrmRbVI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7WooUACgkQJNaLcl1U
h9D/FAf9HGcNZECZYzKadqD5KNbgSRDQG2AKgeG0lOjPeQo/Fs8Rl+rbSWVcSE06
5vLi7ReBZuXtyAmiLnB6x787phImSVKaqfV0g/VEJKSEf46VSeSyNEXgh+Ao+Evr
Ur4uKnTQRqPoPqXVn3Vhz/zCAqDup/4eROm6POMDmisi2VLMvu4M8m2BJbAnyGZ3
vbzfhspadbtuSEm9QKbEyh+VRyqTlAye974pYEZTFPAZlWtTV46VaHikpeRXLr1P
tTL5JT3jK0wuccNnqrqZ0mdildXUxpNYQQkhpXMUbNJOsknHg5Bg52jatkhChytA
Ue7n3/MQ6CM/k4PLCPWTra9VLlKpig==
=2t5q
-----END PGP SIGNATURE-----

--Xsn3knLL3qrmRbVI--
