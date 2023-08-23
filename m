Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEFE785C1D
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 17:29:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7752112;
	Wed, 23 Aug 2023 17:28:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7752112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692804543;
	bh=/3z/QvnTyee1ij7MWqCAtikU7N0Yb5ORJzxQHa0VsvE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j8Z4tVd8RZHioYVV0yVuhT0+tzRPWclmWmLPfMXk39H4wdSxLISINljG5MK2/uoCs
	 4XppIgCwJKkBZ03RH/Hzhx5lYuT/SMYrdVYZp87cMZzjpwm2U0SlMIWwmLm7GpdIg2
	 XbpoAveXVEXNMsFC8ytLByZhTpneGijdgq0qOqLw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65246F804DA; Wed, 23 Aug 2023 17:28:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E586EF800F5;
	Wed, 23 Aug 2023 17:28:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 767ABF80158; Wed, 23 Aug 2023 17:27:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,T_SPF_HELO_TEMPERROR,
	T_SPF_TEMPERROR,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E756EF80022
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 17:27:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E756EF80022
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=mQpjd2Lu
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37N4rX7F005941;
	Wed, 23 Aug 2023 10:26:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=A9CDeJmPx4IU8PeHiMyTPmZOuKRk6C8CvbfrsbnFV/o=; b=
	mQpjd2LuuMYdFtwo4N0q5Sk19uz2GRIiOx+PxZxHVYUxBxxeAeZ7qJPmUXl9+DuY
	vRxsp8hEc3bY+GHpr2RAlXdr3i/ddzVzLo5OJ9mUkx4Algqn+HCRWsaj6pBgQDvJ
	B62Te8woyQbgTgZuXD1SpaFBhqYbhM/BtHEGpql/6D5zPnTxsH9rOU049Ylz+bI8
	60ETXWxhzFggltzg02c1iF65mG0FxnoJJRqQDGqQSE97DWuYC5CVNg5ZOJyDrxMw
	2vJFMYBXoZYtTflDR2IkXQmv2Bzmob6oTFmJSwmlncW0FbP0PywgNem2EY7ZCvwy
	UiH09Y6vovp+05ys3XnV6Q==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sn21s16mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 10:26:54 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 23 Aug
 2023 16:26:52 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Wed, 23 Aug 2023 16:26:52 +0100
Received: from [141.131.156.184] (macMW3KVPQQ2W.ad.cirrus.com
 [141.131.156.184])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4AB2F11CD;
	Wed, 23 Aug 2023 15:26:51 +0000 (UTC)
Message-ID: <286f86dc-065b-1f11-824a-15edfe1ea3e7@opensource.cirrus.com>
Date: Wed, 23 Aug 2023 10:26:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH] ASoC: cs35l41: Correct amp_gain_tlv values
To: Charles Keepax <ckeepax@opensource.cirrus.com>, <broonie@kernel.org>
CC: <david.rhodes@cirrus.com>, <vkarpovi@opensource.cirrus.com>,
        <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>
References: <20230823085308.753572-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
From: "Rhodes, David" <drhodes@opensource.cirrus.com>
In-Reply-To: <20230823085308.753572-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LfBwhJLPj4ANL6VlcXZ87Xh3YIVBjvPy
X-Proofpoint-ORIG-GUID: LfBwhJLPj4ANL6VlcXZ87Xh3YIVBjvPy
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: D3N5N4UO2FYOIUTCBRGDNZXBKR42X7GQ
X-Message-ID-Hash: D3N5N4UO2FYOIUTCBRGDNZXBKR42X7GQ
X-MailFrom: prvs=359913a318=drhodes@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D3N5N4UO2FYOIUTCBRGDNZXBKR42X7GQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 8/23/23 3:53 AM, Charles Keepax wrote:
> The current analog gain TLV seems to have completely incorrect values in
> it. The gain starts at 0.5dB, proceeds in 1dB steps, and has no mute
> value, correct the control to match.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com
Acked-by: David Rhodes <david.rhodes@cirrus.com>

Thanks,
David
