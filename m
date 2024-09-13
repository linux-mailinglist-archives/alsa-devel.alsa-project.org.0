Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A50CC97C9CD
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2024 15:13:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC255E64;
	Thu, 19 Sep 2024 15:13:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC255E64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726751603;
	bh=0xNKdqrsLXQKQZnBLgIZjeVOFe5bD8eJYgL3IYNp/mE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nNQe20wh6K/Y06+8GVayTEn2pulHiAGp7OjW5N9ysGNy5/uciGY+QE0cL8CF0Kq8J
	 mnsgRm5roob/AOqffdfo7hO4qQvJHvdaZmNkWdZlDHopst+z09CX1TSAvbbZCUFHtL
	 ZOWfjKe7/ziQeC7Gul3DfXLpm7HkvbDDP5KJTupk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A28D4F805BA; Thu, 19 Sep 2024 15:12:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B30CF805C4;
	Thu, 19 Sep 2024 15:12:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AE9CF801F5; Fri, 13 Sep 2024 23:12:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC2EBF8010B
	for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2024 23:12:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC2EBF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=R8hSWV3H
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-374c4d4f219so1692260f8f.1
        for <alsa-devel@alsa-project.org>;
 Fri, 13 Sep 2024 14:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726261962; x=1726866762;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QP4N0jFbDkKOuN4zodu72FSNgcwkeZYI9qprlris/e8=;
        b=R8hSWV3H8hK3Id6OldrPLGYpZRphns3E6TcHfeK7i2vCkyo/Ik3sljuybeDiFPz5qj
         0W8nV1BdDx7Ru/hKr5it7/XXrxkfx9Hq1VBYVPRFgUVS0DI0G4wyokfJxp9gyIP55IUT
         U1x/aQ2k9zRrpFwWk4fKPgdkgXq+CaKUQKgjSrPpuAQBJ/Rv+iUAfdIgHM5jJcFjF+zl
         tx15hKTtiihWUtPotszbyKMgAqhtvtLNirDihTCIq7gA3Edd0zT0gV/WWpMj4w8tYriM
         m6DTUX0GmcunNvhW5rY4QTLaCx1pesYpG0eRv7pJZ8IyU5vu8QGIIiueFfokrL+fqSxr
         2d9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726261962; x=1726866762;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QP4N0jFbDkKOuN4zodu72FSNgcwkeZYI9qprlris/e8=;
        b=a6x0OjLAcErkBbS7rVqNH6TtYGN0oLaqz9CEKCG4AFGU59jPdEZfPUbvVinepCgXZL
         tze6xh95zgGzkLstw53DHYXzVajMPlfdBHU5Y9M/u+q3IrDlt2nS3t6FjCorMDD7XBlZ
         KWXt47K0l6mHWzd0J6Id5K8qiUckWrCbIagw8+yYuLI5CL0CXwkVjW6i7GYesckEpBjR
         iWHXkjuDqOYw+GF+4gVU3sOXOjAV7137Oz4p/X2JOTsuwWHg3ODAamp6fIYXYTUZ4uQ7
         KeVE5c9MqhaL/Kd/5OhyK3jfqfu7sz9tD9VGhVyYX4TvzIYNoUOuDEOTmNsHBQS9gns3
         WTgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY84tb6KoWwz7MOfdfWQhQ7DzfoAu0L0gjM0si5wmqpATaJfQoVv1SrOk6zjqBhPh2E0iGYsXt56uw@alsa-project.org
X-Gm-Message-State: AOJu0YxKn+4BvRh6oYeVbNXWROMNhlfqOAoOu6/QRFCz0T7bWtUeYR9H
	dt5I/sJFt6NJm0K+dAYPk0CzLpzeaVGwnNBUGFt24oxz24XttMNh
X-Google-Smtp-Source: 
 AGHT+IGfcJE76v+t0nq/ngpBNhAyG0Jx8lYj7L8r7xRuQaBHUsh5Vps4FAmFOnjokTlsatC8O0jocw==
X-Received: by 2002:a5d:6781:0:b0:374:c2e9:28b8 with SMTP id
 ffacd0b85a97d-378c2d065cemr4370850f8f.18.1726261961510;
        Fri, 13 Sep 2024 14:12:41 -0700 (PDT)
Received: from ?IPV6:2a02:8010:6606:0:24fa:de0f:fe08:38e3?
 ([2a02:8010:6606:0:24fa:de0f:fe08:38e3])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e780ddebsm101457f8f.112.2024.09.13.14.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 14:12:41 -0700 (PDT)
Message-ID: <9b0a0cd8-0994-4235-9823-37f0da1a751d@gmail.com>
Date: Fri, 13 Sep 2024 22:12:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hugh Cole-Baker <sigmaris@gmail.com>
Subject: Re: [RESEND PATCH v2] drm/bridge: dw-hdmi-i2s: set insert_pcuv bit if
 hardware supports it
