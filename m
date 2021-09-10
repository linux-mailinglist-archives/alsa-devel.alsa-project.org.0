Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3AD406A21
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Sep 2021 12:26:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38C9B1698;
	Fri, 10 Sep 2021 12:25:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38C9B1698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631269566;
	bh=cpBCtKfoFJsBnQ3CVScmpNOH6jE9CCJ9RCK8UwFQj/8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BW5HirMojlbm1yg8v8NJNBYJrLjao5xAXmQC71e48PKOpPOF8+mpEFuNy8cieqsPx
	 86vnesQj+3xD8t4x1mKw+JJBTPcnHVfa9EeO8pqZJl0qi8pzhgCB8YXHU1NoMUh8r8
	 NkJ509kCJiTjFm82Sh2o1je4SXsWVtkv/fVtqLYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F1B9F800FC;
	Fri, 10 Sep 2021 12:24:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4ACAF802E7; Fri, 10 Sep 2021 12:24:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C4F0F80143
 for <alsa-devel@alsa-project.org>; Fri, 10 Sep 2021 12:24:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C4F0F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MZrHss3l"
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD07C6103D;
 Fri, 10 Sep 2021 10:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631269475;
 bh=cpBCtKfoFJsBnQ3CVScmpNOH6jE9CCJ9RCK8UwFQj/8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MZrHss3lnb7kui0uBEWe5AxyvJ9GtTIXPYGNfC3rgexbyODBYOxrhrUVomdUyMh60
 s52WJj7MWKMY9ugTC8fet9t4XARhrKRIRn6ONglqnwMgYnRNSJ18B7bpIj3G4+OmVC
 0IkwWolEAMWoZd5PsGlXlFuvbB0YgLaQH9Sni3d4sGpB7wAd29t913C0/XBT/mO4RU
 mqS7JewfNHRalNUbxaBZ+KPc9zJ+hh5+He6mAnqzjUpmToMqLJC421KDMuDAAwjBme
 fdNeVCZdvdWe6f0fElUlr+f+dytlBDompPp3UJsv/Ch6AXBvO50dLHvwDALBy0j+Kt
 Cp9J2iwZQ6BIQ==
Date: Fri, 10 Sep 2021 11:23:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH v2] ASoC: mediatek: common: handle NULL case in
 suspend/resume function
Message-ID: <20210910102358.GC4474@sirena.org.uk>
References: <20210910092613.30188-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Content-Disposition: inline
In-Reply-To: <20210910092613.30188-1-trevor.wu@mediatek.com>
X-Cookie: You are standing on my toes.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, dan.carpenter@oracle.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
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


--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 10, 2021 at 05:26:13PM +0800, Trevor Wu wrote:

> When memory allocation for afe->reg_back_up fails, reg_back_up can't
> be used.
> Keep the suspend/resume flow but skip register backup when
> afe->reg_back_up is NULL, in case illegal memory access happens.

It seems like it'd be better to just allocate the buffer at probe time
and fail in case we can't get it, I'd be surprised if there's many
platforms using this hardware that don't also end up suspending and
resuming.

--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmE7Mj0ACgkQJNaLcl1U
h9CgyQf/ZnO68AsLS2olrmP3aE2kiE4Ya+tAlitO9OKbhT1L/n+iJbKrZ4LRbXEQ
ZfHKa0ObhYErjjmvlqb4C/bpkXixnPVFl+sMv8WOMenad2nwt+ObdT59iQzEVqA6
L/mePf/Fgdda0FuauBlcVcQT0Phb275wyvLRqTDmpTiWjDLNZTzuID9rU3b5ZSWW
had8BZqHsE6PtwSFpLw2/GOhn0aqyO/4SiTiEi5qowd1abY+HhjLfVUPuhGBU8sP
Yiy/MH030ps8jfXnX6FRF+fEp+T70yy3EZWm45c3vl2hLGDSH2iCHh4IDqZb8ynv
LPoGRv5X0L7ebfy2BqkWOahDI7GTNg==
=EfnS
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--
