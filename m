Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9747E49986B
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jan 2022 22:37:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EBA91A40;
	Mon, 24 Jan 2022 22:36:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EBA91A40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643060232;
	bh=NvPqmEwCuqwZAhy1yfMq7bl57KTHaG7J5IO+pv19dvE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FT/G/q9Nbwxf1Tcak4TByr2lt3aZ5XOXcLzX8aIJzkhsC1tPnTtQuz2c2skch6PmQ
	 A4oLrH1AksroL8JdcQXe1+56wsB4Zz6hxMhdeFVcONXSPi3Am+0rDm8uHGI3Id+u0i
	 PAYvvj8RJrT14Pl0Hvcprpk02+K4/dYXZ/IauJBc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7419F80083;
	Mon, 24 Jan 2022 22:36:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CD1CF8027C; Mon, 24 Jan 2022 22:36:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98478F80083
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 22:36:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98478F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="BWEwEal3"
Received: by mail-il1-x131.google.com with SMTP id z7so240238ilb.6
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 13:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hYrpBAikiVvf40qbJLBc9ty//Ul+13OxZpBSqs7E8QM=;
 b=BWEwEal3YXIUIQmTxJT5ds6wEfBcQNsc9Rt41BH+5gLlE7aQdhT994/AEJtV5PHBLV
 31LtmQ1RiJX3OqIcmDNWyk4IGLIWl0GWyMmLj2E3Twb8VvgFbqxkcSWyLfl2GfgJ39YY
 gwAeLG6mYwMccKTTgGqUKV4l7ftQvHLCOnekM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hYrpBAikiVvf40qbJLBc9ty//Ul+13OxZpBSqs7E8QM=;
 b=f3kXoJRiRSetPrC7bINzmzx5oAm9fLNAxmjHz06gfKIxPosRo0iez7zPeSIjDso11r
 uTjOCWGu2vL6hwqvaREVYjdlrgw9AI18y56DIWW2DUaTzo/Jk3D8/iKUct/qbFb0pDn4
 t+jgJwIvk+P/y3sTWnXyKxjQDrgIiE+ouLa4WinH5GT1eBxNkC4QM0/9tybe4SF+GpDG
 MZP5IQYbEWPmAdiREzIH1yuk2/LF2a2j5kGL4MPD+fL2OrtVx8T8qsUBtiYAgSprO7WJ
 HRtM0Md7ZvL8yQVLGVNnuHSMCabOOGMuq5dkeDH9Uson16n0EeP2m8eM0g2S0aLD3HUK
 VuoQ==
X-Gm-Message-State: AOAM5318t7VxY0kzPpSg2dtaaJ+vCduzg8vYLqkJ5EzHGUyQOnY/M+xo
 lrWcPcUwL1fyjwpaUAkjNY9MGw==
X-Google-Smtp-Source: ABdhPJwIhZ//l57LlnXHcwD5eoSmWbMq6LcjCsGHRpEM0UeLtUyM20oWLQEaPRZuTj8AQyfiN6rdJA==
X-Received: by 2002:a05:6e02:1c48:: with SMTP id
 d8mr9502662ilg.297.1643060156597; 
 Mon, 24 Jan 2022 13:35:56 -0800 (PST)
Received: from ?IPv6:2601:282:8200:4c:b48b:eb27:e282:37fe?
 ([2601:282:8200:4c:b48b:eb27:e282:37fe])
 by smtp.gmail.com with ESMTPSA id b12sm2090264ilv.68.2022.01.24.13.35.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 13:35:56 -0800 (PST)
Subject: Re: [PATCH] kselftest: alsa: Add test case for writing invalid values
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shuah Khan <shuah@kernel.org>
References: <20220124151410.2715572-1-broonie@kernel.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <f9a0addc-9e81-b2c2-e5c7-d5e69dae26cd@linuxfoundation.org>
Date: Mon, 24 Jan 2022 14:35:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220124151410.2715572-1-broonie@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
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

