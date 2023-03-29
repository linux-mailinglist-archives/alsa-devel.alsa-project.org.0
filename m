Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E36D6CDB84
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 16:06:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C47D1F6;
	Wed, 29 Mar 2023 16:05:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C47D1F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680098798;
	bh=sNwjrbZfF1yLMKWmQ17OHX6LHmJgawwfIrOMGRuFCTY=;
	h=Date:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=buRSnWB4qdqdAaL+kFyX90t478u0ZGUw3Vul0055F0qQRSRCg1JzLkbcJP/BPWdEs
	 KIeMAFYO48fpiFs22XNevgpE54HNDOJWNcr2ywSjG2Rnchda2QH6eqzU8Rd64EGU9Z
	 3WgTCOxWvJ34aJSjcajIXD/egPXpE289YJ6kcbok=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4D78F8024E;
	Wed, 29 Mar 2023 16:05:47 +0200 (CEST)
Date: Wed, 29 Mar 2023 14:05:24 +0000
To: Jianhua Lu <lujianhua000@gmail.com>
Subject: Re: [PATCH] Asoc: wm_adsp: Add support for loading firmware with
 prefix name
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X7GD65LZGN6ROMP23OXWXL6N5FVQYXNU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168009874672.26.6407339101118973958@mailman-core.alsa-project.org>
From: Charles Keepax via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Simon Trimmer <simont@opensource.cirrus.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFB59F80272; Wed, 29 Mar 2023 16:05:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7BF20F800C9
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 16:05:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BF20F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Lj+BjEli
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32T9DfFW021397;
	Wed, 29 Mar 2023 09:05:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=JGh/hvjvBMdxlLHaLhPm0XGhnA/5dNCgYG0Izty01zk=;
 b=Lj+BjEli4LAR+SVPbVtGv1Z25ZfCumbCwZbmMK3gRw8ibqGwcZyJQTAJNfHYKu5KPkkR
 0YCrOwntWbwCorS9iMVOwhG7dp2uqfB6X957z5dQ0OLhATv4q3QlU2yj3r8Ebc27Fb/E
 868E2zgbUj2opyXcnrkTdTlOb27OGMqFABGC7Hm6AG8qwGW7rYOm/9EO0hWKuwCeLLwS
 u9qrw4sy/IadIt0j8dmDjGXO7TJxddL/hgbRteAW28cHen+qmB3rL4ED9cqWj1zNCNg8
 NTRQak/Ir47EQfyRGsKLCFOPwhVGqCD6ewx/oorhfnrjhH4hu2LTCG3GC9+Z3axKiz8y sA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3pmjghgc9q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Mar 2023 09:05:25 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Wed, 29 Mar
 2023 09:05:24 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Wed, 29 Mar 2023 09:05:24 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2BA5111DA;
	Wed, 29 Mar 2023 14:05:24 +0000 (UTC)
Date: Wed, 29 Mar 2023 14:05:24 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Jianhua Lu <lujianhua000@gmail.com>
Subject: Re: [PATCH] Asoc: wm_adsp: Add support for loading firmware with
 prefix name
Message-ID: <20230329140524.GU68926@ediswmail.ad.cirrus.com>
References: <20230329130525.15830-1-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230329130525.15830-1-lujianhua000@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: EeUUs62KZ6mNxdeiDQAx0DvUuftRFwmz
X-Proofpoint-ORIG-GUID: EeUUs62KZ6mNxdeiDQAx0DvUuftRFwmz
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: X7GD65LZGN6ROMP23OXWXL6N5FVQYXNU
X-Message-ID-Hash: X7GD65LZGN6ROMP23OXWXL6N5FVQYXNU
X-MailFrom: prvs=9452286330=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Simon Trimmer <simont@opensource.cirrus.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X7GD65LZGN6ROMP23OXWXL6N5FVQYXNU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Mar 29, 2023 at 09:05:25PM +0800, Jianhua Lu wrote:
> For platform using fdt, system_name is NULL, it doesn't provide
> a way to load firmware with prefix name, so add it.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
>  sound/soc/codecs/wm_adsp.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
> index 216120b68b64..17481e42d440 100644
> --- a/sound/soc/codecs/wm_adsp.c
> +++ b/sound/soc/codecs/wm_adsp.c
> @@ -760,6 +760,10 @@ static int wm_adsp_request_firmware_file(struct wm_adsp *dsp,
>  		*filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s-%s.%s", dir, dsp->part,
>  				      dsp->fwf_name, wm_adsp_fw[dsp->fw].file, system_name,
>  				      filetype);
> +	else if (asoc_component_prefix)
> +		*filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s-%s.%s", dir, dsp->part,
> +				      dsp->fwf_name, wm_adsp_fw[dsp->fw].file, asoc_component_prefix,
> +				      filetype);
>  	else
>  		*filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s.%s", dir, dsp->part, dsp->fwf_name,
>  				      wm_adsp_fw[dsp->fw].file, filetype);
> @@ -831,6 +835,16 @@ static int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
>  							      NULL, "bin");
>  			return 0;
>  		}
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
>  	}

This direction seems slightly problematic, especially in the
context of amps (which I presume this relates to, please let know
if that is wrong). It would probably be better to be fixing
things up such that the amp in question sets system_name when
registered through DT. Generally speaking the idea is the amp
tuning is going to be specific to the enclosure/speaker involved,
so a generic tuning for say left amps doesn't really make a lot
of sense.

Thanks,
Charles
