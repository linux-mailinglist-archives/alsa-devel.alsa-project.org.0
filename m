Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 149B26804D4
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 05:17:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79EAD857;
	Mon, 30 Jan 2023 05:16:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79EAD857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675052241;
	bh=cWgbXComldTgqMrLUoYpQ3/CsVgdanv2fz7q94hJmV0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JHkA8nFIVDM0BHTMVc1Kk+jxJQNthrJYrrDqMiCopoyyDQ+mk5HtDzcNWBUn3SPt1
	 rU+bu9R5FKg1ZDLZ+UA4WizOBWF/0LEeT1shnDOBeJYau8PIiJPD0thpb/FmjHYrPy
	 GMVfYxILv6LIxzqVMa/TRzagqBxFCkyHu8aKAW+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6A01F8007C;
	Mon, 30 Jan 2023 05:16:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 579C0F8032B; Mon, 30 Jan 2023 05:16:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4CFEF8007C
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 05:16:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4CFEF8007C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=WMri5mqX
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30U42OKP005308; Mon, 30 Jan 2023 04:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=TV1V6b71VsWDCiEaLu9VWqCljS9VRJL6c096PABzjQw=;
 b=WMri5mqXfmH3OE3/U79Al0Z/RgeeQrorfS9Wf2Q5fD03av9FTDuMKvEngUlCh1xmXUNM
 3oPtFnZPyHRDa1Ba7rjou3fOsfzKeilB2Xr+fjHxouR/7DigqEN46haeFFE4avZHDHLr
 o4nTE7x9Iii0Lfqy0zz0mfg/5+A8jRqwlALMGIMxRD+E4mv5WNacRzuqrLzHtNaaEuIo
 Ox+2kV8jv23gIARC6gzD+f9tZYs/hDEdjRaFR8kvijiSW3SEPZLFJcUyzFGFZwCh5H7+
 GXCT9lBN6Yx7f+DMJB3k41bcH7XlrEqzMvP4rz0YLN8ngaHcFUJWDG5OXm+w1EYWO0Qd 9g== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ncvfpam2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 04:16:06 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30U4G685009558
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 04:16:06 GMT
Received: from [10.216.53.76] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Sun, 29 Jan
 2023 20:16:03 -0800
Message-ID: <19d8283a-b432-3a3f-10ca-7af335767876@quicinc.com>
Date: Mon, 30 Jan 2023 09:46:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Query on get_time_info
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, <alsa-devel@alsa-project.org>
References: <271019c5-cfba-fa77-12e0-df97034f25b3@quicinc.com>
 <923c4ca3-bf79-bd34-279a-54c817dbf413@linux.intel.com>
From: Raghu Ballappa Bankapur <quic_rbankapu@quicinc.com>
In-Reply-To: <923c4ca3-bf79-bd34-279a-54c817dbf413@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: GA5tFB5yxWmuRonRCK-ssaEqook1OxJC
X-Proofpoint-ORIG-GUID: GA5tFB5yxWmuRonRCK-ssaEqook1OxJC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_02,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 mlxlogscore=768 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300039
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Rander Wang <rander.wang@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

HI Pierre.


Thanks for your response,

Yes I meant for ASoC core,  We will check your patch and update.


Regards

Raghu Bankapur

On 1/27/2023 8:06 PM, Pierre-Louis Bossart wrote:
>
> On 1/27/23 08:03, Raghu Ballappa Bankapur wrote:
>> HI All,
>>
>>
>> We see get_time_info is not enabled from ALSA core. ay reason behind?
> I think you meant ASoC core?
>
>> we enabled like below with some more code, we are able to get_time_info
>> to lower driver.
>>
>> static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
>>                  struct snd_soc_pcm_runtime *be, int stream)
>> @@ -2907,6 +2927,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd,
>> int num)
>>                  rtd->ops.hw_free        = dpcm_fe_dai_hw_free;
>>                  rtd->ops.close          = dpcm_fe_dai_close;
>>                  rtd->ops.pointer        = soc_pcm_pointer;
>> +               rtd->ops.get_time_info  = soc_pcm_get_time_info;
>>          } else {
>>                  rtd->ops.open           = soc_pcm_open;
>>                  rtd->ops.hw_params      = soc_pcm_hw_params;
>> @@ -2915,6 +2936,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd,
>> int num)
>>                  rtd->ops.hw_free        = soc_pcm_hw_free;
>>                  rtd->ops.close          = soc_pcm_close;
>>                  rtd->ops.pointer        = soc_pcm_pointer;
>> +               rtd->ops.get_time_info  = soc_pcm_get_time_info;
>>          }
>>
>> Is this ALSA limitation or any other approach is followed to enable this
>> implementation.
> No, it's a miss.
>
> I had a patch to fix this in
> https://github.com/thesofproject/linux/pull/3792, but somehow it never
> made its path upstream. I don't fully recall the details, only vaguely
> that we first added support for the .delay(), but the get_time_info part
> was tested back in August 2022.
>
> Would that patch work for you?
