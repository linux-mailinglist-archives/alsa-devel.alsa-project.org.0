Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CCE274080
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Sep 2020 13:11:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88E5316A8;
	Tue, 22 Sep 2020 13:10:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88E5316A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600773070;
	bh=ZSSAAP/85iGefRVHL/IykQXPV1a4Qz4IdNot7umbpi8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MnHfs1rwIpS+qdDdP5oHjmHGR+W+F//CFv4kcSeu7vsRSI0rIua1oK/cFRIHvmJwx
	 GAlisy2A6t/hvfqBDZ8vHJbLMUft+yeMM1E48kriAwgI4/qqI6N4CWBgsO3gdeq5yS
	 MADL4AqzT2G+MaK8qtUofuMZUUvwcoedYkWYTBgs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6F79F80232;
	Tue, 22 Sep 2020 13:09:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C902FF80229; Tue, 22 Sep 2020 13:09:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6CB4F800ED
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 13:09:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6CB4F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Gc/gR5uK"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D2263207C3;
 Tue, 22 Sep 2020 11:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600772958;
 bh=ZSSAAP/85iGefRVHL/IykQXPV1a4Qz4IdNot7umbpi8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gc/gR5uK7fAi/tuxXnKfutxmdsMlMWwPPI20jb7txCEuDoEfpU/hsmev4dPpgZhG8
 OyT6i44vOYOVaadAtcblg40wjkXvIfoXoNxwbH79S8gqIVUzAxjGDWXNIUnqRWbqTO
 pBv4ua7oRkv48pGBUqP+R3OBikCYJJep1whX0cBc=
Date: Tue, 22 Sep 2020 12:08:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v6 3/5] Asoc:qcom:lpass-cpu:Update dts property read API
Message-ID: <20200922110825.GN4792@sirena.org.uk>
References: <1600409084-29093-1-git-send-email-srivasam@codeaurora.org>
 <1600409084-29093-4-git-send-email-srivasam@codeaurora.org>
 <040290a8-26a3-ab9c-04dc-beb23ee827e8@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="z3ovhOgMYmj8MRdq"
Content-Disposition: inline
In-Reply-To: <040290a8-26a3-ab9c-04dc-beb23ee827e8@linaro.org>
X-Cookie: Love thy neighbor, tune thy piano.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 V Sujith Kumar Reddy <vsujithk@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 plai@codeaurora.org, tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, agross@kernel.org, rohitkr@codeaurora.org,
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


--z3ovhOgMYmj8MRdq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 21, 2020 at 10:20:22PM +0100, Srinivas Kandagatla wrote:
> On 18/09/2020 07:04, Srinivasa Rao Mandadapu wrote:

> > -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-lpaif");

> Index is always preferred over name w.r.t device tree bindings, so lets
> stick with that for now!

It is?  That's not usually the case...

> Unless you have any strong reason to lookup resource by name?

Looking things up by name tends to make the DT easier to read (since
things are named).

--z3ovhOgMYmj8MRdq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9p2ygACgkQJNaLcl1U
h9DF0Qf+NkaL/z36OrHjNAgl5BRKBBwHT/DGQCQG5hEnssX4Y6iere3ZcmSC97uB
qE0ku9uCXnOZQmn0xfHl4ZZbyfiq9OsY/0DEgRtDqOoHMu8yWe3/CzPOZZyo8gaR
41jkAGEmbWMw15NfcoKNBsBp9FETFp9YmhrZGChL2XrcWPWJr3iZ2bVSm+PSvExM
haa6OYb8751uvliEjZaNkee0Wj4dnQDNhiV+Y9F5urAoxPbfkzG8QJbZlvhpC4Xg
mxuMfMK8sbZuWBi2eD6V/ZYvRYaGWyTM531HaVyfhCV4zA7g5+pKGMibMUNAnAsW
kJ++v+5t4EyVjeVYS52OpP6ZfQ5yLQ==
=+gQK
-----END PGP SIGNATURE-----

--z3ovhOgMYmj8MRdq--
