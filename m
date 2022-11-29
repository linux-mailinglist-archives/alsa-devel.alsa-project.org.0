Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E7D63C2F0
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 15:44:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD170169B;
	Tue, 29 Nov 2022 15:44:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD170169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669733090;
	bh=A4JzwDdzaEvxSZQvWjndFsFATLStcROSPLYAqY3CJ3c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o8j7bsb46xGdQLyerlG8ZFTBxvNvheULdTYInWmYmzkEF7tws2Fuc9JPsE4hySbpk
	 /dplw40ImquiT+LvMsyNLzTtuLVDuJxZld89K8RV37o/Ndzdgolw1yyp4IEGzElWEx
	 jHmnEAE89RG1zLkAc81KTr+Qr5zHyPCkU/JH+O5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 618DEF80137;
	Tue, 29 Nov 2022 15:43:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B6E9F801F7; Tue, 29 Nov 2022 15:43:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18129F80137
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 15:43:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18129F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="B9mKxGFh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E8EA761770;
 Tue, 29 Nov 2022 14:43:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5A7C433C1;
 Tue, 29 Nov 2022 14:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669733028;
 bh=A4JzwDdzaEvxSZQvWjndFsFATLStcROSPLYAqY3CJ3c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B9mKxGFhnbf9lKJX2LzX1bhAXfXxq4kRXT7ZTGhp6j8gXMNCz/Xp3H1+UBYZaTHNM
 s7YFAM08VbroLvBwddxwFPV/Z2IEKSmxRpeJN/n8tTiZYwNQT5pDfmP5ZbudA96hsz
 kMBuXHVibzbrrMJBIwG2ml1Zr4yoTmKMcbhXsRUq/QIkEDLTNw0Fb/abulkjfF3uNi
 zFxCzEBI/U1WeHdt4w2n8vrJDuajV8VdEEGQg+o8O4Mp8rxMTPi1HZ8N71Jxa37F+4
 U0CFQcBqaNiiyCp+y0oHeRfGJdmN9We4nSm7ChJvg6K+bFT4sVEs2P8RGiI6Znc/RG
 KMwK1O81Z15Yg==
Date: Tue, 29 Nov 2022 14:43:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH] ASoC: qcom: lpass-sc7180: Add maybe_unused tag for
 system PM ops
Message-ID: <Y4YancXWvYEI+H1O@sirena.org.uk>
References: <1669726428-3140-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="DGZE7aNRI3C4ls0o"
Content-Disposition: inline
In-Reply-To: <1669726428-3140-1-git-send-email-quic_srivasam@quicinc.com>
X-Cookie: The devil finds work for idle glands.
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


--DGZE7aNRI3C4ls0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 29, 2022 at 06:23:48PM +0530, Srinivasa Rao Mandadapu wrote:
> Add __maybe_unused tag for system PM ops suspend and resume.
> This is required to fix allmodconfig compilation issue.
> Fixes: c3bf7699747c ("ASoC: qcom: lpass-sc7280: Add system suspend/resume PM ops")

That commit doesn't exist...

--DGZE7aNRI3C4ls0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOGGp0ACgkQJNaLcl1U
h9C7HAf/fSadhhCJnSstdbesNHxGGXznin38OXu/a+Gf2n7GYf0l4BhRVuVlvD0H
y9YdMhn+IQKfNJrxjsbP5C17GvUSThOPfBA/0IgG1KMtiduZbmqdjjo2V8zNVaqt
rfUgJXk7gP023glYJqM/itjXRk0ilIq1Fr3Kx8fHxk8a45Z8eoX/H70GP/q7NaZf
93kXyY/KWk3IvbVbCkwUvNrupcAjRVHczNo3JDCuJCHH7sWcmZc+EJYus/cXMpgj
jYfgvYudVtxjjIiVCC/zpG4XGbvUL5OABfx1xy2ZpgTal2WqRSike7DkL3+VD7DB
955HeYx+vf71gOaTaDvhXs/NpnDFzQ==
=ahx7
-----END PGP SIGNATURE-----

--DGZE7aNRI3C4ls0o--
