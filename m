Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BC6722AEF
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 17:25:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21DB474C;
	Mon,  5 Jun 2023 17:24:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21DB474C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685978700;
	bh=og2G0qioU1lNRGyf6Db5mgIz9SLWyvKUdn5ToqAL4pI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D7iy2CEj0ZTQ8QfF+XZAJ/yH0dy4sJQJp+cPJXAZlHMOb4vM0NCfyXlLD2VHuSl4g
	 281h0mbgrnT0RWKM94UueHVxFWyYUDX84v5da5yyrRD7Xt6hxzzv/JV/LAKGvmlFgl
	 Kh4ULyhClgGXhn4ypf5RSNTl8NaYvq2URMQPMzAo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D163F804DA; Mon,  5 Jun 2023 17:24:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1753AF8016C;
	Mon,  5 Jun 2023 17:24:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44770F80199; Mon,  5 Jun 2023 17:24:05 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B4A19F80130
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 17:24:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4A19F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=SuFG+NYO
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3558e8qJ010267;
	Mon, 5 Jun 2023 10:23:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=uVmiTfqw7mNMn6Bzor8qN+zV9QQNIDAGFDMziJpJE20=;
 b=SuFG+NYOcggQgxA4azHkNp9/VLKBi9gRkHgOavnPxGKUnYrGhiUVWKgHTz4wkvEk2Ej6
 hLlSx/3WmWJmPLrYrDF2u4huit6QxPVg2Q+XlEIveAdRU1jjh+XTTw84kEQcBV+YIGlO
 uVkCti6JSnsckNk56mu8lCapFn7RGCrGdqC+5MpNnhEqA+yzQ9YjCvwtmBoPpXQz77sY
 6auErS2Zj0qjMdufWn+Qvtg5VInFjShRJzdrPFAv+C27ORQSKBYslO2OUibt96Q/Ea4B
 0bXZmPtYs+iDpidqCQQnHl+pZLbwSQSB+P2/4cx4YM5iMTrA1OVZEH2LU5C8yylFauqF Vg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3r01xna11f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jun 2023 10:23:57 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Mon, 5 Jun
 2023 16:23:55 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 5 Jun 2023 16:23:55 +0100
Received: from [198.90.238.35] (LONN2DGDQ73.ad.cirrus.com [198.90.238.35])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7597D11AA;
	Mon,  5 Jun 2023 15:23:55 +0000 (UTC)
Message-ID: <21d2e747-f911-e9d4-2c55-e31c76c9d2bc@opensource.cirrus.com>
Date: Mon, 5 Jun 2023 16:23:55 +0100
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
 <ff8d0da4-10f7-31a7-5cf9-7a4c0e009192@opensource.cirrus.com>
 <878rcyhwvk.wl-tiwai@suse.de>
From: Stefan Binding <sbinding@opensource.cirrus.com>
In-Reply-To: <878rcyhwvk.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Lkg6Khi7KamQ91EwYW0YOCtQrNfT2HqX
X-Proofpoint-GUID: Lkg6Khi7KamQ91EwYW0YOCtQrNfT2HqX
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: H33CDUOVEFG273JELJLAJVI6ZWNAXQWX
X-Message-ID-Hash: H33CDUOVEFG273JELJLAJVI6ZWNAXQWX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H33CDUOVEFG273JELJLAJVI6ZWNAXQWX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

On 05/06/2023 14:17, Takashi Iwai wrote:
> On Mon, 05 Jun 2023 14:50:54 +0200,
> Stefan Binding wrote:
>> Hi Takashi,
>>
>> On 05/06/2023 08:21, Takashi Iwai wrote:
>>> On Thu, 25 May 2023 15:59:54 +0200,
>>> Stefan Binding wrote:
>>>> @@ -379,10 +379,10 @@ static int cs35l41_save_calibration(struct cs35l41_hda *cs35l41)
>>>>      				/* Calibration can only be applied
>>>> whilst the DSP is not running */
>>>>    				ret = cs35l41_apply_calibration(cs35l41,
>>>> -								cpu_to_be32(cl->calAmbient),
>>>> -								cpu_to_be32(cl->calR),
>>>> -								cpu_to_be32(cl->calStatus),
>>>> -								cpu_to_be32(cl->calR + 1));
>>>> +								(__be32)cpu_to_be32(cl->calAmbient),
>>>> +								(__be32)cpu_to_be32(cl->calR),
>>>> +								(__be32)cpu_to_be32(cl->calStatus),
>>>> +								(__be32)cpu_to_be32(cl->calR + 1));
>>> Do we really need those cast?  Even if yes, it must be with __force
>>> prefix for the endian cast in general.
>> These casts were added because we found some warnings when we ran the
>> static analyzer sparse locally.
>> I think these warnings are very minor, and we can drop this patch if
>> you prefer?
> The warnings must be bogus, or maybe pointing to other things?
> The cpu_to_be32() macro itself must return a __be32 value, hence it
> makes no sense to add an extra cast .
>
> If the static analysis still shows such a warning, it should be fixed
> differently -- either fix the analyzer or fix the cpu_to_be32() macro
> itself.
>
> The changes of the argument types to __be32 are fine.  I'm arguing
> only about those unnecessary cast.

You are correct, I double checked and the cast is not needed. I'll push 
up a v2.

Thanks,

Stefan

>
>
> thanks,
>
> Takashi
