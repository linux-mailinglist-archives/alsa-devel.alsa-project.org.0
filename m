Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D36CE942984
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 10:48:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB76D2390;
	Wed, 31 Jul 2024 10:47:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB76D2390
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722415682;
	bh=3yIvDPf4c4n64KaHraqTeElhOaLSm//2zcmGLJWmaBk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tSik+CcKNyuhdVBTbU633AA4RGGlIDlsaFI6Fv7aOHoIzuARt0kD70ufo38Tkm8ph
	 beCWLwRsYe0rmn+tE8e0LEq5R/o6IE4ZVavTyl7Kjcolw8ugL/Yv48ZPbgjmZtMOk7
	 LU+QyDfDcDnqQd9ZONjr69NaNXrP+XBkr/o6ePv0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0669F805CA; Wed, 31 Jul 2024 10:47:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9790DF805CB;
	Wed, 31 Jul 2024 10:47:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8031AF801F5; Fri, 26 Jul 2024 11:07:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C7FAF8007E
	for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2024 11:07:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C7FAF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=i1a1icBX
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a7a8a4f21aeso187088866b.2
        for <alsa-devel@alsa-project.org>;
 Fri, 26 Jul 2024 02:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721984825; x=1722589625;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bw4/r9lMITSTEkd5cCo5TIRQmnIQ1OcJpAvLpq+BYEA=;
        b=i1a1icBXItOjw23VOBBMwFq7J1sZlcYOiebr473C3rAqwSTNFdCc2APhZAJd6FiEjw
         Xl8nO4hzcIBg2irddgU5TA5aFt5Bqc/DH75bWuu12VADq88y33+AHUYx4Mwr/AV+wJlJ
         XvOT0R9MmHi03KApJjiK1yXrNfdR53TZjlk+z1Cq/N1XvqY/Rr2CSqzYhMEk/y8lvkIN
         N4xRVGKD6M3IgEStqULQ5fIMV5mTWkpQJ14orEhvJdAiBZ7HvvIKtqYcAgjReeuGm40M
         wkoKhVB1M4yfLN+Dun9oewWeiE+qS2qHNixeiN3zmW+aDqJW/9gAVJKFkfoR59AxxNtg
         Bcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721984825; x=1722589625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bw4/r9lMITSTEkd5cCo5TIRQmnIQ1OcJpAvLpq+BYEA=;
        b=lQqmrNuUXbniUfbtavUc3E0n3ZA7bhCNckGmhjFs4Kg5H4Ysf30mKkTkBMAWZA/AYT
         mTLjgb2DTgdAPQrH6+YRtFQ0ZILHK0v0mMaJuQKyiWQzd8dETsmEz9kpHuynJIFfJ/Tb
         c6iNLbQN8WpV1gfPquH8ac++h+QGMI8PJXpQwHh7U1omNGSSVrYwxYwB/F1Soq9WVO3+
         VCozt6IC1vIs7tXbQ+dq+ZHo9PVLcBYPNvskYLZq/gc/BmqYF99EQq+j5aMJkfJ/GzSp
         iSxVhLmzVS2cpHf82olvcGb6y42ec0FOAzUL1qVLTZABNeITFqzas8X7Zm/WAm/BnNNG
         8ArA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZYoTwPWzFChObVH4GU0jUA9hMXdiBJXim/+wMEpZ5pqHqiWu+ghJfjMr8e2bFB/l96GILctsaG+rOK/b7iOn6lNx6xjYUKqXi+HU=
X-Gm-Message-State: AOJu0YwcfEKffrx6bDsuZPvYaPguUsPIltGC6pHJweFg9jBcKC3eTLh8
	4gXOkC26WItr19NFkW/f+CWWfyJt65D9eDLrxrncBz69kGAhr4mg
X-Google-Smtp-Source: 
 AGHT+IEoQEUmgZstEOUR1vOkfuzEkJVmKeDZecSqcjIA/p+1ZM4shsAPY8qdln85IyZ6agB6BRD0ow==
X-Received: by 2002:a17:907:940d:b0:a7a:b977:4c9b with SMTP id
 a640c23a62f3a-a7acb4d1951mr323675366b.27.1721984825149;
        Fri, 26 Jul 2024 02:07:05 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-37.cable.dynamic.surfer.at.
 [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab4ddb4sm152965066b.69.2024.07.26.02.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 02:07:04 -0700 (PDT)
Message-ID: <1819d604-a879-40a1-8127-5c9265eb8af9@gmail.com>
Date: Fri, 26 Jul 2024 11:07:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: constify snd_soc_component_driver struct
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Tim Harvey <tharvey@gateworks.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com
References: 
 <20240725-const_snd_soc_component_driver-v1-0-3d7ee08e129b@gmail.com>
 <20240725-const_snd_soc_component_driver-v1-2-3d7ee08e129b@gmail.com>
 <ZqNawRmAqBRLIoQq@opensource.cirrus.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <ZqNawRmAqBRLIoQq@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-MailFrom: javier.carrasco.cruz@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VUXGXAI5MPVK7O5C3E6I4W3WUUXXDTYN
X-Message-ID-Hash: VUXGXAI5MPVK7O5C3E6I4W3WUUXXDTYN
X-Mailman-Approved-At: Wed, 31 Jul 2024 08:47:05 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VUXGXAI5MPVK7O5C3E6I4W3WUUXXDTYN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 26/07/2024 10:13, Charles Keepax wrote:
> On Thu, Jul 25, 2024 at 12:31:40PM +0200, Javier Carrasco wrote:
>> The instances of the `snd_soc_component_driver` struct are not modified
>> after their declaration, and they are only passed to
>> `devm_snd_soc_register_component()`, which expects a constant
>> `snd_soc_component_driver`.
>>
>> Move all instances of `snd_soc_component_driver` to read-only sections
>> by declaring them const.
>>
>> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>> ---
>>  sound/soc/codecs/cs43130.c           | 2 +-
> 
>> -static struct snd_soc_component_driver soc_component_dev_cs43130 = {
>> +static const struct snd_soc_component_driver soc_component_dev_cs43130 = {
>>  	.probe			= cs43130_probe,
>>  	.controls		= cs43130_snd_controls,
>>  	.num_controls		= ARRAY_SIZE(cs43130_snd_controls),
> 
> This won't work for cs43130, whilst what the driver does is
> clearly slightly sketch it directly modifies this struct before
> registering it with ASoC. That would need fixed first before this
> change can be made.
> 
> Thanks,
> Charles

Hi Charles,

thanks a lot for pointing this out, somehow I failed to compile cs43130
and sti-sas, which are the only two cases in the kernel that do modify
snd_soc_component_driver after the declaration. The rest don't do that
and I just double checked that they compile cleanly.

Those two cases where modifications are required rely on values that are
not known until they are probed. I think it makes then sense that they
are left as they are, so I will drop both drivers for v2.

Best regards,
Javier Carrasco
