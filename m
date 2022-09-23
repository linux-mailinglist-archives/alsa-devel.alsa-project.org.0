Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EF85E7BB5
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 15:23:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 971C1210;
	Fri, 23 Sep 2022 15:23:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 971C1210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663939436;
	bh=RVX6YCnEgPI4npfeSwYsvQ8Gf/e9sgc8U0u0H6Y8QiI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dd55QADwZZt8d1bdyBjLA/ataelWozjNdi0gReR0TlYpiNUD30NgWZ3PjSPHaJW8O
	 otKwFLeiz7KW3f8DhvjYpJoKpVk8/lfYkkNDDgXL6qdMQOpuw/rT4znIwoMJMXRsOl
	 i2ZzM+4GXWqXGw2HAjxHW3cHo9GR8/LEjiFqGkKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BA96F80431;
	Fri, 23 Sep 2022 15:23:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BB65F80269; Fri, 23 Sep 2022 15:22:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F27C9F80124
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 15:22:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F27C9F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aZ0oqk6f"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1AAD6B82578;
 Fri, 23 Sep 2022 13:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6A6C433C1;
 Fri, 23 Sep 2022 13:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663939373;
 bh=RVX6YCnEgPI4npfeSwYsvQ8Gf/e9sgc8U0u0H6Y8QiI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aZ0oqk6fjDZQvffHK8g5EAGsHqnskW4tXF9+aITsnDzzQKltR1oHOBs/kdEaqs+Ti
 2iLNY00l3AXoLayhZuA+kkQrfYcDcJhMUu5qPEc2QfUM8Vr+OEG2ykhfT42J2CDIgE
 5BBY5PObg5NM+nMMGP6ei/FdLv/DyZFIH71yS/2JuBMn5hqWHzRytuG64L8EuC+eYI
 DChRJGRBJRb70SNKclsp8T1GECIXvXR/+IfYq30vbV8eVDfV8Q+LszTxwD87rogkon
 KZlZit6u6dKVrNb2tv9SolTakLYcpDKnrUpwsIag8BjhrI7iv781Y9THX7WrNTJz43
 2IqVLep8/TShw==
Date: Fri, 23 Sep 2022 14:22:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] Revert "ASoC: fsl_audmix: make clock and output src
 write only"
Message-ID: <Yy2zKGJXmxq8kwQE@sirena.org.uk>
References: <1662446961-20799-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+p2nOyHK3qW+kWsP"
Content-Disposition: inline
In-Reply-To: <1662446961-20799-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Heisenberg may have been here.
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 Xiubo.Lee@gmail.com, festevam@gmail.com, tiwai@suse.com, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, shengjiu.wang@gmail.com, linux-kernel@vger.kernel.org
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


--+p2nOyHK3qW+kWsP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 06, 2022 at 02:49:21PM +0800, Shengjiu Wang wrote:
> This reverts commit 944c517b8c838832a166f1c89afbf8724f4a6b49.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--+p2nOyHK3qW+kWsP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMtsycACgkQJNaLcl1U
h9AtDAgAhK+VTWFd0vLsZlcIJo6dWg8eYHQYOKvs5GtUAvSIbwvMar01Ec6xQGHi
QPtAKM+cc1+r4ZsBP0uLWMkK9B7SZk0wmkIU9yqdnvkxL/FSwrTYTZQSXYPKnXd9
iCYAux0/o++sZwgLMvUGdEWRWhK4WBKgpM8f9iwXUR8ZqHSp1LH5w2Xbo6QF3ulN
6NMnguzcSM9SLchdHv74X6DCJzHcSK9CaTrvBgx3YRYN3R8qA83YBKORCt73Jo/n
8tY9AHQnOBhotVM7TxWFptSMVx6iGP8z1EgaD4r5HV9PNg0R2iJBk38azCUD2fEg
xEEhbFgFxktNBWSgNlcJ12zvbSbPRw==
=ZIxE
-----END PGP SIGNATURE-----

--+p2nOyHK3qW+kWsP--
