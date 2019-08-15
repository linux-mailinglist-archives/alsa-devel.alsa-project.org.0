Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC98F8F25D
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:37:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7468516B8;
	Thu, 15 Aug 2019 19:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7468516B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565890649;
	bh=95XY5vTwbHvINTazOb6CHAXwK2b02NAAJHcMGY6Djbc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JxSEaWV3NoKwTtzkQrCzAAyx/OgNAYetzJsI4iHCTWAApvsojht2vKG5Dl1USHeH1
	 KZlPXCIomzCFafX6s3SNrc1FoWUTWGQ84pHTGjc9NcRf9MFVHr1tYA9AJ1lZRnAWRi
	 Fb6HAsbtZPd5GOJRMk4fzLe0oOAbuxAgzoQtWI+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B91DF8015B;
	Thu, 15 Aug 2019 19:24:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D3EFF8044C; Thu, 15 Aug 2019 19:24:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D5D4F8015B
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:24:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D5D4F8015B
Received: by mail-wm1-f65.google.com with SMTP id 207so1901191wma.1
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lIlOiwJiz/UuDX4lSGZRpCBnPQazQiW1UWLQabpozO4=;
 b=frdhpu8akFPND8oO4iAvg38rox/IRfvW+HswbS1AJC7k5xaE+cAAxu9Gb6ZPYJI4mL
 jqHYNHWdsWukTmwCltbH98XS1PjqYuSlhR0nAvw7WDdylrYvBmObF/KJFxyubNBG5tfU
 v9iqGM47M2h2Txi81kwMEEqmqME/9L72hWZHysWFkRb+YwneALkQgo9hk+c+l+kun5JU
 Auei3rkJq4zFF95pqIQTfOH85tVCT+MKk5VaJB9UkYWYOJ8i6pDC/MZpekIJ1M3LGFNa
 h/z6QN4kGtavg2jDdK8hlNl4V01TKgvocNvIbuBh5CNL5UJM0o1wpV+QT//7K7YXv631
 crbQ==
X-Gm-Message-State: APjAAAWQiwLTkFY3rcET0vi+JyxTL3Y7OW6OlHG/LaReSccTl7E0oWq8
 PLA+Bsh2KOX0uKSB9KZePEYaOg==
X-Google-Smtp-Source: APXvYqx/QEtbx/qmx2lnZhrj2WqQPCv4uRQAWjHFqyOpjBPyYU6+Z3X7Zo1Z9ez27IHFyLdpd/1vUw==
X-Received: by 2002:a1c:9648:: with SMTP id y69mr3527804wmd.122.1565889872234; 
 Thu, 15 Aug 2019 10:24:32 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id p69sm3259473wme.36.2019.08.15.10.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2019 10:24:31 -0700 (PDT)
