Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C02918CFDF
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 15:20:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CF4317ED;
	Fri, 20 Mar 2020 15:19:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CF4317ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584714014;
	bh=g5JnbAW3j8ylLBaTbmzrvf1LL2qu6rEhjU41ulweAQ4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HBI0y5aFBdmf0bvmhIybaShQF42+r8BcZFaSu2x6zFECQ/AAs1PJKbB5MuzJRNvBK
	 xoJDLt7vLU4hA2GKfCj/69+7V90gtUo+46LLZOdCEVQrqBrm12Vv98C1Krv6jbFH7q
	 256Zgef/DveBYmPwGr+8v3pqpUQkUi2GPRvAfS7w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D625F80162;
	Fri, 20 Mar 2020 15:18:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C603F8015B; Fri, 20 Mar 2020 15:18:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B555BF800DD
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 15:18:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B555BF800DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rYopsrW6"
Received: by mail-lf1-x142.google.com with SMTP id j17so4683269lfe.7
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 07:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=chBLQap+SYKGNzmXvbmb0fKi1zu9d0mpFF2vjia6tcw=;
 b=rYopsrW6ZFC37xZcQOcJGUhPe4rKJbBymWCv2GsSPgbw6Ied2jFWyDidXBfoxhQnj/
 UKU1jHx/MFO+8W+xnDgYChSkdE75tKHwc9u80yFKiNibb4lRXSdUKIVTjGXLayxE4xxf
 CjvYGNqBI8O+Sqw4gDelB5iEw9S11oWZ/K7xtGGWnmaHnrwiwCMD/2hAzTIKpZAA4XoM
 XZ4PVoEWfilijfs+LFvpkRm0yBAyBV9KMUjnoil9+vWLXqYmDvDlTtf9VDSAeVv2XNGK
 2hztDnyBo3PFMNFng1YZGc7alJ3NeYJ2O4+l/x/QeyYjT0FCBiG6ebuTtBHxW1gpHr7V
 z9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=chBLQap+SYKGNzmXvbmb0fKi1zu9d0mpFF2vjia6tcw=;
 b=GWcmiC1/dBDj5lFKA37O3l+UcWwlB88X0olUZM2otlP1IJZpGM2SG/h6EOmGrFWlpr
 dGnFHLgJWzIk6Oy3KCWv3IJC1u5YJjfT2H8Hx/CC53UNnjHIPHGdqemcNkfErwT/bNxt
 5r36c9js5MJ8MyAHt6LUC45cSyx6AzMvuhzVWFZ/poM6QHvOLhc1NuEsgJgH65oSU7dc
 NNxJA3KwdRAQ3P72KBL02gMA7JgMqgMIMivfL55TxO29u5uGnxYoTHdI3REuT1nDGgqY
 szCxPAGFDUE6GkyPpJQFMWw3Cf08ZnVSBmrb5B2xpJvB86RnMt60LmbIKcNKWU4Ti/Yg
 xCKQ==
X-Gm-Message-State: ANhLgQ16aduKlpL+EiJRYoIyt5QOR0/EuTz64LHkO5p/Pgyht7IUt1Ha
 5IfvnJbcG6wzilwirrf+XcOBsTyr
X-Google-Smtp-Source: ADFU+vsHb0FtO1zHy7j0zMSFIunLOXaJMhsTtAXAzU+h1Lch1pchWCJKq24Yu8lGWtxmhLFpren//w==
X-Received: by 2002:a19:c1d2:: with SMTP id r201mr5453386lff.13.1584713906485; 
 Fri, 20 Mar 2020 07:18:26 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru.
 [94.29.39.224])
 by smtp.googlemail.com with ESMTPSA id u7sm3252010lfl.81.2020.03.20.07.18.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Mar 2020 07:18:25 -0700 (PDT)
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
To: Ben Dooks <ben.dooks@codethink.co.uk>, Mark Brown <broonie@kernel.org>
References: <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
 <20200128121315.GD4689@sirena.org.uk>
 <4b90efd2-5d0c-84df-961d-80cee288e0d4@nvidia.com>
 <586ea2b9-c204-2bd1-f8e2-875e0974e42d@nvidia.com>
 <fe002ec7-ae6e-f770-b82a-49237e0b29c6@codethink.co.uk>
 <20200130131039.GC6682@sirena.org.uk>
 <1df9cc13ea636502ac09191523ff0669@codethink.co.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e28e72e7-c4c0-952a-29b7-fb49462708f1@gmail.com>
Date: Fri, 20 Mar 2020 17:18:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1df9cc13ea636502ac09191523ff0669@codethink.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>
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

19.03.2020 18:32, Ben Dooks пишет:
...
> Hmm, I may have accidentally deleted those.
> 
> I will look to see if I can re-form the series and re-send in the next
> couple of weeks. I've got no access currently to the machine and having
> to deal with working from home for the next month or so.

Great, looking forward to the new version :)
