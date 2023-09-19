Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5777A94A0
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 15:22:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 748559F6;
	Thu, 21 Sep 2023 15:21:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 748559F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695302524;
	bh=2LrIFoN+G83v0AhC6Mk1pS2AIEbKPxQL1hUj2gm6+sw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F2L4eTbhrpwfIejXxhZvL8sX7T4hSCDFssB+nmjXsMML5/2uO9OkoSB7ysYmYrfk8
	 1/H8mGiRY+xvoOpKVJ+/Dv2E9e7R5/YXUA17of2/2FLraIYZ6aUflKCVr/10kx2DWO
	 Bcg11gCIT76qEw44J7cr0DSnrHrSSAO0W1Rgnbz8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02955F8025A; Thu, 21 Sep 2023 15:21:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B67FAF801F5;
	Thu, 21 Sep 2023 15:21:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D1D3F801F5; Tue, 19 Sep 2023 10:35:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05016F800F4
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 10:35:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05016F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QgHtOmt7
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-31f7c87353eso1054686f8f.0
        for <alsa-devel@alsa-project.org>;
 Tue, 19 Sep 2023 01:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695112553; x=1695717353;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dV2G+63a3oMH14KZWQWuB/v9m43DyF6GjQGhHD+mfFg=;
        b=QgHtOmt7UVF02pE4q32b4uSzssovsntwOSYVTkviTykJNwuI8lXixqi/v15JYj5Rdh
         XZPQdHq3blZ93WR3ZRIJ7YrkvITFsaNgLLBw9AtU12w6vB07Ivh4BuQI7+haC2fW4CjJ
         /6x/BAmH1ilLl2nwBNnU8kKxz9b2quMwGblIaLUg+RABacrIrS36Cg3X+MAfrZOzEsSN
         mYFoY3I6n379hEs7LaLKYhN5dy2b4wv63Xv+AIeGc7hbbMGuc1PL5TE0A38ZOawZ0ULx
         qFVzxOKleqCPqIO8nKQZkzFa4INOJbLRpOQ9vRJAwKQPC41/CPR7Q2XiaB4ZRGhuagLM
         wRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695112553; x=1695717353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dV2G+63a3oMH14KZWQWuB/v9m43DyF6GjQGhHD+mfFg=;
        b=Nk5ck48gfaupalBCQgd9aSU03Fv6Pabp77RsXT1Ze3PUA4Y/GS3u2oVXgduC3PsYck
         FJIQ/WKycrlm8YMuT6O5gEfjL6aaRY6xoqAlftSB2jcupDTsgNZh/zMpR9mScrjrVaDD
         73+wLaK8Nh5Z1TrktFaO2Ckmbz5Xk9weDcOXkZCUvoeAHqDnnxPCAYjrgSLcDfwOAIEb
         pgv2jqONXPpmafB+zH+zWsuU94HDdobQETOSZVcqzIz1QmAlIfw7DeYD8kjrTVPH4oYL
         /7ztciiXxIXq2hQIlkGiCRRqyqHdMYgABG9sDGlKs6NjSfA3z3apL5JI4oQOiPqxrh1B
         sJIQ==
X-Gm-Message-State: AOJu0Yz+Kh9koEDNJQh9vVllwwMyrw0tM/diA2n9psBGlJOq9cvTSmM3
	TgV3Qzyf86ICyd5l20LsrRY=
X-Google-Smtp-Source: 
 AGHT+IHRNxRaJMpDbUET4qhMBAD4AyqktKwC1xzq6pRb+1P6VTrg6DgiBtGa+9/fJ+fj/1iRhCn9/w==
X-Received: by 2002:a5d:43c3:0:b0:31f:84c9:d75f with SMTP id
 v3-20020a5d43c3000000b0031f84c9d75fmr8965796wrr.4.1695112552745;
        Tue, 19 Sep 2023 01:35:52 -0700 (PDT)
