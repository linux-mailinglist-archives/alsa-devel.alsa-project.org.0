Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E24E2C5407
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Nov 2020 13:36:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB35417C7;
	Thu, 26 Nov 2020 13:35:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB35417C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606394201;
	bh=sNY/so2lf9CzsoHjVsJs3vxsBksPAtotlP+e5fBBlzA=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=MO7D1XRTjjo+1c8kqq5FFseQJNmnAu/2acxXGiiT+nMcxa6i/LLdMBFlobIGsCuLE
	 ADlGQBC7WJQZn6Dpjy3D8+eQsahgA00gILibEVeLO1fAb5bqSOFBHvwFVv6mxG+eFH
	 ExoQ5qpH3FC8WfinMUNAOBpfIw5IsXqF00OZ177I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 513E2F80166;
	Thu, 26 Nov 2020 13:35:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22BF5F80165; Thu, 26 Nov 2020 13:35:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EA1FF80128
 for <alsa-devel@alsa-project.org>; Thu, 26 Nov 2020 13:34:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EA1FF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="Vsu9iMem"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20201126123444epoutp028810ac689825e2e57fee936bf7f45616~LDuiRwnQs2331323313epoutp02M
 for <alsa-devel@alsa-project.org>; Thu, 26 Nov 2020 12:34:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20201126123444epoutp028810ac689825e2e57fee936bf7f45616~LDuiRwnQs2331323313epoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1606394084;
 bh=a3IycIHgDlNF/3I0Sh0LSCcWupf0A7rGm8jrAGxrAA8=;
 h=From:To:Cc:Subject:Date:References:From;
 b=Vsu9iMemy9I5IGCEn4Ex5Y0P+xJKh4IfLYsE4JMDLwNEi3Q/RQ64eHl/YlC5wHBTB
 77/a6vEYXOhCUHfka8nERCZtHExD7jqyBuvA/qCYEV8EfuvLUJ1xOVRlbvZxTjaxPP
 djYul1RRh+Hsu/61AN2DrkgN0as7eq7bEckgNTZ8=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20201126123442epcas2p24ebadf0cbec68388cdb2d19c1b2ff5e6~LDuhCscYu1670816708epcas2p2L;
 Thu, 26 Nov 2020 12:34:42 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.190]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4Chcds4WQqzMqYkZ; Thu, 26 Nov
 2020 12:34:41 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 03.06.56312.1E0AFBF5; Thu, 26 Nov 2020 21:34:41 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
 20201126123440epcas2p3f38035952f571b3be7e86225dc5a2745~LDuedGaMt0958509585epcas2p3Y;
 Thu, 26 Nov 2020 12:34:40 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201126123439epsmtrp20aa70b7df2c96f3cb2feea4483379184~LDueZY3SA0679306793epsmtrp2z;
 Thu, 26 Nov 2020 12:34:39 +0000 (GMT)
X-AuditID: b6c32a46-1d9ff7000000dbf8-bd-5fbfa0e1d002
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 2E.ED.13470.FD0AFBF5; Thu, 26 Nov 2020 21:34:39 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20201126123439epsmtip22f47600451ac8777b996caf626724fa9~LDueGQlmH0561305613epsmtip2P;
 Thu, 26 Nov 2020 12:34:39 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Vinod Koul'" <vkoul@kernel.org>
