Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F2C1EA245
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jun 2020 12:51:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BBDD1704;
	Mon,  1 Jun 2020 12:50:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BBDD1704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591008694;
	bh=/4UH/y1h8L0fXxRduGokjIWQiSlIStmygs+RLToQ9nI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J7T5sSn2EFC7smp5QKWcIeA8GYPMZat4Wpp6o0Po5GeGzF9KImBGfGDlxr89umrVr
	 YdE7bXGRC3hWQoBzcVWDHgkTPcn2cf4BgtWOTmn0LWBaOzvvpmOOsY8/iw6a0AxIqN
	 PGU2OWfstiPHw1dNct9N154jwAMyD5BYv+al00r4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEAADF801F5;
	Mon,  1 Jun 2020 12:49:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3A08F801ED; Mon,  1 Jun 2020 12:49:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 484CFF8013D
 for <alsa-devel@alsa-project.org>; Mon,  1 Jun 2020 12:49:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 484CFF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Dv0KRd8s"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E566620772;
 Mon,  1 Jun 2020 10:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591008586;
 bh=/4UH/y1h8L0fXxRduGokjIWQiSlIStmygs+RLToQ9nI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dv0KRd8sOXNK00jnPGPKUnPhwV0SkcpfCdRhVl6r61B6ZW8j5mgNxxasx/Ds7zqOc
 TT1g/yXaLhY4uUrtoJv8w4NX0TxzW/1czv6ByKLVIiMV1+vyFQMJu/S/WFxYV4AuRT
 rsmUoIMPYd+QNja8j+k0Z7NeXpgI1J6+HERvpg/8=
Date: Mon, 1 Jun 2020 11:49:44 +0100
From: Mark Brown <broonie@kernel.org>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH] ASoC: qcom: q6asm-dai: kCFI fix
Message-ID: <20200601104944.GA5234@sirena.org.uk>
References: <20200529213823.98812-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline
In-Reply-To: <20200529213823.98812-1-john.stultz@linaro.org>
X-Cookie: hangover, n.:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Alistair Delva <adelva@google.com>, Amit Pundir <amit.pundir@linaro.org>,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, lkml <linux-kernel@vger.kernel.org>,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Todd Kjos <tkjos@google.com>
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


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 29, 2020 at 09:38:23PM +0000, John Stultz wrote:

> [   82.585661] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000001
> [   82.595387] Mem abort info:
> [   82.599463]   ESR = 0x96000005
> [   82.602658]   EC = 0x25: DABT (current EL), IL = 32 bits

Please think hard before including complete backtraces in upstream
reports, they are very large and contain almost no useful information
relative to their size so often obscure the relevant content in your
message. If part of the backtrace is usefully illustrative (it often is
for search engines if nothing else) then it's usually better to pull out
the relevant sections.

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7U3UcACgkQJNaLcl1U
h9BhEAf+Pt/dDyPB3Af0xeDBSv6zsEDpdm3K9d1LJUNB2NUjzgwHgD7cFASZD8wt
L/+xGLg8auxCC5t+QhOECKSk/ovv4FiLcWSv0MSBlCX2X7HCgIWP+UjBFKG9a9Do
m6onms+z024kXU1yfZDA3h7zeIT2w4rZ5j5c7SfVbpuaI5KT+xbw5EiDQCht6OlB
LM12/hlKCjEjQ2U4r62JRYgYwMnPKwmp4OcWH99anZPopnjsDO2i5E0ENxtDx4JU
O2s/WRp5PQXDaG9wRXhn9HBGDfckQsUUjMlxJRHa5RLIqvwGWja79ihQx5S5brFb
XX81ZEOmGuzWoi8UZ6ivB6NHSJq52Q==
=WMyj
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
