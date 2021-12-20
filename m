Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E96547B2DE
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Dec 2021 19:31:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9E6A1777;
	Mon, 20 Dec 2021 19:30:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9E6A1777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640025099;
	bh=wnRZGhr/r/oJHJL61vyyNk0oYJYUQaMZIvGBf4zvo+M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ame3NShFgr4Fw54Z/hzHcE628g/b4ogP0HmOs/UDMsG9N57AL0e/TTvosqv5hHiWQ
	 Fb2KxS4ggTD7rSHFFpdzjSxcRn+ekoXCgbszuj+hylI7Y4RCT+DtY1BhfAJQRzBq+H
	 OkuGxMOTVmXjTA2H25qBv+aFHij0NOzFcmANN/Lo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12B6AF80149;
	Mon, 20 Dec 2021 19:30:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8B83F8012A; Mon, 20 Dec 2021 19:30:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5C0DF800B5
 for <alsa-devel@alsa-project.org>; Mon, 20 Dec 2021 19:30:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5C0DF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WAi0AWA0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8DADD60FFB;
 Mon, 20 Dec 2021 18:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57046C36AEA;
 Mon, 20 Dec 2021 18:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640025019;
 bh=wnRZGhr/r/oJHJL61vyyNk0oYJYUQaMZIvGBf4zvo+M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WAi0AWA0wN8e6lLUJs/sXyx++lDqDbsdiGmll6uai/+xHuSNqt/PMepdHoUbLkber
 h+0mKoeSyXlDaQj4FvT+7UGjwP7llLNwarnzEUrsnQhZVWXPgqOwF09XAn0KqikE/d
 J0IvC6EbEMC1uNn20Hxs1IjTVYuI3K0LXVar0XSmzeZKkCWgeBrF0IDgJzu+4xEGtT
 0l9mqY8hA5xhOvpGnIB+v7jWSuhs2MscIW+5DxsTbxL4dzad6boFGgzpmV8M/qiySM
 NXLinuzvb4y0s33jfZNgV272C1lmCx+XG4YuOfF6NqlZRY8CpNuyGdB49G/CaPqLxN
 KOOjPAzGgZuIQ==
Date: Mon, 20 Dec 2021 18:30:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 2/2] ASoC: bcm: Use platform_get_irq() to get the interrupt
Message-ID: <YcDLtMc6QR1kezmE@sirena.org.uk>
References: <20211219181039.24812-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211219181039.24812-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FbpY6masRNdhN5aX"
Content-Disposition: inline
In-Reply-To: <20211219181039.24812-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Cookie: The worst is enemy of the bad.
Cc: alsa-devel@alsa-project.org, Florian Fainelli <f.fainelli@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Prabhakar <prabhakar.csengg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org
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


--FbpY6masRNdhN5aX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 19, 2021 at 06:10:39PM +0000, Lad Prabhakar wrote:
> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.

This doesn't compile for at least x86_64 allmodconfig:

/mnt/kernel/sound/soc/bcm/bcm63xx-pcm-whistler.c: In function 'bcm63xx_soc_platform_probe':
/mnt/kernel/sound/soc/bcm/bcm63xx-pcm-whistler.c:395:11: error: implicit declaration of function 'irq_get_trigger_type' [-Werror=implicit-function-declaration]
  395 |           irq_get_trigger_type(ret), "i2s_dma", (void *)i2s_priv);
      |           ^~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

--FbpY6masRNdhN5aX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHAy7QACgkQJNaLcl1U
h9B8HggAhVFxJhvNQGCBqKTFplNumBkXJngY8gVvGpUD+3Swi9w1W0NUUXgHyWU8
dNSvmIaE4wMkLpMfFtc798MSbKmSVIa8vA+dZ7kmEVBa4mHuqUzggoIF6+mBqkJg
KgNXFNlws74EJdUnOcBH1L0e3eAm7XNSKVb2ajZNTj1+tUZT7i8KRBFQVT0K4dLO
K063q4v8izIXxQpPOtc3sENNr0KIh/keI0TlvuLNmH+0C0lOJezaD6yeiaJaC2v/
R5n8ggf6406QZMnniXYHjLPd7WfjNfDoxuRIQECJOyvpFznPsWlVm0ckZ/Qki5IT
u1vUaDc3+LsWEb21yQL7yosZ70Xdvg==
=/p0n
-----END PGP SIGNATURE-----

--FbpY6masRNdhN5aX--
