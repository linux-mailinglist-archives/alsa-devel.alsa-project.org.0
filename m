Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9E02F32B2
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 15:12:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D81F8170B;
	Tue, 12 Jan 2021 15:12:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D81F8170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610460771;
	bh=hpBkXkpfVvhqn9UxMndwBMEg/zq+ZpBDqDGrYlMlsxU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=INP+2CMg/Ltp9f9qFCPPj5QQVGMWdPXTd2KK7LYywssxAEZmfO7NDJTx2u8ev5uKp
	 7Xm1+JZlj8p7LEt2P1ol6WmJorAxsVzCZoAoH9ffBjrQXgQAKFeZhAjQv9tZ9Qwlng
	 E7fDdh0zLXtpy/2CKZkCQZLZE2O9HUEQTYHwE8Gk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3905F8025E;
	Tue, 12 Jan 2021 15:11:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD62EF8025E; Tue, 12 Jan 2021 15:11:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4114AF80113
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 15:11:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4114AF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RGgKME/N"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B32EC22CE3;
 Tue, 12 Jan 2021 14:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610460670;
 bh=hpBkXkpfVvhqn9UxMndwBMEg/zq+ZpBDqDGrYlMlsxU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RGgKME/NkiIOUGZpTTOkLQ5dM/Ds/F6lXcRUxQZRCf3mI1fevkQeNQyyBGEnOFKiZ
 SXsCn/ogR1Tm4njb2wwV3QOONqYdMUUeJYk1j40KhAr7kP2ZjMEjPgKVMNBi/c/OwX
 phj/rJlg6jL8xyUs5trlYoagvyHuFV0x90r3kYntXF22hZl7vwnRdUonUrqqbsNPEA
 qrhAFoDiY3btHmL9QxSiakPNIZ1Oucnklp7d3NVZyp7lWXZDGt0tiSAlBZtW9bb5ZO
 w9PMIAUwUOQwLJPvGCLV1BqhlBq93ZhIjrPhIQOivk1OQhZ8Tg6JG9B4KfxT8D9Hsj
 AxkVBn9/ZTaqA==
Date: Tue, 12 Jan 2021 14:10:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Guenter Roeck <groeck@google.com>
Subject: Re: [PATCH 1/2] cros_ec_commands: Add EC_CODEC_I2S_RX_RESET
Message-ID: <20210112141036.GC4646@sirena.org.uk>
References: <20210107085942.2891525-1-yuhsuan@chromium.org>
 <20210107135459.GB4726@sirena.org.uk>
 <CAGvk5PqMCEib8Yr=V4SxT0BBMoC1+yGXm0y+52+LwC5dPQUVnA@mail.gmail.com>
 <20210112004207.GN4728@sirena.org.uk>
 <CABXOdTc-HkVW7UuDLoWf2opVO1n-W2EF-E2hJEm_D6=2P32_qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oTHb8nViIGeoXxdp"
Content-Disposition: inline
In-Reply-To: <CABXOdTc-HkVW7UuDLoWf2opVO1n-W2EF-E2hJEm_D6=2P32_qw@mail.gmail.com>
X-Cookie: Stay away from hurricanes for a while.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ALSA development <alsa-devel@alsa-project.org>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Yu-Hsuan Hsu <yuhsuan@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Prashant Malani <pmalani@chromium.org>,
 Pi-Hsun Shih <pihsun@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, Cheng-Yi Chiang <cychiang@chromium.org>
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


--oTHb8nViIGeoXxdp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 11, 2021 at 05:52:31PM -0800, Guenter Roeck wrote:
> On Mon, Jan 11, 2021 at 4:42 PM Mark Brown <broonie@kernel.org> wrote:

> > TBH that seems like a big enough change to split out from this and done
> > as a separate series, I'd be perfectly happy to apply your original
> > change.  I guess part of doing that sync up should ideally be to
> > refactor things so that it can be done mechanically in future.

> Being able to do it mechanically was the idea for introducing the script.
> Unfortunately it doesn't help to have such a script if people don't use it.

Looking at the issues Yu-Hsuan mentions and briefly at the code I guess
there's some updates needed with the script for namespacing around at
least pd_ to avoid the need for hand massaging things, that'll put
people off using the script.

--oTHb8nViIGeoXxdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/9rdwACgkQJNaLcl1U
h9DtWwf+K0SkjUpwh/wmWL/qEAmPhRCFTMJeLJAws7yixp9Kl5/XgnhLENhcdpVg
RyRTdEsdOSmelonIEaKDDdbLtTmdV+FFg1+G5uNjIKF9Qt2Oni5DGweuaLZjcHDz
Z2Xr3w9tWAb4mCIRsG18NIihLqrmltIysCZDQtsWIZg9B2eFO8Hd6SeJ8W+nPHIj
Rt02Cs+qs8jHR4WBVOLAV38F5UABhIUQ6re5htDLjQ2bD5g45vtVmL5WplDToub3
nJwnyDwVH4YIgegUzoR1nicEs5IXqCeYEcDvak5CXF4oiYWaRloJracNvuP0Ard+
THX891gQcNp/VfmP7dvgu72VR3KSbg==
=8wv8
-----END PGP SIGNATURE-----

--oTHb8nViIGeoXxdp--
