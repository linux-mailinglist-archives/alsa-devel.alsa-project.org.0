Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F9642838B
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Oct 2021 22:33:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AEF51690;
	Sun, 10 Oct 2021 22:32:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AEF51690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633897988;
	bh=CEtSLVJ5usDgQh7Ice00Bk3kHK4nsQ0wdcmoTi08S04=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S7MwTb11KyNkMUKZCYgyTDFKlJ2xh1JalwEY0pk/2cNly7u/2u+BmOJhQn6YjIa8D
	 xppiTuBlpDU5vuzBDrCp/1TvhfLzMUCN4Cjz/N/dqGze3G4Y6hbougrQ0PqqgkM5Br
	 3o0ohvwnXn9WVf24uqpY6aT4Tk2l2cbp7XywSY3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B60AF8032D;
	Sun, 10 Oct 2021 22:32:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78B4FF80302; Sun, 10 Oct 2021 22:31:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6EAFF8016D
 for <alsa-devel@alsa-project.org>; Sun, 10 Oct 2021 22:31:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6EAFF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Nz2isOhH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633897908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2qM1+noO5f6Akmfg35oCrKfVl0X/R5UrRZVOAH+twLU=;
 b=Nz2isOhHcK1qP8knVqiVKcPDH8xKzC8ktuDK5bqQcg3NRaRFAMTmJ491p2kSwlBNQKz9Xu
 ks0xEtOjEp4mtqfBhE2Qfb1FNR8tj0YZMtMpLOWftHne+WOdYNGOeNHPOC/4myBhuTQ06A
 dUyNGleF4IidSjj4PMIZQtlepViP5E0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-T0O4FBbkNR2ZUqDF2dqpIA-1; Sun, 10 Oct 2021 16:31:47 -0400
X-MC-Unique: T0O4FBbkNR2ZUqDF2dqpIA-1
Received: by mail-ed1-f70.google.com with SMTP id
 u23-20020a50a417000000b003db23c7e5e2so13926667edb.8
 for <alsa-devel@alsa-project.org>; Sun, 10 Oct 2021 13:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2qM1+noO5f6Akmfg35oCrKfVl0X/R5UrRZVOAH+twLU=;
 b=obCpR/ro/WrN+zk8u26z6gRVrwTpCPZCIEiAPKkAQLBeeH+cuk74gm02OoHcx5PEAC
 46c1Lm03/Q8yx3+bREcmtOf6r6Hj++qNJeMSVCtHFRBhbsF51x0jfIgn4FyvU+9Swio6
 FmEF7W1lVFv3DG/1wS4Ojr06rR0ad0sQgrt1rnHlADNwWgznlCuEK0sCbS1XD7DmyJLU
 RHQAT2J1/StOEjQ+U0QSYZZ7+PTWQ7mpQutFFzQ7KXtCd29siFBkqni/BJO/vzElDNMS
 558IlQEGAbP8pABm40ARGyo78hOa6ZgGsp6QkjBSFuaUsohmgYegsiJBkTZ2/SIDcxYZ
 IdAQ==
X-Gm-Message-State: AOAM532+6433DZqu9TYwHp4Q/AaNnD30xZqqWUwkwhH1J45lKaxnS4pv
 78SNVIEdZonVrEtamkskZAdNUwSH6GW+VoIqrXeJVLU5RHr7lXVuvYp7tJIrp/nPYKQRzoCFp5h
 XrArhl6dCS1Zs3XNjqNGw2tQ=
X-Received: by 2002:a17:906:3402:: with SMTP id
 c2mr20436904ejb.271.1633897906092; 
 Sun, 10 Oct 2021 13:31:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsTCCJeD2sHdcAkCoRgmD8hDM8YIZg1nI86MOfu7KCKbmw811KDl5Bmy5Uquq3ELP7Z4sudA==
X-Received: by 2002:a17:906:3402:: with SMTP id
 c2mr20436898ejb.271.1633897905961; 
 Sun, 10 Oct 2021 13:31:45 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id p23sm3087111edw.94.2021.10.10.13.31.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Oct 2021 13:31:45 -0700 (PDT)
Subject: Re: [PATCH v2 0/4] ASoC: Intel: bytcr_rt5640: few cleanups
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20211007165715.27463-1-andriy.shevchenko@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <3219a8c9-a9c8-25a9-95df-9aa5dbdf6815@redhat.com>
Date: Sun, 10 Oct 2021 22:31:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211007165715.27463-1-andriy.shevchenko@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>
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

On 10/7/21 6:57 PM, Andy Shevchenko wrote:
> The small set of cleanups against bytcr_rt5640 board file.
> 
> In v2:
> - added commit message to patch 2 (Joe, Pierre)
> - added cover letter (Pierre)
> - added Hans to Cc list (Hans)
> 
> Andy Shevchenko (4):
>   ASoC: Intel: bytcr_rt5640: Get platform data via dev_get_platdata()
>   ASoC: Intel: bytcr_rt5640: Use temporary variable for struct device
>   ASoC: Intel: bytcr_rt5640: use devm_clk_get_optional() for mclk
>   ASoC: Intel: bytcr_rt5640: Utilize dev_err_probe() to avoid log
>     saturation

Thanks, the entire series good to me, this one I've also
given a quick test-spin, so:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Hans de Goede <hdegoede@redhat.com>

For the series.

Regards,

Hans


