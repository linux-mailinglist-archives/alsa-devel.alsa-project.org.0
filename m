Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E5F53E3F7
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 11:40:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2E2617B4;
	Mon,  6 Jun 2022 11:39:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2E2617B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654508441;
	bh=yZ/4ZYaxKHrjomgGxd/1bgY3A9U95j0aVPPumel2UKs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b/q3TiVkOy5s0uMHcbAGRfUav+4lWgaU5RhTpniCav5wKWBAHwoFjRtKSe38l6o2j
	 m+qyTx01L7e9ei0yp06ZYjtdtnVDCjzB3+agmXwh1ZrHVRa6Ef8EnWEGfnWCmZydor
	 PyxjP3qB7FCObBxEeBct65+KGmf0gV9s90j3fLYw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AEAAF80310;
	Mon,  6 Jun 2022 11:39:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9CE4F80116; Mon,  6 Jun 2022 11:39:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FFC1F80116
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 11:39:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FFC1F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="T06xocKS"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2565f062015762;
 Mon, 6 Jun 2022 04:39:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=Afk/+rnhejZlVvA6y3mlvCOodazyAWEKfurxb2awss8=;
 b=T06xocKSqvjDMQjC8lDVOf51UAnoJSKKCMjqeQiggId9GhQcJwvwlY0O2/wsvDJTdFH8
 7AuTEyJtxAswwpUaPsKBDs1b4Ulo8gJzbO7ABcldVrMSMIRpfXSJ6vzJ5lbHbvUyHawp
 YcyuW2eUHAAcI8r1E8faXI0+fhqJXe3M3MPnvnU23j99NnYa3SO6aTZWGV9+Kqo4IOfj
 hjmNeF06EmVMmWN+hT8l80yShDG+jUF5h9YkdBJMF3ygSc1RIZ1+gpXhgRYHIjBNTtsy
 xRtDXI/j9ZKSGSp3RsTK7gVDagGZtvRCXW+F9/76KkH9AZQMFqfgnI7pICOVICoAdPOC mg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gg3tq1pag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 06 Jun 2022 04:39:32 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 6 Jun
 2022 10:39:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Mon, 6 Jun 2022 10:39:30 +0100
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.90.251.45])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3BB78475;
 Mon,  6 Jun 2022 09:39:30 +0000 (UTC)
Subject: Re: [PATCH] ASoC: wm_adsp: Fix event generation for wm_adsp_fw_put()
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Simon Trimmer
 <simont@opensource.cirrus.com>
References: <20220603115003.3865834-1-broonie@kernel.org>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <18604186-e133-e2c8-6f18-9e1f79305530@opensource.cirrus.com>
Date: Mon, 6 Jun 2022 10:39:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220603115003.3865834-1-broonie@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kLxb4Vm6Qs7dTxCRkV1h1xioHJiXxYXX
X-Proofpoint-GUID: kLxb4Vm6Qs7dTxCRkV1h1xioHJiXxYXX
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org
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

On 03/06/2022 12:50, Mark Brown wrote:
> Currently wm_adsp_fw_put() returns 0 rather than 1 when updating the value
> of the control, meaning that no event is generated to userspace. Fix this
> by setting the default return value to 1, the code already exits early with
> a return value of 0 if the value is unchanged.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   sound/soc/codecs/wm_adsp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
> index 7973a75cac05..6d7fd88243aa 100644
> --- a/sound/soc/codecs/wm_adsp.c
> +++ b/sound/soc/codecs/wm_adsp.c
> @@ -333,7 +333,7 @@ int wm_adsp_fw_put(struct snd_kcontrol *kcontrol,
>   	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
>   	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
>   	struct wm_adsp *dsp = snd_soc_component_get_drvdata(component);
> -	int ret = 0;
> +	int ret = 1;
>   
>   	if (ucontrol->value.enumerated.item[0] == dsp[e->shift_l].fw)
>   		return 0;
> 
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
