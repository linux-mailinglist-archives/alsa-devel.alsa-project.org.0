Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1662A71267D
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 14:22:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B528204;
	Fri, 26 May 2023 14:21:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B528204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685103719;
	bh=pbT6QZPKSb7UcVvwwWshDYnGp5RYLW0NMCNyheXhWKs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HUt0gpw856gpbRWX0ZLHzvjwZepjAjwfjn08nvanMMhXLxudF8EFHh3jzm4xis8X1
	 X0MOYOv7CPWVytaxtoBr/1+SLNvKurQcaH/3XDwxfXmrFuvF4fTtjOp/RqTTmEIa/Q
	 lLs9IDGClzDn/o0rwgAVTLuQaZNprLGGnTyL+EbA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4B5CF8001F; Fri, 26 May 2023 14:20:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 666FFF8016A;
	Fri, 26 May 2023 14:20:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92468F80249; Fri, 26 May 2023 14:20:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA2E4F8001F
	for <alsa-devel@alsa-project.org>; Fri, 26 May 2023 14:20:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA2E4F8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=d4TNlwFu
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34QBYFLH030993;
	Fri, 26 May 2023 07:20:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=8FRvUnxeEwWZA99tu0bOyIubM9mJTTwebRYyDDCDp1M=;
 b=d4TNlwFuHIF7v+/nQZCuH+xjWv7fnu4l2ynjznlpiJpCjLp//a+w9st69/po+suYGOBr
 1tBsUSS1cfykLtxbSannu7qDCXTVIXXBRaefxe4C7SDcW9D3rm8v5m191bF+72zAeIae
 EOv4x96FQMufJqyLW4m86O+fgcVFj1rC0rt8UPLxFvqgF02S7ZdsQRHvD7huPSKZq7IC
 iXlMZkT1CskFhZBBTMRbm5Qa3fZsc91Ugx2/fzrfBD2Oa3Zprc+tYi6xdollPVx/rMCH
 FbOe0pNeVsOc9ZjF233FQeDeYorN6jcS57z/sYUbVwXjcyQPkdlB3f5UF4xiM+vBH9M5 Kg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qptmm8d5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 May 2023 07:20:34 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 26 May
 2023 07:20:32 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 26 May 2023 07:20:32 -0500
Received: from [198.61.65.166] (EDIN4L06LR3.ad.cirrus.com [198.61.65.166])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5F4F2B38;
	Fri, 26 May 2023 12:20:32 +0000 (UTC)
Message-ID: <7c5f776d-bf17-ea3d-a4ee-3ac54194a215@opensource.cirrus.com>
Date: Fri, 26 May 2023 13:20:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 13/13] ALSA: hda/cs35l56: Add driver for Cirrus Logic
 CS35L56 amplifier
Content-Language: en-US
To: <Claudiu.Beznea@microchip.com>, <tiwai@suse.com>, <broonie@kernel.org>,
        <perex@perex.cz>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <simont@opensource.cirrus.com>
References: <20230525150659.25409-1-rf@opensource.cirrus.com>
 <20230525150659.25409-14-rf@opensource.cirrus.com>
 <6ff4235d-f8d0-3c3f-cc67-18aadee2afbc@microchip.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <6ff4235d-f8d0-3c3f-cc67-18aadee2afbc@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RWDcGByEdYWf6UE-LrUN2hVXgR0W9kqc
X-Proofpoint-GUID: RWDcGByEdYWf6UE-LrUN2hVXgR0W9kqc
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: KQARUIMYOU3FGGKXPGYYL2V4574GEDB4
X-Message-ID-Hash: KQARUIMYOU3FGGKXPGYYL2V4574GEDB4
X-MailFrom: prvs=0510bc6290=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KQARUIMYOU3FGGKXPGYYL2V4574GEDB4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 26/5/23 05:40, Claudiu.Beznea@microchip.com wrote:
> On 25.05.2023 18:06, Richard Fitzgerald wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> From: Simon Trimmer <simont@opensource.cirrus.com>
>>
>> Add a driver for the Cirrus Logic CS35L56 amplifier. This uses the same
>> component binding API as the CS35L41 driver. This is not a standalone
>> HDA device; it provides control of the CS35L56 for systems that use a
>> combination of an HDA codec and CS35L56 amplifiers with audio routed
>> through the HDA codec.
>>

<SNIP>

>> +
>> +       cs35l56->base.reset_gpio = devm_gpiod_get_index_optional(cs35l56->base.dev,
>> +                                                                "reset",
>> +                                                                cs35l56->index,
>> +                                                                GPIOD_OUT_LOW);
>> +       if (IS_ERR(cs35l56->base.reset_gpio)) {
> 
> devm_gpiod_get_index_optional() can also return NULL.
> 

Yes, that is expected. It's optional. It's not an error.
In that case cs35l56->base.reset_gpio will already be NULL.

>> +               ret = PTR_ERR(cs35l56->base.reset_gpio);
>> +
>> +               /*
>> +                * If RESET is shared the first amp to probe will grab the reset
>> +                * line and reset all the amps
>> +                */
>> +               if (ret != -EBUSY)
>> +                       return dev_err_probe(cs35l56->base.dev, ret, "Failed to get reset GPIO\n");
>> +
>> +               dev_info(cs35l56->base.dev, "Reset GPIO busy, assume shared reset\n");
>> +               cs35l56->base.reset_gpio = NULL;
>> +       }
>> +
>> +       return 0;
>> +
>> +err:
>> +       dev_err(cs35l56->base.dev, "Failed property %s: %d\n", property, ret);
>> +
>> +       return ret;
>> +}