Subject: [PATCH v3 0/1] ALSA: compress: allow pause and resume during draining
Date: Thu, 26 Nov 2020 21:34:39 +0900
Message-ID: <000001d6c3f0$82250580$866f1080$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdbD7inK7M1ppD6oQROJKVAjHlS2fQ==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHJsWRmVeSWpSXmKPExsWy7bCmqe7DBfvjDaYdlrW4cvEQk8XdH+YW
 M7Z1s1g03pvAZrH66hYmi29XOpgsfv1/xmRx9OJiJouGu83sFhu+r2W0eLn5DZPFkcYpTBY7
 75xgduD12PC5ic1j56y77B6bVnWyecw7GejRt2UVo8f6LVdZPDafrg5gj8qxyUhNTEktUkjN
 S85PycxLt1XyDo53jjc1MzDUNbS0MFdSyEvMTbVVcvEJ0HXLzAE6VkmhLDGnFCgUkFhcrKRv
 Z1OUX1qSqpCRX1xiq5RakJJTYGhYoFecmFtcmpeul5yfa2VoYGBkClSZkJOxeN4ploKfohX9
 8/4yNTD+EOxi5OSQEDCR2Ph8B0sXIxeHkMAORon9z5czQTifGCV2du6Hcr4xSjw53ckI0/L6
 7mo2iMReRok1X9dA9b9klHjfOY8ZpIpNQFfiy707YLaIgKrElicPwDqYBe4xSTS+eMsEkhAW
 CJDY2nMcyObgYAEqetggDBLmFbCUWLv1CzOELShxcuYTFhCbWUBeYvvbOcwQVyhI/Hy6jBVi
 vp7E1JafzBA1IhKzO9uYQXZJCGzhkDgx4wIbRIOLxOwpD1ghbGGJV8e3sEPYUhKf3+1lg2ho
 ZpR4d/YPVGIKo0RntxCEbSyxZe4psEOZBTQl1u/SBzElBJQljtyCuo1PouPwX3aIMK9ERxtU
 o5LExlP/mCDCEhLzNkDN9pA4uWQ26wRGxVlInpyF5MlZSJ6ZhbB2ASPLKkax1ILi3PTUYqMC
 I+TI3sQITshabjsYp7z9oHeIkYmD8RCjBAezkgivu/DeeCHelMTKqtSi/Pii0pzU4kOMpsBQ
 n8gsJZqcD8wJeSXxhqZGZmYGlqYWpmZGFkrivKEr++KFBNITS1KzU1MLUotg+pg4OKUamO74
 +PC9WBiYfoZX46k3tzKrafFy92CXnkbBLU3bt8t8f+q56s90fZHmuCK/hX+nPVO/IW11pM/K
 vlV4rbt21ea/DDyrV75y5XBxS7BaZ+IYdGj3x6Il9RqdFx2VDrUEmJi1MU5euCmtu2LKBJu4
 hzufJPxuSo9vePRV9fysA+n/9z37t2DeQ0WHlJzdW/7IP/m2//La4ye+7O18JbpgxqKJ1YUt
 NQY9d3baul182CM548+fyw+nrzPdPvnoM48jj99rmEjxNnyaprLgNdOqc3WuF5fuvXZbKnR3
 9ZL8/2Hdb+LyDvtdCW447zs94lqnYe+1PRqRW3Z5lS6Y8Pf3r33nGlwqJKbxbLnM/P/+urmf
 lFiKMxINtZiLihMBEWNDylEEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeLIzCtJLcpLzFFi42LZdlhJXvf+gv3xBlfn6VtcuXiIyeLuD3OL
 Gdu6WSwa701gs1h9dQuTxbcrHUwWv/4/Y7I4enExk0XD3WZ2iw3f1zJavNz8hsniSOMUJoud
 d04wO/B6bPjcxOaxc9Zddo9NqzrZPOadDPTo27KK0WP9lqssHptPVwewR3HZpKTmZJalFunb
 JXBlLJ53iqXgp2hF/7y/TA2MPwS7GDk5JARMJF7fXc0GYgsJ7GaUuP+eEyIuIfFh/hl2CFtY
 4n7LEdYuRi6gmueMEjcuvgNLsAnoSny5d4cZxBYRUJXY8uQB2CBmgTdMEl/OFXYxcnAIC/hJ
 dHTxg5gsQCUPG4RBKngFLCXWbv3CDGELSpyc+YQFpIRZQE+ibSMjxBB5ie1v5zBDXKAg8fPp
 MlaIRXoSU1t+MkPUiEjM7mxjnsAoOAvJpFkIk2YhmTQLSccCRpZVjJKpBcW56bnFhgWGeanl
 esWJucWleel6yfm5mxjBEaaluYNx+6oPeocYmTgYDzFKcDArifC6C++NF+JNSaysSi3Kjy8q
 zUktPsQozcGiJM57o3BhnJBAemJJanZqakFqEUyWiYNTqoEp+MOLL5cshJj//2O9HczJklxy
 4LRibNv5jT7reQSmyakLhESeL5RXSr/z/2yA4PfChd+/2K64UBt91Kxf4t+zCTHmnxw3fXwa
 /XSG+jbG+OpNi0rMJx95eEHpovtzpRmvGnV+WCiXJif//tu0m8fT2djcrCn1aPglUde7okFH
 RaQvM0/YsO6UTfcXodlrGQ+Lu2jZRMZHpS1NUePt3es+efb6ItFDk5xuZAj/Lok4GRfhtsZz
 zg1VXzFtvr8Lqk7LvVA7dPHmpEylqRZpZxa/to7ePP3bg+r/B1ZWn+L/yFWoN/tQvdOqnvMf
 V6tOObLlzkndeQd84ytaLBKP/nrD93Ijm28Ew+6+nW5Suh/ilViKMxINtZiLihMBDEfzzx8D
 AAA=
