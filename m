Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6367D4C4CA9
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 18:38:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA2F11DE8;
	Fri, 25 Feb 2022 18:38:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA2F11DE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645810733;
	bh=55H8QnkGyEAbQODvLLv1iG3nCue5egT78H9wUUdabyY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d40VNZG5xa7f328xIQefz/FOr9f14EVTix4uORC9lnbwDIjvyfwvwG1Jt0JSQ67n8
	 Yt+WNn/EkCGqsLRf5HEgwJKfCCYUxpgAQ4s/LZnxeIG0EXmLIwyFwyVSB0c1mfkTWb
	 va/Yu1tqna6h82JquNqr34WtMpV6EZdzajZ/mytM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ED5EF8020D;
	Fri, 25 Feb 2022 18:37:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD3E5F80159; Fri, 25 Feb 2022 18:36:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64057F800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 18:36:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64057F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hMv88cuv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 661B361DCE;
 Fri, 25 Feb 2022 17:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBAFBC340F3;
 Fri, 25 Feb 2022 17:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645810613;
 bh=55H8QnkGyEAbQODvLLv1iG3nCue5egT78H9wUUdabyY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hMv88cuvWCQOH6mGcVBbEzK6DWIpYvK4DnMLDdnVesDTCJ2xSdl4tsjVtFy/3CPty
 NewkLpFWycLmp2VHz6m054taatL1WcaIq3TWBuuTqlDuL2aEtaHZwT9z4JTlTQPSGF
 UV+TWxc26verVUXZ/YOrSa2etLOLN+rh5npH/qFYu7cMK1ISTv7AJRzL4Dgx+9fh9E
 SkVvVGG8ppsncrUALjroOF9SkbeHtw5AvZifOEvMLF7xo7i3hOBBLg3ng/8IqiVBok
 0wTjksjdA7NMtHOo9CVIp80OuzcO2T/ffuInbagScXHCscJlU/oAkg+ehZr7mxn6ML
 hMadthx1UJPvw==
Date: Fri, 25 Feb 2022 17:36:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v4 0/2] Add power domains support for digital macro codecs
Message-ID: <YhkTrflXM2aI1qOu@sirena.org.uk>
References: <1645786624-12311-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="B9sA1yustykLxY/n"
Content-Disposition: inline
In-Reply-To: <1645786624-12311-1-git-send-email-quic_srivasam@quicinc.com>
X-Cookie: I smell a wumpus.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, rohitkr@codeaurora.org, agross@kernel.org,
 srinivas.kandagatla@linaro.org, quic_plai@quicinc.com, judyhsiao@chromium.org,
 linux-kernel@vger.kernel.org
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


--B9sA1yustykLxY/n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 25, 2022 at 04:27:02PM +0530, Srinivasa Rao Mandadapu wrote:
> This patch set is to add power domains support for RX, TX and VA macros.

This conflicts with some of the other work going on with these drivers
which got merged, could you rebase please?

--B9sA1yustykLxY/n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIZE6wACgkQJNaLcl1U
h9CTQgf+LVtyrqYcATwwJ43HX06LqU+W1JD8UoZhseiY/fovF4Sg5mRvGyw6pp7T
es9X9DBynLKonb4b3h/hDFxbWkrvhXby2zJvQuWLe7qGajh0lMdXFGClAk0spXV/
dxhBuQfeoQCeX6SdOTa81+7HSjfWADnMNQZuBe7Qr3RXPhtxAuBdWREzua9U3364
cvzHZldWHYRVSrQkHMmDGYcf+iD09/aoix8KsnsHGt0c3sNtUcttViYYUyaZHK8n
+NfT87FeTRKupxuwxrrlBGaP4F015+VX3AwIcSRxu6fLr2D8Iko4oc/M+HJQhXcN
lSn+Mhv7UFP4TFzJaR/0Jx1obJ8iAw==
=JP8I
-----END PGP SIGNATURE-----

--B9sA1yustykLxY/n--
