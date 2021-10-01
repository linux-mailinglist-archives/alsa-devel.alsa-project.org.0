Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1357741F633
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 22:13:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7DC916DA;
	Fri,  1 Oct 2021 22:13:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7DC916DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633119238;
	bh=ravcRnwLo3DWLVPSU8uzwKbeH8sA+3UEVqRo90J/4Ag=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=acbD90ZXcwbOV1Y7dpAKCFyQWLxQ7BTNOQ4Xw3BZKLVvVsahub/CJUEhxHh5256Ax
	 EMlcIzT/vt2eI0xNZCxe3AfcCXG/MefCvDpYmS7s97qm1Xm1sUI11fXI6ozLG0iYzu
	 sWwJ2esYMxy4d+sJkLeGt7Z3FnEkmjfku/tfgEWo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B8EBF80165;
	Fri,  1 Oct 2021 22:12:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6A5AF80245; Fri,  1 Oct 2021 22:12:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9D4BF800F3
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 22:12:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9D4BF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="N+yFyL+A"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D62E61268;
 Fri,  1 Oct 2021 20:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633119152;
 bh=ravcRnwLo3DWLVPSU8uzwKbeH8sA+3UEVqRo90J/4Ag=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N+yFyL+AU4bEJj/oFTks2v18zfpXMraC/i3cNCgAHOYQmUkEawSu4USqb08TwvqgM
 Vsu1OMA8ouTBFHgPPf4YFQ8KwtHIo1FTJO1CnMQg8TbWf30hwJ+ZtJXL5ApyhoKU0L
 EPMUa0kOls5D4JDHF68a7z6FfjHZsEGJOF6jF0uhi7PEeYWA2Zqk9+Ca8HPmvwiJVS
 dDrv2scNHhfqt4PUuwPhWT4zTnRTOasJK5Je4M10JVHCL0SXonMEUq8aqFE4FBrEa/
 BGThYu4nPwqmTHtuqOLtQmgwJ3CbNFxkVKlvkpFIGv/Dio8tLmrdjo6GBwxEK2izs2
 f8zUAJfN3SNDQ==
Date: Fri, 1 Oct 2021 21:11:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v3 01/16] ASoC: test-component: add Test Component YAML
 bindings
Message-ID: <20211001201141.GD5080@sirena.org.uk>
References: <87tuitusy4.wl-kuninori.morimoto.gx@renesas.com>
 <87sfyduswu.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="11Y7aswkeuHtSBEs"
Content-Disposition: inline
In-Reply-To: <87sfyduswu.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: "Pok pok pok, P'kok!"
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


--11Y7aswkeuHtSBEs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 10, 2021 at 10:21:37AM +0900, Kuninori Morimoto wrote:

> +    enum:
> +      - test-cpu
> +      - test-cpu-vv
> +      - test-cpu-vn
> +      - test-cpu-nv
> +      - test-codec
> +      - test-codec-vv
> +      - test-codec-vn
> +      - test-codec-nv

I do think we need some words in the binding document about what these
are.

--11Y7aswkeuHtSBEs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFXa3wACgkQJNaLcl1U
h9AtOQf9FHbnpGqMZTnGe+Y1RrejQceYQV9ZWBSDf3PbjARAlJKON38Nt3cBONIe
BEcpVMf/ooGvQJoz6wcRVNWuDqvg0vNJB4weGxf98GmVfq+r8R4MQ/EBtjf76EIh
4MS/gY4FUCrVjPJ0xxSwTd1hT11WGdTUrS47YR0v7+kZJlGovWB/nSboPT3lMug0
zXGrrC27WTajFSRDw+4vSJ+XuZqqdp+99Q9l0wBUnm/a8s1uREuW1Wmpm0dixiMg
g6cap7eCMeh7phgoOR619gZH1Xw6AFvoMzI3zEY+1xY9uPef4kPoLGOPGAAiMu77
QOwm98qlBIqNgVFLMOjnrWTZGsifhg==
=hKhF
-----END PGP SIGNATURE-----

--11Y7aswkeuHtSBEs--
