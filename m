Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4897125A932
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 12:13:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5A7B1829;
	Wed,  2 Sep 2020 12:12:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5A7B1829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599041608;
	bh=s+IhWSG0hKsENtLwU2TRT4t5upCGNQwG6qQJDXWNAf8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VCKml93DBDEktlD3IE1P+7TpDGMlybHGNxYdeArR+XX6EovDAp6NraMh6MGLn8Wl/
	 nH46PUo0HxsJKJkFEdw/1V8VFAGfDVGAlq0+TdtYVrD/lTTjv+RD1roHmXPDeZVsvw
	 4yIkAnL48x71uSjOcCuF0SCLBjPrmubzaNKaFA+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7767CF80276;
	Wed,  2 Sep 2020 12:11:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54FB7F8026F; Wed,  2 Sep 2020 12:11:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36F19F80212
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 12:11:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36F19F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="THJrRfRi"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 358332071B;
 Wed,  2 Sep 2020 10:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599041467;
 bh=s+IhWSG0hKsENtLwU2TRT4t5upCGNQwG6qQJDXWNAf8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=THJrRfRiWQmLhZgc/HzYVkiKn/NWywWutBhXq4okK1fRLRvvTQoL4XbBIvZD0NhFz
 +ucL7ceUSOGYhIUiKiIjmHzJH8Hur+qYar3kz+6ubdsTGZvAkPqEbkaQXWF7BBtHrF
 QfkJd32+08D2ESX/WbcBAIrZbB7pm8ex9882t/zA=
Date: Wed, 2 Sep 2020 11:10:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Allen Pais <allen.lkml@gmail.com>
Subject: Re: [PATCH v2 08/10] ASoC: txx9: convert tasklets to use new
 tasklet_setup() API
Message-ID: <20200902101027.GD6162@sirena.org.uk>
References: <20200902040221.354941-1-allen.lkml@gmail.com>
 <20200902040221.354941-9-allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0IvGJv3f9h+YhkrH"
Content-Disposition: inline
In-Reply-To: <20200902040221.354941-9-allen.lkml@gmail.com>
X-Cookie: Prices higher in Alaska and Hawaii.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Romain Perier <romain.perier@gmail.com>,
 timur@kernel.org, Xiubo.Lee@gmail.com, clemens@ladisch.de, tiwai@suse.com,
 nicoleotsuka@gmail.com
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


--0IvGJv3f9h+YhkrH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 02, 2020 at 09:32:19AM +0530, Allen Pais wrote:
> In preparation for unconditionally passing the
> struct tasklet_struct pointer to all tasklet
> callbacks, switch to using the new tasklet_setup()
> and from_tasklet() to pass the tasklet pointer explicitly.

Acked-by: Mark Brown <broonie@kernel.org>

--0IvGJv3f9h+YhkrH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9Pb5IACgkQJNaLcl1U
h9BI/Af/QLYH3t28vg2oKlNDj8n6Ks4v1z8rZoyPfPJ/vORONmbUC1Q9Zhhxuv0U
/0BACJW3sYW4jGAy6/E2dgXwcQ4fOCINA3e1TZj+xhkYIgDXjNDJxv3ZZrIb8ZHn
Bgr+WKFMKRsZctFc6gIsO5bLeuuhOHfGW8vtOyaKLHKAiCej4YFXColxJL62y79G
6x6eJWs2nzdWEwD7za/mzzebO05HkmpP8JfRXp5arQERr4lY7eFvH6AowF1RYOtZ
ytkmfZh5+AEUvskY+VZLke1nrJwI0k2539iTtq4OV6eFo/HjSCUfDUToJuaZanQK
PdZRPJrpStG/ThcSUBPNoXJXvEZdDg==
=NjNA
-----END PGP SIGNATURE-----

--0IvGJv3f9h+YhkrH--
