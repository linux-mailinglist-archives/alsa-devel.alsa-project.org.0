Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C5B495DB6
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 11:24:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEFD92BD9;
	Fri, 21 Jan 2022 11:23:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEFD92BD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642760653;
	bh=eFaLVELg5rQdIEHsvU6kItrYqCGqQUVY9BqbGEJpsbc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fE3OaxkPtm2xisVF5DS5OwYsux66bUHaLwHC3yYrpwEeAcVPB5rACv0C7nlrkTYMr
	 /IQVk/yJ1ZFRXLiyjq4TeyZyjsTzKLUjcg09kF9QPvxTOEjzkvbtMTJbWR3L3eRLN7
	 giy+M1+6Z91RwkkAzYOX7IpxUefdXLeuFXig7qVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30B26F800F5;
	Fri, 21 Jan 2022 11:23:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11CFCF8028B; Fri, 21 Jan 2022 11:23:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DFBBF800F8
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 11:22:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DFBBF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="izZgzTUH"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20L5THpx009597;
 Fri, 21 Jan 2022 04:22:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=1Pj0a8nkcMdoeHViL8o4xa3w7vEvMA0LvSinV0C8EYA=;
 b=izZgzTUHwVdvj389FVYq/1NC+klr/q1vuO84Tni0ADG9NiZZAoYDleCtoZFqe8l8XmmC
 tMpiP8Zw9r8CwCV9x9RrZxWEic0304hScWl6mFqBTTp4CLn/th/ZcJbL5KTcHxWq2rz1
 SMf2dzrnJze1FPQZEcda4duRxFjndWG3hUwrdwjtWNfYdwE7+wAhr+75eebinswACUaF
 oNwMFHVjtI3SaB5gbNF+CEb6Gw9f94ks35tf0r7thSOCY9NN0/kgsnnchwOoJN5QbM4u
 6Y9TLed9xg2jZQ05+TDoGYyAMM62siviFJqOgGT/sDNZuOxCUrR31stByQh43/CQcfMl zA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dqhyq0j64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 21 Jan 2022 04:22:57 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 21 Jan
 2022 10:22:54 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 21 Jan 2022 10:22:54 +0000
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.61.65.33])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B2ECE45D;
 Fri, 21 Jan 2022 10:22:54 +0000 (UTC)
Subject: Re: [PATCH 3/3] ASoC: cs42l42: Handle system suspend
To: <broonie@kernel.org>
References: <20220120175549.671831-1-rf@opensource.cirrus.com>
 <20220120175549.671831-4-rf@opensource.cirrus.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <49c925e8-b6e9-0dcb-b8ed-7e03d9e2b188@opensource.cirrus.com>
Date: Fri, 21 Jan 2022 10:22:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220120175549.671831-4-rf@opensource.cirrus.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pSfwcL6fTdyCuR0StuSbKo4FNNpWhNMI
X-Proofpoint-ORIG-GUID: pSfwcL6fTdyCuR0StuSbKo4FNNpWhNMI
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 20/01/2022 17:55, Richard Fitzgerald wrote:

> +static int __maybe_unused cs42l42_resume(struct device *dev)
> +{
> +	struct cs42l42_private *cs42l42 = dev_get_drvdata(dev);
> +	int ret;
> +
> +	/*
> +	 * If jack was unplugged and re-plugged during suspend it could
> +	 * have changed type but the tip-sense state hasn't changed.
> +	 * Force a plugged state to be re-evaluated.
> +	 */
> +	if (cs42l42->plug_state != CS42L42_TS_UNPLUG)
> +		cs42l42->plug_state = CS42L42_TS_TRANS;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(cs42l42->supplies), cs42l42->supplies);
> +	if (ret != 0) {
> +		dev_err(dev, "Failed to enable supplies: %d\n", ret);
> +		return ret;
> +	}
> +
> +	gpiod_set_value_cansleep(cs42l42->reset_gpio, 1);
> +	usleep_range(CS42L42_BOOT_TIME_US, CS42L42_BOOT_TIME_US * 2);
> +
> +	regcache_cache_only(cs42l42->regmap, false);
> +	regcache_mark_dirty(cs42l42->regmap);
> +
> +	/* Sync LATCH_TO_VP first so the VP domain registers sync correctly */
> +	regcache_sync_region(cs42l42->regmap, CS42L42_MIC_DET_CTL1, CS42L42_MIC_DET_CTL1);
> +	regcache_sync(cs42l42->regmap);
> +
> +	cs42l42->suspended = false;

This should be taking the irq_mutex around the regcache_sync() so that
we don't get unhandled interrupts after the interrupts are unmasked
but before cs42l42->suspended is cleared.

Will push a V2 with this fix.

