Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3D91D36DF
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 18:45:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C0F6165F;
	Thu, 14 May 2020 18:44:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C0F6165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589474741;
	bh=/Woo2rbtVtqFaQbIP71cYFRtkvxNZGYitF1KhNpibss=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U+TjF1jVzQYzqZPYdARah0kStbMr2owrwwtwXd8qPLLo0N007Vasx4iAeckiMCXY6
	 7u3zNYWN1MRDYK6QrlQTHuo1saT/t/ucZEJNBaDyEnS7fUTrLdQLkNJDQRykw7E3hQ
	 LUqhzQASkD9Yg+kz8nK4fyuTqRiFdXxIVqE7N5zo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99D57F80101;
	Thu, 14 May 2020 18:44:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF081F8014C; Thu, 14 May 2020 18:44:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A09FF800BD
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 18:44:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A09FF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dfmv5ixe"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0435D206A5;
 Thu, 14 May 2020 16:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589474672;
 bh=/Woo2rbtVtqFaQbIP71cYFRtkvxNZGYitF1KhNpibss=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dfmv5ixegX3iiK3uzXEug99JwwHoTDf1sL57KPmn56/npYXt5zvRBBgVbCFRgqVlx
 3cOJoqsDx93Hm30YC1N4wvj4mTwaHc8joXc32zkOCThyqPMPhayrG4es7AtyxZ4WIT
 bWVT+snwLdrr7CmKERzG17YSIeeHJ/wa1lyGor1M=
Date: Thu, 14 May 2020 17:44:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajit Pandey <ajitp@codeaurora.org>
Subject: Re: [PATCH v2 1/7] Documentation: device-tree: sound: Update
 lpass-cpu driver binding
Message-ID: <20200514164429.GJ5127@sirena.org.uk>
References: <“1586592171-31644-1-git-send-email-ajitp@codeaurora.org”>
 <1589474298-29437-1-git-send-email-ajitp@codeaurora.org>
 <1589474298-29437-2-git-send-email-ajitp@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/0P/MvzTfyTu5j9Q"
Content-Disposition: inline
In-Reply-To: <1589474298-29437-2-git-send-email-ajitp@codeaurora.org>
X-Cookie: I think we're in trouble.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, plai@codeaurora.org, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org
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


--/0P/MvzTfyTu5j9Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 14, 2020 at 10:08:12PM +0530, Ajit Pandey wrote:
> Done the required cleanups to update lpass-cpu binding with newer
> yaml formats.

Please do YAML conversions as the last thing in any patch series, there
is quite a big backlog of reviews of YAML conversions so they can slow
down the code development.  It's good to do them, just try to make sure
other patches don't depend on them.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--/0P/MvzTfyTu5j9Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl69dWwACgkQJNaLcl1U
h9AXrwf/UUMyxPnGMZgJjf6Tb9WX8m9q0VXIk1y6rqsRtvKb8K7tSvC+euLhGJPr
+HbOhL0c30dJZls75X9x927Bo/rpNx5gTNFxUW45xK53cf1exNqMo26U0NSaY2Sn
VLu5juCg0M5hjZwi2unBjzE5Qu0JDGaVMMNfJrDm7bVIZUBWxWdTcT8ixsUYUjKc
iHvjM46lUpATtdr4lheFBFd4gS/kaHHWyI+dbjcfdBWht94Y91mZ+m7Azq+uAcdQ
uX1KkYLVtGcWzl9WNPpl8xSiFS9I/xXJ4/b/oECLyNxF2gW9TdrPPEVUVkpmDC1N
waON7hD0lep1WQst50p2Pm6GokaqLQ==
=V1P7
-----END PGP SIGNATURE-----

--/0P/MvzTfyTu5j9Q--
