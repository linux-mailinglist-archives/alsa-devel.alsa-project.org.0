Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E13E163C00E
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 13:30:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 578EC16CB;
	Tue, 29 Nov 2022 13:30:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 578EC16CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669725052;
	bh=5/zWs23/mnNl4PE9sJrMpmtkRckoGhnJBGPeass5SAs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IeExX0L1V/8184cOEIW+Jh/DeKarImC422s+yZUppJDEL4iweReXnwdWaMkyI0Eac
	 HGDsoBIS7F3/CsAV73Al8dCWwSgClP0INSinas6oFS2VEjtESFsMUjrnz2VeS3lRoL
	 tF8L32QzgSdIZy9/3Nk+q/ZhzXWvPLOa6SacXsi8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB36CF80137;
	Tue, 29 Nov 2022 13:29:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25562F801F7; Tue, 29 Nov 2022 13:29:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62AFCF80166
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 13:29:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62AFCF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SShJla8Y"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2426D61704;
 Tue, 29 Nov 2022 12:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 121CAC433D7;
 Tue, 29 Nov 2022 12:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669724988;
 bh=5/zWs23/mnNl4PE9sJrMpmtkRckoGhnJBGPeass5SAs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SShJla8Y8GuOg69pR8pSutZ8q2WkNT7VOMyMNuVD7PlyX1YDY0THvOaL0tE9etnvv
 meJ/WCvJW/iTlq9e4IDFVxw41R8bxvXnkFNLfB9To//bODdcH34O/vrUxLguIyeKdA
 VQO8PgAcuNNCprkMWKtST7kLILYESrK0q4ZshOb1dOaQDm2lKWuz7DE2TYPyw0lmVQ
 4oRb3zaZZUhKeut7Br0o9vE7EOgMUiQX4m831RHfE2UBRIvc0WdyAGgko8trD1aI60
 UKxriGLQKatXdYTFa9lctuucRSMhm4KYJc6hJbgfLYoDfgULGpI1h1iEefSXJ0Pt2Y
 4f2L4xA7CIFvQ==
Date: Tue, 29 Nov 2022 12:29:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v2] ASoC: qcom: lpass-sc7280: Add system suspend/resume
 PM ops
Message-ID: <Y4X7NSrvuKCb+eHr@sirena.org.uk>
References: <1669724411-14840-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nk9KEKTYlNAwdPwy"
Content-Disposition: inline
In-Reply-To: <1669724411-14840-1-git-send-email-quic_srivasam@quicinc.com>
X-Cookie: An apple a day makes 365 apples a year.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, agross@kernel.org,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, quic_plai@quicinc.com,
 swboyd@chromium.org, judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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


--nk9KEKTYlNAwdPwy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 29, 2022 at 05:50:11PM +0530, Srinivasa Rao Mandadapu wrote:
> Update lpass sc7280 platform driver with PM ops, such as
> system supend and resume callbacks.
> This update is required to disable clocks during supend and
> avoid XO shutdown issue.

This doesn't apply against current code, please check and resend.

--nk9KEKTYlNAwdPwy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOF+zQACgkQJNaLcl1U
h9AKHwf+NgNP4dQ8gsJFECdo50AJJbF5NXrLqkT8an+WcFY9FZWolfTEfn8cmd+q
yL1z182glbD0QnPWCpQK95miBGDu7D96ETOD3wZ7/bKHUiOSDj6a0SfHDZuPZrnd
Gv7YDHd99C4/BmtoWtKFnitVq5poMPALkxrukGkuAMxBJqkjBLbnJZ5q8CXZrUXG
ztFc6lS9PYtDan5WEAxfpflXHCAuLy/5y0DVuhxutdQdSLWOZBYRGR6uqzTwf/NA
XfKKbPSUV8KTQfWGoyNAVxDFiudi7BkZUU2+egj7tsKfDW9TfSrw1ARZraXsHamK
I+02cFMnwVzLIPiPQtDHzvmgMGNMZg==
=4Dou
-----END PGP SIGNATURE-----

--nk9KEKTYlNAwdPwy--
