Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AC03882C4
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 00:33:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CB8E1714;
	Wed, 19 May 2021 00:32:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CB8E1714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621377185;
	bh=WCzm0MCb7Qs7iKkIQbEnYB+kgruqLE6rZkUXKueBNd8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mATdj8k4YpjksRmmV79qKIBu7YXCR6TMIcnvJz7XhoO9hOutLDqUytQSYh6Y0VZas
	 Rc9+jvGlh+TYIIBxuTwyikcGqdLTfICP5Ed03N3tKC7cc15vFH2ZXTkfYsgR3x8QJ0
	 RJg57fT/AU2/gpvA4v4x+0Bmu46vCCL+dAMHUld8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D00B0F8014C;
	Wed, 19 May 2021 00:31:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44DE4F80217; Wed, 19 May 2021 00:31:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5661FF8014C
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 00:31:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5661FF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EZ1892QS"
Received: by mail-lf1-x133.google.com with SMTP id i22so16016698lfl.10
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 15:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6ljTRHwDIGzKo93ro0EyJFj979FSc4cfbPsSrjnxUwY=;
 b=EZ1892QSAlcdInwXoIsMLGfBxydo1KcRAPSMXGWFBtVz33HsOcLCnYuXraX+CikYq4
 MXk/yi+C6QME/uL9aalttKXxoKix8sL2suoO/6QP2322m4DLH4p3GWCPMULIumAk5Lfk
 3hpwqiEIOLOKEeSXwUI4Vpsry4X1eQOjE5kTns+E01m4ssxuXe0n5u1xjBQw0wFrSl6U
 ZLcF3ehyVwO4z2qWjoCfKfn9ej4x65SZ2Vex3P9E+OsEDzm94CWjj0JxOUZxAKfklGY6
 JR76fvBSQw8qjEKE2CGcEvuBVjFThmoVeDlA5WFQxFs8CIPKsi4mumcG2vsAKlt697iH
 JXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6ljTRHwDIGzKo93ro0EyJFj979FSc4cfbPsSrjnxUwY=;
 b=js6X8Pxxa/B0u0tysXUQaUQpTLI0Fx6Q9LDqGj0S9FVc2GinEtC6ml/xAU7olVW9MS
 OW5FGGAVIr9DBNGhosb+QJZjL03DlvSJYCy2bI8/JUernnCie7QTRvx/a2mNfEOA9j6F
 wXCcMMRMUsT0/fJX6nl87fJx0txuVSSuIy77AP/EF16ko0h28K/1X9l/b/8acwOnDxh/
 Y/fQ8HkOCsKg0hAUL7QKXN9yJl7L7p+IhUE6yd2+m2b/5nT1Cyt+npv6QtWRL/g4eDML
 PBUtHZPOTutHxv5QRkHxP6jX8BQMpD7aBIQtwg1+bp3/1SJD8UsxPxme6m1+sRL4lAL4
 4hsA==
X-Gm-Message-State: AOAM531tdIsCcRAjRUfY9X61JGipAEu2zH8Zi0gn62A/EmHwyBgIaJny
 D657RqSUpr0F7zK1zHtpIKY=
X-Google-Smtp-Source: ABdhPJybbVaMiPw92JX0U2shg8oyjsaIK95UmJ6HxuvOu18l6A+ecA9rZrx3Yn/FqFTI23c+Zl+7EA==
X-Received: by 2002:a19:431b:: with SMTP id q27mr5484708lfa.226.1621377089928; 
 Tue, 18 May 2021 15:31:29 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-91.dynamic.spd-mgts.ru.
 [109.252.193.91])
 by smtp.googlemail.com with ESMTPSA id m22sm2392071lfu.219.2021.05.18.15.31.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 15:31:29 -0700 (PDT)
Subject: Question about Tegra UCMs
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>
References: <20210518001356.19227-1-digetx@gmail.com>
 <20210518001356.19227-3-digetx@gmail.com>
 <20210518180949.GA949047@robh.at.kernel.org>
 <20210518183455.GE4358@sirena.org.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <92cef674-c454-e08c-b44d-d8c08b1e8ccf@gmail.com>
Date: Wed, 19 May 2021 01:31:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518183455.GE4358@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Svyatoslav Ryhel <clamor95@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Ion Agorria <ion@agorria.com>,
 linux-tegra@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 Rob Herring <robh@kernel.org>
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

Mark, could you please help me to understand the UCM naming scheme that ALSA uses..

About a year ago I tried to complain to Jaroslav Kysela in a comment to the UCM change [1] that it should be breaking the naming scheme of Tegra UCMs, but haven't got a meaningful reply and moved on to other things.

[1] https://github.com/alsa-project/alsa-ucm-conf/commit/8ff2d50745efbb6959324f672460e413f0b618b8

Today I noticed that the naming scheme changed again and I still don't understand what to do about it.

I have two devices:

 1. Acer Picasso tablet that uses "Acer Iconia Tab A500 WM8903" for the card model name.

 2. Google Nexus 7 that uses "ASUS Google Nexus 7 ALC5642".

Previously UCMs were picked up by pulseaudio from these paths:

 1. /usr/share/alsa/ucm2/Acer Iconia Tab A500 WM8903/
 2. /usr/share/alsa/ucm2/ASUS Google Nexus 7 ALC5642/

Now the lookup paths are changed to:

 1. /usr/share/alsa/ucm2/Acer_Iconia_Tab/
 2. /usr/share/alsa/ucm2/ASUS_Google_Nex/

Strace shows that pulseaudio searches UCMs only at these paths.

The output of /proc/asound/cards:

 0 [WM8903         ]: Acer_Iconia_Tab - Acer Iconia Tab A500 WM8903
                      Acer Iconia Tab A500 WM8903

 0 [ALC5642        ]: ASUS_Google_Nex - ASUS Google Nexus 7 ALC5642
                      ASUS Google Nexus 7 ALC5642

IIUC, the "ucm2/Tegra/codec_name" scheme [2] that the current ALSA UCM uses simply doesn't work at all. Is there anything on the kernel side that I could change to get a working naming scheme? If yes, I may try to do something about it in the v2, thanks in advance.

[2] https://github.com/alsa-project/alsa-ucm-conf/tree/master/ucm2/Tegra
