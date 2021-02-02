Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECDC30C3A6
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 16:27:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A05A16DE;
	Tue,  2 Feb 2021 16:26:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A05A16DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612279639;
	bh=pP4RFe8gnSbR6RtAOvcwSni1rrgvsp8t0HsaWcqWJU4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r92kTTY1N3s0Hi3RFG7xVxDJ/bMGs/zd6n2hsXuv6/YdgkhxJe+vlN1lypPVumU+Z
	 A9k8+9C1/YgxRBybeChWAzlXpG1GqUNsVN/mDViI3OFC7FM6P0kjiDYBekufQP5UgQ
	 f0G1cWRzuAfnDXu1Gw0IABlAIBFBZLFwf36OnWPs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80D22F801F7;
	Tue,  2 Feb 2021 16:25:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A22E4F80171; Tue,  2 Feb 2021 16:25:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F8EDF800E1
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 16:25:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F8EDF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Vv94kslT"
Received: by mail-lj1-x234.google.com with SMTP id s18so24413534ljg.7
 for <alsa-devel@alsa-project.org>; Tue, 02 Feb 2021 07:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1BFhguJtknsgKZxynMp8586vauMG7FnrvbgtjYyZdro=;
 b=Vv94kslTjxOHCof/KEF/LoLKR4nL5ltWMvPcoQIXsSRavJWqtYBiP4QkJfugy6ZSHw
 QF/4EXVfa3lenAfwmQje7P49RcR1YghY0PCAU//9kv0OcVTFjTz+s6MTZsuDvoxeNQBg
 VhJHmLc35E4FARCFj1km/HlUqEq5qSdKlViFF05bIHJYnduqZRrIF/W9XUC7LvaYe2wg
 H1qPnPgPgF1ij8aDO/c1c+3R7ZGttCyFlLtxcYJiYN+c2/hWbqX0cqLcTFyW4c+9bQO4
 8eoNEKdfAyzCfqpFKMhgFKZr15lZL86pIdGoUv/Neqjn/opYp+dRlJF99YQ2/8WOcbaG
 28Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1BFhguJtknsgKZxynMp8586vauMG7FnrvbgtjYyZdro=;
 b=CsUZEemAE6EaNr7OjTNT+71cXBpWwobgzaJrsh/ewWWLRoacqukiWNqrI9t8Lb4PQ7
 tPz6sqdB2w7p3xOqrs6FWXxknMGq1ZZicSE8oQpdFOVvotlK23a6ryfqGX/4mAE00EGI
 AKb238gWqQCLGpECxuYR0JqxWWO5m+jfgYtPHXsWG3ADi2QdnAm3odm6ChE5yYdHBm7H
 3T+LSfExi7qZf3Je/azxDxuXoFqDLfX+FHA9tDK2xWDeqm1sAiaSskOt20MIsdJOlSkO
 +bsMub99Wz7r/mNf83B1XpPWFc6KZCridwz1hsBtE5mYFpkZI9M/uQ3++RFQhrkXsXh2
 QpEw==
X-Gm-Message-State: AOAM5310DTwYpAPZKvWwuSjM1AGSCymHKLCNt6k5RN5vYy3Wc3RyeMSd
 SK+OJVgyaDMhJ2C4r5P2lJI=
X-Google-Smtp-Source: ABdhPJy9CrYxZnEFUlb+AY6IJgJ2nx7yfz9iiAllAC8BTXE/k9hwCGANIk8LURd2z3PsTK23pF1mFg==
X-Received: by 2002:a2e:7c16:: with SMTP id x22mr13561352ljc.46.1612279536183; 
 Tue, 02 Feb 2021 07:25:36 -0800 (PST)
Received: from ?IPv6:2a00:1370:814d:ea25:a10:76ff:fe69:21b6?
 ([2a00:1370:814d:ea25:a10:76ff:fe69:21b6])
 by smtp.googlemail.com with ESMTPSA id s19sm2604205ljg.43.2021.02.02.07.25.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 07:25:35 -0800 (PST)
Subject: Re: [PATCH v1 2/2] ASoC: tegra: Add RT5631 machine driver
To: Jon Hunter <jonathanh@nvidia.com>, Ion Agorria <AG0RRIA@yahoo.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Stephen Warren <swarren@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Rob Herring <robh+dt@kernel.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Ion Agorria <ion@agorria.com>
References: <20210131184101.651486-1-AG0RRIA@yahoo.com>
 <20210131184101.651486-3-AG0RRIA@yahoo.com>
 <7f4eb8f7-215e-ab3d-fcef-9243037cf246@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8d0bc6f3-45ce-565d-d80f-b50fb75e7c55@gmail.com>
Date: Tue, 2 Feb 2021 18:25:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <7f4eb8f7-215e-ab3d-fcef-9243037cf246@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

02.02.2021 16:22, Jon Hunter пишет:
> So this is very similar to tegra_rt5677, is it not possible to support
> both codecs with the same machine driver?

These codecs require individual configurations and those
"../codecs/rt5631.h" and  "../codecs/rt5677.h" aren't compatible at a
quick glance.

The tegra_rt5677 also uses outdated GPIO API and etc. Hence the new
driver should be a better base anyways.

Overall it shouldn't worth time and effort trying to squeeze these
drivers into a single one, IMO.
