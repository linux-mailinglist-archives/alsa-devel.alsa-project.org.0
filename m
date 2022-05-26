Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C00B15351F8
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 18:25:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D2E6168B;
	Thu, 26 May 2022 18:25:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D2E6168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653582352;
	bh=7ZpEQI0wNPLS9yFmIoDpovqJieGY62sZqPVAgfA1k78=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b57j2hwHdd88ZEtte3ELkMbCmkhfzhczGfZOxoydDSrxD5LSIBjuTYR/01ASPESMu
	 SmCv20H0IwuJptpH6mL4x5dDcFLn5mVETbkqJN0GJMOp2/TiLZOCchPdu/h6P47q7P
	 8Mktwst07IKlBA+yfmncgJiuzBkS5uRxH6xaOlVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2C76F80171;
	Thu, 26 May 2022 18:24:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAC7AF8014B; Thu, 26 May 2022 18:24:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACFE4F80100
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 18:24:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACFE4F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FpfCyO2y"
Received: by mail-ot1-x332.google.com with SMTP id
 c15-20020a9d684f000000b0060b097c71ecso1268629oto.10
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 09:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=neb+08dJa/RwX7npWszkK/Fr6HAXwHC5DeeyGEDl1iE=;
 b=FpfCyO2ySFPubf0IasQAKi7X8VYgFvf2kzuJUB9ckLEkm9T1eFM1CHEJnFd9hFt7fL
 snGB4PFStSiKBs7oSnMLYvGfQTLuPYm9KDVs1q82wjTZ1Hj3mUKhrAm+bn5LRhRXYKUb
 3H+gEXHGjjx7SaVyKeegQuRpgntZZfS3TTs7P4oBLIMTsaz6pLsaaWOHoljxyzQKNN+P
 8yORrzDVoMu8j08HE7dfsRWiyJyt2Tr70bZenYPpU+9ZUUQ4g15+RHatnMvFBpN6KDAS
 XwJkjpaKyWZB5q14AEyckDg9WRXLvek+zXjOLgU7ukGyIHRaS/TNLdySoIDa7rchtXrU
 eKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=neb+08dJa/RwX7npWszkK/Fr6HAXwHC5DeeyGEDl1iE=;
 b=WutLBf2zm4kWO0JWwzg4F7nrCZr/hW8lsdslX481iAQIyxcmq7PVNWQx8SNb+zmYjY
 A7xr8rT95Vdj9EE2sWiwMtDFQKh0fhqa31JnUg6tl7UCk0KipoR5mHM4EwBgWR4w6lnJ
 P60LesIjaafJ0jGlJe+qzwU1iorAOy8IHMA7GqiUUsCQK41ogHfKkplHvBqfXUtKdkWI
 1K7cWMs12fAFhfNwW/6qb+TZkbaSKmVnzl3dNgDcTCoUKWuGAP9nGfLEuSgzXf1zIb0X
 5pISnvM1EJS7kGd4fGUSDq1ah1Mblp5k1bhgm6dsOCNqBpreTdC6+oPpepFYYfYzl1Mw
 BBIA==
X-Gm-Message-State: AOAM530291gtfOcEVh8yEn5N+Qj8S25BB95FXGFSmkP0IrhtcjVS3dii
 oSacEqUNreXPwxBlmlYfSUM=
X-Google-Smtp-Source: ABdhPJx/P5kDhWfpz2tY4daO/UBXp9nGjIZ1sPkHCNEhM02oQnlf5uAYI0bXd4N34hr70JEJDm8lbA==
X-Received: by 2002:a05:6830:4182:b0:60b:16e5:c1ef with SMTP id
 r2-20020a056830418200b0060b16e5c1efmr7973276otu.137.1653582285308; 
 Thu, 26 May 2022 09:24:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a056871058b00b000f2c928ba51sm811129oan.46.2022.05.26.09.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 09:24:44 -0700 (PDT)
Date: Thu, 26 May 2022 09:24:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v3 11/15] ASoC: Intel: avs: Machine board registration
Message-ID: <20220526162443.GA60418@roeck-us.net>
References: <20220516101116.190192-1-cezary.rojewski@intel.com>
 <20220516101116.190192-12-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516101116.190192-12-cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, rad@semihalf.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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

On Mon, May 16, 2022 at 12:11:12PM +0200, Cezary Rojewski wrote:
> AVS driver operates with granular audio card division in mind.
> Super-card approach (e.g.: I2S, DMIC and HDA DAIs combined) is
> deprecated in favour of individual cards - one per each device. This
> provides necessary dynamism, especially for configurations with number
> of codecs present and makes it easier to survive auxiliary devices
> failures - one card failing to probe does not prevent others from
> succeeding.
> 
> All boards spawned by AVS are unregistered on ->remove(). This includes
> dummy codecs such as DMIC.
> 
> As all machine boards found in sound/soc/intel/boards are irreversibly
> tied to 'super-card' approach, new boards are going to be introduced.
> This temporarily increases number of boards available under /intel
> directory until skylake-driver becomes deprecated and removed.
> 
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
[ ... ]

> +
> +static int avs_register_i2s_board(struct avs_dev *adev, struct snd_soc_acpi_mach *mach)
> +{
> +	struct platform_device *board;
> +	int num_ssps;
> +	char *name;
> +	int ret;
> +
> +	num_ssps = adev->hw_cfg.i2s_caps.ctrl_count;
> +	if (fls(mach->mach_params.i2s_link_mask) > num_ssps) {
> +		dev_err(adev->dev, "Platform supports %d SSPs but board %s requires SSP%ld\n",

   sound/soc/intel/avs/board_selection.c: In function 'avs_register_i2s_board':
>> sound/soc/intel/avs/board_selection.c:328:36: warning: format '%ld' expects argument of type 'long int', but argument 5 has type 'int' [-Wformat=]
     328 |                 dev_err(adev->dev, "Platform supports %d SSPs but board %s requires SSP%ld\n",
                                                                                                  ^^^

Reported by 0-day but still made it into mainline.

Guenter
