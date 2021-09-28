Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A123A41B837
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 22:16:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C18D21694;
	Tue, 28 Sep 2021 22:15:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C18D21694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632860187;
	bh=aP9incyzePMdI3psEWcSsS8h2Wz1M8LqFDbi/+JCKJc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kpc5SVZZq49uSu9IRhrnbPZPZeCZztXuiFN/C7DD7YQUErxDn7I9oWVg+UxIb2lfw
	 u7GotwTHbQxYdUHPXh2qOV4x+rpx2ygPfU7jib5Xg32N6Fz0gzuJFjKILuOXLuCUwz
	 U2NG8c5ydrIHdBzKpG6QODelfdqoqp5EjpmrhVaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 210CFF804BC;
	Tue, 28 Sep 2021 22:15:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2302BF804AD; Tue, 28 Sep 2021 22:15:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2281F80105
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 22:15:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2281F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GApk4YK6"
Received: by mail-lf1-x12a.google.com with SMTP id t10so1016944lfd.8
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 13:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F6OkdMihkUU4gz9owuVrVenqdn7XROou+8F7Ev5ghXM=;
 b=GApk4YK6EMcDTed2SzhwxJTMukYPinLyPlVRg1EVdV1dFmqe/c4mTT7h1M4kjYQTJT
 lI8APBQnYhZDEMwFonwLFY5UHyToXMBeHL3wTYODxcRcBQtORJ3WYs2Civ0eG0NfNWbf
 eVNRXusSC+Otz+gsARiTO47J+cB959kesZNHKSpwYsVjvP72X3Gdd/kSzA/7nMM2v2uc
 R31RS6935wPs0ODP1ymB2gChf4s2dR57+soyc30RbulvyS6gWdLJrL4UETes5Lc9cSW/
 402hSVB2+rPRH4PGZ9zEsda2rQ15Msl1F73hNrN9K/ily1A+aC37pvM4YvncNXfjbMOI
 IyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F6OkdMihkUU4gz9owuVrVenqdn7XROou+8F7Ev5ghXM=;
 b=QT++VUoGVFeDwgp90x6BRCICyLaoaiqKEHiGcv/TUGMy8IeDr112Jp0+gfUn0J4AAj
 ROOmFF1hqAYbdIlFe6hQotH59CzP12Frcpj2m+Gp214BmRRpEZYj+bVMhJx/vajUU5lp
 sM9enZCTNLAdwiV3VjKqd00CdpTiqbs8iqwnrJ28bwEEe6lizggjRMhrjZ14yUjg/GOj
 v3il0+UBzBOMURJ5I6YI9q60qcWUvGmYg5gGgmlkbM1BwN97Z75C96mydlfUyjRG3gyp
 oUZw/Ksoi1WJ3ESuSt214FrE/YwLGPZFdojRaUSBXsTTYiV/xzDs8RyFc4Y3yQ6rYaDV
 4WhA==
X-Gm-Message-State: AOAM532mgeJNwwgIro1rDhvnm1lSsV0bRya9p2/efFziwARi1pVCMHFc
 zsjd+Q0jc7GtWNqsjNcpxl/xEC9Tngs=
X-Google-Smtp-Source: ABdhPJy44Qb+4jimz22qusg2Tl205n9RVixo0gXrudoXvS5WTL1OrYFqvOzpyf/0raTd8p5uqcUcBQ==
X-Received: by 2002:a05:6512:401e:: with SMTP id
 br30mr7270438lfb.399.1632860101978; 
 Tue, 28 Sep 2021 13:15:01 -0700 (PDT)
Received: from [192.168.2.145] (46-138-80-108.dynamic.spd-mgts.ru.
 [46.138.80.108])
 by smtp.googlemail.com with ESMTPSA id b25sm1411lff.295.2021.09.28.13.15.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 13:15:01 -0700 (PDT)
Subject: Re: [PATCH alsa-ucm-conf 1/2] bytcr-rt5640: Fix 'Headphone Switch' /
 'Headset Mic Switch' no longer getting set
To: Hans de Goede <hdegoede@redhat.com>, Jaroslav Kysela <perex@perex.cz>
References: <20210718175750.12353-1-hdegoede@redhat.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1dfbddfb-e93d-112f-d787-aa27c88a3b80@gmail.com>
Date: Tue, 28 Sep 2021 23:15:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210718175750.12353-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>
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

18.07.2021 20:57, Hans de Goede пишет:
> Commit 446d0a71b47f ("codecs/rt5640: Move out BayTrail-specific pin switches")
> moved the setting of the 'Headphone Switch' / 'Headset Mic Switch' into
> "If.hp" resp "If.hsmic" blocks. But instead of making them part of the
> True {} block inside that If, the statements where added add the top-level
> of the If {} block where they are no-ops.
> 
> Move them to inside the True blocks so that these Switches again get
> properly turned on/off. This fixes the Headphones and Headset-mic no longer
> working on bytcr-rt5640 devices.
> 
> Cc: Dmitry Osipenko <digetx@gmail.com>
> Fixes: 446d0a71b47f ("codecs/rt5640: Move out BayTrail-specific pin switches")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  ucm2/bytcr-rt5640/HiFi.conf | 36 ++++++++++++++++++++----------------
>  1 file changed, 20 insertions(+), 16 deletions(-)

Hi,

I don't see this patch in upstream alsa-ucm, is it still actual?
