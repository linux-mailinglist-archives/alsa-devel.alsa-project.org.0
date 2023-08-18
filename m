Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E78667827AD
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 13:14:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BBA986F;
	Mon, 21 Aug 2023 13:14:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BBA986F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692616498;
	bh=GERRINsAE4jFIhYWdb4073xkrV0e7fJw3JwzPleFkGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S8zRKkoaakjlBKDe0ZbZ71S9j9b0E+neIuKyDAl2coyBlcmUjUS7Ei29DK/eDdiWz
	 UU6EMZRLm6L67ivDSLDajvrrunKX1o/NIc1vJT9CjkuaUvAorE6VKc0nTlQmUP5oaa
	 6ERIry+7LwJV5++qNJN2wbOH1c2TjZ/n15j2tGKQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 778C1F805F1; Mon, 21 Aug 2023 13:11:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3B3AF800BF;
	Mon, 21 Aug 2023 13:11:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DA90F801EB; Sat, 19 Aug 2023 00:47:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA347F80027
	for <alsa-devel@alsa-project.org>; Sat, 19 Aug 2023 00:47:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA347F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cyuL5Iht
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D06A363A4D;
	Fri, 18 Aug 2023 22:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5936C433C8;
	Fri, 18 Aug 2023 22:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692398846;
	bh=GERRINsAE4jFIhYWdb4073xkrV0e7fJw3JwzPleFkGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cyuL5Iht3FYQhRsQPZ882/GmkeF4L5szu8lARMrLLwnl/0ywm7mtvMs22mHQfpQEV
	 PfMAoZI9wLWJ88CsiWMyPcyIZlbf2PVYElReCYpEyqPx79/9xEz0p2o24WJqS7cfEd
	 3ppg3GlffC8lgib60tR67hmDMT96+jDVyO7khBg5IfTrrrzO8vR2si+EvKu7D/bwFl
	 BOQJwbKJE47igkOtaP04PX5ASifTwmFRyzEb76CWj1pq1lFsCFcdYnoSNsmw3bbopA
	 jb4Cy2tCBGbxN1MIv7KK7Nkz6ZeGN4hzis7MN6B2iZymCsTslqic6QQ0etjZshT3RI
	 t7o66s2q1HFRw==
Date: Fri, 18 Aug 2023 23:47:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Andy Gross <agross@kernel.org>, David Airlie <airlied@gmail.com>,
	alsa-devel@alsa-project.org, Bjorn Andersson <andersson@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>, ath10k@lists.infradead.org,
	ath11k@lists.infradead.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
	etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	Frank Rowand <frowand.list@gmail.com>, iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Joerg Roedel <joro@8bytes.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Kalle Valo <kvalo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-wireless@vger.kernel.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Maxime Ripard <mripard@kernel.org>, Sinan Kaya <okaya@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>, Sean Paul <sean@poorly.run>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <jroedel@suse.de>,
	Kevin Tian <kevin.tian@intel.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH] iommu: Remove the device_lock_assert() from
 __iommu_probe_device()
Message-ID: <1b53ea1e-3522-43db-a7db-dd4b460f0bc6@sirena.org.uk>
References: <0-v1-98d20e768c66+7-of_dma_lock_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sBznzgBGlLdaocvC"
Content-Disposition: inline
In-Reply-To: <0-v1-98d20e768c66+7-of_dma_lock_jgg@nvidia.com>
X-Cookie: Your aim is high and to the right.
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: LIAEIURT5KGZ62AGGASHV5YEB45VQXG3
X-Message-ID-Hash: LIAEIURT5KGZ62AGGASHV5YEB45VQXG3
X-Mailman-Approved-At: Mon, 21 Aug 2023 11:11:53 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LIAEIURT5KGZ62AGGASHV5YEB45VQXG3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--sBznzgBGlLdaocvC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 18, 2023 at 06:32:28PM -0300, Jason Gunthorpe wrote:
> It turns out several drivers are calling of_dma_configure() outside the
> expected bus_type.dma_configure op. This ends up being mis-locked and
> triggers a lockdep assertion, or instance:

Acked-by: Mark Brown <broonie@kernel.org>

--sBznzgBGlLdaocvC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTf9O4ACgkQJNaLcl1U
h9CQkgf/U+glO2B163vQwi/fCAxSj8fyw/4Fx89WMOmUEwj0C05hkeR75k8U4pW8
4U0vPSpT0yaPcjKGpztFpE3uMIf/40CZ1SbbKuvZ4RcYoumOqLIWVcQzYmEiQSml
M4NjnYXvs3xppLRtxlnWYCzwmvijPoQfs/Ot1VBn9TsoGz70YwLD3JfjHXnztUHF
y9wAVvMF5OgDayDuWedbuh63H4kRGS7LIhIu9cPgnV14RWL9SmYat6UKcto2FePd
th2ai/d8CMoJ8oHV7BOaf86sQXul26EvMiWSqgyc9uGX/ag9RYCA465U/QXlVQZc
M7hwZKW9rlZZsKXxSdbNPklRZ/Mdqg==
=cHW/
-----END PGP SIGNATURE-----

--sBznzgBGlLdaocvC--
