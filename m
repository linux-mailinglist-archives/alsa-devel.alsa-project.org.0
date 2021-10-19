Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C4F433AD5
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 17:40:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BFB21699;
	Tue, 19 Oct 2021 17:39:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BFB21699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634658003;
	bh=/LVHO/5ISm/6Pnnk0ukujn98j7GgSVV5x60c5BdmtaA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qPcdSRhaisx/N9fWLXX7cZ+GwRqJPdlrson5dbmlneY+ekYTAYvCDqP1Wq/+XX9TG
	 LNIXdNORO5Sba5/G8XMcan/zN2UgpqigVmXQjTMIJZgDsxauQX+QVVVLkTQVPkp6pL
	 SxIann33MpIy80V5yuY41sQQWlWReSIRYyg1vfis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E92AF80082;
	Tue, 19 Oct 2021 17:38:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEE70F80240; Tue, 19 Oct 2021 17:38:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8567F80082
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 17:38:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8567F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="dsVq4hrU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634657918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lBWny9l8w5QQ5c/h7R1rNUnAj1o8FomFEG/lW37JHhQ=;
 b=dsVq4hrUCB8Rpul7GF+egQSI3oSFoqfuu7TRre4yE7lo5x36sgdiYJYN34mwnefn4/P6gB
 O9kITFxbv9l1zAX7g7MrhBW2Az5MOaAdVJvVd7ECR22hmxqnfo4ud+vl+7fVxJcKTSCv/4
 VEaqdn13TQKtxMg14CDfbvYMEWlG9GY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-sX3IsqALO_2m6bGryzn4dw-1; Tue, 19 Oct 2021 11:38:34 -0400
X-MC-Unique: sX3IsqALO_2m6bGryzn4dw-1
Received: by mail-ed1-f72.google.com with SMTP id
 u10-20020a50d94a000000b003dc51565894so11306118edj.21
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 08:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lBWny9l8w5QQ5c/h7R1rNUnAj1o8FomFEG/lW37JHhQ=;
 b=cbrnC/JQccOTqg606Z2/kmqhMaJQbwf9TrYR7OehnaxzwZviiFmojuT77yd7WjWWTY
 OjYbmSXuLvDh03C7nehvfnSS67yBVTyqmrfCTdiu8iLYTkGVQKQIiU1NumiebKfRH6xM
 x+B5FUzjsDUSN0dRTURYOMjRRr11ohnmKZ9a2HIrL8MNKsAYXA4B0sybUU1xROB2DySA
 0Qxv1qQVz7DwoFhq2pIUBmto/Oc9pEQp17HJF+BgsGlrCXkKtNXn/bTMuK9FUnhr9RZu
 yjRIzIt/j5OutNWV2UMBtvPRPJvZ7PrG5x/ps6F5hg3sJmEPcuSP9GOMZ38ZLfj0BlqQ
 oxqA==
X-Gm-Message-State: AOAM530JKDYqNFcPHC/y47JALdjt6pIypdqS7euL1BZsBG0k09REFunh
 FkqvBmZa66N9SkKd3zlXn2uJaI/q2RAPcECNbN0PFCWzF9pbvxF23sqpv9QC2ZKPodZaonGx4q5
 LBSHs56qHMsLXNprB7tCxPTA=
X-Received: by 2002:a05:6402:4243:: with SMTP id
 g3mr55292107edb.381.1634657913692; 
 Tue, 19 Oct 2021 08:38:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwG/fAtFGLBchgq7PN24BSIFjwXRBZ3wtMsrjk1m8hP9cKbjUIFYOi0igzOYOGWTbohrYqsZw==
X-Received: by 2002:a05:6402:4243:: with SMTP id
 g3mr55292072edb.381.1634657913512; 
 Tue, 19 Oct 2021 08:38:33 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214?
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id r3sm11033928edo.59.2021.10.19.08.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 08:38:33 -0700 (PDT)
Message-ID: <7b1224bf-005b-03a4-5bf1-3b8ec3de6b4c@redhat.com>
Date: Tue, 19 Oct 2021 17:38:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/3] ASoC/pdx86/input: Introduce and use soc_intel_is_*()
 helpers
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mark Gross <markgross@kernel.org>, Andy Shevchenko <andy@infradead.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20211018143324.296961-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211018143324.296961-1-hdegoede@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org
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

On 10/18/21 16:33, Hans de Goede wrote:
> Hi All,
> 
> We have been open-coding x86_match_cpu() checks for enabling some
> SoC specific behavior in various places.
> 
> The sound/soc/intel drivers used to also open-code this but this was
> cleaned up a while ago introducing a number of soc_intel_is_*() helpers.
> 
> This series moves the definition of these helpers to a more public place
> and uses it in a couple of more places outside the sound tree.
> 
> Mark, I know we are a bit late in the cycle, but if you can pick up
> patch 1/3 (assuming on one objects) for 5.16, then the rest can be
> applied after 5.16-rc1 is out.
> 
> Regards,
> 
> Hans

Thank you all for the review and acks. I've pushed the entire series to:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
now, with Andy's Reviewed-by and the acks added and Andy's
nitpicks addressed.

Once the buildbot has had a chance to play with this I'll push this
out to platform-drivers-x86/for-next.

Regards,

Hans




> 
> 
> Hans de Goede (3):
>   ASoC: Intel: Move soc_intel_is_foo() helpers to a generic header
>   platform/x86: intel_int0002_vgpio: Use the new soc_intel_is_byt/cht
>     helpers
>   Input: axp20x-pek - Use new soc_intel_is_cht() helper
> 
>  drivers/input/misc/axp20x-pek.c            | 26 ++-------
>  drivers/platform/x86/intel/int0002_vgpio.c | 14 +----
>  include/linux/platform_data/x86/soc.h      | 65 ++++++++++++++++++++++
>  sound/soc/intel/common/soc-intel-quirks.h  | 51 +----------------
>  4 files changed, 75 insertions(+), 81 deletions(-)
>  create mode 100644 include/linux/platform_data/x86/soc.h
> 

