Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F67A96E10A
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 19:25:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 581D9847;
	Thu,  5 Sep 2024 19:25:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 581D9847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725557119;
	bh=oA+JaK45bIvDN0Y/g2haYI3ERCCF35W5j6c76i1XHWk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r8Ckp8ys3e2y+zeejxed4TcXmcDgoABfwUgvxQJKiIwmUCDxIzByIgW1+My/wdOkv
	 GMEddp6PaLEmp//V4D8L980qek94oauaNDtQq/OrAj5zrBLaotoeSe0ph4hBZjNNg0
	 thqtT6eIVCQ8w8wHK58u3z5Gt4QhfXJCoVHp0Qv8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04803F80199; Thu,  5 Sep 2024 19:24:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60B48F80527;
	Thu,  5 Sep 2024 19:24:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 450ADF8016C; Thu,  5 Sep 2024 19:24:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0864EF800E9
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 19:24:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0864EF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=VJ9ZDnhV
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 485H6VQw012415;
	Thu, 5 Sep 2024 12:24:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=2EPLvM+fTjNtBBRKdAtax43O9eQJ3gxJ5hQy/CTb4Wg=; b=
	VJ9ZDnhVEjybUXSFuEkkY1m4J26M2uWOb4LI/E2E4ORRD0JAsVO3YQ4A8lSoKQhW
	2PRR7L7P81m0idpUk9U5x2IzMXPDhD61QpRjoh/8Lah7udUAcTm3FJCfBPvQMN16
	VC/KJDrsvpxfKjup2poagnIkMYEes47trH/+M8EsO8J2PAumxasdvLcB++KpAqzj
	7xm0RgTdYoWAKEykbgFcwb+RiClNkJ+DWD2eQrMpxRRIX9hWnQgAeuHPEZm/Fsai
	JnIEyan/xomUEYLwb5LP7qWzAztyba2nJOOLCIp8xqrGaRwHJvU+Q7qp0aujMrAz
	F2lDsnQYRU4P454t905lBg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 41c0jxehg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 12:24:42 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Sep 2024
 18:24:35 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 5 Sep 2024 18:24:35 +0100
Received: from [141.131.157.113] (macMW3KVPQQ2W.ad.cirrus.com
 [141.131.157.113])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 6D335820244;
	Thu,  5 Sep 2024 17:24:32 +0000 (UTC)
Message-ID: <c2b7654b-74ae-4195-be0d-463b33af5965@opensource.cirrus.com>
Date: Thu, 5 Sep 2024 12:24:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] ALSA: update sample rate definitions
To: Jerome Brunet <jbrunet@baylibre.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Cezary Rojewski
	<cezary.rojewski@intel.com>,
        Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood
	<liam.r.girdwood@linux.intel.com>,
        Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>,
        Kai Vehmanen
	<kai.vehmanen@linux.intel.com>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        "Jernej
 Skrabec" <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
Content-Language: en-US
From: "Rhodes, David" <drhodes@opensource.cirrus.com>
In-Reply-To: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DCprltle2cLpNuwRuuh1hqg0jsfwhZ4c
X-Proofpoint-GUID: DCprltle2cLpNuwRuuh1hqg0jsfwhZ4c
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: YGLB2SXSX54VA4TZIDPG5MATAYJDQWO7
X-Message-ID-Hash: YGLB2SXSX54VA4TZIDPG5MATAYJDQWO7
X-MailFrom: prvs=697880dd55=drhodes@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YGLB2SXSX54VA4TZIDPG5MATAYJDQWO7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 9/5/24 9:12 AM, Jerome Brunet wrote:
> This patchset adds rate definitions for 12kHz, 24kHz and 128kHz.
> 
> It is follow-up on the series/discussion [0] about adding 128kHz for
> spdif/eARC support. The outcome was to add 12kHz and 24kHz as well and
> clean up the drivers that no longer require custom rules to allow these
> rates.
> 

Reviewed-by: David Rhodes <drhodes@opensource.cirrus.com>

Thanks,
David
