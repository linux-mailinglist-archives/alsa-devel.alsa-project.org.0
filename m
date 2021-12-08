Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8960A46DDA1
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 22:28:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19F9026FC;
	Wed,  8 Dec 2021 22:28:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19F9026FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638998936;
	bh=deth0H6BXZtCdRa4fYa1HGnfBSNRaomcrheOFbrE+Io=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PHkrZ/HWa5M4p0o1KAgGgQGETfmxI3qsazb+QmOwXb+e4hWtRNyEtzeBg2RvTDpSV
	 4xw8dsZnbR26APMmVoF67uqR84FwFZ//tH6cxFVAfuhLro/ieIo6WsU/u2U23/IEuX
	 9/+Zp0hhq7wa9vQDQGxFGQgavur9+YQTPKb1YBtc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99294F804EC;
	Wed,  8 Dec 2021 22:27:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A546F804E5; Wed,  8 Dec 2021 22:27:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93DB0F80103
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 22:27:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93DB0F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="gsYcFzAa"
Received: by mail-oi1-x234.google.com with SMTP id o4so5845068oia.10
 for <alsa-devel@alsa-project.org>; Wed, 08 Dec 2021 13:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+6Kg8hk6Iu9Pu3cLAqYxADhT5631YcWaCFKQTfINd0s=;
 b=gsYcFzAa15fPxqMzMzmfghDvXXnI5QSDxbgMrhpjhMy7muF1gzB0CeuzC5TEtSZ5w4
 VHzxhRkiB1+bgIfq7u4YvPnRuUNSwMd4fblycNiyvkPD9vI8qFP/NZChCYoU6dqZc0hx
 O6+lVt4ZWDF0ptDY8SmcX83yjdMwSj+qhHNes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+6Kg8hk6Iu9Pu3cLAqYxADhT5631YcWaCFKQTfINd0s=;
 b=x1G5AQvrQcuewBbb2Q99MGnYfHMgUIuuWTpe/c8adE7ayVdm0nn4zA//ebXUojvCo1
 gF1BE8WLpNQzz3oAUcHX/fixnx9+oBavlqCSWljDfr5eQonoM/VTnPwhGT0rjlKthe/b
 5pHiiaYH3KIg6LqLZ2v4YmxUciVMfoctmqYJI7T8EZ5IsxhjmdNbY+7FtuS9Wv8WDn7Y
 bbkq3+ex3yV3iz14qJfWVLFqd6Zax4zD/SQnguo8DzPVLm4+OdbKb3gqo42gX6nJnvos
 Wv1FHKnvR36gUzRaDWYnV1KaiU52twpYo1onq5+NbSYYVY7PUy8M1ah3o3T0+YhUWzoN
 tvcA==
X-Gm-Message-State: AOAM532WrXJB1hwmzLTYxym/7pO9BhciWuU/wDlL77rqIOubW2HKOCif
 U1R0iSy1gA2swXScdc3ZKfRQ9w==
X-Google-Smtp-Source: ABdhPJxa89a3lENmzcAzjsaiH81MXzjLZJZZY326hwCw1GT1hjzooiUdCCJqN4iglimK/HBp8CVlBQ==
X-Received: by 2002:a05:6808:8c9:: with SMTP id
 k9mr1988621oij.147.1638998855585; 
 Wed, 08 Dec 2021 13:27:35 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id s1sm656841ooo.11.2021.12.08.13.27.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 13:27:35 -0800 (PST)
Subject: Re: [PATCH v3 3/3] kselftest: alsa: Use private alsa-lib
 configuration in mixer test
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 Jaroslav Kysela <perex@perex.cz>, Shuah Khan <shuah@kernel.org>
References: <20211208211745.533603-1-broonie@kernel.org>
 <20211208211745.533603-4-broonie@kernel.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <b76dd5e0-56ba-79f4-21c2-ac5455d7fd65@linuxfoundation.org>
