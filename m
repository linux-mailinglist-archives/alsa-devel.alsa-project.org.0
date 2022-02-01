Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B11DB4A6144
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Feb 2022 17:20:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B1D5184C;
	Tue,  1 Feb 2022 17:19:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B1D5184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643732411;
	bh=51iAkfakr6dzMJ/ZoUyXX6xPuccUsYpX14eHdjdzrwg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hy8eXsZBHlN7jgYLBmyqD7i3QaBxVkFx7sUHYC8CCh/Lo8BKpwoQmpRJ8t0JMJmVc
	 EShrKOYTX/qeh0ZzKUlHe6SM3J30ROJmauLVGfcTuVKKmsFPtfyouOGHXOJvhXAz2Y
	 GorRfwaNrtUADQ4AmzR7fanZz2XHzO2Ifuc+X6GE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76F55F80139;
	Tue,  1 Feb 2022 17:19:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93BFEF80130; Tue,  1 Feb 2022 17:19:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B754F800F8
 for <alsa-devel@alsa-project.org>; Tue,  1 Feb 2022 17:18:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B754F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="R0+TU47f"
Received: by mail-io1-xd2f.google.com with SMTP id z199so21832123iof.10
 for <alsa-devel@alsa-project.org>; Tue, 01 Feb 2022 08:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4OhZfHUxI7MPicqoltScDG1q8CggMUNIkpArrbFpx+M=;
 b=R0+TU47f92DTZ4gyJXdsjhKkiIim9NaAMFMJeB/Z1hufQTDDGYz+KGr/apRcC7LZ+b
 7bQ4PWJLq9SEO0wRpd6FI8gz6CnucdDkIp+vdXBRhKrMHkx6wYuZJIiq/yOQF+oG4mur
 ONm39mnNHToFTxXALRsBCHRMAOiRwI+VP0pyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4OhZfHUxI7MPicqoltScDG1q8CggMUNIkpArrbFpx+M=;
 b=pPKK5s+n22UkCuz1Md5f7Ri4bcJ4IniNklj6osB5p2Y/TxkJhAW1B5Hq60sfv2F6Rp
 5uqe/HOTE6qjTYiST0D112ftn3tEquTMGdenNh/N875ykdHx4+YRtvQWrIXL1nwz0vK7
 hZ11CYaJFhoY0Y0WF7tn6luI0iIdFOeJ+w+0bfPre8vvw1QyqJjntzLVpJvLTzaYZabs
 1f9iICc74jiNftNkp0LRo3NHdYNaCCSOm7Ujri8Mm/1X8M4wOTqrB4SE9OgDFxMZWmIx
 ELjuljk5gnf71cXtjEJqFfeRhlJGHApbyoh/UndT1BjqkGIWoCPGbAZaJ2iloy/0bIqo
 fA4A==
X-Gm-Message-State: AOAM533TVO7bHpy2O8kYk+fi408i6xxMn4VYIfYBKH+ecyUPvyybatXG
 gpBeFtG1k/sVgXctk0qdiksd/A==
X-Google-Smtp-Source: ABdhPJw6F7hUq1bUHc0+QqodaOIYAH/kMk0XJtay1kcklu5JOaOCBr07efnVHqfdzLQuF6dsAETktA==
X-Received: by 2002:a02:2904:: with SMTP id p4mr14021237jap.191.1643732333211; 
 Tue, 01 Feb 2022 08:18:53 -0800 (PST)
Received: from [192.168.1.128] ([71.205.29.0])
 by smtp.gmail.com with ESMTPSA id o4sm15671766iou.42.2022.02.01.08.18.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 08:18:52 -0800 (PST)
Subject: Re: [PATCH] kselftest: alsa: Check for event generation when we write
 to controls
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shuah Khan <shuah@kernel.org>
References: <20220201151551.21497-1-broonie@kernel.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <0e1bc48d-ff3e-a4f8-5f81-d6902e89458d@linuxfoundation.org>
Date: Tue, 1 Feb 2022 09:18:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220201151551.21497-1-broonie@kernel.org>
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

Hi Mark,

