Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9617E0682
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 17:27:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B12EEE9B;
	Fri,  3 Nov 2023 17:26:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B12EEE9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699028821;
	bh=l+Xul+2WCUeepfOC2JW7x9q4TDDnGXq7BFAgNs363fg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bIL+sb20RmOZ/4tMwnUE1RA5XQ26xpU2mWCgUeDuUsy5WKm/vfGZvFa/XTH0MgS7k
	 BWUWE1kBoLdVDp/VS1IxKdgHnC0dzPD/jlwjuu31IijTIFDz0MglHVaRzFeYpp5R2M
	 z1EdfICseYj0zUa4DR1s3xmH3FYasdctLnW5d0Z8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6ADA0F80537; Fri,  3 Nov 2023 17:26:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4E50F80425;
	Fri,  3 Nov 2023 17:26:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F41CEF8020D; Tue, 31 Oct 2023 10:46:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by alsa1.perex.cz (Postfix) with ESMTP id C838AF80166
	for <alsa-devel@alsa-project.org>; Tue, 31 Oct 2023 10:46:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C838AF80166
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1849591:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256);
 Tue, 31 Oct 2023 17:45:35 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.27; Tue, 31 Oct
 2023 17:45:35 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1258.27 via Frontend
 Transport; Tue, 31 Oct 2023 17:45:35 +0800
Date: Tue, 31 Oct 2023 17:45:35 +0800
From: ChiYuan Huang <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Allen Lin <allen_lin@richtek.com>,
	<alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] ASoC: codecs: rtq9128: Fix string compare in DAPM
 event callback
Message-ID: <20231031094535.GA15465@linuxcarl2.richtek.com>
References: <1697795435-5858-1-git-send-email-cy_huang@richtek.com>
 <1697795435-5858-2-git-send-email-cy_huang@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1697795435-5858-2-git-send-email-cy_huang@richtek.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MailFrom: prvs=1666D5052C=cy_huang@richtek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6FHRCJMNC25I35WEELOFE6YYSKO75AK5
X-Message-ID-Hash: 6FHRCJMNC25I35WEELOFE6YYSKO75AK5
X-Mailman-Approved-At: Fri, 03 Nov 2023 16:26:07 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6FHRCJMNC25I35WEELOFE6YYSKO75AK5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Oct 20, 2023 at 05:50:33PM +0800, cy_huang@richtek.com wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Since widget name may concatenate the component prefix. To compare the
> the name with 'strcmp' function in shared DAPM event callback will
> cause the wrong RG field control. Use 'strstr' function, instead.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  sound/soc/codecs/rtq9128.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/codecs/rtq9128.c b/sound/soc/codecs/rtq9128.c
> index 371d622c6214..8c1c3c65475e 100644
> --- a/sound/soc/codecs/rtq9128.c
> +++ b/sound/soc/codecs/rtq9128.c
> @@ -291,11 +291,11 @@ static int rtq9128_dac_power_event(struct snd_soc_dapm_widget *w, struct snd_kco
>  
>  	dev_dbg(comp->dev, "%s: %s event %d\n", __func__, w->name, event);
>  
> -	if (strcmp(w->name, "DAC1") == 0)
> +	if (strstr(w->name, "DAC1"))
>  		shift = 6;
> -	else if (strcmp(w->name, "DAC2") == 0)
> +	else if (strstr(w->name, "DAC2"))
>  		shift = 4;
> -	else if (strcmp(w->name, "DAC3") == 0)
> +	else if (strstr(w->name, "DAC3"))
>  		shift = 2;
>  	else
>  		shift = 0;
https://lore.kernel.org/lkml/20231023095428.166563-8-krzysztof.kozlowski@linaro.org/
Since the better change is applied. Please ignore this one.

Still wait the other patch(2&3)'s feedback.

Thanks.
> -- 
> 2.34.1
> 
