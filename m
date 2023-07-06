Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D2B749A4E
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 13:11:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32070868;
	Thu,  6 Jul 2023 13:10:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32070868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688641891;
	bh=egeReSLfzzLuhYE4h/tu6LbdDoAT1PRjhBZU8FiEUKA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lojQhLZhX/ssPVUaoxkcfzU5WpwdLkdriJoEWVDRVIRs05E59Ep1oMwefTnZX5kin
	 U5bBOrBgYuWHoGZV/lcpR+NoTf4ZLeODj/1rA9cupbBtcwM35bV8hcilP4fAXk6Ll5
	 t0klCa6netC9bUTJ7C1vPOIwm4sQ2j/Y0/F0ZvSE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91959F805A0; Thu,  6 Jul 2023 13:09:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22FDEF8057B;
	Thu,  6 Jul 2023 13:09:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CF56F8057E; Thu,  6 Jul 2023 13:09:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C588AF8055C
	for <alsa-devel@alsa-project.org>; Thu,  6 Jul 2023 13:09:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C588AF8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Eu+qCiJb
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fa48b5dc2eso732241e87.1
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jul 2023 04:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688641776; x=1691233776;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eIfq4MRzR+KoZPI1E9eD68L1Fz5A5ss/vOUye0MENZk=;
        b=Eu+qCiJb9/ZQziHich993INIybqg5yUVTuFRG8v+m1ZYi1/RozbOLY1UNN8f/ZQkZg
         6Hyb002LVetWGbB5bopkDcBSfKL4EJxQGT8Tsq7itQMAYt6vsHxczuar1nzxn/3Q/cJN
         UecBxQ9KawO3nDK/Gm97C7Y1Z7Ya42Awa8seKVpA8jsOybCHvpzYIM/0TaGqCQ7acRnB
         6KbL9xHzZDtbflOJ9gsrpJx6/AzIshQiJUXyItjUFaLOH5wI2u10tF3ylKTgb3Pv7xSK
         vxbKBadnqWFKTSRpwYAd6MPEYA4Lk0yCHRA854KXvkE6MBzzGqSBcxKMah+MsSskK1Mc
         qqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688641776; x=1691233776;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eIfq4MRzR+KoZPI1E9eD68L1Fz5A5ss/vOUye0MENZk=;
        b=HSDZGj+l1Q886fqMmMC803nYB0IY+3sN/Z8eecG4nhdk9e4ut0almMLILGYehuk+YN
         dcQUJq3MY3A+kk0vXavDs6PPL7vi9xbpqrwN5rpyJ8Cn91PZx+PBq16AjIrcdutB3IYW
         BKx0b3sediA+8pEGMFgGpfd3Lc36A77hI1bqAKbkA2LaP/Y+lyyU3wp5JoGAj1X/dW76
         ggj3NX1VlIHGI1izcSonHHg1mbH4EI7EEJewjRA/1iB7j6qeTJUrRsjzr1jyA6w5Xg6e
         52NFtt24Y7iER6jx3o3E6Uc/5TrmZmMod8kgdKWTdsPmoLJb6K3+Ji1ScbRFTTuAgGo4
         xzjg==
X-Gm-Message-State: ABy/qLYCvhEs0c72e//WlUjVh5+j1T1lCsn+XziN09yQjqrEnzyjqQgT
	jQqLbaqJn0F1UkppkWOnvnjrdZ8RczGR3LkriN3irg==
X-Google-Smtp-Source: 
 APBJJlF5NH85gPa/S229vpji4QxH175vQhrtxSWkFPBoWHTwM4BvsECkcwnnHswVVAWLFpm7U+teIw==
X-Received: by 2002:a05:6512:3da8:b0:4fb:8b2a:a4af with SMTP id
 k40-20020a0565123da800b004fb8b2aa4afmr1592839lfv.2.1688641776427;
        Thu, 06 Jul 2023 04:09:36 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 p14-20020a056000018e00b003113ed02080sm1574066wrx.95.2023.07.06.04.09.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 04:09:35 -0700 (PDT)
Message-ID: <af3ea27a-5940-5279-5590-fe7a42bdfdfa@linaro.org>
Date: Thu, 6 Jul 2023 12:09:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/8] ASoC: codecs: wcd934x: fix resource leaks on
 component remove
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Mark Brown <broonie@kernel.org>,
 Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20230705123018.30903-1-johan+linaro@kernel.org>
 <20230705123018.30903-6-johan+linaro@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230705123018.30903-6-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AQW4BY4JSFDBQPCX2MI7DY3QYX2AM22N
X-Message-ID-Hash: AQW4BY4JSFDBQPCX2MI7DY3QYX2AM22N
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AQW4BY4JSFDBQPCX2MI7DY3QYX2AM22N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 05/07/2023 13:30, Johan Hovold wrote:
> Make sure to release allocated MBHC resources also on component remove.
> 
> This is specifically needed to allow probe deferrals of the sound card
> which otherwise fails when reprobing the codec component.
> 
> Fixes: 9fb9b1690f0b ("ASoC: codecs: wcd934x: add mbhc support")
> Cc: stable@vger.kernel.org      # 5.14
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

>   sound/soc/codecs/wcd934x.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
> index a17cd75b969b..1b6e376f3833 100644
> --- a/sound/soc/codecs/wcd934x.c
> +++ b/sound/soc/codecs/wcd934x.c
> @@ -3044,6 +3044,17 @@ static int wcd934x_mbhc_init(struct snd_soc_component *component)
>   
>   	return 0;
>   }
> +
> +static void wcd934x_mbhc_deinit(struct snd_soc_component *component)
> +{
> +	struct wcd934x_codec *wcd = snd_soc_component_get_drvdata(component);
> +
> +	if (!wcd->mbhc)
> +		return;
> +
> +	wcd_mbhc_deinit(wcd->mbhc);
> +}
> +
>   static int wcd934x_comp_probe(struct snd_soc_component *component)
>   {
>   	struct wcd934x_codec *wcd = dev_get_drvdata(component->dev);
> @@ -3077,6 +3088,7 @@ static void wcd934x_comp_remove(struct snd_soc_component *comp)
>   {
>   	struct wcd934x_codec *wcd = dev_get_drvdata(comp->dev);
>   
> +	wcd934x_mbhc_deinit(comp);
>   	wcd_clsh_ctrl_free(wcd->clsh_ctrl);
>   }
>   
