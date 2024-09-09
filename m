Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2CA971D26
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2024 16:51:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2466826;
	Mon,  9 Sep 2024 16:51:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2466826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725893499;
	bh=vfWPLolbvjAOE8YUFh5g7EDszn5aZxFmMhJy6zxlwB8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sVQvbF5l3EjVPnJ0sc5z0cvA77JwICToZ7PzCUOFCzBIJOKwyPp/VEDlQyZy7GiH1
	 /XQvw8Vibs3BkRqh9LHrEoVadYBDXsFy8Bnec0HSH7ZmNIpTgqmspToWnmDc6cwb9j
	 mbeB7yrMEk0QCm+AfoDSSkU4S1gVlckUlMCWLSmc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAE2FF804FC; Mon,  9 Sep 2024 16:51:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF009F805B1;
	Mon,  9 Sep 2024 16:51:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4B74F801F5; Mon,  9 Sep 2024 16:50:57 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E5B6EF800E9
	for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2024 16:50:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5B6EF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=baVicP2Z
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4894jf3p028462;
	Mon, 9 Sep 2024 09:50:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Qz8uTQ/YT/UmGGDiqK
	zRvw8o3HKTLhX5RFgLVbzHM8Y=; b=baVicP2ZV58uqKjWz5oLwvk7fKPNI1MeiK
	88SudOZPcF5CI48Ve6g8/YzFO7lJ4+Umj1ul5LC+WDXJP6Swaipha97TmumZNPXo
	UgG/GHWwyUpjsRLVAtqVaBvqewj87jIfvtrUvhEyLj1BWdWDs51vBhjiVxM05pk/
	pLZzE7Tp9mp4AnIoY7ZdJdp8ELuvICQfYUhmiGpq/pYp4SDXNhAB5C7ieGmml1UI
	s+nkyzbt4GCXGLlLRPY7KdoTKA8kOkXa2gpXwCB6fGfbnZ/Ra+mTKNDer+fugc5c
	eGix53Lwaim6hmX9dOlUcFuiMJ3UZClTxUa7/4JxISDF7uqcAXzg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 41gk8hstxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 09:50:54 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Sep 2024
 15:50:53 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 9 Sep 2024 15:50:53 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id F2679820249;
	Mon,  9 Sep 2024 14:50:52 +0000 (UTC)
Date: Mon, 9 Sep 2024 15:50:51 +0100
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
Subject: Re: [PATCH v1 2/4] soundwire: stream: Add set_master_channel_map()
 to set static channel mapping
Message-ID: <Zt8LS0nyTXggLnkC@opensource.cirrus.com>
References: <20240909105547.2691015-1-quic_mohs@quicinc.com>
 <20240909105547.2691015-3-quic_mohs@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240909105547.2691015-3-quic_mohs@quicinc.com>
X-Proofpoint-GUID: CdFgfbFc3Vpyg3QaCjy_WlrTuHJL9kgZ
X-Proofpoint-ORIG-GUID: CdFgfbFc3Vpyg3QaCjy_WlrTuHJL9kgZ
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: OOW54LISQ7PKVCIDI2AQRTZVJN6AHVVV
X-Message-ID-Hash: OOW54LISQ7PKVCIDI2AQRTZVJN6AHVVV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OOW54LISQ7PKVCIDI2AQRTZVJN6AHVVV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Sep 09, 2024 at 04:25:45PM +0530, Mohammad Rafi Shaik wrote:
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index 5e0dd47a0412..264450763bab 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -857,6 +857,8 @@ struct sdw_master_ops {
>  			(struct sdw_bus *bus);
>  	int (*set_bus_conf)(struct sdw_bus *bus,
>  			struct sdw_bus_params *params);
> +	int (*set_master_channel_map)(struct sdw_bus *bus, int *ch_mask,
> +				      unsigned int port_num);

At the very least this needs some kernel doc to explain what the
new callback is for, I think also the commit message could use
some work to help us understand the purpose here.

Thanks,
Charles
