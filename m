Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E70A71CE01A
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 18:09:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6254A1607;
	Mon, 11 May 2020 18:08:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6254A1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589213364;
	bh=Jw4EUPHyRghQxx0znjPMiNopC/3ADmRdiztkcgJmBRI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=McrmXK8D8UHan0R0Qgd4YwNS4vG8wCDg159ek60Rr2kJiX9AVExSEkCWMb5Is5shw
	 /4OU/DuBUzcGImAUohUN2SCgUyaojKSVMQO2qY2SVdBx7p66R2Mfw+mGPJFXbggSC8
	 4/N4SRa4txUdR0A/mn3OBjKWJDH1JSDALSVvsNpo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7542DF80107;
	Mon, 11 May 2020 18:07:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EFEFF80157; Mon, 11 May 2020 18:07:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AC28F800E3
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 18:07:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AC28F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="u19DzjOE"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 67092206E6;
 Mon, 11 May 2020 16:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589213254;
 bh=Jw4EUPHyRghQxx0znjPMiNopC/3ADmRdiztkcgJmBRI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u19DzjOEydKdWr79FdACTBtmi9myJlEvJ3UTDk/gm+AK3FSKsJ/1viymQTO+pQyW4
 Q0DJS7SALk25UIf7udXqN/sYlRjXk4b1dD5sKGg3c2YQrI40Fs7KMv1b7bjz0Lt0CP
 YcGbw0dtL6qnXw9WVnUZhZ10eq1K1q+Nqkkvasd8=
Date: Mon, 11 May 2020 17:07:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Yongbo Zhang <giraffesnn123@gmail.com>
Subject: Re: [PATCH v1] ASoC: rsnd: add interrupt support for SSI BUSIF buffer
Message-ID: <20200511160731.GA3618@sirena.org.uk>
References: <20200511100415.12502-1-giraffesnn123@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
In-Reply-To: <20200511100415.12502-1-giraffesnn123@gmail.com>
X-Cookie: Check your local listings.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Chen Li <licheng0822@thundersoft.com>, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
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


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 11, 2020 at 06:04:15PM +0800, Yongbo Zhang wrote:
> SSI BUSIF buffer is possible to overflow or underflow, especially in a
> hypervisor environment. If there is no interrupt support, it will eventually
> lead to errors in pcm data.
> This patch adds overflow and underflow interrupt support for SSI BUSIF buffer.

This introduces loads of build errors on for-5.8 with an x86
allmodconfig:

/mnt/kernel/sound/soc/sh/rcar/ssi.c: In function 'rsnd_ssi_quit':
/mnt/kernel/sound/soc/sh/rcar/ssi.c:596:12: error: invalid storage class for function 'rsnd_ssi_hw_params'
 static int rsnd_ssi_hw_params(struct rsnd_mod *mod,
            ^~~~~~~~~~~~~~~~~~
/mnt/kernel/sound/soc/sh/rcar/ssi.c:596:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
 static int rsnd_ssi_hw_params(struct rsnd_mod *mod,
 ^~~~~~

and so on for ages.  Probably just needs a rebase I guess?

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl65eEIACgkQJNaLcl1U
h9D6tgf7BtkZhzn4Ek9W+lN6u/0eBOTZZhpzgCCjwgdfk+L3YM3ZRQxCA8+WLr21
JZp/URIp4PS2kLFFsD9J3qJyajCCOAsGRHBan0pGUDnfn2bWlqrqmpZXmiI+ttFq
GvCN/AN4Am9i49rQqWzRMu5M5px5H+7AHz9QpM6icZsDNAM3C3sIIXAq9HY+ujEu
3XriJGxE+S3/yZlyUArQrAHgIfk0FHwP2k8yyfN671dMTGNgczArgRXkaCKfPDc2
vKbBSFdEsJ4AoyCLmNaAny5k0qCCmIE/bU/wUGDLRVI88MCULm18qxb15cMJ3vYe
GBoRg4hDXzX1ybIjK7n5QJ1VyWwVFQ==
=OG33
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