Date: Wed, 8 Dec 2021 14:27:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20211208211745.533603-4-broonie@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Shuah Khan <skhan@linuxfoundation.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kselftest@vger.kernel.org
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

On 12/8/21 2:17 PM, Mark Brown wrote:
> From: Jaroslav Kysela <perex@perex.cz>
> 
> As mentined by Takashi Sakamoto, the system-wide alsa-lib configuration
> may override the standard device declarations. This patch use the private
> alsa-lib configuration to set the predictable environment.
> 
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> Link: https://lore.kernel.org/r/20211208095209.1772296-1-perex@perex.cz
> [Restructure version test to keep the preprocessor happy -- broonie]
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   tools/testing/selftests/alsa/mixer-test.c | 56 ++++++++++++++++++++++-
>   1 file changed, 55 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
> index 171d33692c7b..a177676c530e 100644
> --- a/tools/testing/selftests/alsa/mixer-test.c
> +++ b/tools/testing/selftests/alsa/mixer-test.c
> @@ -46,22 +46,74 @@ struct ctl_data {
>   	struct ctl_data *next;
>   };
>   
> +static const char *alsa_config =
> +"ctl.hw {\n"
> +"	@args [ CARD ]\n"
> +"	@args.CARD.type string\n"
> +"	type hw\n"
> +"	card $CARD\n"
> +"}\n"
> +;
> +
>   int num_cards = 0;
>   int num_controls = 0;
>   struct card_data *card_list = NULL;
>   struct ctl_data *ctl_list = NULL;
>   
> +#ifdef SND_LIB_VER
> +#if SND_LIB_VERSION >= SND_LIB_VER(1, 2, 6)
> +#define LIB_HAS_LOAD_STRING
> +#endif
> +#endif
> +
> +#ifndef LIB_HAS_LOAD_STRING
> +int snd_config_load_string(snd_config_t **config, const char *s, size_t size)
> +{
> +	snd_input_t *input;
> +	snd_config_t *dst;
> +	int err;
> +
> +	assert(config && s);
> +	if (size == 0)
> +		size = strlen(s);
> +	err = snd_input_buffer_open(&input, s, size);
> +	if (err < 0)
> +		return err;
> +	err = snd_config_top(&dst);
> +	if (err < 0) {
> +		snd_input_close(input);
> +		return err;
> +	}
> +	err = snd_config_load(dst, input);
> +	snd_input_close(input);
> +	if (err < 0) {
> +		snd_config_delete(dst);
> +		return err;
> +	}
> +	*config = dst;
> +	return 0;

Why not consolidate the error path code?

> +}
> +#endif
> +
>   void find_controls(void)
>   {
>   	char name[32];
>   	int card, ctl, err;
>   	struct card_data *card_data;
>   	struct ctl_data *ctl_data;
> +	snd_config_t *config;
>   
>   	card = -1;
>   	if (snd_card_next(&card) < 0 || card < 0)
>   		return;
>   
> +	err = snd_config_load_string(&config, alsa_config, strlen(alsa_config));
> +	if (err < 0) {
> +		ksft_print_msg("Unable to parse custom alsa-lib configuration: %s\n",
> +			       snd_strerror(err));
> +		ksft_exit_fail();
> +	}
> +
>   	while (card >= 0) {
>   		sprintf(name, "hw:%d", card);
>   
> @@ -69,7 +121,7 @@ void find_controls(void)
>   		if (!card_data)
>   			ksft_exit_fail_msg("Out of memory\n");
>   
> -		err = snd_ctl_open(&card_data->handle, name, 0);
> +		err = snd_ctl_open_lconf(&card_data->handle, name, 0, config);
>   		if (err < 0) {
>   			ksft_print_msg("Failed to get hctl for card %d: %s\n",
>   				       card, snd_strerror(err));
> @@ -137,6 +189,8 @@ void find_controls(void)
>   			break;
>   		}
>   	}
> +
> +	snd_config_delete(config);
>   }
>   
>   /*

This open comment at the end of the patch looks odd. Does this compile?

> 

thanks
-- Shuah
