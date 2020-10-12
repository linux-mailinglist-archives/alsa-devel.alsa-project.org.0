Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF6B28B862
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 15:52:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C99F1168D;
	Mon, 12 Oct 2020 15:51:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C99F1168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602510739;
	bh=gclqk7PlHJkH2Ivqw36sMpSSFpCR5Atw2BLhMIFSeZ8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=akRofpAfxFFmdtF5O94DjgXxKu0Z1IYpUd1pbJKZwI17QucSe3xlvSwEOGnZZG280
	 HhrKkta8+lPrPuPEuzpzZjjwIWNCvfI1Fot3qLopK8MN0ncO7uoXgsl1TiDbyT7ovI
	 Lmh5B/eqDKz8pNgWGBmul0Cwfd+Od1mZbAAUyBsQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4C88F8020D;
	Mon, 12 Oct 2020 15:50:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A7ADF80217; Mon, 12 Oct 2020 15:50:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2944F80141
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 15:50:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2944F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uBfz4p4R"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 543F620678;
 Mon, 12 Oct 2020 13:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602510629;
 bh=gclqk7PlHJkH2Ivqw36sMpSSFpCR5Atw2BLhMIFSeZ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uBfz4p4Rs+2yLXkEje0vEUczBBX9Wa8UI1+elcZfPtciYMbvFTkbSNNMrr+FrPv9E
 lyTKL+hZtelhR2hYYQyRxGz5GNnfPqnWLnGrV47YD66zUGy5e/zug9eW1IFmqQGzLQ
 rp+iMF+8MOkSI+8AIteEQJn6DaMl0iRaM4yayxHM=
Date: Mon, 12 Oct 2020 14:50:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Subject: Re: [PATCH v1 1/2] ASoC: qcom: dt-bindings: Modify sc7180 machine
 bindings
Message-ID: <20201012135025.GF4332@sirena.org.uk>
References: <20200928063744.525700-1-ajye_huang@compal.corp-partner.google.com>
 <20200928063744.525700-2-ajye_huang@compal.corp-partner.google.com>
 <20201009135231.GA6655@sirena.org.uk>
 <CALprXBZAFCOpWP2186RaP++613qnjPY3D3NbXEN5CToYsLNsRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="m1UC1K4AOz1Ywdkx"
Content-Disposition: inline
In-Reply-To: <CALprXBZAFCOpWP2186RaP++613qnjPY3D3NbXEN5CToYsLNsRw@mail.gmail.com>
X-Cookie: Fremen add life to spice!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ajye Huang <ajye.huang@gmail.com>,
 Patrick Lai <plai@codeaurora.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, dianders@chromium.org,
 Andy Gross <agross@kernel.org>, Rohit kumar <rohitkr@codeaurora.org>,
 tzungbi@chromium.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Cheng-yi Chiang <cychiang@chromium.org>
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


--m1UC1K4AOz1Ywdkx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 10, 2020 at 12:07:54AM +0800, Ajye Huang wrote:
> On Fri, Oct 9, 2020 at 9:52 PM Mark Brown <broonie@kernel.org> wrote:
> > On Mon, Sep 28, 2020 at 02:37:43PM +0800, Ajye Huang wrote:

> > > Add compatible "qcom,sc7180-sndcard-rt5682-m98357-2mic"
> > > for 2mic case.

> > This doesn't apply against current code, please check and resend.

> Thank you for your reply,
> This patch depends on  Cheng-Yi's patch series
> https://patchwork.kernel.org/patch/11773221/.

That's "ASoC: qcom: dt-bindings: Add sc7180 machine bindings" for those
playing at home.

>   If I misunderstand what you mean, please correct me,

A version of some SC7180 patches was applied.  However it does seem like
that didn't include any machine driver bindings so it must've been a
different, similar looking series which is presumably waiting for a new
version - please resend based on that new version (ideally these patches
could be picked up as part of that series).

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--m1UC1K4AOz1Ywdkx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+EXyAACgkQJNaLcl1U
h9BwIAf/XpfQPd1lFO2YwlgTjpFOBaziPt4AR62h8rbInkhceFG213nkLrJwxqwB
zd86aM3WLbMco1ub9Cb45c8Ki+XG3JkKzu42jAe57UI7PKDSEUbMPX9ij9syI0rp
Av2maAjFLvsayqXLMKoPAEeukBfNGxFys7bGRRPVFCFH2Ji9o2JmrRQ3nUOTmxNW
kZBtjAkb2L7b9gMZj2p+pnwuU/Sx9DWyaE5pIu02YsjxXCp1NSWRCYnoZ/WPmvMh
la5s2RnQJ7d5etnRM/iKDUmNrJX6bptGu7aFpwIM7ErjhIc2nT8SbtH79lU63t9w
eGhLoubWxF3WrO9uxYZ9ecN0h4ufwg==
=78nE
-----END PGP SIGNATURE-----

--m1UC1K4AOz1Ywdkx--