Received: from [10.0.0.26] ([178.160.241.68])
        by smtp.gmail.com with ESMTPSA id
 k15-20020a5d628f000000b0031f729d883asm14843546wru.42.2023.09.19.01.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 01:35:52 -0700 (PDT)
Message-ID: <8e39a894-e921-51e6-c9bf-b007a08b10fb@gmail.com>
Date: Tue, 19 Sep 2023 12:35:45 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/2] ALSA: Add new driver for Marian M2 sound card
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, corbet@lwn.net,
 alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org
References: <20230918181044.7257-1-ivan.orlov0322@gmail.com>
 <20230918181044.7257-2-ivan.orlov0322@gmail.com>
 <87y1h2y4tr.wl-tiwai@suse.de>
Content-Language: en-US
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <87y1h2y4tr.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QZVAF5KH3UEHFPKIO7N3QQEO6WG2JOII
X-Message-ID-Hash: QZVAF5KH3UEHFPKIO7N3QQEO6WG2JOII
X-Mailman-Approved-At: Thu, 21 Sep 2023 13:21:09 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QZVAF5KH3UEHFPKIO7N3QQEO6WG2JOII/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 9/19/23 11:56, Takashi Iwai wrote:
> On Mon, 18 Sep 2023 20:10:44 +0200,
> Ivan Orlov wrote:
>>
>> +#include <sound/core.h>
>> +#include <sound/control.h>
>> +#include <sound/pcm.h>
>> +#include <sound/pcm_params.h>
>> +#include <sound/core.h>
>> +#include <sound/pcm.h>
>> +#include <sound/initval.h>
>> +#include <sound/info.h>
>> +#include <linux/delay.h>
>> +#include <linux/module.h>
>> +#include <linux/pci.h>
>> +#include <linux/interrupt.h>
> 
> We usually include linux/* at first, followed by sound/*.
> 
> 
>> +#define DEBUG
> 
> Any need to define this for the production system?
> 
> 
>> +struct marian_card_descriptor;
>> +struct marian_card;
>> +
>> +struct marian_card_descriptor {
>> +	char *name;
>> +	char *port_names;
>> +	unsigned int speedmode_max;
>> +	unsigned int ch_in;
>> +	unsigned int ch_out;
>> +	unsigned int midi_in;
>> +	unsigned int midi_out;
>> +	unsigned int serial_in;
>> +	unsigned int serial_out;
>> +	unsigned int wck_in;
>> +	unsigned int wck_out;
>> +
>> +	unsigned int dma_bufsize;
>> +
>> +	void (*hw_constraints_func)(struct marian_card *marian,
>> +				    struct snd_pcm_substream *substream,
>> +				    struct snd_pcm_hw_params *params);
>> +	/* custom function to set up ALSA controls */
>> +	void (*create_controls)(struct marian_card *marian);
>> +	/* init is called after probing the card */
>> +	int (*init_card)(struct marian_card *marian);
>> +	void (*free_card)(struct marian_card *marian);
>> +	/* prepare is called when ALSA is opening the card */
>> +	void (*prepare)(struct marian_card *marian);
>> +	void (*set_speedmode)(struct marian_card *marian, unsigned int speedmode);
>> +	void (*proc_status)(struct marian_card *marian, struct snd_info_buffer *buffer);
>> +	void (*proc_ports)(struct marian_card *marian, struct snd_info_buffer *buffer,
>> +			   unsigned int type);
>> +
>> +	struct snd_pcm_hardware info_playback;
>> +	struct snd_pcm_hardware info_capture;
> 
> Do we need this kind of abstraction inside the driver?
> As far as I see, the driver supports only a single model, hence there
> is no real merit of abstracted / indirect function calls.
> 
> So I stop reading at this point.
> 
> 
> thanks,
> 
> Takashi

Hi Takashi,

Thank you for the review! I will send the next version after removing 
all indirections and cleaning the code again.

--
Kind regards,
Ivan Orlov