To: Geraldo Nascimento <geraldogabriel@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 ALSA-devel <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <Y01E5MvrnmVhnekO@geday>
Content-Language: en-GB
In-Reply-To: <Y01E5MvrnmVhnekO@geday>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-MailFrom: sigmaris@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3TOHLHSTHYOJU7TJZ6UGM5A4I5GFLW3L
X-Message-ID-Hash: 3TOHLHSTHYOJU7TJZ6UGM5A4I5GFLW3L
X-Mailman-Approved-At: Thu, 19 Sep 2024 13:12:35 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3TOHLHSTHYOJU7TJZ6UGM5A4I5GFLW3L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Geraldo, and apologies for resurrecting a 2 year old thread...

On 17/10/2022 13:04, Geraldo Nascimento wrote:
> Hi Mark, resending this as it failed to apply in my last submission. Added
> Neil Armstrong to Cc: as hopefully he will be able to better review this.
> 
> Thanks,
> Geraldo Nascimento
> 
> ---
> 
> Starting with version 2.10a of Synopsys DesignWare HDMI controller the
> insert_pcuv bit was introduced. On RK3399pro SoM (Radxa Rock Pi N10),
> for example, if we neglect to set this bit and proceed to enable hdmi_sound
> and i2s2 on the device tree there will be extreme clipping of sound
> output, to the point that music sounds like white noise. Problem
> could also manifest as just mild cracking depending of HDMI audio
> implementation of sink. Setting insert_pcuv bit (bit 2 of
> aud_conf2 Audio Sample register) fixes this.
> 
> Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>

I also had the HDMI audio clipping issue described here, on a RK3399. This was
on a 6.1.23 kernel based on the one used by LibreELEC.tv with their out-of-tree
patches for video decoding, 4k HDMI support, etc. When testing this patch I
also updated my kernel tree to 6.10.3, and found that even without this patch,
on 6.10.3 the problem no longer happens.

I added printk to show the value of AUD_CONF2, and found that on 6.1.23, the
value is 0 before the code in this patch sets the insert_pcuv bit. On 6.10.3
the value is 4, i.e. insert_pcuv is already set.

According to the RK3399 TRM, the value-after-reset of the insert_pcuv bit is 1,
so apparently on the 6.1.23 kernel something is clearing the bit after HW reset
but before this driver sets the hw_params, and this patch sets it back to the
correct value. On 6.10.3 the bit is not cleared, i.e. this patch is seemingly
no longer necessary (but is a harmless no-op).

> 
> ---
> 
> v1->v2: SoC->SoM on description, better commenting, minor style changes,
> 	conditional application of fix for L-PCM only
> 
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio-20221017.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio-20221017.c
> @@ -42,6 +42,7 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
>  	struct dw_hdmi *hdmi = audio->hdmi;
>  	u8 conf0 = 0;
>  	u8 conf1 = 0;
> +	u8 conf2 = 0;
>  	u8 inputclkfs = 0;
>  
>  	/* it cares I2S only */
> @@ -101,6 +102,28 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
>  		return -EINVAL;
>  	}
>  
> +	/*
> +	 * dw-hdmi introduced insert_pcuv bit in
> +	 * version 2.10a.
> +	 *
> +	 * This single bit (bit 2 of HDMI_AUD_CONF2)
> +	 * when set to 1 will enable the insertion of the PCUV
> +	 * (Parity, Channel Status, User bit and Validity)
> +	 * bits on the incoming audio stream.
> +	 * 
> +	 * Support is limited to Linear PCM audio. If
> +	 * neglected, the lack of valid PCUV bits
> +	 * on L-PCM streams will cause anything from
> +	 * mild cracking to full blown extreme
> +	 * clipping depending on the HDMI audio
> +	 * implementation of the sink.
> +	 *
> +	 */
> +
> +	if (hdmi_read(audio, HDMI_DESIGN_ID) >= 0x21 &&
> +			!(hparms->iec.status[0] & IEC958_AES0_NONAUDIO))
> +		conf2 = HDMI_AUD_CONF2_INSERT_PCUV;
> +
>  	dw_hdmi_set_sample_rate(hdmi, hparms->sample_rate);
>  	dw_hdmi_set_channel_status(hdmi, hparms->iec.status);
>  	dw_hdmi_set_channel_count(hdmi, hparms->channels);
> @@ -109,6 +120,7 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
>  	hdmi_write(audio, inputclkfs, HDMI_AUD_INPUTCLKFS);
>  	hdmi_write(audio, conf0, HDMI_AUD_CONF0);
>  	hdmi_write(audio, conf1, HDMI_AUD_CONF1);
> +	hdmi_write(audio, conf2, HDMI_AUD_CONF2);
>  
>  	return 0;
>  }
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-20221017.h
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-20221017.h

btw, this patch doesn't apply without edits as these filenames are incorrect.

> @@ -931,6 +931,11 @@ enum {
>  	HDMI_AUD_CONF1_WIDTH_16 = 0x10,
>  	HDMI_AUD_CONF1_WIDTH_24 = 0x18,
>  
> +/* AUD_CONF2 field values */
> +	HDMI_AUD_CONF2_HBR = 0x01,
> +	HDMI_AUD_CONF2_NLPCM = 0x02,
> +	HDMI_AUD_CONF2_INSERT_PCUV = 0x04,
> +
>  /* AUD_CTS3 field values */
>  	HDMI_AUD_CTS3_N_SHIFT_OFFSET = 5,
>  	HDMI_AUD_CTS3_N_SHIFT_MASK = 0xe0,

Best regards,
Hugh
