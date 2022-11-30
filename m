Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B65A063DBC6
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Nov 2022 18:17:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33F081709;
	Wed, 30 Nov 2022 18:16:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33F081709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669828645;
	bh=yyriOptA5RWxFE38x5xxIOr09IYVT+AppLmF6+AlJsU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mRRe5teg+Pf6ltFaDkmo0lZHD8+mtekN6KyaxaeGe5qwODZ4ujQa9R7af7bdrTamQ
	 WkecpXIxONAbAPcWlwpudbu270FZmoRHbS5yLAgM9Y8qsXTVaYvfjwVOyYNl8lPBL6
	 Qz8B4zuaUtixMzhEXtut+NqX6gl/ejO5m2OmIgjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3119F803DD;
	Wed, 30 Nov 2022 18:16:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3C2FF8023A; Wed, 30 Nov 2022 18:16:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96887F80166
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 18:16:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96887F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iLna48rh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1BE4C61D1F;
 Wed, 30 Nov 2022 17:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2955C433D6;
 Wed, 30 Nov 2022 17:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669828578;
 bh=yyriOptA5RWxFE38x5xxIOr09IYVT+AppLmF6+AlJsU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iLna48rhaHtiXHKuJdHhpAsQJCkScar0R0IKfCommkdtCEofbO762Dlh5m8nqx5O+
 XXzjbc/lT/F4r3Dp1sM+Byeje/txzqS4EqGRaXoSBilQSLWb/nG1HoD24ZkV32EYKQ
 zUwyUQm4GNoRnZOZiKjPpXaTpB+X97mjqaakC8cwoWGeLO8lcm9feZe0+xEDkrBxup
 39NsZSUS1JSRjP6ZV0wYmAFYYMQ7o+17T+w2KeuQCDgr5nDCZ7okdbDF4dhMnXKB0s
 3mjTr2VnMqrBRvSaBRUEFSmkphzQO+30ac77g1Xiqh5s9YbyuEYhlgIB/tZy4nWlIN
 61YV+oqNT1DaA==
Date: Wed, 30 Nov 2022 17:16:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH] ASoC: qcom: lpass-sc7180: Add maybe_unused tag for
 system PM ops
Message-ID: <Y4eP2yFKsmxzyX/4@sirena.org.uk>
References: <1669726428-3140-1-git-send-email-quic_srivasam@quicinc.com>
 <Y4eN4utrDnEnKu/8@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6SJAvmLG8+E8QRmv"
Content-Disposition: inline
In-Reply-To: <Y4eN4utrDnEnKu/8@google.com>
X-Cookie: Jesus is my POSTMASTER GENERAL ...
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, agross@kernel.org,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, quic_plai@quicinc.com,
 swboyd@chromium.org, judyhsiao@chromium.org, linux-kernel@vger.kernel.org,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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


--6SJAvmLG8+E8QRmv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 30, 2022 at 05:07:46PM +0000, Matthias Kaehlcke wrote:
> On Tue, Nov 29, 2022 at 06:23:48PM +0530, Srinivasa Rao Mandadapu wrote:

> > Add __maybe_unused tag for system PM ops suspend and resume.
> > This is required to fix allmodconfig compilation issue.
> > Fixes: c3bf7699747c ("ASoC: qcom: lpass-sc7280: Add system suspend/resume PM ops")

> This is incorrect, it should be '2d68148f8f85 ("ASoC: qcom: lpass-sc7180: Add
> system suspend/resume PM ops")'. I see you fixed that in v2, but this patch
> has already been applied ...

with the fixes tag already updated as I was applying it.

> Mark, I appreciate you being responsive and picking patches quickly, it might
> help though to leave 'external' reviewers at least some time to provide their
> feedback :)

There's a balance with hanging on for utterly trivial patches to get
reviewed, especially in areas where reviews aren't relaible or
consistent.

--6SJAvmLG8+E8QRmv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOHj9oACgkQJNaLcl1U
h9CVTgf/Yk6JQALmBhkO871ntVkBaSxGqlp+3vln0kZMki5ZCf9OWnSUtXUmaUk/
Vmk6rTe1hZ7fKFIcV1q1D6y8OnlRPFTBbCZl8OwPBESHXxFm3kWkiBpReuEr4Lzl
x9H399V3j+XaqQH2a7a08ls4Xr+L7pcnP6jIqmTp2H0axiGSWoxxBbIBeNO/BSoF
nYuaDojavoLEjR4LOyCgzGu1+E+NFeqrE2lkdlhc9KWObJ5a2iaRgCkXq6SdYJmH
wcqu9ldjoiWBJElKShLPW/2OKS2ADP7IVNi8QngsYt6iYO8p58lCOnfI58vhpdwR
/LsOtpk0Wtk94W2lYsNxwf3TYWQQbg==
=0l3+
-----END PGP SIGNATURE-----

--6SJAvmLG8+E8QRmv--
