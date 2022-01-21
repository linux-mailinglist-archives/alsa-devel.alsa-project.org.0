Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCA54962A7
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 17:14:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4899B2B34;
	Fri, 21 Jan 2022 17:13:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4899B2B34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642781659;
	bh=/Ctcaw8Q+48jyHUs0o5gNZd++A1+asZFRndUItiRfQg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J2P62/BYHNoCLsmfOnv/s5FhL08AvGyA9DFGKjX8e9W4jGP99Mp51SL5VLjJfhkR4
	 I5J5UL+hdqInMPc1OtwqWwTiiQTKSWwQB8n445N3uS85KkFbFnQBxH9dDHV9sOpa3B
	 WK5X6dxmHqhvYQQ97bWOSGM8hOjhIi9NkxqDE4wk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5CA3F80302;
	Fri, 21 Jan 2022 17:13:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFC0CF8007E; Fri, 21 Jan 2022 17:13:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BA73F8007E
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 17:13:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BA73F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kuFcMzz5"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 54E82B8204D;
 Fri, 21 Jan 2022 16:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22011C340E1;
 Fri, 21 Jan 2022 16:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642781588;
 bh=/Ctcaw8Q+48jyHUs0o5gNZd++A1+asZFRndUItiRfQg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kuFcMzz5MNmNLSPwGoiQkwzuDbmXidX2bO5nj9Ky8QR8lOnTfINLgvf40g5lB5RyY
 0a/mQzAfCCSdwtmYH8L6bn0VEnuLunM/a6HRIpS6qfWmsfHDhNu6++Ci+TooUCARV1
 9fsWTU1WsT8A+rWpbZBrsPn9RRNUuIuPxZFecRETclJXd2rBDOTMXSSru4slK+fJYR
 Y1XQyS+4YKU450h167ZL7iRAgQba3TT2EP9aYu+XDIXySbjq53RrAD5Lz9xtGMk0OF
 TDkmUXqGtPrQWT34j9KVveqrf+ofxSdWAOoc9PJ3rGGT8etPys0ArVu3ib8IbXhk/9
 NzHOyZ5o5UFLQ==
Date: Fri, 21 Jan 2022 16:13:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: Re: [PATCH v2] ASoC: codecs: Check for error pointer after
 calling devm_regmap_init_mmio
Message-ID: <YerbjgJugYEaDI3A@sirena.org.uk>
References: <20220120015650.1851703-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iJUnwWNON0h2KLfW"
Content-Disposition: inline
In-Reply-To: <20220120015650.1851703-1-jiasheng@iscas.ac.cn>
X-Cookie: Alimony is the high cost of leaving.
Cc: cezary.rojewski@intel.com, bgoswami@codeaurora.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, srinivas.kandagatla@linaro.org
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


--iJUnwWNON0h2KLfW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 20, 2022 at 09:56:50AM +0800, Jiasheng Jiang wrote:

> I am really sorry.
> I have already try my best to find the latest code but fails.
> Please give me the url or the git repository.

In general you can always find this in MAINTAINERS:

git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

--iJUnwWNON0h2KLfW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHq24sACgkQJNaLcl1U
h9D63Qf+O6zHB9Qqif1FXcwwrt74MmnK7jsfmkQVbttSLZqb0GK8BaYdzCdl+qmR
m8RYizNnGOvHm5ipAws+uLVNq5elo2Vf90DUtzTtAABn9ZorCxervbN+oNw2yexA
fo0K52O8aMvHqLe1P5jYWdHnREHnGcwcXwfz4ibkyYCsFrOsxXHPUe1TrIFaVVo3
jj2eXvXnr4HxtEp0bdG9MzjGmjgG8de/gVtdgkXEo3SQ3fD9CoXvmUFu94K71a5N
QBGiFiIIxmbtHSQoQ5Nhmar4PUtX32ZlsxPEH0M0ZMZzcwyBwyNR5yGSskuYrTGu
nJKqXl96xQp1uxqrlDU3p4VJbHOQdg==
=xlYU
-----END PGP SIGNATURE-----

--iJUnwWNON0h2KLfW--
