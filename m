Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C189781A205
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Dec 2023 16:17:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5769C836;
	Wed, 20 Dec 2023 16:17:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5769C836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703085437;
	bh=ooCIIsodHdSkzvsLyZj9BJniMAGsODY3Idjs1nuTlr0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zi0GfOkr4pe5SrQpdCmUAm+xg3G/pqnPrjWCvOUSJ7v2UQiaYWTbAQia9lRLJSy+I
	 J45P9cq+FEeNPGQ5jcS/O/XsFRUa7AkVMypcO9j+pgUMW3ulOeEKWo01iPiB9v54k+
	 GUTnrRnjiym7zqg6Av7X/uffp0kDyUK3Ql2LclPQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A0FBF8055A; Wed, 20 Dec 2023 16:16:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2EECF8057B;
	Wed, 20 Dec 2023 16:16:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4330BF800D2; Wed, 20 Dec 2023 16:16:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B68B2F800D2
	for <alsa-devel@alsa-project.org>; Wed, 20 Dec 2023 16:16:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B68B2F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=OU7qWuhi
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BKFAu6j013270;
	Wed, 20 Dec 2023 09:16:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=H40IqBOxm3jSi5g
	QtOQ0V4uc0WBm+P5NltYmz5Hxiyc=; b=OU7qWuhiV4gvDR3uVcl2RGqDOv37Ft2
	2P4VNcVU5enDwtHtX6KTsW5uUToTLLdeoRYnVN1phNMjev7AbZTqMnfkEw0GRdJ/
	QhdOLa1ew70PcZfZkTWRAZy//BvQw/wimLqf1cTSx2XIj6KvZh1UlYvagdpfgxCb
	S/pEQk1oeU0QLE2bEL+uPhQdfck2H3/6S4Cuz1vJQ701+OFGkaSOeMxh96QDLG6V
	bI9fW5AwHyNVoixUStF4Syf0fTacxWEJWN1gQKKdQdb1/kT3n/zb0kB0Di6GJXku
	ESL5vbnnc3ygpdEQ7SwWA3P8jsiOZNC/nN5b8IhBvey2VjAH1N2AN4Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3v1a625mqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Dec 2023 09:16:33 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 20 Dec
 2023 15:16:31 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Wed, 20 Dec 2023 15:16:31 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 69CD611D1;
	Wed, 20 Dec 2023 15:16:31 +0000 (UTC)
Date: Wed, 20 Dec 2023 15:16:31 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>, <linux-sound@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <tiwai@suse.de>,
 <vinod.koul@intel.com>,
        Bard
 liao <yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>,
        Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>,
        Kai Vehmanen
	<kai.vehmanen@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>,
        <vijendar.mukunda@amd.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Shuming Fan
	<shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
        Oder Chiou
	<oder_chiou@realtek.com>
Subject: Re: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
Message-ID: <20231220151631.GD14858@ediswmail.ad.cirrus.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <38d0c1c9-d60c-4ddd-b2ee-091d1717a377@sirena.org.uk>
 <5b8e74ad-460f-4e68-a17b-3131d810f29b@linux.intel.com>
 <ZXOPWRWvrRddOWpT@finisterre.sirena.org.uk>
 <700e564d-7e87-463a-a764-c4713ddf11cd@linux.intel.com>
 <bec481f0-5361-4090-b69c-1123f83ac8ac@sirena.org.uk>
 <f24a2a89-3d8a-4a6d-849a-cddbae4c1e03@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f24a2a89-3d8a-4a6d-849a-cddbae4c1e03@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: z-sJ_nunaaRtA2h0EEviAt3_2TDvFNd3
X-Proofpoint-ORIG-GUID: z-sJ_nunaaRtA2h0EEviAt3_2TDvFNd3
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: FT4E2VPS2HVFEZLYNQZUG2EPLRYCFOBC
X-Message-ID-Hash: FT4E2VPS2HVFEZLYNQZUG2EPLRYCFOBC
X-MailFrom: prvs=7718adeda9=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FT4E2VPS2HVFEZLYNQZUG2EPLRYCFOBC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Dec 19, 2023 at 06:08:15PM +0100, Pierre-Louis Bossart wrote:
> On 12/19/23 17:53, Mark Brown wrote:
> > On Tue, Dec 19, 2023 at 05:50:30PM +0100, Pierre-Louis Bossart wrote:
> >>> grep for regmap_.*async - cs_dsp.c is the upstream example in a driver,
> >>> or there's the rbtree cache sync code which uses a back door to go into
> >>> an async mode.  Basically just variants of all the normal regmap I/O
> >>> calls with a _complete() call you can use to wait for everything to
> >>> happen.  The implementation is a bit heavyweight since it was written to
> >>> work with fairly slow buses.
> > 
> >> I spent a fair amount of time this afternoon trying to understand the
> >> regmap_async parts, and I am not following where in the code there is an
> >> ordering requirement/enforcement between async and sync usages.
> > 
> > The only actual async implementation is SPI which processes things in
> > order of submission, the sync API wraps the async API.
> > 
> >> Also is this just me spacing out or there is no regmap_raw_read_async()?
> > 
> > Right, there was never any need.
> 
> ok. I am starting to think that we could have a new type of regmap, say
> "regmap-sdw-bra", where the use of write_raw_async() would rely on the
> send/wait bus primitives, and write_raw() would fallback to the regular
> read/write commands. We'd need a mutual exclusion to prevent parallel
> async/sync access to the same regmap.
> 
> In other words, "memory" areas that are used for firmware downloads
> would be moved to a different regmap with async capabilities and no
> caching support.

I would be a little inclined to say leave adding a regmap for a
follow up series, whether we add it to the existing regmap or add
a new one, or whatever, it should all sit happily on top of the
API being added in this series. Makes it a little more contained
to focus on one area at a time, and leave this series as adding
core support for BRA. But that said, if we really want to I don't
feel mega strongly on this one.

Thanks,
Charles