On 1/24/22 8:14 AM, Mark Brown wrote:
> Attempt to write various invalid values for control types we know about and
> check that something sensible happens. The ABI isn't quite as clearly
> defined as one might like, rather than generating an error when an invalid
> value is written many devices will silently rewrite the value into one that
> is valid for the control. The exact value chosen is not predictable so in
> the case the write succeeds we just check that the value we read back is
> one that is valid for the control.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   tools/testing/selftests/alsa/mixer-test.c | 222 +++++++++++++++++++++-
>   1 file changed, 221 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
> index 17f158d7a767..15e05b241468 100644
> --- a/tools/testing/selftests/alsa/mixer-test.c
> +++ b/tools/testing/selftests/alsa/mixer-test.c
> @@ -13,6 +13,7 @@
>   #include <stdio.h>
>   #include <stdlib.h>
>   #include <stdbool.h>
> +#include <limits.h>
>   #include <string.h>
>   #include <getopt.h>
>   #include <stdarg.h>
> @@ -26,7 +27,7 @@
>   
>   #include "../kselftest.h"
>   
> -#define TESTS_PER_CONTROL 3
> +#define TESTS_PER_CONTROL 4
>   
>   struct card_data {
>   	snd_ctl_t *handle;
> @@ -679,6 +680,224 @@ void test_ctl_write_valid(struct ctl_data *ctl)
>   			 ctl->card->card, ctl->elem);
>   }
>   
> +bool test_ctl_write_invalid_value(struct ctl_data *ctl,
> +				  snd_ctl_elem_value_t *val)
> +{
> +	int err;
> +	long val_read;
> +
> +	/* Ideally this will fail... */
> +	err = snd_ctl_elem_write(ctl->card->handle, val);
> +	if (err < 0)
> +		return false;
> +
> +	/* ...but some devices will clamp to an in range value */
> +	err = snd_ctl_elem_read(ctl->card->handle, val);
> +	if (err < 0) {
> +		ksft_print_msg("%s failed to read: %s\n",
> +			       ctl->name, snd_strerror(err));
> +		return true;
> +	}
> +
> +	return !ctl_value_valid(ctl, val);
> +}
> +
> +bool test_ctl_write_invalid_boolean(struct ctl_data *ctl)
> +{
> +	int err, i;
> +	long val_read;
> +	bool fail = false;
> +	snd_ctl_elem_value_t *val;
> +	snd_ctl_elem_value_alloca(&val);
> +
> +	for (i = 0; i < snd_ctl_elem_info_get_count(ctl->info); i++) {
> +		snd_ctl_elem_value_copy(val, ctl->def_val);
> +		snd_ctl_elem_value_set_boolean(val, i, 2);
> +
> +		if (test_ctl_write_invalid_value(ctl, val))
> +			fail = true;
> +	}
> +
> +	return !fail;
> +}
> +
> +bool test_ctl_write_invalid_integer(struct ctl_data *ctl)
> +{
> +	int i;
> +	bool fail = false;
> +	snd_ctl_elem_value_t *val;
> +	snd_ctl_elem_value_alloca(&val);
> +
> +	for (i = 0; i < snd_ctl_elem_info_get_count(ctl->info); i++) {
> +		if (snd_ctl_elem_info_get_min(ctl->info) != LONG_MIN) {
> +			/* Just under range */
> +			snd_ctl_elem_value_copy(val, ctl->def_val);
> +			snd_ctl_elem_value_set_integer(val, i,
> +			       snd_ctl_elem_info_get_min(ctl->info) - 1);
> +
> +			if (test_ctl_write_invalid_value(ctl, val))
> +				fail = true;
> +
> +			/* Minimum representable value */
> +			snd_ctl_elem_value_copy(val, ctl->def_val);
> +			snd_ctl_elem_value_set_integer(val, i, LONG_MIN);
> +
> +			if (test_ctl_write_invalid_value(ctl, val))
> +				fail = true;
> +		}
> +
> +		if (snd_ctl_elem_info_get_max(ctl->info) != LONG_MAX) {
> +			/* Just over range */
> +			snd_ctl_elem_value_copy(val, ctl->def_val);
> +			snd_ctl_elem_value_set_integer(val, i,
> +			       snd_ctl_elem_info_get_max(ctl->info) + 1);
> +
> +			if (test_ctl_write_invalid_value(ctl, val))
> +				fail = true;
> +
> +			/* Maximum representable value */
> +			snd_ctl_elem_value_copy(val, ctl->def_val);
> +			snd_ctl_elem_value_set_integer(val, i, LONG_MAX);
> +
> +			if (test_ctl_write_invalid_value(ctl, val))
> +				fail = true;
> +		}
> +	}
> +
> +	return !fail;
> +}
> +
> +bool test_ctl_write_invalid_integer64(struct ctl_data *ctl)
> +{
> +	int i;
> +	bool fail = false;
> +	snd_ctl_elem_value_t *val;
> +	snd_ctl_elem_value_alloca(&val);
> +
> +	for (i = 0; i < snd_ctl_elem_info_get_count(ctl->info); i++) {
> +		if (snd_ctl_elem_info_get_min64(ctl->info) != LLONG_MIN) {
> +			/* Just under range */
> +			snd_ctl_elem_value_copy(val, ctl->def_val);
> +			snd_ctl_elem_value_set_integer64(val, i,
> +				snd_ctl_elem_info_get_min64(ctl->info) - 1);
> +
> +			if (test_ctl_write_invalid_value(ctl, val))
> +				fail = true;
> +
> +			/* Minimum representable value */
> +			snd_ctl_elem_value_copy(val, ctl->def_val);
> +			snd_ctl_elem_value_set_integer(val, i, LLONG_MIN);
> +
> +			if (test_ctl_write_invalid_value(ctl, val))
> +				fail = true;
> +		}
> +
> +		if (snd_ctl_elem_info_get_max64(ctl->info) != LLONG_MAX) {
> +			/* Just over range */
> +			snd_ctl_elem_value_copy(val, ctl->def_val);
> +			snd_ctl_elem_value_set_integer64(val, i,
> +				snd_ctl_elem_info_get_max64(ctl->info) + 1);
> +
> +			if (test_ctl_write_invalid_value(ctl, val))
> +				fail = true;
> +
> +			/* Maximum representable value */
> +			snd_ctl_elem_value_copy(val, ctl->def_val);
> +			snd_ctl_elem_value_set_integer(val, i, LLONG_MAX);
> +
> +			if (test_ctl_write_invalid_value(ctl, val))
> +				fail = true;
> +		}
> +	}
> +
> +	return !fail;
> +}
> +
> +bool test_ctl_write_invalid_enumerated(struct ctl_data *ctl)
> +{
> +	int err, i;
> +	unsigned int val_read;
> +	bool fail = false;
> +	snd_ctl_elem_value_t *val;
> +	snd_ctl_elem_value_alloca(&val);
> +
> +	snd_ctl_elem_value_set_id(val, ctl->id);
> +
> +	for (i = 0; i < snd_ctl_elem_info_get_count(ctl->info); i++) {
> +		/* One beyond maximum */
> +		snd_ctl_elem_value_copy(val, ctl->def_val);
> +		snd_ctl_elem_value_set_enumerated(val, i,
> +				  snd_ctl_elem_info_get_items(ctl->info));
> +
> +		if (test_ctl_write_invalid_value(ctl, val))
> +			fail = true;
> +
> +		/* Maximum representable value */
> +		snd_ctl_elem_value_copy(val, ctl->def_val);
> +		snd_ctl_elem_value_set_enumerated(val, i, UINT_MAX);
> +
> +		if (test_ctl_write_invalid_value(ctl, val))
> +			fail = true;
> +
> +	}
> +
> +	return !fail;
> +}
> +
> +
> +void test_ctl_write_invalid(struct ctl_data *ctl)
> +{
> +	bool pass;
> +	int err;
> +
> +	/* If the control is turned off let's be polite */
> +	if (snd_ctl_elem_info_is_inactive(ctl->info)) {
> +		ksft_print_msg("%s is inactive\n", ctl->name);
> +		ksft_test_result_skip("write_invalid.%d.%d\n",
> +				      ctl->card->card, ctl->elem);
> +		return;
> +	}
> +
> +	if (!snd_ctl_elem_info_is_writable(ctl->info)) {
> +		ksft_print_msg("%s is not writeable\n", ctl->name);
> +		ksft_test_result_skip("write_invalid.%d.%d\n",
> +				      ctl->card->card, ctl->elem);
> +		return;
> +	}
> +
> +	switch (snd_ctl_elem_info_get_type(ctl->info)) {
> +	case SND_CTL_ELEM_TYPE_BOOLEAN:
> +		pass = test_ctl_write_invalid_boolean(ctl);
> +		break;
> +
> +	case SND_CTL_ELEM_TYPE_INTEGER:
> +		pass = test_ctl_write_invalid_integer(ctl);
> +		break;
> +
> +	case SND_CTL_ELEM_TYPE_INTEGER64:
> +		pass = test_ctl_write_invalid_integer64(ctl);
> +		break;
> +
> +	case SND_CTL_ELEM_TYPE_ENUMERATED:
> +		pass = test_ctl_write_invalid_enumerated(ctl);
> +		break;
> +
> +	default:
> +		/* No tests for this yet */
> +		ksft_test_result_skip("write_invalid.%d.%d\n",
> +				      ctl->card->card, ctl->elem);
> +		return;
> +	}
> +
> +	/* Restore the default value to minimise disruption */
> +	err = write_and_verify(ctl, ctl->def_val, NULL);

Why not read the value and then restore the value, in case the value
before the write test is different from the ctl->def_val?

> +	if (err < 0)
> +		pass = false;
> +
> +	ksft_test_result(pass, "write_invalid.%d.%d\n",
> +			 ctl->card->card, ctl->elem);
> +}
> +
>   int main(void)
>   {
>   	struct ctl_data *ctl;
> @@ -697,6 +916,7 @@ int main(void)
>   		test_ctl_get_value(ctl);
>   		test_ctl_write_default(ctl);
>   		test_ctl_write_valid(ctl);
> +		test_ctl_write_invalid(ctl);
>   	}
>   
>   	ksft_exit_pass();
> 

thanks,
-- Shuah
