Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45824803596
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 14:54:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD864843;
	Mon,  4 Dec 2023 14:54:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD864843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701698087;
	bh=JJwwjcw4VwxKvEbdciDdqrREwTot+yBp8HJWjDI+IJk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RiqIZPpz/7M9Yo1/xiJD+mnV9PWB0nKbDdr63EEkKiIx5kR5KR3TXw/ZtXZ660ij5
	 1em/j4uk3oA8QT1M8CutWkx5ku8+uRm6hS7nouOD4zCN/uQZ+wiv3oLyF/R8Uvwbb1
	 cDCuMDUKuArhXQxJmRn6NgsmPCIRuKJYbQwz8O/Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B299F80579; Mon,  4 Dec 2023 14:54:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DDE75F800D2;
	Mon,  4 Dec 2023 14:54:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72962F8024E; Mon,  4 Dec 2023 14:54:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6C64F800E4
	for <alsa-devel@alsa-project.org>; Mon,  4 Dec 2023 14:54:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6C64F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=X8UxyoNp
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B48WiWV016031;
	Mon, 4 Dec 2023 07:54:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=7Cszo/QfiEGpR/7BrzRb15GLRpfykFiy+y4Fq2bL4dg=; b=
	X8UxyoNpRiT0DK3Jlgppd805lWxAeFYRgFrMhQgn33o3tOYK3MPCv6EeA4r53Pje
	ZfIuDbCLU3nSPK3FEKEa1s3xoPmn+3ztl4IBO7HyD29XBZgAkrDviwFiphl7NwIv
	ryq7V4+yiNmK105vzMuIkDb3uxWd6EOpp1IwkbNKkPWXD8JcR51xkLTUGCmhCYN4
	/DF4MTujDfeZZuTJ59y/pILLuJxL3WseMs/R6gAouTJBNNmOZav+1VpPLE6gzTzV
	FbDrn7klBlKpy2C5dflMm395+G8OzBpfwaKeFX8xWHikaFq9q7S8L8LnVjpaDQ5N
	9JCSY8RL3jqZIaPC+PB7Fw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ur1vnhxkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 07:54:18 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 4 Dec
 2023 13:54:16 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Mon, 4 Dec 2023 13:54:16 +0000
Received: from [198.90.251.82] (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.82])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5572C468;
	Mon,  4 Dec 2023 13:54:16 +0000 (UTC)
Message-ID: <e93d5d7f-3e60-4577-b2f9-dfe73ef757b1@opensource.cirrus.com>
Date: Mon, 4 Dec 2023 13:54:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: Intel: soc-acpi-intel-tgl-match: add cs42l43 and
 cs56l56 support
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>
CC: <kai.vehmanen@linux.intel.com>, <cezary.rojewski@intel.com>,
        <ranjani.sridharan@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
References: <20231204135307.2169282-1-rf@opensource.cirrus.com>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20231204135307.2169282-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PaX3Q-Tak9cV3HoZ9I-gNyTEhTPutX0O
X-Proofpoint-ORIG-GUID: PaX3Q-Tak9cV3HoZ9I-gNyTEhTPutX0O
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 6K3IKMTALCNXP5X3X6BYKT5RWVPV6IJN
X-Message-ID-Hash: 6K3IKMTALCNXP5X3X6BYKT5RWVPV6IJN
X-MailFrom: prvs=7702ab03e0=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6K3IKMTALCNXP5X3X6BYKT5RWVPV6IJN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 04/12/2023 13:53, Richard Fitzgerald wrote:
> From: Bard Liao <yung-chuan.liao@linux.intel.com>
> 
> This is a test configuration for UpExtreme with Cirrus Logic
> CS35L56-EIGHT-C board.
> 

Please ignore this. I've just noticed the typo in the commit
title (carried over from V1). I'll send a V3 with this corrected.