On 2/1/22 8:15 AM, Mark Brown wrote:
> Add some coverage of event generation to mixer-test. Rather than doing a
> separate set of writes designed to trigger events we add a step to the
> existing write_and_verify() which checks to see if the value we read back
> from non-volatile controls matches the value before writing and that an
> event is or isn't generated as appropriate. The "tests" for events then
> simply check that no spurious or missing events were detected. This avoids
> needing further logic to generate appropriate values for each control type
> and maximises coverage.
> 
> When checking for events we use a timeout of 0. This relies on the kernel
> generating any event prior to returning to userspace when setting a control.
> That is currently the case and it is difficult to see it changing, if it
> does the test will need to be updated. Using a delay of 0 means that we
> don't slow things down unduly when checking for no event or when events
> fail to be generated.
> 
> We don't check behaviour for volatile controls since we can't tell what
> the behaviour is supposed to be for any given control.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   tools/testing/selftests/alsa/mixer-test.c | 148 +++++++++++++++++++++-
>   1 file changed, 145 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
> index 0e88f4f3d802..42cf3b724586 100644
> --- a/tools/testing/selftests/alsa/mixer-test.c
> +++ b/tools/testing/selftests/alsa/mixer-test.c
> @@ -3,7 +3,7 @@
>   // kselftest for the ALSA mixer API
>   //
>   // Original author: Mark Brown <broonie@kernel.org>
> -// Copyright (c) 2021 Arm Limited
> +// Copyright (c) 2021-2 Arm Limited
>   
>   // This test will iterate over all cards detected in the system, exercising
>   // every mixer control it can find.  This may conflict with other system
> @@ -27,11 +27,12 @@
>   
>   #include "../kselftest.h"
>   
> -#define TESTS_PER_CONTROL 4
> +#define TESTS_PER_CONTROL 6
>   
>   struct card_data {
>   	snd_ctl_t *handle;
>   	int card;
> +	struct pollfd pollfd;
>   	int num_ctls;
>   	snd_ctl_elem_list_t *ctls;
>   	struct card_data *next;
> @@ -43,6 +44,8 @@ struct ctl_data {
>   	snd_ctl_elem_info_t *info;
>   	snd_ctl_elem_value_t *def_val;
>   	int elem;
> +	int event_missing;
> +	int event_spurious;
>   	struct card_data *card;
>   	struct ctl_data *next;
>   };
> @@ -149,6 +152,7 @@ void find_controls(void)
>   			if (!ctl_data)
>   				ksft_exit_fail_msg("Out of memory\n");
>   
> +			memset(ctl_data, 0, sizeof(*ctl_data));
>   			ctl_data->card = card_data;
>   			ctl_data->elem = ctl;
>   			ctl_data->name = snd_ctl_elem_list_get_name(card_data->ctls,
> @@ -184,6 +188,26 @@ void find_controls(void)
>   			ctl_list = ctl_data;
>   		}
>   
> +		/* Set up for events */
> +		err = snd_ctl_subscribe_events(card_data->handle, true);
> +		if (err < 0) {
> +			ksft_exit_fail_msg("snd_ctl_subscribe_events() failed for card %d: %d\n",
> +					   card, err);
> +		}
> +
> +		err = snd_ctl_poll_descriptors_count(card_data->handle);
> +		if (err != 1) {
> +			ksft_exit_fail_msg("Unexpected desciptor count %d for card %d\n",
> +					   err, card);
> +		}
> +
> +		err = snd_ctl_poll_descriptors(card_data->handle,
> +					       &card_data->pollfd, 1);
> +		if (err != 1) {
> +			ksft_exit_fail_msg("snd_ctl_poll_descriptors() failed for %d\n",
> +				       card, err);
> +		}
> +
>   	next_card:
>   		if (snd_card_next(&card) < 0) {
>   			ksft_print_msg("snd_card_next");
> @@ -194,6 +218,73 @@ void find_controls(void)
>   	snd_config_delete(config);
>   }
>   
> +/*
> + * Block for up to timeout ms for an event, returns a negative value
> + * on error, 0 for no event and 1 for an event.
> + */
> +int wait_for_event(struct ctl_data *ctl, int timeout)

Let's make this static.

> +{
> +	unsigned short revents;
> +	snd_ctl_event_t *event;
> +	int count, err;
> +	unsigned int mask = 0;
> +	unsigned int ev_id;
> +
> +	snd_ctl_event_alloca(&event);
> +
> +	do {
> +		err = poll(&(ctl->card->pollfd), 1, timeout);
> +		if (err < 0) {
> +			ksft_print_msg("poll() failed for %s: %s (%d)\n",
> +				       ctl->name, strerror(errno), errno);
> +			return -1;
> +		}
> +		/* Timeout */
> +		if (err == 0)
> +			return 0;
> +
> +		err = snd_ctl_poll_descriptors_revents(ctl->card->handle,
> +						       &(ctl->card->pollfd),
> +						       1, &revents);
> +		if (err < 0) {
> +			ksft_print_msg("snd_ctl_poll_desciptors_revents() failed for %s: %d\n",
> +				       ctl->name, err);
> +			return err;
> +		}
> +		if (revents & POLLERR) {
> +			ksft_print_msg("snd_ctl_poll_desciptors_revents() reported POLLERR for %s\n",
> +				       ctl->name);
> +			return -1;
> +		}
> +		/* No read events */
> +		if (!(revents & POLLIN)) {
> +			ksft_print_msg("No POLLIN\n");
> +			continue;
> +		}
> +
> +		err = snd_ctl_read(ctl->card->handle, event);
> +		if (err < 0) {
> +			ksft_print_msg("snd_ctl_read() failed for %s: %d\n",
> +			       ctl->name, err);
> +			return err;
> +		}
> +
> +		if (snd_ctl_event_get_type(event) != SND_CTL_EVENT_ELEM)
> +			continue;
> +
> +		/* The ID returned from the event is 1 less than numid */
> +		mask = snd_ctl_event_elem_get_mask(event);
> +		ev_id = snd_ctl_event_elem_get_numid(event);
> +		if (ev_id != ctl->elem + 1) {
> +			ksft_print_msg("Event for unexpected ctl %s\n",
> +				       snd_ctl_event_elem_get_name(event));
> +			continue;
> +		}
> +	} while ((mask & SND_CTL_EVENT_MASK_VALUE) != SND_CTL_EVENT_MASK_VALUE);
> +
> +	return 1;
> +}
> +
>   bool ctl_value_index_valid(struct ctl_data *ctl, snd_ctl_elem_value_t *val,
>   			   int index)
>   {
> @@ -428,7 +519,8 @@ int write_and_verify(struct ctl_data *ctl,
>   {
>   	int err, i;
>   	bool error_expected, mismatch_shown;
> -	snd_ctl_elem_value_t *read_val, *w_val;
> +	snd_ctl_elem_value_t *initial_val, *read_val, *w_val;
> +	snd_ctl_elem_value_alloca(&initial_val);
>   	snd_ctl_elem_value_alloca(&read_val);
>   	snd_ctl_elem_value_alloca(&w_val);
>   
> @@ -446,6 +538,18 @@ int write_and_verify(struct ctl_data *ctl,
>   		snd_ctl_elem_value_copy(expected_val, write_val);
>   	}
>   
> +	/* Store the value before we write */
> +	if (snd_ctl_elem_info_is_readable(ctl->info)) {
> +		snd_ctl_elem_value_set_id(initial_val, ctl->id);
> +
> +		err = snd_ctl_elem_read(ctl->card->handle, initial_val);
> +		if (err < 0) {
> +			ksft_print_msg("snd_ctl_elem_read() failed: %s\n",
> +				       snd_strerror(err));
> +			return err;
> +		}
> +	}
> +
>   	/*
>   	 * Do the write, if we have an expected value ignore the error
>   	 * and carry on to validate the expected value.
> @@ -470,6 +574,30 @@ int write_and_verify(struct ctl_data *ctl,
>   		return err;
>   	}
>   
> +	/*
> +	 * Check for an event if the value changed, or confirm that
> +	 * there was none if it didn't.  We rely on the kernel
> +	 * generating the notification before it returns from the
> +	 * write, this is currently true, should that ever change this
> +	 * will most likely break and need updating.
> +	 */
> +	if (!snd_ctl_elem_info_is_volatile(ctl->info)) {
> +		err = wait_for_event(ctl, 0);
> +		if (snd_ctl_elem_value_compare(initial_val, read_val)) {
> +			if (err < 1) {
> +				ksft_print_msg("No event generated for %s\n",
> +					       ctl->name);
> +				ctl->event_missing++;
> +			}
> +		} else {
> +			if (err != 0) {
> +				ksft_print_msg("Spurious event generated for %s\n",
> +					       ctl->name);
> +				ctl->event_spurious++;
> +			}
> +		}
> +	}
> +
>   	/*
>   	 * Use the libray to compare values, if there's a mismatch
>   	 * carry on and try to provide a more useful diagnostic than
> @@ -898,6 +1026,18 @@ void test_ctl_write_invalid(struct ctl_data *ctl)
>   			 ctl->card->card, ctl->elem);
>   }
>   
> +void test_ctl_event_missing(struct ctl_data *ctl)

Let's make this static.

> +{
> +	ksft_test_result(!ctl->event_missing, "event_missing.%d.%d\n",
> +			 ctl->card->card, ctl->elem);
> +}
> +
> +void test_ctl_event_spurious(struct ctl_data *ctl)

Let's make this static.

> +{
> +	ksft_test_result(!ctl->event_spurious, "event_spurious.%d.%d\n",
> +			 ctl->card->card, ctl->elem);
> +}
> +
>   int main(void)
>   {
>   	struct ctl_data *ctl;
> @@ -917,6 +1057,8 @@ int main(void)
>   		test_ctl_write_default(ctl);
>   		test_ctl_write_valid(ctl);
>   		test_ctl_write_invalid(ctl);
> +		test_ctl_event_missing(ctl);
> +		test_ctl_event_spurious(ctl);
>   	}
>   
>   	ksft_exit_pass();
> 

Otherwise looks good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
