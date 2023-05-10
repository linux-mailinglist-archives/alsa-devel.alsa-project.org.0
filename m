Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 492866FDD59
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 14:00:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD17B103C;
	Wed, 10 May 2023 13:59:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD17B103C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683720039;
	bh=Qb0Oc5UusMrzYZBvpQZ44s6QN4KE4mAh94taer7ZLHw=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iKKva0aNMtVc5E9mUckZmnxej3b2wrlthq6SIdi/us4Qrp6S1AehzzPqvM7L8smFz
	 +i1Q1+QIzgCNxKv7qmjIUqhPBR0fw8+uOz2iRKn4Vk3xo680lJ7oQ8YSa/fuaZLSXq
	 uHS+qpsnVeAvF+XkLUYv9ALk8499Sxis8w1+qXOQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C484F80310;
	Wed, 10 May 2023 13:59:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3851EF8032D; Wed, 10 May 2023 13:59:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2161BF8014C
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 13:59:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2161BF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=D1EKLsRZ
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-965c3f9af2aso1057328666b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 10 May 2023 04:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683719955; x=1686311955;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wBh03BIVJ6bBsfdWgoiwpXPJcFGoTrOV/vp+iVHTloM=;
        b=D1EKLsRZ9GZ3EE2mrLEAHlZJdZsZuTA5tn+mox4JeoT6BFLOEdfVySNpyIG2TT5+pN
         +l+MrnHviHrT8NJWLa6csqo604JNo/arjFPSSIy4oXN4IB4xo+pjko2n/I1jFkL9r5uL
         lKXAnnrH2aBlit0xNM9EuTAeaMsKWxkDs68D2ePXajr1Eriy2JGnrr0lkKpzHQTrDJNp
         V0bodjFUJlaIIvRwIZuMW9fvVV8beKheRDmc8bQ8C2OwOEyaiEIWBoysq0A6SIvzl8kD
         IKw13w74WWTRUXH6hrUiKgtU2yARMMfY4avsnfic91aSwgXaq4gz9JUZZhRscmi6onSh
         2zBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683719955; x=1686311955;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wBh03BIVJ6bBsfdWgoiwpXPJcFGoTrOV/vp+iVHTloM=;
        b=NRZBR8BG3jNuPltLRd9ZO7ScF2Vl4LXUu0lrNddtNTdQDd/ZCVdpMF8FvxXWkwiDei
         vQd5vluy6q1clr+z8ZLHQjP9kLttfXZZZHmVO1G+H/yDovomt+Q+aMybfQNZyJ1wS7y7
         C1W40hkJF6p7dAcqaxAj+XUPoWp+TkakS5yVj7wLxggspPEqQqPsAQD5Suf+XFssv2N/
         p5H/TfmBCFRohLJZUHcFMzDWRWeOQhGZkUzNRzy3Hewl3H5GZo+x+mEye745U83wz4uK
         TLgp/JzU78DauRaGjNPsLPtEPvCCsh3CxO9kvRA4pRW/wVnRFxJEgw0iGy7Z9GBVLR8R
         U/FA==
X-Gm-Message-State: AC+VfDy1n5g/1LJln33eQAv+ZAuAtzVyBkeWjTMkVNHWfmZ11SaiCRqv
	Ut4Suq43+nAGXM21Cqm0AECBXmQm6bHT5w==
X-Google-Smtp-Source: 
 ACHHUZ5qqw5cgGI6/qLkFeV1i5mxPFvZkUe/ofZQm3xfr4w4TXbnYwlTpXRQ3Oliz8VjGH7gNSPPUQ==
X-Received: by 2002:a17:907:3606:b0:961:800b:3f57 with SMTP id
 bk6-20020a170907360600b00961800b3f57mr14857074ejc.77.1683719955031;
        Wed, 10 May 2023 04:59:15 -0700 (PDT)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch.
 [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id
 m24-20020a1709062b9800b009686a7dc71csm2617945ejg.30.2023.05.10.04.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 04:59:12 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 1D2B1BE2DE0; Wed, 10 May 2023 13:59:12 +0200 (CEST)
Date: Wed, 10 May 2023 13:59:12 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.10 1/3] ASOC: Intel: sof_sdw: add quirk for
 Intel 'Rooks County' NUC M15
Message-ID: <ZFuHEML1r5Xd6S7g@eldamar.lan>
References: <20230420110326.506279-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230420110326.506279-1-sashal@kernel.org>
Message-ID-Hash: LYR6ZRC2VSFL3OXZ47UELVBWQI5TFPOV
X-Message-ID-Hash: LYR6ZRC2VSFL3OXZ47UELVBWQI5TFPOV
X-MailFrom: salvatore.bonaccorso@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Eugene Huang <eugene.huang99@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 tiwai@suse.com, gongjun.song@intel.com, shumingf@realtek.com,
 yong.zhi@intel.com, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LYR6ZRC2VSFL3OXZ47UELVBWQI5TFPOV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Sasha,

On Thu, Apr 20, 2023 at 07:03:22AM -0400, Sasha Levin wrote:
> From: Eugene Huang <eugene.huang99@gmail.com>
> 
> [ Upstream commit 3c728b1bc5b99c5275ac5c7788ef814c0e51ef54 ]
> 
> Same quirks as the 'Bishop County' NUC M15, except the rt711 is in the
> 'JD2 100K' jack detection mode.
> 
> Link: https://github.com/thesofproject/linux/issues/4088
> Signed-off-by: Eugene Huang <eugene.huang99@gmail.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Link: https://lore.kernel.org/r/20230314090553.498664-2-yung-chuan.liao@linux.intel.com
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  sound/soc/intel/boards/sof_sdw.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
> index f5d8f7951cfc3..eb713e9c2bd22 100644
> --- a/sound/soc/intel/boards/sof_sdw.c
> +++ b/sound/soc/intel/boards/sof_sdw.c
> @@ -175,6 +175,17 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
>  					SOF_SDW_PCH_DMIC |
>  					SOF_RT711_JD_SRC_JD2),
>  	},
> +	{
> +		/* NUC15 'Rooks County' LAPRC510 and LAPRC710 skews */
> +		.callback = sof_sdw_quirk_cb,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Intel(R) Client Systems"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "LAPRC"),
> +		},
> +		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
> +					SOF_SDW_PCH_DMIC |
> +					RT711_JD2_100K),
> +	},
>  	/* TigerLake-SDCA devices */
>  	{
>  		.callback = sof_sdw_quirk_cb,
> -- 
> 2.39.2

Is this correct that this can be picked for 5.10.y? I did (by mistake)
AFAICS this is in 5.10.180-rc1, and building leads to:

sound/soc/intel/boards/sof_sdw.c:187:6: error: ‘RT711_JD2_100K’ undeclared here (not in a function)
  187 |      RT711_JD2_100K),
      |      ^~~~~~~~~~~~~~
make[7]: *** [scripts/Makefile.build:286: sound/soc/intel/boards/sof_sdw.o] Error 1
make[6]: *** [scripts/Makefile.build:503: sound/soc/intel/boards] Error 2
make[5]: *** [scripts/Makefile.build:503: sound/soc/intel] Error 2
make[4]: *** [scripts/Makefile.build:503: sound/soc] Error 2

Regards,
Salvatore
