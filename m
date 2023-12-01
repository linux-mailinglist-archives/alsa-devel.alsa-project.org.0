Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BF58006B7
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Dec 2023 10:21:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46179DE5;
	Fri,  1 Dec 2023 10:21:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46179DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701422511;
	bh=Ce3CDGxL92CkSZSg2ogZ33YUucpfRGHQs+D7B/LFI7I=;
	h=Date:Subject:From:To:CC:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CpMHsxmaOMgjquFmYhL8x79f859G+i8E3NJDEB62WFvNWyIIPtv8nJtew07oTOhsz
	 KbyYTZG2UOx2QDZvtvdMceKxOKnxvaLYDrv2YOwkmWLBC7pJdl391+WJP5Y6AKaLrK
	 sKN23zu0DAUPV7/6K7EMyD4o6Zi+ty+FklRzc+cw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFB21F80567; Fri,  1 Dec 2023 10:21:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C51CF80571;
	Fri,  1 Dec 2023 10:21:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DE2CF8016E; Fri,  1 Dec 2023 10:21:13 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7CE1EF80104
	for <alsa-devel@alsa-project.org>; Fri,  1 Dec 2023 10:21:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CE1EF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=K2mW4NEL
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B174DkJ027843;
	Fri, 1 Dec 2023 03:21:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:from:to:cc:references
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=CLKVZ5aYreBKIuc2sSh6SH/zjBjVtznHx6oI/rsB4OA=; b=
	K2mW4NELZKBu6lOyofOWKOHZ4cyTP2qzEOLdBW1FCIaBQh/hlMULJVIjc0bu3dZe
	FQ+8AZOAg/E7TJ8VHDjrQwuYD53Zn5DkhflhBnobmeyW5RMs1Mi5od8H7PajSCcn
	U6nMeS8qOQLfK66tUwoydyoLuoXUt2OiatIZ4Fhnur0BC1M17rLyFG0n+GQ2nuxK
	vDihcN2/spCnQ8u6ZLEo1D5FjuqVcSIhakywVWd+nOUyuCgSlFuBeEyxukc7cN6D
	qBoUI65GJwbKB/Tpqh3t/wnSwsQD6HKkBoCaf4BCXUaCLELYts/u1K+HnODb7v13
	jfNXCNyulkiugdVJNDzOEQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3unvhpb8ea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 03:21:03 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 1 Dec
 2023 09:21:00 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.39 via Frontend Transport; Fri, 1 Dec 2023 09:21:00 +0000
Received: from [198.61.65.94] (EDIN4L06LR3.ad.cirrus.com [198.61.65.94])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D2C60468;
	Fri,  1 Dec 2023 09:20:59 +0000 (UTC)
Message-ID: <8808f57c-7eb3-41c4-bd57-8ac59ddd767b@opensource.cirrus.com>
Date: Fri, 1 Dec 2023 09:21:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] ASoC: Intel: soc-acpi-intel-tgl-match: add cs42l43
 and cs56l56 support
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <pierre-louis.bossart@linux.intel.com>,
 <kai.vehmanen@linux.intel.com>,
        <ranjani.sridharan@linux.intel.com>, <cezary.rojewski@intel.com>,
        <yung-chuan.liao@linux.intel.com>, <ckeepax@opensource.cirrus.com>,
        <yong.zhi@intel.com>, <chao.song@linux.intel.com>
References: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
 <20231127133448.18449-7-peter.ujfalusi@linux.intel.com>
 <9660e9df-2061-4b2c-ba59-5e6f8a61f07d@opensource.cirrus.com>
In-Reply-To: <9660e9df-2061-4b2c-ba59-5e6f8a61f07d@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tuSfLSiUl7kbFvtZR9ohLi9x7CE7NyzK
X-Proofpoint-ORIG-GUID: tuSfLSiUl7kbFvtZR9ohLi9x7CE7NyzK
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: QXBFRX7OLDDLQ2W4F4VT74VRH3S3W7IQ
X-Message-ID-Hash: QXBFRX7OLDDLQ2W4F4VT74VRH3S3W7IQ
X-MailFrom: prvs=7699f10339=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QXBFRX7OLDDLQ2W4F4VT74VRH3S3W7IQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27/11/23 14:40, Richard Fitzgerald wrote:
> 
> 
>> +        .name_prefix = "cs35l56-8"
> 
> Can these prefixes be "AMPn" to match the CS35L41, CS35L51 and
> CS35L56-hda driver? This prefix is used to find the matching firmware
> files and our naming convention for these has been cs35lxx-xxxx-ampn
> 
> Is there anything that depends on the prefixes being "cs35l56-n" ?
> 

We're thinking about whether to change to using "cs35l56-n" prefix.
Hold on this while we make a decision...

