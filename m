Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E36C46C9DEA
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 10:33:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30E27822;
	Mon, 27 Mar 2023 10:32:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30E27822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679905997;
	bh=d8EOqUPgyRwm3cEMQoVbHAW/2HE6BDhJzlhn2e4ZXqE=;
	h=Date:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=dRNtBJSRxl+s2viRM/F1gpTXUvISOzBp6+d4mhBjt85OghPWcG2fdEtFKGIyo+SvJ
	 2voF0tb8AQocVt3UyGrMm8b6dk8+Uq8/L7G/UA76vUSgIpQYyXB8turbAOCGAxCat/
	 +YgZzV5GQcT/Zm6OrIyJzSt3zfEgqmkje8raaJS8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9A26F8024E;
	Mon, 27 Mar 2023 10:32:26 +0200 (CEST)
Date: Mon, 27 Mar 2023 08:32:08 +0000
To: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH v1 1/1] ASoC: wm8903: implement DMIC support
References: <20230325083643.7575-1-clamor95@gmail.com>
 <20230325083643.7575-2-clamor95@gmail.com>
In-Reply-To: <20230325083643.7575-2-clamor95@gmail.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EPDAKKXKK4SOYMIJBOX3C2YRY3VJZH7V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167990594623.26.14605768664827837520@mailman-core.alsa-project.org>
From: Charles Keepax via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF7DEF80272; Mon, 27 Mar 2023 10:32:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 604C6F80249
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 10:32:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 604C6F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=WOlzgGSo
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32R7BCOu028059;
	Mon, 27 Mar 2023 03:32:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=Po+ae3aSw2GW2FFY1Ex0+XnVhUK7QaDVZZPLKHJDiEc=;
 b=WOlzgGSovcspp7tuNrc+OGO3VEvtxPOZG4YX9o5+BSIQRtczlT71+R2WVLhtM76qlSMo
 raw+oErun8ugVCBNPhAdjVVCqz9xlsnyYM7S2krcpNogzjTGkVHWo8YPr4ObhhnQyh8T
 +3fgTekVNZMkNbl/FNcHr48GR+JQo/31ALw9NRWQD4ENLWzPLxwZhB1FFk9oz59IULyO
 8P9X/fvaYimW630rXNY9e/PKXOX3juX3UxQe7AONZQ1H0OBVwB63dUCddsEsd6TFF+91
 SJX/NLMIXyt21Y07YhwveWnXhbL3i4mfl6nChx+zvtseEMvlyCxJy6fiTVyJSSsdSqZo nw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3phxc2j698-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Mar 2023 03:32:10 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Mon, 27 Mar
 2023 03:32:08 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Mon, 27 Mar 2023 03:32:08 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 82FA611D4;
	Mon, 27 Mar 2023 08:32:08 +0000 (UTC)
Date: Mon, 27 Mar 2023 08:32:08 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH v1 1/1] ASoC: wm8903: implement DMIC support
Message-ID: <20230327083208.GQ68926@ediswmail.ad.cirrus.com>
References: <20230325083643.7575-1-clamor95@gmail.com>
 <20230325083643.7575-2-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230325083643.7575-2-clamor95@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: ChH8pAOo6YN8MZg2uI0OBVWvOIKr7fFB
X-Proofpoint-ORIG-GUID: ChH8pAOo6YN8MZg2uI0OBVWvOIKr7fFB
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: EPDAKKXKK4SOYMIJBOX3C2YRY3VJZH7V
X-Message-ID-Hash: EPDAKKXKK4SOYMIJBOX3C2YRY3VJZH7V
X-MailFrom: prvs=845006f82f=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EPDAKKXKK4SOYMIJBOX3C2YRY3VJZH7V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Mar 25, 2023 at 10:36:43AM +0200, Svyatoslav Ryhel wrote:
> Add DMIC input and routing.
> 
> Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # ASUS TF300T
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  sound/soc/codecs/wm8903.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
> index 41346e5ec5ad..9c2f0aadcff3 100644
> --- a/sound/soc/codecs/wm8903.c
> +++ b/sound/soc/codecs/wm8903.c
> @@ -9,7 +9,6 @@
>   *
>   * TODO:
>   *  - TDM mode configuration.
> - *  - Digital microphone support.
>   */
>  
>  #include <linux/module.h>
> @@ -816,6 +815,7 @@ SND_SOC_DAPM_INPUT("IN2L"),
>  SND_SOC_DAPM_INPUT("IN2R"),
>  SND_SOC_DAPM_INPUT("IN3L"),
>  SND_SOC_DAPM_INPUT("IN3R"),
> +SND_SOC_DAPM_INPUT("DMIC"),
>  SND_SOC_DAPM_INPUT("DMICDAT"),

There is already a datapath for the DMIC here, DMICDAT. Are you
sure you don't just need to set the "Left/Right ADC Input" muxes
correctly through the ALSA controls?

>  
>  SND_SOC_DAPM_OUTPUT("HPOUTL"),
> @@ -996,6 +996,9 @@ static const struct snd_soc_dapm_route wm8903_intercon[] = {
>  	{ "AIFTXL", NULL, "Left Capture Mux" },
>  	{ "AIFTXR", NULL, "Right Capture Mux" },
>  
> +	{ "ADCL", NULL, "DMIC" },
> +	{ "ADCR", NULL, "DMIC" },
> +

And at any rate these should not be directly connected to the
ADC you need some muxing to indicate whether the DMIC or AMICs
are active. Which the DMICDAT path appears to already have.

Thanks,
Charles
