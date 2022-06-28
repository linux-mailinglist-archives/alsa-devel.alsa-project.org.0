Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CF855BCC1
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 02:48:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8943B1654;
	Tue, 28 Jun 2022 02:47:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8943B1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656377305;
	bh=LianCZhHDCWmZWUZsvelrGy6f67SHP8KCkDX9HsvsSY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dFf3Ms8k63swdG8eDreqnIl840emazpJZkZPDA2rYL7bGvGnoqaXH1TW1V1phKxsa
	 Qgvp9WDkjtpkuC1GobZG+rqwRjI2e4fJruLQ5GucLXqe+wxRU0aD/0JnwAe5BjXKR1
	 yaJUjNBe9FWBD91Q+yqGv+FV+SH1mC3vc35Rn3eg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08728F8028D;
	Tue, 28 Jun 2022 02:47:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29597F8028B; Tue, 28 Jun 2022 02:47:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 481BDF800E9
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 02:47:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 481BDF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gG4xBAQZ"
Received: by mail-oi1-x233.google.com with SMTP id be10so15186557oib.7
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 17:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CmaV9NQoW/Fd662ZqYGgD45ASvjbDpDWdPEsvS2puqM=;
 b=gG4xBAQZG+ETFRDPO3xDVpqxjka4QuQdvw7yyaHT/XjY6P4wj/AS1Hb+LPrNQkL4q2
 kKuD0BLK2u8RhvKJ5EQ29jUmROplqkDr0gkL56nWz27d8XdfHUDCoYNoKLDmkhXBS4Vc
 uHaXZU2keHYh/KthmyM2uKWucb3YMDoLepGVIDKGhABScKuFJsulpCT8qMXw2hBdutG3
 e5cD6+Ozi0LMM1BJJYLYYcy51HPGo8v3GdCdz/hVZC3R1SWhPegp5jp8HBlwCGbn7Tea
 uBOhvTY7v867T4Nlx0rc9ClJnjCZPKr9oSR6ZSwqJzIIhOUMp76SQyXVpYadOj70pirl
 okMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CmaV9NQoW/Fd662ZqYGgD45ASvjbDpDWdPEsvS2puqM=;
 b=BShhGyKF/E2qArZHV0aADyTqJfUmY9tKHUO6SANNsqgLnuSX8zpd0PR6pYdNt2Iujg
 7qi2zbuM4KOTn4bb56YIvL+MDB2Ur1APJIzpoxDEolmxFjj4V/xdIbDNY8hofF13HXi/
 2pXCauQK323342LjsXMFcBinaWF87aktBjSXlI4ONLngnU5Ezzc00GZ8eCeF0FrQXWxM
 m0+pD4KED5yWfHmo0G9yqDCRZ/NBYKf35rJaTyEPcxIDjnwDH3JwVCfiKSBYp39cPYZc
 PeFQIcfpvBkpfok7Dkd6rThE4cgdy8/etWPFxGwgMf7My0QJLqsK9Ky/lA2THgE6FPSy
 xY9A==
X-Gm-Message-State: AJIora9h5w2qWJrftew8MRN9Pw6LKOidOyckCeVgjnbTMBnJlTFP8tth
 bW/VixWR3qLe0T8cnavqSJ7n7DP38Qisp5DlfuU=
X-Google-Smtp-Source: AGRyM1urInjctET96oj51M0B3XZ00J8P6KIKs5gOKFT0R+ElWvC6ntuNIUQmFXbmzLc04vtCwKSOmizEMBQOA2N/MeI=
X-Received: by 2002:aca:1113:0:b0:335:6d08:31a2 with SMTP id
 19-20020aca1113000000b003356d0831a2mr5519853oir.258.1656377236924; Mon, 27
 Jun 2022 17:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220627131202.3148329-1-ckeepax@opensource.cirrus.com>
In-Reply-To: <20220627131202.3148329-1-ckeepax@opensource.cirrus.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Tue, 28 Jun 2022 06:17:05 +0530
Message-ID: <CAFqt6zaNzKioWbXrN+JqQPvy82vFqj29M36ApnjzdTV-c=6_aA@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: samsung: s3c24xx-i2s: Fix typo in DAIFMT handling
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, Mark Brown <broonie@kernel.org>
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

On Mon, Jun 27, 2022 at 6:42 PM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> The conversion of the set_fmt callback to direct clock specification
> included a small typo, correct the affected code.

sound/soc/samsung/s3c24xx-i2s.c: In function 's3c24xx_i2s_set_fmt':
>> sound/soc/samsung/s3c24xx-i2s.c:173:14: error: 'SND_SOC_DAIFMT_BC_CFC' undeclared (first use in this function); did you mean 'SND_SOC_DAIFMT_BC_FC'?
     173 |         case SND_SOC_DAIFMT_BC_CFC:
         |              ^~~~~~~~~~~~~~~~~~~~~
         |              SND_SOC_DAIFMT_BC_FC

Adding this actual error msg from the kernel test robot will be helpful.

Reviewed-by: Souptick Joarder (HPE) <jrdr.linux@gmail.com>
>
> Fixes: 0b491c7c1b25 ("ASoC: samsung: Update to use set_fmt_new callback")
> Reported-by: kernel test robot <lkp@intel.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>
> Changes since v1:
>  - Correct fixes tag.
>
>  sound/soc/samsung/s3c24xx-i2s.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
> index 4082ad7cbcc11..c1a314b86b155 100644
> --- a/sound/soc/samsung/s3c24xx-i2s.c
> +++ b/sound/soc/samsung/s3c24xx-i2s.c
> @@ -170,7 +170,7 @@ static int s3c24xx_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
>         pr_debug("hw_params r: IISMOD: %x \n", iismod);
>
>         switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> -       case SND_SOC_DAIFMT_BC_CFC:
> +       case SND_SOC_DAIFMT_BC_FC:
>                 iismod |= S3C2410_IISMOD_SLAVE;
>                 break;
>         case SND_SOC_DAIFMT_BP_FP:
> --
> 2.30.2
>
