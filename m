Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BDC6CED0C
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 17:34:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63A5A1E9;
	Wed, 29 Mar 2023 17:33:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63A5A1E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680104068;
	bh=dKC/RV2uy2hEqbHZASfCCDa1VhuOCT5yRRIcTZ/hCew=;
	h=Date:Subject:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=WFVzg9KYgvLzNYkLCXsuHLCSU3Azyjlpz7PlBSjvAFSs6iL8Ji1FyJn/63jnkrXqI
	 uogFO5RmmpYbxXc5ZH1KZ0nV/Huk2fXb+QHIiNTeg7iFRUK0cI0g35JGUqWzwFEfbF
	 QHAbQ9uwP0dGyEpdUyNoVVOTHdKKVOSdZ+6/gAdg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9516AF8024E;
	Wed, 29 Mar 2023 17:33:37 +0200 (CEST)
Date: Wed, 29 Mar 2023 16:33:08 +0100
Subject: Re: [PATCH] Asoc: wm_adsp: Add support for loading firmware with
 prefix name
To: Jianhua Lu <lujianhua000@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi
 Iwai <tiwai@suse.com>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Charles
 Keepax <ckeepax@opensource.cirrus.com>,
        Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>
References: <20230329130525.15830-1-lujianhua000@gmail.com>
In-Reply-To: <20230329130525.15830-1-lujianhua000@gmail.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NQHPU72EJIPUPDP3UYMPMCI3VFP3HZGE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168010401700.26.5602544732799136434@mailman-core.alsa-project.org>
From: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C08B4F80272; Wed, 29 Mar 2023 17:33:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9ECEAF800C9
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 17:33:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9ECEAF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=eTlIVmVs
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32T9EBxw021690;
	Wed, 29 Mar 2023 10:33:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=nKcNlzwm7qE0F3RDbGVCCb1M6tgGymG9oJ9fa9j5Mf8=;
 b=eTlIVmVsKGjq3mnHM6Jr4s9VvJWJcCe3BZ4tu+miceljn7Cs7ndXHSYAvcLHuvLExnnC
 N5AYuTBDGizsaXXuNHKeZIhOYyq888zNB4e3OwoqgdXcSgiMXUBITOqIYt4OGimFZgAN
 yilkDV/p+2APuyiiovGt/RHIDUQbwBxL3omvUJ/dA7xZ8/TqcUab9NVsSn31T63h7blS
 sgk5syUc2BYaochL0WHOhIQjNtfqdgAN1h1IPaePN4XH16qN8KU0bCFQz2NSZ/PMHLuE
 x82dsOVODSu/y5Ho6m9MKRBmi4dTUpv1nzriDtIYAh2p69oEqWCg+2ywzNoUvFF6a1od tw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3pmjghgjaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Mar 2023 10:33:11 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Wed, 29 Mar
 2023 10:33:10 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Wed, 29 Mar 2023 10:33:10 -0500
Received: from [198.61.65.23] (EDIN4L06LR3.ad.cirrus.com [198.61.65.23])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CFE8211D3;
	Wed, 29 Mar 2023 15:33:08 +0000 (UTC)
Message-ID: <57c5a3b3-00cd-5b44-02f4-dedabacc7662@opensource.cirrus.com>
Date: Wed, 29 Mar 2023 16:33:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] Asoc: wm_adsp: Add support for loading firmware with
 prefix name
Content-Language: en-US
To: Jianhua Lu <lujianhua000@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi
 Iwai <tiwai@suse.com>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Charles
 Keepax <ckeepax@opensource.cirrus.com>,
        Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>
References: <20230329130525.15830-1-lujianhua000@gmail.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20230329130525.15830-1-lujianhua000@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZcNbkvF3f1WjSY9515Intogj9F5T569W
X-Proofpoint-ORIG-GUID: ZcNbkvF3f1WjSY9515Intogj9F5T569W
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: NQHPU72EJIPUPDP3UYMPMCI3VFP3HZGE
X-Message-ID-Hash: NQHPU72EJIPUPDP3UYMPMCI3VFP3HZGE
X-MailFrom: prvs=9452efeff7=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NQHPU72EJIPUPDP3UYMPMCI3VFP3HZGE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29/3/23 14:05, Jianhua Lu wrote:
> For platform using fdt, system_name is NULL, it doesn't provide
> a way to load firmware with prefix name, so add it.

This is intended behavior.

To load per-amp tuning you must know the function of each amp.
You only know that if you know what hardware platform you are running
on.

So if system_name is NULL it should fall back to generic firmware.

> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
>   sound/soc/codecs/wm_adsp.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
> index 216120b68b64..17481e42d440 100644
> --- a/sound/soc/codecs/wm_adsp.c
> +++ b/sound/soc/codecs/wm_adsp.c
> @@ -760,6 +760,10 @@ static int wm_adsp_request_firmware_file(struct wm_adsp *dsp,
>   		*filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s-%s.%s", dir, dsp->part,
>   				      dsp->fwf_name, wm_adsp_fw[dsp->fw].file, system_name,
>   				      filetype);
> +	else if (asoc_component_prefix)
> +		*filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s-%s.%s", dir, dsp->part,
> +				      dsp->fwf_name, wm_adsp_fw[dsp->fw].file, asoc_component_prefix,
> +				      filetype);
>   	else
>   		*filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s.%s", dir, dsp->part, dsp->fwf_name,
>   				      wm_adsp_fw[dsp->fw].file, filetype);
> @@ -831,6 +835,16 @@ static int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
>   							      NULL, "bin");
>   			return 0;
>   		}
> +	} else if (asoc_component_prefix) {
> +		if (!wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
> +						   cirrus_dir, NULL,
> +						   asoc_component_prefix, "wmfw")) {
> +			adsp_dbg(dsp, "Found '%s'\n", *wmfw_filename);
> +			wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
> +							      cirrus_dir, NULL,
> +							      asoc_component_prefix, "bin");
> +			return 0;
> +		}
>   	}
>   
>   	if (!wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
