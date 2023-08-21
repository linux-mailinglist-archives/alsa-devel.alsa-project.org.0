Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D886678685E
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 09:33:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D611483B;
	Thu, 24 Aug 2023 09:32:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D611483B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692862387;
	bh=FixGPDbY1JGUzoXJGnGCpBH8LX7vfPyc85NTwmVIvZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y+Rqi6uQxnS7jIulAiaW7fr5/8jD9sMbucuPSaJ6EtDgZ+hxs3nwn6gmjA4kdHh8e
	 h9y7xTHmOnsw/cwCiYlgiBKkjBA5gyuGkqND332t87yjqJG+cB+bSeJnBBCr1sb8Rp
	 W3vX+KXsrJsM4nx55yEBjl/Z9MX+f5SU31NpkCbQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 493BBF8025F; Thu, 24 Aug 2023 09:32:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87C1CF800F5;
	Thu, 24 Aug 2023 09:32:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27CE1F80199; Mon, 21 Aug 2023 14:27:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.8bytes.org (mail.8bytes.org
 [IPv6:2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by alsa1.perex.cz (Postfix) with ESMTP id C485BF800F8
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 14:27:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C485BF800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=8bytes.org header.i=@8bytes.org header.a=rsa-sha256
 header.s=default header.b=1GNfM2qX
Received: from 8bytes.org (pd9fe95be.dip0.t-ipconnect.de [217.254.149.190])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 14D6D28194F;
	Mon, 21 Aug 2023 14:27:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1692620870;
	bh=FixGPDbY1JGUzoXJGnGCpBH8LX7vfPyc85NTwmVIvZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1GNfM2qXUHu69LlGLcBH8KY7o7o7XmY+SCrGkW/UUIs2KGTpDHXZZbMpPGz6QSYZs
	 UPnFUxDcsVEY3pjS1DruthDw9f83ySojUQCSB+rWg+GUD0/AhHwU/y7CvGp4ChZNfv
	 PF0U1t4Yrw0S3cKVt3Z1VBJMi6C4Yubn+JBgQ0h8akaCgHt2/SoukE6zqp52PyQtal
	 mSBFlaAtIaUSfX6biqD/5UJPh1qGAUoCalqefQ1b2bqiPcVjHwugqG0e+YrG5Eef+K
	 UDBnBPokoAbTS28F+RA/gZgu4I/tGuWG+hC4PlSSGwOqv9iwEYEE1WLsVZflD78r+Z
	 CJt+ubMPFXzmw==
Date: Mon, 21 Aug 2023 14:27:47 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Andy Gross <agross@kernel.org>,
	David Airlie <airlied@gmail.com>, alsa-devel@alsa-project.org,
	Bjorn Andersson <andersson@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>, ath10k@lists.infradead.org,
	ath11k@lists.infradead.org, Mark Brown <broonie@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
	etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	Frank Rowand <frowand.list@gmail.com>, iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
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
Message-ID: <ZONYQyMSG17YMc_b@8bytes.org>
References: <0-v1-98d20e768c66+7-of_dma_lock_jgg@nvidia.com>
 <78114fd6-9b83-92ba-418f-6cc7bda9df9b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78114fd6-9b83-92ba-418f-6cc7bda9df9b@arm.com>
X-MailFrom: joro@8bytes.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: SPFGSTYL5VZXI7DBARBXROSW5CKRXJTE
X-Message-ID-Hash: SPFGSTYL5VZXI7DBARBXROSW5CKRXJTE
X-Mailman-Approved-At: Thu, 24 Aug 2023 07:29:53 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SPFGSTYL5VZXI7DBARBXROSW5CKRXJTE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 21, 2023 at 12:06:40PM +0100, Robin Murphy wrote:
> The solution is to drop those locking patches entirely and rethink the whole
> thing.

Agreed, that was exactly what I thought when looking at this patch.

I dropped the original 10 patches and the 4 fixes on-top from the IOMMU
tree. This needs more investigation and adaption of the actual API users
before it can be reconsidered.

Regards,

	Joerg

