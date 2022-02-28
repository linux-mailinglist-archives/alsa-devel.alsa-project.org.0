Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E7F4C6E77
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 14:42:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 226011732;
	Mon, 28 Feb 2022 14:41:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 226011732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646055743;
	bh=VA89CeUxKMxAiD5e2iQqCNZGN2aSPDh90kmOOEXOGeY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S8QSuujv/s2vky5TH5apJWwsSh7EB7CukpZ/shto2AR9IqsQ8o2MlB00/hEBw9q7C
	 K5il08stqbLKq0Kppqs56agHPqs/Ev8DdiEh5mceqcn2OTOIGzmpHy8Zzun8LMQfg5
	 zMosuV2DSnla7ZtEScBXfBxOtmpGZY/f/XsCsWaI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1551F804CA;
	Mon, 28 Feb 2022 14:41:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54F31F8025C; Mon, 28 Feb 2022 14:41:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 071E0F80125
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 14:41:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 071E0F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vHR0qat2"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 21CE9B8112D;
 Mon, 28 Feb 2022 13:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6611C340E7;
 Mon, 28 Feb 2022 13:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646055658;
 bh=VA89CeUxKMxAiD5e2iQqCNZGN2aSPDh90kmOOEXOGeY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vHR0qat24ix1x9tEH+Xc54AYjZuVSLKMiH/fflbfGvXMcG4DuAJiJARPGOtP3uZmr
 nCOuHHKREe40joEkERig1pzZRh7TKEX+qYLCHKlFZgkxqZ//zt0btI4DoDz0FCyT+Y
 HgFSPe2B2L3ZnD4XIwUs7A2eikHWYoNGLY0ftWsKU16HuxdnFB2mIIJlkXNktBDnlj
 +Kb6d+FD9xdbyS01jj/745en/anIT2Db2f3xGt17lpo07A7H/JLTtGCd39/xRfQaV9
 YcApXpvsLLfBmrOGx/JYvoiMuYzyHfhDQTHsUVR504n/qfmV5r+3gvL9F9F8Ij6Suw
 edMkZS3/bGR/A==
Date: Mon, 28 Feb 2022 13:40:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH] ASoC: qcom: soundwire: Add support for controlling audio
 CGCR from HLOS
Message-ID: <YhzQ40svWd/ytyHE@sirena.org.uk>
References: <1646035750-25635-1-git-send-email-quic_srivasam@quicinc.com>
 <YhzMeoNW7/OUJrMa@sirena.org.uk>
 <2de96a40-82c1-7ff2-a293-295267058fd3@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="UMh4YcLiIRHdmZcN"
Content-Disposition: inline
In-Reply-To: <2de96a40-82c1-7ff2-a293-295267058fd3@quicinc.com>
X-Cookie: Killing turkeys causes winter.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, yung-chuan.liao@linux.intel.com,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, bjorn.andersson@linaro.org,
 rohitkr@codeaurora.org, agross@kernel.org, srinivas.kandagatla@linaro.org,
 pierre-louis.bossart@linux.intel.com, quic_plai@quicinc.com,
 sanyog.r.kale@intel.com, judyhsiao@chromium.org,
 Venkata Prasad Potturu <quic_potturu@quicinc.com>,
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


--UMh4YcLiIRHdmZcN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2022 at 06:57:55PM +0530, Srinivasa Rao Mandadapu wrote:

> DT binding included in another patch which was sent recently. As this pat=
ch
> depends on clock driver patches didn't=A0 mention the below dependence.

> https://patchwork.kernel.org/project/alsa-devel/list/?series=3D618579

This is all getting far too messy and complicated - you're sending lots
of different versions of multiple patch serieses with various
interdependencies and conflicts some of which you're forgetting to
mention and some of which are against things that haven't even been
posted yet.  Please slow down a bit here, take a bit more care and try
to rate limit the amount of stuff you're sending out at once.  It'll
make things a lot easier to manage and probably take less time and
effort overall.

--UMh4YcLiIRHdmZcN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIc0OIACgkQJNaLcl1U
h9D40Af+KP9WixHc82GfzMRI8RejCkjKeOju9FcCVKIAq9u9tzYSpuGab/lbjtK4
Q98w68/Z3JqC1kzSw3WwR+fOy0DO0A7t+Skapwqc4WutGEFET4Z4SAeHZU9peiEV
Hb/5pQtHVLhLEtnNdQKGJI6sojkbUiXZDDISeMEHsdjXiOikcxPfT13pgxLceC8a
teDHRU530pcTiAIKNxdUu9NWTRNNQNd6Pe6FP+OIfngnCYqLgwlrt9wIHAUgYhWA
uxDMFfdWTXBBbL5Uoc0B+c6jmaROn0O9XBMVnRBe4PUZ/k8rZtx6vS/snRKYyr/+
ZQhj0ptzrE1kN9uoP6d3f8svSHp3tQ==
=DeDG
-----END PGP SIGNATURE-----

--UMh4YcLiIRHdmZcN--