To: Daniel Stuart <daniel.stuart14@gmail.com>
References: <20190815171300.30126-1-daniel.stuart14@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <175edc67-e0e0-f690-704e-b74b110eda16@redhat.com>
Date: Thu, 15 Aug 2019 19:24:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190815171300.30126-1-daniel.stuart14@gmail.com>
Content-Language: en-US
Cc: cezary.rojewski@intel.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Daniel Stuart <daniel.stuart@pucpr.edu.br>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ASoC: intel: cht_bsw_max98090_ti: Add all
 Chromebooks that need pmc_plt_clk_0 quirk
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On 15-08-19 19:12, Daniel Stuart wrote:
> Every single baytrail chromebook sets PMC to 0, as can be seeing
> below by searching through coreboot source code:
> 	$ grep -rl "PMC_PLT_CLK\[0\]" .
> 	./rambi/variants/glimmer/devicetree.cb
> 	./rambi/variants/clapper/devicetree.cb
> 	./rambi/variants/swanky/devicetree.cb
> 	./rambi/variants/enguarde/devicetree.cb
> 	./rambi/variants/winky/devicetree.cb
> 	./rambi/variants/kip/devicetree.cb
> 	./rambi/variants/squawks/devicetree.cb
> 	./rambi/variants/orco/devicetree.cb
> 	./rambi/variants/ninja/devicetree.cb
> 	./rambi/variants/heli/devicetree.cb
> 	./rambi/variants/sumo/devicetree.cb
> 	./rambi/variants/banjo/devicetree.cb
> 	./rambi/variants/candy/devicetree.cb
> 	./rambi/variants/gnawty/devicetree.cb
> 	./rambi/variants/rambi/devicetree.cb
> 	./rambi/variants/quawks/devicetree.cb
> 
> Plus, Cyan (only non-baytrail chromebook with max98090) also needs
> this patch for audio to work.
> 
> Thus, this commit adds all the missing devices to bsw_max98090 quirk
> table, implemented by commit a182ecd3809c ("ASoC: intel:
> cht_bsw_max98090_ti: Add quirk for boards using pmc_plt_clk_0").
> 
> Signed-off-by: Daniel Stuart <daniel.stuart14@gmail.com>

Thank you for catching this, this patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>   sound/soc/intel/boards/cht_bsw_max98090_ti.c | 98 ++++++++++++++++++++
>   1 file changed, 98 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/cht_bsw_max98090_ti.c b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
> index 33eb72545be6..83b978e7b4c4 100644
> --- a/sound/soc/intel/boards/cht_bsw_max98090_ti.c
> +++ b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
> @@ -399,6 +399,20 @@ static struct snd_soc_card snd_soc_card_cht = {
>   };
>   
>   static const struct dmi_system_id cht_max98090_quirk_table[] = {
> +	{
> +		/* Banjo model Chromebook */
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Banjo"),
> +		},
> +		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
> +	},
> +	{
> +		/* Candy model Chromebook */
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Candy"),
> +		},
> +		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
> +	},
>   	{
>   		/* Clapper model Chromebook */
>   		.matches = {
> @@ -406,6 +420,27 @@ static const struct dmi_system_id cht_max98090_quirk_table[] = {
>   		},
>   		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
>   	},
> +	{
> +		/* Cyan model Chromebook */
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Cyan"),
> +		},
> +		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
> +	},
> +	{
> +		/* Enguarde model Chromebook */
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Enguarde"),
> +		},
> +		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
> +	},
> +	{
> +		/* Glimmer model Chromebook */
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Glimmer"),
> +		},
> +		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
> +	},
>   	{
>   		/* Gnawty model Chromebook (Acer Chromebook CB3-111) */
>   		.matches = {
> @@ -413,6 +448,62 @@ static const struct dmi_system_id cht_max98090_quirk_table[] = {
>   		},
>   		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
>   	},
> +	{
> +		/* Heli model Chromebook */
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Heli"),
> +		},
> +		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
> +	},
> +	{
> +		/* Kip model Chromebook */
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Kip"),
> +		},
> +		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
> +	},
> +	{
> +		/* Ninja model Chromebook */
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Ninja"),
> +		},
> +		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
> +	},
> +	{
> +		/* Orco model Chromebook */
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Orco"),
> +		},
> +		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
> +	},
> +	{
> +		/* Quawks model Chromebook */
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Quawks"),
> +		},
> +		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
> +	},
> +	{
> +		/* Rambi model Chromebook */
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Rambi"),
> +		},
> +		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
> +	},
> +	{
> +		/* Squawks model Chromebook */
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Squawks"),
> +		},
> +		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
> +	},
> +	{
> +		/* Sumo model Chromebook */
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Sumo"),
> +		},
> +		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
> +	},
>   	{
>   		/* Swanky model Chromebook (Toshiba Chromebook 2) */
>   		.matches = {
> @@ -420,6 +511,13 @@ static const struct dmi_system_id cht_max98090_quirk_table[] = {
>   		},
>   		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
>   	},
> +	{
> +		/* Winky model Chromebook */
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Winky"),
> +		},
> +		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
> +	},
>   	{}
>   };
>   
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
