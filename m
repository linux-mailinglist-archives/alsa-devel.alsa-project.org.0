Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F74E81B2D8
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Dec 2023 10:47:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3360B844;
	Thu, 21 Dec 2023 10:47:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3360B844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703152044;
	bh=2mPypVus8kxF8qkjRR0Akx7qGIv3qn15L01qU9PKMkc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kBERjIptJTmNJQfxyPyxBelQQ6YaprirT4PyDh7DYpOfuJ9cImzt88+mKnjZbXTH7
	 KvjkRLe4NBNfFbWIfdshhoiAT18wiN3CB3R8ym+SHoS7/VGKlSULFaneKcsZSoU4Rd
	 vBvly3NAbXrSvfts26fnXw1ISf3ofHBADeV076DA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6779EF8055C; Thu, 21 Dec 2023 10:46:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CEC8F80571;
	Thu, 21 Dec 2023 10:46:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 385CDF80153; Thu, 21 Dec 2023 10:46:47 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DC0BF800F5
	for <alsa-devel@alsa-project.org>; Thu, 21 Dec 2023 10:46:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DC0BF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=p0Ir59av
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BL8GX9d016665;
	Thu, 21 Dec 2023 03:46:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=2mPypVus8kxF8qk
	jRR0Akx7qGIv3qn15L01qU9PKMkc=; b=p0Ir59avbb3yhpZallP84N7sBsN5pwU
	fbq3ZAskCt+o54H0h9lwEUfPKl3FhsL0IiIxMcykxJgJ5gG1JLKAC0CXX3t2Yw0a
	3vha9VaZMjjIYQwMS9FyWJ/w7GOjBw9S13/QK2H5WEXVhI2edTGTcAysPGETk+M9
	Vzpvkge+iy8R5WwG3d0u6k3SOte0UStGHh/ddVhA93xrxw4nSUzBP30P3fbtPTP0
	mhvf5rOfukCNq69ix9XEAQaCKK6utn5r9C5B4ReHDaVnQuNrQGs2oeBoRn967pv1
	bHwDzicVqaNmmhxASvGwrC0a0Htbdusot2fC2UWKnSjJhoM2AwJiC8g==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3v1a6273rs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Dec 2023 03:46:38 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 21 Dec
 2023 09:46:36 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Thu, 21 Dec 2023 09:46:36 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 347AD15B4;
	Thu, 21 Dec 2023 09:46:36 +0000 (UTC)
Date: Thu, 21 Dec 2023 09:46:36 +0000
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
Message-ID: <20231221094636.GE14858@ediswmail.ad.cirrus.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <38d0c1c9-d60c-4ddd-b2ee-091d1717a377@sirena.org.uk>
 <5b8e74ad-460f-4e68-a17b-3131d810f29b@linux.intel.com>
 <ZXOPWRWvrRddOWpT@finisterre.sirena.org.uk>
 <700e564d-7e87-463a-a764-c4713ddf11cd@linux.intel.com>
 <bec481f0-5361-4090-b69c-1123f83ac8ac@sirena.org.uk>
 <f24a2a89-3d8a-4a6d-849a-cddbae4c1e03@linux.intel.com>
 <20231220151631.GD14858@ediswmail.ad.cirrus.com>
 <546d698c-3e23-4a92-9081-f1bebd6b33ae@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <546d698c-3e23-4a92-9081-f1bebd6b33ae@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: oKBkNLvCQh8eI1M36pKd7t46MudCjgxN
X-Proofpoint-ORIG-GUID: oKBkNLvCQh8eI1M36pKd7t46MudCjgxN
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: IUUDWEAQV3B326E2XOJSRHX7Q3AGJWKG
X-Message-ID-Hash: IUUDWEAQV3B326E2XOJSRHX7Q3AGJWKG
X-MailFrom: prvs=7719ccbd94=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IUUDWEAQV3B326E2XOJSRHX7Q3AGJWKG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Dec 20, 2023 at 07:26:24PM +0100, Pierre-Louis Bossart wrote:
> On 12/20/23 16:16, Charles Keepax wrote:
> > On Tue, Dec 19, 2023 at 06:08:15PM +0100, Pierre-Louis Bossart wrote:
> >> On 12/19/23 17:53, Mark Brown wrote:
> >>> On Tue, Dec 19, 2023 at 05:50:30PM +0100, Pierre-Louis Bossart wrote:
> Put differently: is there any sustained objection to the proposal of
> extending regmap with async BRA transfers?

Seems good to me, was not my intention to object to the idea itself.

Thanks,
Charles
