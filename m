Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B8872265D
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 14:52:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4904E827;
	Mon,  5 Jun 2023 14:51:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4904E827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685969522;
	bh=6Gi6mmYAUeRmDVlWC4JCzRkKrqBe4bF3In5pngh9cMI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zdy80lVy8Vhd4DWOB0G5wXXtkD9EHZgh/e8zxhLeALARtRU5PbRdwKccgwuppmbx7
	 uYLeDVaefAOrR8jh3Q7xLC1Lwuo5EnEGsZIFKSfM5cZ1nrJHrye1WeG7lQeZcgp+7d
	 ytQ8eDzYqmg3rBzMuaBBHJrboX5DZmOuH8TjGR50=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAAC0F80520; Mon,  5 Jun 2023 14:51:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 662F9F800ED;
	Mon,  5 Jun 2023 14:51:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E207F80199; Mon,  5 Jun 2023 14:51:01 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 59564F800ED
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 14:50:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59564F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=lWb5nHMt
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3558e8hD010267;
	Mon, 5 Jun 2023 07:50:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=yU9eshyqKAIkJa4SLDx3YPJnfeTYlRKTxJ/oaNHkkXI=;
 b=lWb5nHMtT0fcm7O84i2QCHRlsOoeVdXBTFYaVhaUi1Q124K4ALl7g4sLTKDPgx+168f7
 YyPVMtgLDq9Ymu6603cjx4K+BkKOTrfRhNQoCFzIThC7hSf+WRwDlK00nxSxlsQkw1yb
 yFT/A/O21qCdwDHj705mFlrSO6vCcGNZ0FGvLWG+vGJ59GFUENS2s8/ls9BQ2WSxWFX6
 ir7KRFegR1zoXVFJ3zLlYplW9FSgWFaN599bDz4zKMbOU7A4EPwNUONKe/d2jThRxApK
 UpFstf9dabk5WWwAlI629BI5L9s376nZAkly90g+F6AxW05kJfPbSTztnlV92Ff4Ulwo kQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3r01xn9tw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jun 2023 07:50:56 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Mon, 5 Jun
 2023 13:50:54 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 5 Jun 2023 13:50:54 +0100
Received: from [198.90.238.35] (LONN2DGDQ73.ad.cirrus.com [198.90.238.35])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5AC9C458;
	Mon,  5 Jun 2023 12:50:54 +0000 (UTC)
Message-ID: <ff8d0da4-10f7-31a7-5cf9-7a4c0e009192@opensource.cirrus.com>
Date: Mon, 5 Jun 2023 13:50:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RESEND v1 2/3] ALSA: hda: cs35l41: Fix endian conversions
To: Takashi Iwai <tiwai@suse.de>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
References: <20230525135955.2108140-1-sbinding@opensource.cirrus.com>
 <20230525135955.2108140-3-sbinding@opensource.cirrus.com>
 <87zg5eidcb.wl-tiwai@suse.de>
From: Stefan Binding <sbinding@opensource.cirrus.com>
In-Reply-To: <87zg5eidcb.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -7NHbr8YGozgAH0ikn2DmeYWPwtQUtCc
X-Proofpoint-GUID: -7NHbr8YGozgAH0ikn2DmeYWPwtQUtCc
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: AGDPNL4I55EJDDCGTDMOXBTETVBZ5K3J
X-Message-ID-Hash: AGDPNL4I55EJDDCGTDMOXBTETVBZ5K3J
X-MailFrom: prvs=1520dfaea3=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AGDPNL4I55EJDDCGTDMOXBTETVBZ5K3J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

On 05/06/2023 08:21, Takashi Iwai wrote:
> On Thu, 25 May 2023 15:59:54 +0200,
> Stefan Binding wrote:
>> @@ -379,10 +379,10 @@ static int cs35l41_save_calibration(struct cs35l41_hda *cs35l41)
>>   
>>   				/* Calibration can only be applied whilst the DSP is not running */
>>   				ret = cs35l41_apply_calibration(cs35l41,
>> -								cpu_to_be32(cl->calAmbient),
>> -								cpu_to_be32(cl->calR),
>> -								cpu_to_be32(cl->calStatus),
>> -								cpu_to_be32(cl->calR + 1));
>> +								(__be32)cpu_to_be32(cl->calAmbient),
>> +								(__be32)cpu_to_be32(cl->calR),
>> +								(__be32)cpu_to_be32(cl->calStatus),
>> +								(__be32)cpu_to_be32(cl->calR + 1));
> Do we really need those cast?  Even if yes, it must be with __force
> prefix for the endian cast in general.

These casts were added because we found some warnings when we ran the 
static analyzer sparse locally.
I think these warnings are very minor, and we can drop this patch if you 
prefer?

Thanks,

Stefan

>
> thanks,
>
> Takashi
