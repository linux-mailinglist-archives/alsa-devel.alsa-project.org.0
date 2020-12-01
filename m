Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9837C2CAA27
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 18:53:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1638A17CC;
	Tue,  1 Dec 2020 18:52:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1638A17CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606845229;
	bh=jUfmwSwFjkBDlJ2yKLucSJdrO2Do2GFfT2jP3rl2XF0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PNwa08vx/fV3Zu5hwWTJZSwkIBsNVAu0zuIHSQJj8vIh6IudPY70dlsljLlgsgTYR
	 qbaBvJeqBGWck3wXuk4vsLVX5fd1Y7gD78pVv6DJuFjk+ng5xuU5DZI7ZAcHjPXBf2
	 zyVJsvQjf4yw8JD4gThNk0H0dLVm2TdDMcAeV8ro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 287C5F80168;
	Tue,  1 Dec 2020 18:52:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C57EF8016D; Tue,  1 Dec 2020 18:52:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 975D4F80168
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 18:52:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 975D4F80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="B6evOfVt"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CFCF620639;
 Tue,  1 Dec 2020 17:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606845124;
 bh=jUfmwSwFjkBDlJ2yKLucSJdrO2Do2GFfT2jP3rl2XF0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B6evOfVtPDO/lqPGI4YNEUtxLDjHbZ2Gn0Fo0LlZJhPXn5WYv1KHmWaBDtNZPQcnM
 mjSeRMfZVph92b22w85+1sXGKO/sK9bLw4OSpTbJAZhnHNFFEl/kxxChQpoT1nfsYF
 F/Qw+ItDxJumfTk/UJCa0IEZ6Tgyc4WhgJMslYxI=
Date: Tue, 1 Dec 2020 17:51:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: Re: [PATCH v4 1/2] Partially revert ASoC: qcom: Fix enabling BCLK
 and LRCLK in LPAIF invalid state
Message-ID: <20201201175135.GO5239@sirena.org.uk>
References: <1606539559-4277-1-git-send-email-srivasam@codeaurora.org>
 <1606539559-4277-2-git-send-email-srivasam@codeaurora.org>
 <20201130124617.GC4756@sirena.org.uk>
 <966993b7-4720-bdd2-cf4d-cf5a7c11a0c1@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2/+Vq7w28QOSGzSM"
Content-Disposition: inline
In-Reply-To: <966993b7-4720-bdd2-cf4d-cf5a7c11a0c1@codeaurora.org>
X-Cookie: Who was that masked man?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, bjorn.andersson@linaro.org,
 agross@kernel.org, srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
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


--2/+Vq7w28QOSGzSM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 01, 2020 at 11:01:21PM +0530, Srinivasa Rao Mandadapu wrote:
> On 11/30/2020 6:16 PM, Mark Brown wrote:

> > Part of this commit message says that the problem was making the regist=
ers
> > non-volatile but both the change and the rest of the commit message say
> > that the issue was that the registers were made volatile.  I'm also
> > still unclear as to what the issue is either way - how does reading the
> > state of the registers from the hardware instead of the cache affect
> > things?

> Initial problem was, during playback if device suspended, I2S and DMA
> control registers

> are getting reset and unable to recover playback after resume.

> As these registers were non volatile registers, driver is not getting act=
ual
> register value

> and unable to report error state to application. Due to this application

> keeps on polling for HW current pointer state and not exited from PCM
> running state.

> Later from review comments by Srinivas kandagatla, I got to know
>=20
> about regcache sync APIs, which can be used=A0 to sync cache after resume=
 and
>=20
> HW registers can be updated with=A0 original values. With that playback c=
an be
> continued.
>=20
> So is the reason, I am reverting partial changes in the commit b182496822=
1c.

I don't understand why a fix for the register cache not being in sync
with the hardware doesn't involve syncing the register cache with the
hardware.

--2/+Vq7w28QOSGzSM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/GgqYACgkQJNaLcl1U
h9AADgf8CR0hjpkrydEc4Jmmddl9qFfQcl6Ce7ZzoFWbuXciX9c8pj+PPVgpoX/K
jwlx1LwoYv/e+ods31XWXAdp2nRaCef93oB6iUPjUydd6LdsW40FFiBCB4fiT/v/
6JqlND0PT2+PAgAkoz1sUM9Hn5U5ocdWfs02/3jICjdnfvHjDWtH6XWgNwt+CA1A
1PpFFUv4RkRTYZFG/LHHNXPOOBc8jqJ1Z66ZjEd38AvpJXaWsDAAlF4hc2XUk15/
hSoQ97rYQGjGUfQUB/K9qgkhzAj67DtXgif7iosAO+Th/hAkRwH189Z/lTZrkoOd
Rp1dumAYfp+wg91tB7hho8TJxhmygg==
=QxRn
-----END PGP SIGNATURE-----

--2/+Vq7w28QOSGzSM--
