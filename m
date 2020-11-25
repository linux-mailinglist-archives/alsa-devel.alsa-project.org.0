Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D84962C4090
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Nov 2020 13:51:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77E8E171D;
	Wed, 25 Nov 2020 13:50:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77E8E171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606308702;
	bh=TG3UpeiHbWC57NXnHtKT6Q7HjbmbKGepoMAsuPbYhgg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iQIu4FvsA2Xja2pdHUd36FovV1nKdOQbRwckUF/RMN76wRFbFzvHvcT1HEb3xc5fK
	 +PDRceXj5NRFdl6AgwgLKr2CTFYqU1kzERQjGf3vDGQg+XRaeJHlAQzebfGhRuzC2Z
	 J4YgVec+1gKy2O41aGe3QE1RFRDQRIXG9SEfkOkg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC49DF8015F;
	Wed, 25 Nov 2020 13:50:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DDF1F8019D; Wed, 25 Nov 2020 13:50:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AEDAF8015A
 for <alsa-devel@alsa-project.org>; Wed, 25 Nov 2020 13:49:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AEDAF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qA6Yjnk0"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B894206E5;
 Wed, 25 Nov 2020 12:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606308593;
 bh=TG3UpeiHbWC57NXnHtKT6Q7HjbmbKGepoMAsuPbYhgg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qA6Yjnk0W6zCUTsY9ibqshuDQiyuMajOgBuOizLAck5E9ZE5L+x+V2bYY6fA0yzhP
 xrJyA9k5kSg27ql/IPPknP/v+4uxJ4vosi4p2FhH49/Imm/qZUyNXz/o2apsCdUSEv
 3nynnNaoFfMST3otOGu54i2pO5tWIalKvxy47vR8=
Date: Wed, 25 Nov 2020 12:49:28 +0000
From: Mark Brown <broonie@kernel.org>
To: xuyuqing <xuyuqing@huaqin.corp-partner.google.com>
Subject: Re: [PATCH v1 0/1] Fix 32 bit format for adau7002
Message-ID: <20201125124928.GA4489@sirena.org.uk>
References: <20201118005858.123013-1-xuyuqing@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline
In-Reply-To: <20201118005858.123013-1-xuyuqing@huaqin.corp-partner.google.com>
X-Cookie: No foreign coins.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Rohit kumar <rohitkr@codeaurora.org>, cychiang@chromium.org,
 Patrick Lai <plai@codeaurora.org>, Andy Gross <agross@kernel.org>,
 dgreid@chromium.org, zhouguohui@huaqin.corp-partner.google.com,
 devicetree@vger.kernel.org, tzungbi@chromium.org,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, judyhsiao@chromium.org
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


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2020 at 08:58:57AM +0800, xuyuqing wrote:
> the microphone is attached to external codec(adau7002)
> instead of rt5682.We need to always use 32 bit format on sc7180
> to meet the clock requirement of adau7002:
> The ADAU7002 requires a BCLK rate=20
> that is a minimum of 64=D7 the LRCLK sample rate

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl++UtcACgkQJNaLcl1U
h9BXsAf+JbAuQvpTNdjb5/LUqRdyuTd2UQmI4XFbgJUpmVe1dh0IbCc5pqQg/DXU
/Wl7kSPW1BB1dgiEpbf54AcEQedhpzJggccsH9tWbLyLvC6yVksQc+PU3dxf8FbC
d+O/GzA4WlIomYE7szH8rvTLcBG8FE37F5qT7zADGhDFA4yjXNhmEOBFQQQsIzRR
gemWP64PSv4ekoI7Kc9k8VXFutE67I7cPaL0uHEnaDzUcbgkompnweXA8AApxTTq
PkxAlknTOCQQlkUQH+TgFi00oJlyriAJ9y1ua9le7GoFNRva07aIo9cehika7qTT
CxonbnDUtgpR5DZnZ5cUXTBJkby3EA==
=3C6x
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
