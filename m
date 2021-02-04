Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E98A30F096
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 11:27:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E05C716F8;
	Thu,  4 Feb 2021 11:26:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E05C716F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612434469;
	bh=cp4K2GKnMYBfQB+WHSulvmijbJLKl5coIMQsxhA7HO0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BlOlMYUvaxclj1uB4ZITcMTVL1Tuvp8+S9zjfmLi3ldcBDCSA1dXawZnNaD5AMGQ1
	 d2JdjjaYUFn8UcsGb23kzYsPXuZuRB571cYWmuXHjGWDXtss3gW1ByV6A6fl8PJEsX
	 8CN4SGhPTHEL38/FRZFeq93bWZYVGC9g79peO2ZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB4B2F80154;
	Thu,  4 Feb 2021 11:26:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86C72F80171; Thu,  4 Feb 2021 11:26:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05BB4F80152
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 11:26:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05BB4F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="XyJs5yTR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612434363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OLWFqqioSQuJpJPY+zOLA8DJwaXfSTLmoy294A06xlY=;
 b=XyJs5yTRcExu/cjmqyBkE5bVLv/fg/yiT83YGrkfin5yfzZT6L4Epp1JLqBRWbjQ1mwCxu
 QHe85OkdbrIRIaWF948UhI6FoCdGs5s80ss8KyV5BCQekBsFH6Y94mPLPt6uWCtmzYkwp9
 Ogb2FgZ4MiGfemlxu7BGAoD4MfGFG38=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-Sggu37JPPlyHVI5FywvC1A-1; Thu, 04 Feb 2021 05:25:59 -0500
X-MC-Unique: Sggu37JPPlyHVI5FywvC1A-1
Received: by mail-ej1-f70.google.com with SMTP id k3so2363648ejr.16
 for <alsa-devel@alsa-project.org>; Thu, 04 Feb 2021 02:25:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OLWFqqioSQuJpJPY+zOLA8DJwaXfSTLmoy294A06xlY=;
 b=CkULOvIw9f1kyBxPmDtahKczNDrZ70hPt8Ml0rV/dGeQlgCaMLkTAue+tX55SueOT2
 xMuObu0M2oGIh5hO1PHxZwo7tNGKLLy3f0r1DZbsar0cSzyUC19pV863Zk/2Y9Wa0BgW
 dSR4eyN3R4Xtjf3XvPnnYXuHUOJSoRek4K9U2lQVKrucG+A/6ykxSaowyS1hNBZ9m7kX
 yhgY2dkxFo3mn4ifl8REViNKjrozlOAsLJd80gs7trP/uP7J7d+k+mMs1DYvstlQ7TXf
 jo2Xb/FoWw7gGC5yfU0Dm1VuTNjl98t48UHopvyZegsGiUGPvxj7DcZQt/RB9vBSk4Oy
 hxXw==
X-Gm-Message-State: AOAM531z+LTddzfigZxhtgMRPtp0pWJhzSq2z4zs0uPUyM5yw5ggshDd
 86COi+xFYLgFjDO4KYOGzvp4gwJv+Fqlg1mB4fbmOrv7q3f2nH9LSNmmZbIk1tK+h0qqNzAxRIr
 yFouBGrolECkH+6Jo9LjGlpBN94e6q2hd88eAu01CRkXUWOHRFrzIeVV7nOOQrBnxSdP+EiwdWa
 E=
X-Received: by 2002:a17:906:660b:: with SMTP id
 b11mr7786801ejp.458.1612434357591; 
 Thu, 04 Feb 2021 02:25:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfUEL2lUcZLgfZ9Y/2lbVtndPBhLJVsJgRX8pZK0yj1Upi/WWsjVlAqx7qWdxEnRbUuMGGGA==
X-Received: by 2002:a17:906:660b:: with SMTP id
 b11mr7786780ejp.458.1612434357413; 
 Thu, 04 Feb 2021 02:25:57 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id y8sm2119405edd.97.2021.02.04.02.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 02:25:56 -0800 (PST)
Subject: Re: [PATCH v4 0/5] MFD/ASoC: Add support for Intel Bay Trail boards
 with WM5102 codec
To: Lee Jones <lee.jones@linaro.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20210120214957.140232-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <249f1a7c-048e-d255-d860-68a97a0092c8@redhat.com>
Date: Thu, 4 Feb 2021 11:25:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210120214957.140232-1-hdegoede@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
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

Hi all,

On 1/20/21 10:49 PM, Hans de Goede wrote:
> Hi All,
> 
> Here is v4 of my series to add support for Intel Bay Trail based devices
> which use a WM5102 codec for audio output/input.
> 
> This was developed and tested on a Lenovo Yoga Tablet 1051L.
> 
> The MFD and ASoC parts do not have any build-time dependencies
> on each other. But the follow-up jack-detect series does have
> patches depending on each-other and on this series. So IMHO it
> would be best if this entire series would be merged through the
> MFD tree to make merging the follow-up series easier.
> 
> Mark, if that is ok with you (and you are happy with the ASoC
> changes) can you please Ack this ?

I believe that this series and the follow-up:

"[PATCH v4 00/13] MFD/extcon/ASoC: Rework arizona codec jack-detect support"

series are both ready for merging. All patches have Reviewed-by and/or
Acked-by tags now.

I guess it is too late for 5.12, but it would be nice to at least formulate
a plan for getting this merged after 5.12-rc1 is out. Given the
interdependencies I still believe that it is best to merge all the patches
through the mfd tree and then have Lee provide an immutable branch for the
other subsystems to merge.

Mark and extcon-maintainers (for the follow-up series) may we have your ack
for merging these through the MFD tree ?

Regards,

Hans

