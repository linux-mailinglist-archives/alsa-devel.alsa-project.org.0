Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 481AF72CD66
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 20:02:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBAAB82A;
	Mon, 12 Jun 2023 20:01:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBAAB82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686592965;
	bh=v1SKKw5hi75/Uk50Jt3AiB4VgAKrNVx7wqorO4yeTL0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=epLBN79eTeRZe5TD+8CbM3+JpuNNOBdwwdZVqHL+uQeVEXMSNv1eaRkJxymGlS6ag
	 nQ2mMHYP2KM2ZAmmEFib0tr9XtkhbrRZRDcbaoMqWDk3O6toWe9EsmeeNKauSQ5ovt
	 1JhRAV/To1fbRPcUBiMFHKZeXMyFyOs6xJ053uXk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60D02F80301; Mon, 12 Jun 2023 20:01:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 110ABF80132;
	Mon, 12 Jun 2023 20:01:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57A86F80149; Mon, 12 Jun 2023 20:01:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3216CF80130
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 20:01:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3216CF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=k691v2RK
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35CDOsMO023788;
	Mon, 12 Jun 2023 13:01:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=0fhZSw8heUGKrKR9J9xBRt2ncINDfH8G5IqxRrkw4aE=;
 b=k691v2RKmsEmuHjfFAoWXHfCjEgpN8IYnhMaYczg9jNJkT+YPt4OgNAaq2kf7kJc0XhK
 1Y7264YRfQi5e4Log6Vvgt3s/jUUlwRXoJLyvYZqO0evVoxnIOciXaZYjYQaa7gvxgKM
 q1uVcdNL/GAKj5YarkoGQJBoLqnGExaSx7nq9T/sTBh5re5Z+kxY3qrhZUGPcIV1It/Y
 PMrq3kQ89UgiYFQKxXGIofz2Ix68axxNwNMpkkG4JHybSr1fqs0nB/ndqaI7r4UHzbLr
 RX6RLo21DaEd0TVobJ/rF/RcdqXkvzwvuJZN3g7hT1iB/T4bUNGOdNfAdHJwTyYgs0Tm xA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3r4pk0a35w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Jun 2023 13:01:38 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Mon, 12 Jun
 2023 19:01:36 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 12 Jun 2023 19:01:36 +0100
Received: from [141.131.77.133] (unknown [141.131.77.133])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DA643475;
	Mon, 12 Jun 2023 18:01:34 +0000 (UTC)
Message-ID: <0d8d93ca-65fa-d0b4-e2e3-483c87711cf5@opensource.cirrus.com>
Date: Mon, 12 Jun 2023 13:01:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 00/10] ASoC: Use maple tree for Cirrus Logic devices
To: Mark Brown <broonie@kernel.org>,
        James Schulman
	<james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <asahi@lists.linux.dev>
References: <20230609-asoc-cirrus-maple-v1-0-b806c4cbd1d4@kernel.org>
Content-Language: en-US
From: "Rhodes, David" <drhodes@opensource.cirrus.com>
In-Reply-To: <20230609-asoc-cirrus-maple-v1-0-b806c4cbd1d4@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xg50FgLF5dU4PJKCN9wkq7V8vgnMOFEd
X-Proofpoint-GUID: xg50FgLF5dU4PJKCN9wkq7V8vgnMOFEd
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 6SKQQP4SFM7AIKBZE6OYH5HO4HPAOWFF
X-Message-ID-Hash: 6SKQQP4SFM7AIKBZE6OYH5HO4HPAOWFF
X-MailFrom: prvs=15273e91c8=drhodes@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6SKQQP4SFM7AIKBZE6OYH5HO4HPAOWFF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 6/10/23 8:56 AM, Mark Brown wrote:
> A lot of the Cirrus Logic devices only support single register
> read/write operations so they get no benefit from using the rbtree cache
> over the more modern maple tree cache, convert them to use maple tree.
> 

Acked-by: David Rhodes <david.rhodes@cirrus.com>

Thanks,
David

