Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 739F242838A
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Oct 2021 22:32:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E9491687;
	Sun, 10 Oct 2021 22:31:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E9491687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633897964;
	bh=I7ZjCFfrwknONXASbRAPH70BipXV5TEM6OhQgyI07+c=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ch+7pPdRLHNNtg7MmqkT/WoLsHcxF7GNN2dEkzgeFoxkbUJ7quP/yoCPokl7eMe2e
	 fHbcqyQnoqlXy8AWX/UvX+TIZFZTXzE+VTDIDmALJ3ihHilroM80WEBgNg1nmcagu8
	 FwWPix9LYe0i/1MuNSqcYdlWFJozvRxDPayS7AYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65C0CF80059;
	Sun, 10 Oct 2021 22:31:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0871FF801F7; Sun, 10 Oct 2021 22:31:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CA69F8016D
 for <alsa-devel@alsa-project.org>; Sun, 10 Oct 2021 22:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CA69F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="C5J/2kzW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633897878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=29N8iJHpqEFBydQ2HyKe6nNjBksnkXsyb45rpziiGjY=;
 b=C5J/2kzWSxjh0ei5PH/xhwb/WBcbfMAgRBFAGPgHZIGEFkKwLhg6QJ1US4EDmZPCbLJh5e
 7frrU5H23du0Osx5w32xDJCN/0T/QLrvXU6KZMSlFqPE6Q81p69834gz0YscELwKG1m4E0
 t4CbMdxtt7eX3tKUhtql7taiTN3MYOo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-GCXohOD3OFm86-X-n6N4jA-1; Sun, 10 Oct 2021 16:31:17 -0400
X-MC-Unique: GCXohOD3OFm86-X-n6N4jA-1
Received: by mail-ed1-f70.google.com with SMTP id
 v9-20020a50d849000000b003db459aa3f5so11306758edj.15
 for <alsa-devel@alsa-project.org>; Sun, 10 Oct 2021 13:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=29N8iJHpqEFBydQ2HyKe6nNjBksnkXsyb45rpziiGjY=;
 b=xyDIXZz54W7opoLdnFhZuG5OuZImt6c054ynHiM/FK/jv3yH/NwwjkaliNGPSkqbcz
 P1qQfGdX0WifJUYipZz2tfGfDiZ3+ixQoIeXFGKeUWojjJ/yaHtKzo5EFq4WyIadT5p9
 rlyM2lP8ZNOlSOTqnIOmLB9y3UINZIgPFNb9WQewdD+3L0UnFbdM7jujhAfRbBZVEOcO
 QBeIwGHrjdkwRc8gHC/SyBKe/nzcBMFV0fYZoWoyprU27ihotVwpuGhfnEcRcUQjUEjg
 xcHM3+f9/rxajNAoAf0M6bVVCmbc/2W58Wb5rmMkQCv1JDgLAy7hDE2rHP2JuM14qIv4
 //pQ==
X-Gm-Message-State: AOAM533yUIGpn18p/lMbnKpPHzFIj2TuT4ussOxjuQ8+Ti7XUMhMBWiM
 tUuLkW2hQaNR9PYY5yK0GW4r3cRBXCgp7PjEQlPH0A0ZkwhP+CwBpZnI5memnCXnAcc21DAEDbj
 ZyYMF9OkZ4pmF2rPlES/EwHg=
X-Received: by 2002:a05:6402:268c:: with SMTP id
 w12mr34274687edd.376.1633897876331; 
 Sun, 10 Oct 2021 13:31:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSECQrx1JCOn54lLBMRIQZgcaKJygbpxJ623VAkSBF5wUhroWcQi2nR6YXENQmfu4UFK2vBw==
X-Received: by 2002:a05:6402:268c:: with SMTP id
 w12mr34274664edd.376.1633897876184; 
 Sun, 10 Oct 2021 13:31:16 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id v15sm2093119edi.89.2021.10.10.13.31.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Oct 2021 13:31:15 -0700 (PDT)
Subject: Re: [PATCH v4 0/4] ASoC: Intel: bytcht_es8316: few cleanups
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20211007164523.27094-1-andriy.shevchenko@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <9206ba12-c69f-c638-31ed-9f15ca0e6587@redhat.com>
Date: Sun, 10 Oct 2021 22:31:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211007164523.27094-1-andriy.shevchenko@linux.intel.com>
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

On 10/7/21 6:45 PM, Andy Shevchenko wrote:
> The small set of cleanups against bytcht_es8316 board file.
> 
> In v4:
> - fixed Pierre's email (Pierre)
> - added Hans to the Cc list
> 
> In v3:
> - actually added a Pierre's tag (Mark)
> 
> In v2:
> - added tag (Pierre)
> - added commit message to the patch 2 (Joe)
> 
> Andy Shevchenko (4):
>   ASoC: Intel: bytcht_es8316: Get platform data via dev_get_platdata()
>   ASoC: Intel: bytcht_es8316: Use temporary variable for struct device
>   ASoC: Intel: bytcht_es8316: Switch to use gpiod_get_optional()
>   ASoC: Intel: bytcht_es8316: Utilize dev_err_probe() to avoid log
>     saturation

Thanks, the entire series good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

For the series.

Regards,

Hans

