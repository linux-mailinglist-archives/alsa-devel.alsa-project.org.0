Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB066FDAF1
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 11:41:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C91C1109B;
	Wed, 10 May 2023 11:40:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C91C1109B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683711661;
	bh=AWWu8XiW1LLiqS0WQ1A6BI9pOMOed1V5r+R/t788ChQ=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U/1Cok2wywJWoQrwDyWE0D2vTjT5Qf5oYfqm6N78ZnsHXXrkhtlgUkvpb8/EeSezq
	 L3yrD011cL5rJb6y8J2hzzdyy94505stSzC71vXzSxcX3lunu8hOXsiVd2eB33GfWl
	 adOd98Wx6KEJSogN3bCP8CoSwkoP5lL1nJExQalo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF861F80310;
	Wed, 10 May 2023 11:40:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B897BF8032D; Wed, 10 May 2023 11:40:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4056AF8014C
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 11:39:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4056AF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=OMhkZKT0
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34A3pgpp010448;
	Wed, 10 May 2023 04:39:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=lt7tYtRSHcbNz13cpGnmb0upm+h7ZBHAcUMhNqedGbs=;
 b=OMhkZKT0AK0NJoUKAdyxE87ejsuD8FDZpfyuTrIEXqgL76HOT3lKYxVEb5jRv76C+dZs
 6iOiDEyUf3LeCQuIpxtp5eIGf+2S6O28YBX4CU51fL54Uw1nLmIjx287LJuzMrFO9Bo+
 o2QBOjmNUatVNnneIMTsWDpGmYksrMke7QfFiCB5Scd5jUvbNqJJiIvdxRXOek66F5xA
 CFS4Ub41CAlxqe3oYhTwXuyrT33YkyhEH0Tp3iwsDzPN3NXndXbe7TqSsgG9unrZGkHu
 rm1Nw8OrPTxtX9+mJ91qd/TG35Xkivub1nS8ftZ5B0LW3SK1/Y81f0aWR+nOuQbyF16Q Jg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qf7s42gbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 04:39:56 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Wed, 10 May
 2023 04:39:54 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 May 2023 04:39:54 -0500
Received: from [198.90.251.127] (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4AE4A475;
	Wed, 10 May 2023 09:39:54 +0000 (UTC)
Message-ID: <4a9f398a-8801-d585-2f18-1daf76ad67c8@opensource.cirrus.com>
Date: Wed, 10 May 2023 10:39:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ASoC: cs35l45: Relicense to GPL only
To: Charles Keepax <ckeepax@opensource.cirrus.com>, <broonie@kernel.org>
References: <20230510092534.3919120-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20230510092534.3919120-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JUbL-a9pSr2OFsHs4-o--JgG80Jv6ttF
X-Proofpoint-GUID: JUbL-a9pSr2OFsHs4-o--JgG80Jv6ttF
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: EPDYZ45VPJTJ6M43GITNZ4BM6AUP6XSB
X-Message-ID-Hash: EPDYZ45VPJTJ6M43GITNZ4BM6AUP6XSB
X-MailFrom: prvs=0494043d7b=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: pierre-louis.bossart@linux.intel.com, u.kleine-koenig@pengutronix.de,
 james.schulman@cirrus.com, vkarpovi@opensource.cirrus.com,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EPDYZ45VPJTJ6M43GITNZ4BM6AUP6XSB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/05/2023 10:25, Charles Keepax wrote:
> Cirrus never intended to upstream dual licensed code, convert to
> GPL only.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> Apologies for this but this was never our intention and I believe that
> it can be a little legally involved maintaining dual licensed kernel code.
> Fortunately not that many people outside of Cirrus have contributed to
> the files in question. I have CCed everyone who has contributed both
> internally and externally.
> 
> Thanks,
> Charles
> 
>   sound/soc/codecs/cs35l45-i2c.c    | 4 ++--
>   sound/soc/codecs/cs35l45-spi.c    | 4 ++--
>   sound/soc/codecs/cs35l45-tables.c | 2 +-
>   sound/soc/codecs/cs35l45.c        | 4 ++--
>   sound/soc/codecs/cs35l45.h        | 2 +-
>   5 files changed, 8 insertions(+), 8 deletions(-)
> 
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
