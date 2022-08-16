Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A14E59584F
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 12:32:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBC751640;
	Tue, 16 Aug 2022 12:31:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBC751640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660645933;
	bh=Y1ssBoJ5zO/WRuSrgGQzfQubJPFGLWIyFFc34Joyf/I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZhqxoBmQCcKtg0elgcIB4EG80CmHQwfs8LqICWfoqYy4sxiVOQVoGdMmHAYYNYSsX
	 t+AcRiDCgSAphlus1UnrvvIkAjsmv2wMNAtm9OyCTjnsBF0nwImgyfnykKK7ioEGBa
	 LsABX9wkmZ/sxKjZuKcBNhz1YZfmjoXLN9dWVkiY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E6A8F80431;
	Tue, 16 Aug 2022 12:31:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B8B3F8032D; Tue, 16 Aug 2022 12:31:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFFEFF80118
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 12:31:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFFEFF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HcP5Hn/Z"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6733160B7E;
 Tue, 16 Aug 2022 10:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E829FC433C1;
 Tue, 16 Aug 2022 10:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660645863;
 bh=Y1ssBoJ5zO/WRuSrgGQzfQubJPFGLWIyFFc34Joyf/I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HcP5Hn/ZUq0ZjBB5gIeEM6+U5Z3a0o0HUtq1a71pSGkv0iFvf8eDLL2/9HHZzlHdL
 V78YkJiSDbKgy1+u9ftEx8zDUMXTNzByz6MKx0mNwLt2x4c5sah10TM50CmPvUNJW9
 vSdUNm84LbP3gMBmvsCbaFYvZUMYCEPKNA+bWYmLwSo2y0IjUUjRiurp3u/kPfsEE6
 /LhZZ/yoULKv2vyVff+n4ndj9aZ1EaSTt4Dmy9hDUhBXH7K9HJks3z3QeBF0dedK2K
 tUOEvucWLWzpsHvbRd+gJKyU0jqNZX6wOZNRB+1hOZvLlOynjDPVlKoKxh+fymhzOu
 A81iRDH/3oZZA==
Date: Tue, 16 Aug 2022 11:30:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 0/6] ALSA: hda: Unify codec construction
Message-ID: <Yvtx4q9Nwryf6mRZ@sirena.org.uk>
References: <20220815174227.3071323-1-cezary.rojewski@intel.com>
 <e8e9eb65-3095-ac5a-ce96-55eaa34ef895@intel.com>
 <87tu6cy0dm.wl-tiwai@suse.de>
 <78315088-9aa5-2134-fc0f-12bee612e600@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BzMJNH46A2BzwjKl"
Content-Disposition: inline
In-Reply-To: <78315088-9aa5-2134-fc0f-12bee612e600@intel.com>
X-Cookie: A bachelor is an unaltared male.
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 Takashi Iwai <tiwai@suse.de>, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com
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


--BzMJNH46A2BzwjKl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 16, 2022 at 12:08:12PM +0200, Cezary Rojewski wrote:
> On 2022-08-16 11:59 AM, Takashi Iwai wrote:

> > > "recover them from the void" or should I resend the entire series as:
> > > "[RESEND PATCH v2]" as see how it goes this time?

> > I guess the full resubmission would be better.

Note that if you do whatever upset the server again it'll happen again.
If it was a blacklisting it does look like there's something going on
there which might be random, I've had some issues with the kernel.org
servers there that don't seem attached to the the actual sending server
as much as you'd expect.

> Should I apply Mark's ACKs for patches 2/6 and 3/6 in the about-to-be-resent
> series?

Yes, if there's tags always carry them formwards unless something
changed to invalidate them.

--BzMJNH46A2BzwjKl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmL7ceEACgkQJNaLcl1U
h9ARawf/d1jpFpQrQ2hwCr86ELNNP/IUrZY0wxVtATSeY4suviV+ABaQzb5w4SzM
YCq2GSl3swkPoWnT79NNrvWgavPWnXm6c/X2NIzW2cjefBF0TVEdW0P1vDYm/ZYy
1YeW1ijV8nFenhBCiftWObXXxPERJ+N2NXa0WCctgzwJbqgN0TxpGGb7XAYTpCZY
fMPaqG+HsjZsQji0nLbkpAI48CRCyhJ1LJVtfi/VzFyjrjbnxZP5JbU/G58pD2sg
KpoVPuZE4BJBhwkI4eP4rS1Bmwl+PnS4zHAd1ZZMNGeaeO8ir/Ykm1kA7+n5LAxo
WHKeWWypsiCzyRISDPGHq3mnXJfSGA==
=DKb+
-----END PGP SIGNATURE-----

--BzMJNH46A2BzwjKl--
