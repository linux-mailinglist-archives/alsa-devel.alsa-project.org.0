Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C37CC4F294A
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 11:01:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50570176C;
	Tue,  5 Apr 2022 11:01:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50570176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649149316;
	bh=MXo8A8/wIUuv9w8db70UptiJnP918L1XIJKSFtWGfHE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IAdwyZYl6lIWnmXSw/xQa+s6DJLjHisU7yOjMcpCHjjSJfYqubEf+DwXMpLj4m5MH
	 7ovyOSM2BVVCFcMejVAPm4HQxVNoxeMB+YG20ytdB/TdDFxJiDg8/lcpn0QSsYZYzY
	 wZaNS6fYllo681i5Z+CHOgQbRnSZ+jto8MSZ90MM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C514DF800D1;
	Tue,  5 Apr 2022 11:00:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 014B9F8016A; Tue,  5 Apr 2022 11:00:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62605F800D1
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 11:00:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62605F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="IPdPmOQM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649149248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HSO/TqrwqUyxFxKxwKZYjfIE5/lfFHPLnUnqeq3HIT8=;
 b=IPdPmOQMSEE1XF/C3s3rhtmpiYidgc0eHtQ79DLqtbpk6mmdupX7rgfvsDe7DtZtinAznt
 mPi3/KHQJmXsXwsqiA+Qr6bN8HitF/QH1GI5K3unwMjv0wR3x66P4Kw8ZzS/Q25CRhqNwZ
 PLloOe8O6unm8jHKsK9l1lyhiafqOSQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-LIZ7FcykO1-z3xsGWwyjaQ-1; Tue, 05 Apr 2022 05:00:47 -0400
X-MC-Unique: LIZ7FcykO1-z3xsGWwyjaQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 sg13-20020a170907a40d00b006e7e8234ae2so2902028ejc.2
 for <alsa-devel@alsa-project.org>; Tue, 05 Apr 2022 02:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HSO/TqrwqUyxFxKxwKZYjfIE5/lfFHPLnUnqeq3HIT8=;
 b=NDnJyRdjjq6Zpg+J4AudYJC2TsbdnM42c7JC7ggSVrGv/BjH7G8j2I0vfB8OwjSZw9
 f81+0yQG5C8iasGablSkOWfVLd2C071RYw9Kv8xSTS/qNq/OodZ5L1RGbYqXMuxk08gg
 ZRMEOGeH+WAABP1Fz2d0VTuA4+MJuCsvZfKUOdxQv05MBvbaG6Yx2ZU4NSimXTtSynhY
 YG8KKm2aUq3O7lnGTBebCIWV8PcmhB8xkomEcODWBtDZ/hLaCJ87Hi8q0dKpLKnkXFih
 zPOdjlBDfDa/fRuUE5rlH1Hc1VBnnKECvSJjfxM7wxhvELnylwio31zyffRZtsRI21nD
 AXKQ==
X-Gm-Message-State: AOAM530rIwEv8P56qKTYwE3HUmwsL66p+aLgS0Ib0sGdhnSa+fZ2nDC/
 dft1/gr2forg5yVau8BFLv+pT8kescalHEh7bU+ZAyVyBZQ0iZT4NeTwYYoHZ0l9Qlr7yyaTKpY
 L1xdPXa8G2v3JYaOaNZ3UX10=
X-Received: by 2002:aa7:c946:0:b0:416:226f:f8a6 with SMTP id
 h6-20020aa7c946000000b00416226ff8a6mr2429363edt.360.1649149245924; 
 Tue, 05 Apr 2022 02:00:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoDqgawidQhMilYXxAI8B1jQnINDAvkJZhtA332a2gcFfHYdlmk8fXP+9rXPGfmSTwJsmNSQ==
X-Received: by 2002:aa7:c946:0:b0:416:226f:f8a6 with SMTP id
 h6-20020aa7c946000000b00416226ff8a6mr2429335edt.360.1649149245754; 
 Tue, 05 Apr 2022 02:00:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id
 gn33-20020a1709070d2100b006dfcce8be86sm5235523ejc.225.2022.04.05.02.00.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 02:00:45 -0700 (PDT)
Message-ID: <168fe6c3-6a7d-4019-16e3-066caf394b8a@redhat.com>
Date: Tue, 5 Apr 2022 11:00:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 0/2] Make headphone work on Huawei Matebook D15
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <cover.1649147890.git.mchehab@kernel.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <cover.1649147890.git.mchehab@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 linux-kernel@vger.kernel.org
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

Hi,

On 4/5/22 10:44, Mauro Carvalho Chehab wrote:
> At Huawei Matebook D15 two different GPIOs are used to control the output:
> 	- gpio0 controls the speaker output;
> 	- gpio1 controls the headphone output.
> 
> Changing both at the same time cause spurious events that are mis-interpreted
> as input events, causing troubles on apps. So, a delay is needed before turning
> on such gpios.
> 
> With this patch, plugging a headphone causes a jack event to trigger the speaker
> supply, powering down the speaker and powering up the headphone output.
> Removing the headphone also triggers the power supply, powering up the speaker
> and powering down the headphone.
> 
> Mauro Carvalho Chehab (2):
>   ASoC: Intel: sof_es8336: support a separate gpio to control headphone
>   ASoC: Intel: sof_es8336: Huawei Matebook D15 uses a headphone gpio

There is something weird with the patches here, at least for me in Thunderbird
both patches show up as nameless attachments to emails with empty bodies.

After saving the attachments the patches look good to me, so:

Acked-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans

