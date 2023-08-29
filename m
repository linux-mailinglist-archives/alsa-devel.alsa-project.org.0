Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C8378C6F9
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 16:11:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AAF5112;
	Tue, 29 Aug 2023 16:10:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AAF5112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693318286;
	bh=5ROhx+Mdg495UmpbqjupEWMNTD1OEeXWyudo+4AQwlk=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LVXWvq0QUHm1JBF/bGclJFhkWvGHA1UlAyOsq6eZSCRKeFqXxcpykivhgzZl1F28w
	 F51aAzpX6USDdf9wIrCwDW74PXfHPAv+jgbNv9wqWrmnhzqWknthTHWAVMcgs3Gcep
	 6blgYDZyqCVaT/njmrHmLB/xMgyAIggREnzjHI5k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBB4CF8023B; Tue, 29 Aug 2023 16:10:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AA8AF80155;
	Tue, 29 Aug 2023 16:10:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD7B7F80158; Tue, 29 Aug 2023 16:10:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 075E3F800D1
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 16:10:29 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id CF5A711D9;
	Tue, 29 Aug 2023 16:10:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz CF5A711D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1693318228; bh=VFizFasrmps0pK8Vm4GD/TVsSeVHbnbNGk46FkUfXyU=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=SlcKdjZHvSJuQ5tOF5JHfz3uL4SgWS5GqyKpTsLtlHxZF/8KmjceLfG8zOxdF+ULh
	 U43J0A2sLxkOWVY9Hh6W3te/cZKYSwXFrBF1JKGuzPa6KoK9XV6KTc6fk8LobiGeAb
	 dqlt6xSIeE9+wjRBGhaAew2MQJXFc0CUreCdZBes=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 29 Aug 2023 16:10:24 +0200 (CEST)
Message-ID: <9b71579b-3c2c-aafc-64d0-ae16603de82b@perex.cz>
Date: Tue, 29 Aug 2023 16:10:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.com>
References: <20230829135252.3915124-1-andriy.shevchenko@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v1 1/1] ALSA: control: Use list_for_each_entry_safe()
In-Reply-To: <20230829135252.3915124-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CCUY5OPZSYAP6D6NROWL3UQ5K4636CRE
X-Message-ID-Hash: CCUY5OPZSYAP6D6NROWL3UQ5K4636CRE
X-MailFrom: perex@perex.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CCUY5OPZSYAP6D6NROWL3UQ5K4636CRE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29. 08. 23 15:52, Andy Shevchenko wrote:
> Instead of reiterating the list, use list_for_each_entry_safe()
> that allows to continue without starting over.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> 
> Takashi, if you have anybody or want yourself to spend some time,
> I believe you can simplify a lot the parser in this file with
> the help of lib/cmdline.c APIs.

You probably mean next_arg() function. Unfortunately, it does not handle all 
cases we need to parse. The control IDs are a bit different than standard 
arguments.

>   sound/core/control_led.c | 15 +++++----------
>   1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/core/control_led.c b/sound/core/control_led.c
> index a78eb48927c7..afc9ffc388e3 100644
> --- a/sound/core/control_led.c
> +++ b/sound/core/control_led.c
> @@ -297,16 +297,13 @@ static void snd_ctl_led_clean(struct snd_card *card)
>   {
>   	unsigned int group;
>   	struct snd_ctl_led *led;
> -	struct snd_ctl_led_ctl *lctl;
> +	struct snd_ctl_led_ctl *lctl, _lctl;
>   
>   	for (group = 0; group < MAX_LED; group++) {
>   		led = &snd_ctl_leds[group];
> -repeat:
> -		list_for_each_entry(lctl, &led->controls, list)
> -			if (!card || lctl->card == card) {
> +		list_for_each_entry_safe(lctl, _lctl, &led->controls, list)
> +			if (!card || lctl->card == card)
>   				snd_ctl_led_ctl_destroy(lctl);
> -				goto repeat;
> -			}
>   	}
>   }
>   
> @@ -314,7 +311,7 @@ static int snd_ctl_led_reset(int card_number, unsigned int group)
>   {
>   	struct snd_card *card;
>   	struct snd_ctl_led *led;
> -	struct snd_ctl_led_ctl *lctl;
> +	struct snd_ctl_led_ctl *lctl, _lctl;
>   	struct snd_kcontrol_volatile *vd;
>   	bool change = false;
>   
> @@ -329,14 +326,12 @@ static int snd_ctl_led_reset(int card_number, unsigned int group)
>   		return -ENXIO;
>   	}
>   	led = &snd_ctl_leds[group];
> -repeat:
> -	list_for_each_entry(lctl, &led->controls, list)
> +	list_for_each_entry(lctl, _lctl, &led->controls, list)

The list_for_each_entry_safe() should be used here, too.

With the fix:

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

						Jaroslav
-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

