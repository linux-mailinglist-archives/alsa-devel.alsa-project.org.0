Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 084AF42838C
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Oct 2021 22:33:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CC7F1696;
	Sun, 10 Oct 2021 22:32:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CC7F1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633898008;
	bh=M4VxTBVA8e62gxlL52G9ku2qK2Gd2epimv+pW4J1PoA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=buS9igDj3wXgPxmNtqOhApQqVg8/KRqlneQ0mq5JKjp37/tXPQWLju37IJw4A3fMQ
	 K7giel6uX01kmq86PlvzNiyl3WZQYJO17bhMoEriCPPdWxgOgCkBN+6bUYJ65vLxnh
	 3+ricc+IhC6KVCOuBsXga6ur/8WQipQJ35m0Hjx8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 420C0F804AF;
	Sun, 10 Oct 2021 22:32:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B83EEF80212; Sun, 10 Oct 2021 22:32:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2810F8016D
 for <alsa-devel@alsa-project.org>; Sun, 10 Oct 2021 22:32:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2810F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="FO8b/dwD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633897938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A2WM23iKfyJKBW5KrpSSOzCQTAjIwd99n6oiaQ5fc7c=;
 b=FO8b/dwDrIyIJ87PhbhlNpQMJVPltxwrWtVBog+sVn0vZEpRehw1FOaEv+rw3sL9MKV0Op
 kavakeip+JcFVjnBmlC4BrgbtP8MfPUG3vF5y+KFYGN1eYhz0ROMCLWNBUDnyL4UckEcuv
 j5qe8HmNdw1Tw3WIBQfEqFKDD4ntF1E=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-RfoMcxYBPSqfH6ns_7X6ug-1; Sun, 10 Oct 2021 16:32:17 -0400
X-MC-Unique: RfoMcxYBPSqfH6ns_7X6ug-1
Received: by mail-ed1-f72.google.com with SMTP id
 d3-20020a056402516300b003db863a248eso1900654ede.16
 for <alsa-devel@alsa-project.org>; Sun, 10 Oct 2021 13:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A2WM23iKfyJKBW5KrpSSOzCQTAjIwd99n6oiaQ5fc7c=;
 b=5XmkQTm9a2zAmnlXYnmE/7YiJI0d1M4iGGWLeOqDNwAmu2LvaDXrIhGHwyUo2JGwtw
 1TiY7RoBqyxdRrroW8t2NG5pF7ZWPRwfCwYME3f2zqt7UMk6C8zoH4EuBVI+T4G9T1If
 hXzD72PgLhJ9lrP3vlt5P2RtS9ubVWoop3/1a6CbnDTvnwA8uESHVQXdzfKCbDxI3gXH
 +ozbZa3j7ELgbwfDhBNbI8mtvfKnI0NQC3jc9vWTN4ntMkXIFbIE9YdvYQmc6Ooy47n/
 fvCQXUiiXhaCO77Loj7kGpwN8WQHk6Zb32oWos28xjEuBZHWYF472fGBEAUPwacIskDY
 KgFA==
X-Gm-Message-State: AOAM532i3E7G48rio19xi8cl8LOQoD51yVRqrChV0b7IkSk50+5iStV2
 Wcmc+b2gzR7Ar8MwhkGqk2X1/4nBPuiWZjJI1r567IYPy5NvvQuOzeszo7AXG0LEHHO83vDylyg
 GTMvLTWnpesI+CA/R1SM+F1o=
X-Received: by 2002:a50:cc03:: with SMTP id m3mr35811809edi.278.1633897936552; 
 Sun, 10 Oct 2021 13:32:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxL7oBHZT4EcrkFGCpdMbmkraoKZo9lhc/TO0YYTZ4dl04QSDgY9HzrEdv4Q8hLpZ5R3ywDkA==
X-Received: by 2002:a50:cc03:: with SMTP id m3mr35811794edi.278.1633897936456; 
 Sun, 10 Oct 2021 13:32:16 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id bj21sm2491946ejb.42.2021.10.10.13.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Oct 2021 13:32:16 -0700 (PDT)
Subject: Re: [PATCH v2 0/4] ASoC: Intel: bytcr_rt5651: few cleanups
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20211007170250.27997-1-andriy.shevchenko@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <0a74d8d1-2f36-18dc-56a3-4e5033dcab85@redhat.com>
Date: Sun, 10 Oct 2021 22:32:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211007170250.27997-1-andriy.shevchenko@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
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

On 10/7/21 7:02 PM, Andy Shevchenko wrote:
> The small set of cleanups against bytcr_rt5651 board file.
> 
> In v2:
> - added commit message to patch 2 (Joe, Pierre)
> - added cover letter (Pierre)
> - added Hans to Cc list (Hans)
> 
> Andy Shevchenko (4):
>   ASoC: Intel: bytcr_rt5651: Get platform data via dev_get_platdata()
>   ASoC: Intel: bytcr_rt5651: Use temporary variable for struct device
>   ASoC: Intel: bytcr_rt5651: use devm_clk_get_optional() for mclk
>   ASoC: Intel: bytcr_rt5651: Utilize dev_err_probe() to avoid log
>     saturation

Thanks, the entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans

