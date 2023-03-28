Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C59B26CBC5B
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 12:16:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0161E1F0;
	Tue, 28 Mar 2023 12:15:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0161E1F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679998572;
	bh=lC0hKOmAE17iA1gBKh65atvoPCE0brTqxj9/7aDl8vo=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jaPXiuKUJ6J2KNdkxzQRQKimUwfvHP1p5V06Ok1+TbuKOd6TKWPiRhQiUzI3rCR6/
	 WX0HIF9S3gQeAfcc4Kh/kdmntiPzM/3l5E1l5EglLvPmy3AFk+idOst7pxGS0XAPKq
	 245ysjzcj24k5EkO3xPz3xJXUZtto7aYHNKhm+JA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D5C4F8024E;
	Tue, 28 Mar 2023 12:15:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37AE1F8021D; Tue, 28 Mar 2023 12:15:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D0B5F8021D
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 12:15:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D0B5F8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=EYyWjjnK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679998509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yVTl6Zqhno+wxlfGSCgUpjuBfnVHjRtvpGdjuseKXvQ=;
	b=EYyWjjnK2Gg3BXgghL4yBzpCRxgu1UfjeL1tC1gnZkSbVjn1wvFq1chzAYWzkxtVcSkeLh
	yj1/sViHRpH+Jo2jrgwZ4LwExyzs/CVo9KN3R/3h6k43QPRlbLh3tI4Sq4scuPwwJIAQUo
	yRI/TLUrx3bARWKK+xuelJLLClkuBvA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-W6j5lvtlMTiLkA3OyOTUWw-1; Tue, 28 Mar 2023 06:15:05 -0400
X-MC-Unique: W6j5lvtlMTiLkA3OyOTUWw-1
Received: by mail-ed1-f69.google.com with SMTP id
 k30-20020a50ce5e000000b00500544ebfb1so16716361edj.7
        for <alsa-devel@alsa-project.org>;
 Tue, 28 Mar 2023 03:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679998504;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yVTl6Zqhno+wxlfGSCgUpjuBfnVHjRtvpGdjuseKXvQ=;
        b=C5RQkzMGHciqldohKgjMXSmjNiPnhKxxQ7iXH9LY13qYpy6xA97pXiUXCBpT4FHM5X
         3i/pGm96H/f4hQFFI6Ta4paUTJ+tbyIGhI2RLa6zlxrQLEvxBh8aqou4lq82l3sKop/1
         Z3X1zRABEFxLtv2qfKgU2h8wjjl1uasaQZD+BFTLs1FhVhNnXUI+s7luEUxg5Rju9I/u
         dU596E89TyFHEPbt9wQ3cmGkEUmr2r697O1Auxsn3EcQ8ErOyjNZemsFIaJgLyWgPPgl
         yQeS92ayOPs+YLEURPfecutO0sfk9ZI8/kxG7A6GGiMGPYLWj2J78OX/KZsIv2blDmR1
         BhBw==
X-Gm-Message-State: AAQBX9frZkUcSzIX7X2/2zgmqcxEi45mbFeeAe4o1i0YWvBRobv8i1f1
	su0egJQ0xqs/uKEIEqD5IJxSgY1VyjDkd4Urm0hYXS705xEkLriu5yY9FA3QXU+Y4Y518VIRv6F
	f5RFGJx0cjFjjCGB1usnnbPY=
X-Received: by 2002:a05:6402:31e2:b0:4fc:c6fe:1d3a with SMTP id
 dy2-20020a05640231e200b004fcc6fe1d3amr15738425edb.22.1679998504511;
        Tue, 28 Mar 2023 03:15:04 -0700 (PDT)
X-Google-Smtp-Source: 
 AKy350YAjL4A52eBRX9X9NGG7KuyR3mYs6dt88IHCIOn5pHRYMcQvxffUNRTHX2vlt4kPN8bsRrd/w==
X-Received: by 2002:a05:6402:31e2:b0:4fc:c6fe:1d3a with SMTP id
 dy2-20020a05640231e200b004fcc6fe1d3amr15738413edb.22.1679998504260;
        Tue, 28 Mar 2023 03:15:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id
 i22-20020a17090671d600b0093348be32cfsm13232182ejk.90.2023.03.28.03.15.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 03:15:03 -0700 (PDT)
Message-ID: <ae65a407-9c39-c48a-0cb9-44b3eacda410@redhat.com>
Date: Tue, 28 Mar 2023 12:15:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] ASoC: es8316: Handle optional IRQ assignment
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20230328094901.50763-1-cristian.ciocaltea@collabora.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230328094901.50763-1-cristian.ciocaltea@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ULGH7LSXLWPQBPS42BZYEPMW7GO3LUA3
X-Message-ID-Hash: ULGH7LSXLWPQBPS42BZYEPMW7GO3LUA3
X-MailFrom: hdegoede@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ULGH7LSXLWPQBPS42BZYEPMW7GO3LUA3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On 3/28/23 11:49, Cristian Ciocaltea wrote:
> The driver is able to work fine without relying on a mandatory interrupt
> being assigned to the I2C device. This is only needed when making use of
> the jack-detect support.
> 
> However, the following warning message is always emitted when there is
> no such interrupt available:
> 
>   es8316 0-0011: Failed to get IRQ 0: -22
> 
> Do not attempt to request an IRQ if it is not available/valid. This also
> ensures the rather misleading message is not displayed anymore.
> 
> Also note the IRQ validation relies on commit dab472eb931bc291 ("i2c /
> ACPI: Use 0 to indicate that device does not have interrupt assigned").
> 
> Fixes: 822257661031 ("ASoC: es8316: Add jack-detect support")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  sound/soc/codecs/es8316.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
> index 056c3082fe02..f7d7a9c91e04 100644
> --- a/sound/soc/codecs/es8316.c
> +++ b/sound/soc/codecs/es8316.c
> @@ -842,12 +842,14 @@ static int es8316_i2c_probe(struct i2c_client *i2c_client)
>  	es8316->irq = i2c_client->irq;
>  	mutex_init(&es8316->lock);
>  
> -	ret = devm_request_threaded_irq(dev, es8316->irq, NULL, es8316_irq,
> -					IRQF_TRIGGER_HIGH | IRQF_ONESHOT | IRQF_NO_AUTOEN,
> -					"es8316", es8316);
> -	if (ret) {
> -		dev_warn(dev, "Failed to get IRQ %d: %d\n", es8316->irq, ret);
> -		es8316->irq = -ENXIO;
> +	if (es8316->irq > 0) {
> +		ret = devm_request_threaded_irq(dev, es8316->irq, NULL, es8316_irq,
> +						IRQF_TRIGGER_HIGH | IRQF_ONESHOT | IRQF_NO_AUTOEN,
> +						"es8316", es8316);
> +		if (ret) {
> +			dev_warn(dev, "Failed to get IRQ %d: %d\n", es8316->irq, ret);
> +			es8316->irq = -ENXIO;
> +		}
>  	}
>  
>  	return devm_snd_soc_register_component(&i2c_client->dev,

