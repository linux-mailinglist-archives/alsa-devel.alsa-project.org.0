Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9135D2B5083
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Nov 2020 20:06:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08ED41773;
	Mon, 16 Nov 2020 20:05:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08ED41773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605553561;
	bh=YQbOeR0Ir0jO5GxTkZ/KPEcLOqI6KXbHLyISKeSbQ2k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q3Bp7ZSzOu98TZ/8nP4ckrD6klKZtA3KqNEic/9cgL54rSgGAtcEWTbFXDTdArIc+
	 e59iTvkbB8NJjZmBMuXFKn8A+ki63QFSUevKc/27wsI0hnhhs7ypedxEIZl4mWt6WJ
	 MnAa8IZ1PreWXCDK/uYmCA+UESolVwYLQIbihmvA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B52FF800D8;
	Mon, 16 Nov 2020 20:04:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6781BF80168; Mon, 16 Nov 2020 20:04:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED3CEF800D8
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 20:04:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED3CEF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="f3nHWDB5"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 52B132225B;
 Mon, 16 Nov 2020 19:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605553459;
 bh=YQbOeR0Ir0jO5GxTkZ/KPEcLOqI6KXbHLyISKeSbQ2k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f3nHWDB5UYIanun4/6bqobOCfJotTUjTtZItEmpy0wO6KaXjrxdusbSMS4ljgIs1V
 pDbRIw4hq7DjsHI/TtpuMdrR/of84ih03VU/ZohdCYYh2vZ8V+NmW9wOj8Dsj2ZgmL
 OKSRtmDgMyutH1MzfMyRjnQs3SXIohzYYhKlIbjs=
Date: Mon, 16 Nov 2020 19:04:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: Re: [PATCH] Asoc: qcom: lpass-platform: Fix memory leak
Message-ID: <20201116190400.GE4739@sirena.org.uk>
References: <1605416210-14530-1-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="brEuL7wsLY8+TuWz"
Content-Disposition: inline
In-Reply-To: <1605416210-14530-1-git-send-email-srivasam@codeaurora.org>
X-Cookie: Immanuel doesn't pun, he Kant.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, bjorn.andersson@linaro.org,
 agross@kernel.org, srinivas.kandagatla@linaro.org, Pavel Machek <pavel@ucw.cz>,
 rohitkr@codeaurora.org, linux-kernel@vger.kernel.org
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


--brEuL7wsLY8+TuWz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Nov 15, 2020 at 10:26:50AM +0530, Srinivasa Rao Mandadapu wrote:
> lpass_pcm_data is not freed in error paths. Free it in
> error paths to avoid memory leak.

Please use subject lines reflecting the general style for the subsystem,
it makes it easier for people to spot patches that need to be reviewed.

--brEuL7wsLY8+TuWz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+yzSAACgkQJNaLcl1U
h9CULgf/enozSv/x01jexTc5wfCzv9oWXsElA/pDZMQvwp2/Hix6fWeuOPzmWIo7
7PYUVqp5i6mJWejVH+qDpIVIwo2V/KzyT81D5JmooPoOglEZzKdiJcj0LK7mkkD+
T21T3qhVwaWml3gna9W8srBFidN3/gJ7+Agd5M3nQbxGtqINtMPBrJ1y7F6CsGhc
+pTCkwcpDe/oOhWiV/iifsBhWYmkdCWHypN3vMSDMzuiE5u+PcnZchGhPSdCqrJF
FXZ0dMoESRKqUS+MoVa0o3tAL6SEnY/gXvmFEJAw7bYCfpID82GULtwfDuuFmApK
qXYtPZY8/noF2WY+pdHO582yoJ12ag==
=NfJ5
-----END PGP SIGNATURE-----

--brEuL7wsLY8+TuWz--
