Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A244C8CC6
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 14:37:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22E761B35;
	Tue,  1 Mar 2022 14:37:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22E761B35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646141874;
	bh=AhkBBUjPoe/xMZrvrF1mkG8iDICMbXuJHq6vDcKPlXQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gi+U/J3uaUJzaCjqUOrx/HdU0EMZY3V7r4V9VvrGrrAZ87G36wxKaRY5XnSmApZjh
	 sk9tI/t9eDFycdvj6ivvkzK3aEPCj6K/JQQylai0hcZyio3tp+VGVuh8i91fUud9/c
	 GJ+OeGf8M/4JlAgCK/PazcxaIFBhSNSQcbhYHLkU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EF56F802D2;
	Tue,  1 Mar 2022 14:36:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16980F80227; Tue,  1 Mar 2022 14:36:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0A9DF80095
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 14:36:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0A9DF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="b++kZK6a"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D96B7614B7;
 Tue,  1 Mar 2022 13:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7BDBC340EE;
 Tue,  1 Mar 2022 13:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646141798;
 bh=AhkBBUjPoe/xMZrvrF1mkG8iDICMbXuJHq6vDcKPlXQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b++kZK6aZxKQ9I+aYavnWIqgdHkyE5VwUebf1xHsKHQUgLsLS1sO6osFTNGJqUX7r
 IwjUzgBVVNSFNxmq7gezUUYarqAiM9dhydLZJnYFI951cYXedWhEow70HtADeaz4lM
 Vd9pModFzceJG1q2Lk9/+5SFVmVTpIejTV2cPTnikJPl7EOGwLruLek2ObTQHGTAvn
 2k0MI2L8zrlUOPHSO7RKi/Kmli2b5heXeIA5/mbp7qYtsYuxTYwyqdMr+gQYb0KVa7
 uS8PK1JIgaDPF3oO2RL1dGSo129p88cCvm5ETGTTIl2LdeVaFZ78zFyyQrlwum3TCx
 ihL/My5eBz6DQ==
Date: Tue, 1 Mar 2022 13:36:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Add schema for "awinic,aw8738"
Message-ID: <Yh4hYVJFZJBYp3d9@sirena.org.uk>
References: <20220301123742.72146-1-stephan@gerhold.net>
 <20220301123742.72146-2-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qirQl09dxjOo5/hy"
Content-Disposition: inline
In-Reply-To: <20220301123742.72146-2-stephan@gerhold.net>
X-Cookie: You have a message from the operator.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Jonathan Albrieux <jonathan.albrieux@gmail.com>
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


--qirQl09dxjOo5/hy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 01, 2022 at 01:37:41PM +0100, Stephan Gerhold wrote:

> +  awinic,mode:
> +    description: Amplifier mode (number of pulses for one-wire pulse control)
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1

No maximum?

> +  sound-name-prefix: true

While it's very likely that someone will want to use this it shouldn't
be *mandatory* that they do so, there may be no other controls for it to
collide with (eg, if none of the other components in the audio path have
controls).

--qirQl09dxjOo5/hy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIeIWAACgkQJNaLcl1U
h9BT7Af/abCfQLZFr6Z/6zT3r//dESK02ozo1k9r5s/h9qr+HoWGQ34otTtx2xHo
5fLyMV/7sFleZuNjRb98zH+TvsmlppB7crocL+0hbvU5Z0bZQ9yb9jv/gU4uyoBR
WoCrUPCAjCQvVPidpLCWcdoEH/zYwrGDXamk/zviLStVKMUp/Ib8chtRlmsd3oA9
lwKPIOcBdeh1K2DvBl8nJd6u+nJ7dMrFKSWNQX7k4R2DXTXoLsvTlyU2VmI/Oqqt
LRvaUdpDG8KUuPMVClhCjJ5LJCXS69KCgtBtFe0zPNGqIgEio1kqlAfFx1Zj6ibu
vGru1WSjIh68zdiaxoRK44zSU3wc1w==
=No04
-----END PGP SIGNATURE-----

--qirQl09dxjOo5/hy--
