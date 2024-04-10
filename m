Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBE18A9EF6
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:48:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C81C4DF6;
	Thu, 18 Apr 2024 17:48:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C81C4DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455297;
	bh=7ARq7CtkufCoSJtbuCqkwQo/bhan5+eThkCUX7hkdd4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WTW1xo+oqsGx/fUBIxSxfVSDeDrTgZHyWuDZrDpY0UxMSInM/YrL0YlZcsXpMYEsU
	 ikba4JB5ESntdIQeJvACBQ2zT9wTeh1a/twu+MUGBMVExcnQSseeNNKumYu1Q3dc7r
	 de4VKrn/o/wcIkVx3nDuQ5+4cFr0v4DUtTtQVUqI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B445EF8080A; Thu, 18 Apr 2024 17:45:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C095F80800;
	Thu, 18 Apr 2024 17:45:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1448F8026D; Wed, 10 Apr 2024 14:42:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CBFBFF80130
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 14:42:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBFBFF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=GAgwiX/W
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-346406a5fb9so1068242f8f.1
        for <alsa-devel@alsa-project.org>;
 Wed, 10 Apr 2024 05:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712752965;
 x=1713357765; darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s6I23qc5vtFfA69hwi5DwiHXGwJhre0eHDpmfJgJbQg=;
        b=GAgwiX/W6cyz0SFiqv9aLtQBfrj7/W1beToP+SbYAidZg/fiaRcgc1hTSCxTV59xjQ
         Hmt7K7Md+qL5chRhb/1CD5t5eVS5/dWUoEiA9p28MyqfV4jErY58EoG7q7Re557MwExu
         QiCmDpQKA//UIbr6DL02KJusj+8iIxpR2cZkynwwVBGB/rZQNroo0j1bEyAmc4P30Ezi
         k81hGxhxhrHqlpDtnvbU0lHy6rWUHEJuRjebL49GIIscFalXKJn5NxvH9eRIRsSfiEb6
         4yYpYzb3IZNDD6rHIz9ptHfoAXf4NxKjkxUCY4NYLehV6YmTe7BvA+F1S5HMEoaxsmks
         iJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712752965; x=1713357765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s6I23qc5vtFfA69hwi5DwiHXGwJhre0eHDpmfJgJbQg=;
        b=co0T26FS3kT1jRyhzCZd9DjTsqbEGXv4rO9PckilyBP0I2S6FswxuELK4kIaQVUw/L
         dZN/vJoBOUOA23pvRyp2HJZVLqkItnwVMSQO7K27JBdEAqdMo/mfn9KNyjVe+4jZVAD3
         NNy3e2RKenu7u5EaX37+X1Luel2GHNCDk+kNqzure/7bddlAcVFhYytsVAASNqbBEVO4
         22Ujfv3KHhtiV0JF54Ho6fAHCeG7WBX6WRSculA1DSnyBcXGOHlI+wnRNeiEoLaFvUsV
         HJotp4WhSAf9Co3y/8S0t4XGCkOfsh7a8ZEGeTV3sVHQMuTIvH7eL+Sy4Vl4gLptXGhY
         02oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFUxhWqSR/J2YmD6O2YnCWC9Jfy5kE6N4BjEpzsLZ0LzhbVbFPb2bFhvSMAT/6L7in+X1pHbLhgYK6gpgO/X5SRpIuu/cZD1nkZPY=
X-Gm-Message-State: AOJu0Yy7leB/788nPzVX9ktcmINyU+mqUxirGWvTtIAVFgpXtZZbnv1/
	ckN26gcBSdblcGcv2FJpP5T0mMZ53dWGY3gBR2o7q6ft8eMpgnNN06vOUjBWuOQ=
X-Google-Smtp-Source: 
 AGHT+IGLIzv68MN2vk07ucSWBnQpWhzyZz3+w9au/M9OjAewrobTeMyExcozFPeCXalIxP/pVJHGdA==
X-Received: by 2002:a5d:64c3:0:b0:33e:19ae:3716 with SMTP id
 f3-20020a5d64c3000000b0033e19ae3716mr2319146wri.11.1712752965497;
        Wed, 10 Apr 2024 05:42:45 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 a17-20020a5d5091000000b00341ba91c1f5sm13702046wrt.102.2024.04.10.05.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 05:42:45 -0700 (PDT)
Message-ID: <6ae5ed54-4205-46ae-b903-188a8138eaa4@baylibre.com>
Date: Wed, 10 Apr 2024 14:42:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/18] ASoC: mediatek: Add common machine soundcard
 driver probe mechanism
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 broonie@kernel.org
Cc: wenst@chromium.org, lgirdwood@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 trevor.wu@mediatek.com, maso.huang@mediatek.com,
 xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
 kuninori.morimoto.gx@renesas.com, shraash@google.com,
 nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de,
 dianders@chromium.org, frank.li@vivo.com, allen-kh.cheng@mediatek.com,
 eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev,
 jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com, alpernebiyasak@gmail.com,
 ckeepax@opensource.cirrus.com, zhourui@huaqin.corp-partner.google.com,
 nfraprado@collabora.com, alsa-devel@alsa-project.org,
 shane.chien@mediatek.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20240409113310.303261-1-angelogioacchino.delregno@collabora.com>
 <20240409113310.303261-2-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409113310.303261-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2VJ4CE6N2VKHAZFNXSS6EMXN4N4V7RAX
X-Message-ID-Hash: 2VJ4CE6N2VKHAZFNXSS6EMXN4N4V7RAX
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:44:50 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2VJ4CE6N2VKHAZFNXSS6EMXN4N4V7RAX/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 09/04/2024 13:32, AngeloGioacchino Del Regno wrote:
> Add a common machine soundcard driver probe function that supports both
> DSP and AFE-direct usecases and also provides a hook for legacy machine
> soundcard driver probe mechanisms.
> 
> Note that the hook is there because, even for legacy probe, a lot of the
> actual code can still be commonized, hence still reducing duplication
> for the legacy devicetree retrocompatibility cases.
> 
> This common probe function deprecates all of the inconsistent previous
> probe mechanisms and aims to settle all of the MediaTek card drivers on
> consistent and common devicetree properties describing wanted DAIs,
> device specific DAI configuration and DAI links to codecs found on
> each device/board.

-- 
Regards,
Alexandre
