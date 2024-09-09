Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89402971D1F
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2024 16:50:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E61E1E0;
	Mon,  9 Sep 2024 16:50:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E61E1E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725893444;
	bh=zYUb39rxLloRBDzZo4+kzlIgM65YSGPIz0TgH8WfP6g=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KtfS8mR1OYUvyVujNvq12NU6xWabSvfHGp7kZd8fvIwk1OoC+OL3vVmNuoutfZQjZ
	 JRFDle7pKCCX0AkfBJlQGKpITICk2GGAtTBdcVyzZ0EGUHFMlSL1GlHoDshwIQSVVA
	 c/xWCtdCYmk+pYyF2o+ORj/ocpBF88fPOm6QYUFI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D9DBF805A9; Mon,  9 Sep 2024 16:50:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C04A0F805B3;
	Mon,  9 Sep 2024 16:50:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A147F801F5; Mon,  9 Sep 2024 16:50:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E2E5F800E9
	for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2024 16:50:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E2E5F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=aEb/jlSX
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4894kdKO029438;
	Mon, 9 Sep 2024 09:50:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=7H3hIEPlOVkieGvBf2
	c0DYfFeVzq19u7SSW0qmjXnjY=; b=aEb/jlSXCbHQwhREJ7dfRikrM9wtb0MIQR
	dCpj/YRqATTCq7HNraKv1bdCEN9NkoXzlUg9+0nTzQb4MNv1kXC69nv0AJ7md5jJ
	OaAMvxFIIXS7hcLmWLy3Um2yW6xZcKcdQpwRWqt/lcDmk5xWVAkov9EbUAXSoUft
	wkpyA4aLmufarwAX+WwPPhzlwRkxySUcNtJuO3zwEZ4CCpCRbuSTvH3kPVWd4A2V
	TLXmd2BYYz9bUCKRZgUjoI6JY8jX7WBTlwHT0sLHLK19ZzmK0azR6RtMMaWWbLo7
	0dsJ6jgrQJL31mHGKrBfC6HflOIeP8zeaDWihcVMCryDYz809wEA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 41gk8hstw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 09:50:05 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Sep 2024
 15:49:48 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 9 Sep 2024 15:49:48 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id D332F820249;
	Mon,  9 Sep 2024 14:49:48 +0000 (UTC)
Date: Mon, 9 Sep 2024 15:49:47 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale
	<sanyog.r.kale@intel.com>,
        <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_rohkumar@quicinc.com>,
        <kernel@quicinc.com>, <quic_pkumpatl@quicinc.com>
Subject: Re: [PATCH v1 0/4] Add static channel mapping between soundwire
 master and slave
Message-ID: <Zt8LC4IY7DGq8Qom@opensource.cirrus.com>
References: <20240909105547.2691015-1-quic_mohs@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240909105547.2691015-1-quic_mohs@quicinc.com>
X-Proofpoint-GUID: qG5DD1sdYl7BYNL1JLvRQwR3HMwgcMJo
X-Proofpoint-ORIG-GUID: qG5DD1sdYl7BYNL1JLvRQwR3HMwgcMJo
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: CXAICSB6F3YDBHTGFHDDHVDHJNF5LE4Y
X-Message-ID-Hash: CXAICSB6F3YDBHTGFHDDHVDHJNF5LE4Y
X-MailFrom: prvs=698262c8fd=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CXAICSB6F3YDBHTGFHDDHVDHJNF5LE4Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Sep 09, 2024 at 04:25:43PM +0530, Mohammad Rafi Shaik wrote:
> Add static channel map support between soundwire master and slave.
> This patch series will resolve channel mask mismatch between master and slave.
> 
> Scenario: wcd937x AMIC2 usecase
> 
>                           Master                 Slave (wcd937x)
>                      +--------------+           +--------------+
>                      |  +--------+  |           |  +--------+  |
>          AMIC1 ----->|  | PORT1  |  |           |  |   TX1  |  |<-----------AMIC1
>          AMIC2 ----->|  |        |  |           |  |        |  |
>                      |  +--------+  |           |  +--------+  |
>                      |              |           |              |
>          AMIC3 ----->|  +--------+  |           |  +--------+  |
>                      |  |  PORT2 |  |           |  |   TX2  |  |<-----------AMIC2
>                      |  |        |  |           |  |        |  |<-----------AMIC3
>                      |  +--------+  |           |  +--------+  |
>                      |              |           |              |
>                      |  +--------+  |           |  +--------+  |
>  DMIC0...DMIC3------>|  |  PORT3 |  |           |  |   TX3  |  |<-----------DMIC0...DMIC3
>                      |  |        |  |           |  |        |  |<-----------MBHC
>                      |  +--------+  |           |  +--------+  |
>                      |              |           |              |
>                      |  +--------+  |           |  +--------+  |
>  DMIC4...DMIC37----->|  |  PORT4 |  |           |  |   TX4  |  |<-----------DMIC4...DMIC7
>                      |  |        |  |           |  |        |  |
>                      |  +--------+  |           |  +--------+  |
>                      |              |           |              |
>                      +------------- +           +--------------+
> 
> For AMIC2 usecase, The Slave need to configure TX2 Port with channel mask 1 and
> for Master required PORT1 with channel mask 2,
> 
> In existing design master and slave configured with same channel mask, it will fail
> AMIC2 usecase.

Apologies but I am not really following what exactly the issue is
here? How do these ports map to DAI links? It looks like you are
attempting to have AMIC2 produced by one DAI link, but consumed
by another?

Thanks,
Charles
