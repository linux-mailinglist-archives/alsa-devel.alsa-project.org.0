Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D1A8B9790
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2024 11:23:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D6AC86F;
	Thu,  2 May 2024 11:23:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D6AC86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714641828;
	bh=w8QjHcrlLNytid75AMyv9vPhb5KjwI82qLWvBRClbC4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NGgGn/wPdGpztJDpzjRdLbVFsY2xpVnzNdh/cSt9vfpZqH3iBgzZhDnXDY0aU06pq
	 +AEG3nzPCrGYPHF7ayt3vWZpVm/ec2i+DCBHZb1gsFPgkHx+efylEAgx/JsJK3w8zC
	 YGS5mwjHQc0uEFnaLA/ZbiLJD6wJ/dFzhYKPBh7s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF5E3F8057E; Thu,  2 May 2024 11:23:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 539B8F805A1;
	Thu,  2 May 2024 11:23:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8312BF80266; Thu,  2 May 2024 11:21:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7324BF800E2
	for <alsa-devel@alsa-project.org>; Thu,  2 May 2024 11:21:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7324BF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=BlgmQBCu
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4426fe2X018298;
	Thu, 2 May 2024 04:21:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=VJrjKuSFrH1gRBcvsZN1w75FIo5Vye6zZ77H/zyS4h8=; b=
	BlgmQBCuVZvnR+1s/J4qr3vY3zxRjADbfA9OUr1rCg8tHfnfISvx+jsC5KGT7tlc
	doL7BpRkb5CdOswy2vzLDRshsqAN4kzshlV6zJEqxtKQBxKIckWBk1o/Ebnjxqfx
	jacP6QLS9sqxmPEhLIC+GAfuHsAn/eQpkPAcI79XgXmZmuR3agjQLM5rHPszPOqd
	Naq/pNw+FGtM+AF79MPniht721kSHrOLA2ppfNrEhE6pgjlC+tCKKzveh9wf74VI
	vcWYRlkQwMYXoAmSvojOfKCcA7Tye3qMR16bMEQasKbrsNNXnN/GL+UXP48YE5Px
	3ua7m5gx5FN7NZ9iduirFg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3xv0e8g9bf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 May 2024 04:21:38 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 2 May 2024
 10:21:36 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 2 May 2024 10:21:36 +0100
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 57C8D820244;
	Thu,  2 May 2024 09:21:36 +0000 (UTC)
Message-ID: <a9345d24-af36-42b4-9139-0701a0dbe1a3@opensource.cirrus.com>
Date: Thu, 2 May 2024 10:21:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda: cs35l56: Perform firmware download in the
 background
To: Takashi Iwai <tiwai@suse.de>, Simon Trimmer <simont@opensource.cirrus.com>
CC: <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
References: <20240501111755.21231-1-simont@opensource.cirrus.com>
 <87ttjgk6ph.wl-tiwai@suse.de>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <87ttjgk6ph.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5r_XGd3UwelsfKl2wpH1nWx0Tm5vaTNb
X-Proofpoint-GUID: 5r_XGd3UwelsfKl2wpH1nWx0Tm5vaTNb
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 6S4XXV64OUG7RJMQBTWLQFPMSKY5DZGT
X-Message-ID-Hash: 6S4XXV64OUG7RJMQBTWLQFPMSKY5DZGT
X-MailFrom: prvs=285278285c=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6S4XXV64OUG7RJMQBTWLQFPMSKY5DZGT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 02/05/2024 08:34, Takashi Iwai wrote:
> On Wed, 01 May 2024 13:17:55 +0200,
> Simon Trimmer wrote:
>> @@ -964,6 +1011,14 @@ int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int hid, int id)
>>   	mutex_init(&cs35l56->base.irq_lock);
>>   	dev_set_drvdata(cs35l56->base.dev, cs35l56);
>>   
>> +	cs35l56->dsp_wq = create_singlethread_workqueue("cs35l56-dsp");
>> +	if (!cs35l56->dsp_wq) {
>> +		ret = -ENOMEM;
>> +		goto err;
>> +	}
> 
> Do we really need a dedicated workqueue?  In most usages, simple
> schedule_work*() works fine and is recommended.
> 

On a slow I2C bus with 4 amps this work could take over 2 seconds.
That seems too long to be blocking a global system queue. We use a
dedicated queue in the ASoC driver.

Also if we queue work on an ordered (single-threaded) system queue the
firmware won't be downloaded to multiple amps in parallel, so we don't
get the best use of the available bus bandwidth.

> 
> thanks,
> 
> Takashi