X-CMS-MailID: 20201126123440epcas2p3f38035952f571b3be7e86225dc5a2745
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201126123440epcas2p3f38035952f571b3be7e86225dc5a2745
References: <CGME20201126123440epcas2p3f38035952f571b3be7e86225dc5a2745@epcas2p3.samsung.com>
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com, lgirdwood@gmail.com,
 'Takashi Iwai' <tiwai@suse.de>,
 'Pierre-Louis Bossart' <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
 kimty@samsung.com, donggyun.ko@samsung.com, hmseo@samsung.com,
 s47.kang@samsung.com, pilsun.jang@samsung.com, tkjung@samsung.com
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

On Wed, 25 Nov 2020 16:28:05 +0530, Vinod Koul wrote:
>On 27-10-20, 10:57, Gyeongtaek Lee wrote:
>> diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
>> index 0e53f6f31916..a071485383ed 100644
>> --- a/sound/core/compress_offload.c
>> +++ b/sound/core/compress_offload.c
>> @@ -708,11 +708,24 @@ static int snd_compr_pause(struct snd_compr_stream *stream)
>>  {
>>  	int retval;
>>  
>> -	if (stream->runtime->state != SNDRV_PCM_STATE_RUNNING)
>> +	switch (stream->runtime->state) {
>> +	case SNDRV_PCM_STATE_RUNNING:
>> +		retval = stream->ops->trigger(stream,
>> +			SNDRV_PCM_TRIGGER_PAUSE_PUSH);
>
>this seems to fit single line with new 100char limit and makes it a
>better read, can we please do that here and few places below .. The line
>split is making it look bit ugly IMO
>
>> +		if (!retval)
>> +			stream->runtime->state = SNDRV_PCM_STATE_PAUSED;
>> +		break;
>> +	case SNDRV_PCM_STATE_DRAINING:
>> +		if (!stream->device->use_pause_in_draining)
>> +			return -EPERM;
>
>I am expecting patches to tinycompress to handle pause while drain. Esp
>this case..
>
>> +		retval = stream->ops->trigger(stream,
>> +			SNDRV_PCM_TRIGGER_PAUSE_PUSH);
>> +		if (!retval)
>> +			stream->pause_in_draining = true;
>> +		break;
>> +	default:
>>  		return -EPERM;
>> -	retval = stream->ops->trigger(stream, SNDRV_PCM_TRIGGER_PAUSE_PUSH);
>> -	if (!retval)
>> -		stream->runtime->state = SNDRV_PCM_STATE_PAUSED;
>> +	}
>>  	return retval;
>>  }
>>  
>> @@ -720,11 +733,25 @@ static int snd_compr_resume(struct snd_compr_stream *stream)
>>  {
>>  	int retval;
>>  
>> -	if (stream->runtime->state != SNDRV_PCM_STATE_PAUSED)
>> +	switch (stream->runtime->state) {
>> +	case SNDRV_PCM_STATE_PAUSED:
>> +		retval = stream->ops->trigger(stream,
>> +			SNDRV_PCM_TRIGGER_PAUSE_RELEASE);
>> +		if (!retval)
>> +			stream->runtime->state = SNDRV_PCM_STATE_RUNNING;
>> +		break;
>> +	case SNDRV_PCM_STATE_DRAINING:
>> +		if (!stream->device->use_pause_in_draining ||
>> +		    !stream->pause_in_draining)
>> +			return -EPERM;
>
>does this condition make sense for resume part..? We have already
>checked for this while going into pause. I am not expecting drain state
>to change while we are paused :)
>

I have fixed the patch as your review comment and send version 3.
For your comment about tinycompress, I'll try to make a patch after study about tinycompress.

Thanks,
Gyeongtaek


Gyeongtaek Lee (1):
  ALSA: compress: allow pause and resume during draining

 include/sound/compress_driver.h | 16 ++++++++++++++
 sound/core/compress_offload.c   | 39 ++++++++++++++++++++++++++-------
 2 files changed, 47 insertions(+), 8 deletions(-)


base-commit: 418baf2c28f3473039f2f7377760bd8f6897ae18
-- 
2.21.0


