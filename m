Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E0E792FF0
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 22:26:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86847825;
	Tue,  5 Sep 2023 22:26:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86847825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693945617;
	bh=TmXORlHZVdnwhszatFqHmxtEzPrOP6cfGb7Lvq6PQMw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ot/VZp9eUu0GNo0yIj1BUPTE8+yT6zpm+H86x3wKjgbnab13ZA5w6pb0mwDAW8i/w
	 DoRJzSBID9pszl/LAPse26gAzy3yK0gRshVsa4wSJh3FzDtnyPL6PIjbkW2VzxEKuk
	 H5/21PzRHwZIBIC7I3LOqmoKk0v6k1NZ7ItcBrxU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8E25F80551; Tue,  5 Sep 2023 22:26:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F9C7F8047D;
	Tue,  5 Sep 2023 22:26:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B855FF80494; Tue,  5 Sep 2023 22:26:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C220F80431
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 22:25:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C220F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=K6SS7o33
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38560mTI022304;
	Tue, 5 Sep 2023 15:25:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=UpYpqMqegw67X6w319WVYKssAQtKW9ZSUZjIh1z449U=; b=
	K6SS7o33KnW4hPYRMvg43KqMZvFKpDk+IGUUz/+WJD2HQSY7elT1n/69/lUcReNz
	JuC7r4f/D0sr7/eaYStSBFgPDBB0E701MtxqNEKd3Gi/TbiAaXBmQW1sub4j35MW
	pcdj9roj/UWeE4kqh4D/p7/xUHvYDkCnFzsV0YBUGLpd4Nusi9dvmBtFUlPXBXCM
	2wyz7sn7eqLvjrUR+RXNpcv941/bkq7f+CxT/hBsaQ5GLTLRv967MHRRyWnXvMtt
	zra9JtFcyqNc35FdEOqxF3yWuUznyqelKF4GsZIeB4JOvjgo+h0YZ8jwSE3D+Wq3
	5J2McidSxrzeF2s1/Pobow==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sv2ex45g4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Sep 2023 15:25:51 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 5 Sep
 2023 21:25:48 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Tue, 5 Sep 2023 21:25:48 +0100
Received: from [141.131.157.8] (macMW3KVPQQ2W.ad.cirrus.com [141.131.157.8])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DB49746B;
	Tue,  5 Sep 2023 20:25:46 +0000 (UTC)
Message-ID: <f3f074d4-458c-9ed8-b3a6-b6d32b8c9f77@opensource.cirrus.com>
Date: Tue, 5 Sep 2023 15:25:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH 4/9] ASoC: cs35l41: Fix broken shared boost activation
Content-Language: en-US
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
        Charles Keepax
	<ckeepax@opensource.cirrus.com>
CC: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "Liam
 Girdwood" <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>, <kernel@collabora.com>
References: <20230902210621.1184693-1-cristian.ciocaltea@collabora.com>
 <20230902210621.1184693-5-cristian.ciocaltea@collabora.com>
 <20230905102933.GL103419@ediswmail.ad.cirrus.com>
 <c3328c1d-07f4-ae3f-88cd-b4b767a667b2@opensource.cirrus.com>
 <1cd66d6d-6a39-41eb-8646-0a6e6f473e8d@collabora.com>
From: "Rhodes, David" <drhodes@opensource.cirrus.com>
In-Reply-To: <1cd66d6d-6a39-41eb-8646-0a6e6f473e8d@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fbPf4wxmXlYDfcSCXGGmXTH1--H0fzrp
X-Proofpoint-GUID: fbPf4wxmXlYDfcSCXGGmXTH1--H0fzrp
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 23IUKDBMEXV3QMAKIODECL6MTAWSWPIV
X-Message-ID-Hash: 23IUKDBMEXV3QMAKIODECL6MTAWSWPIV
X-MailFrom: prvs=4612ed829b=drhodes@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/23IUKDBMEXV3QMAKIODECL6MTAWSWPIV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 9/5/23 3:05 PM, Cristian Ciocaltea wrote:
> If I got it right, we should drop all write operations on PWR_CTRL1,
> and simply set the CS35L41_SYNC_EN_MASK bit in PWR_CTRL3.

> That's a good point, it should be fixed implicitly by replacing the
> read/write operations with a single regmap_update_bits() call, which
> is protected by regmap's internal lock.
> 

Yes, my recommendation is to replace the mdsync_up_sequence and 
completion handling with a single regmap_update_bits() call to set the 
CS35L41_SYNC_EN_MASK bit in PWR_CTRL3, which occurs in response to the 
PLL Lock interrupt.

Thanks,
David
