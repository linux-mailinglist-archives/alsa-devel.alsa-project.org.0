Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6491C7A4DC9
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 17:59:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE519852;
	Mon, 18 Sep 2023 17:59:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE519852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695052798;
	bh=8vWvXRXTjHLKmSX460XRlSWRmJ8f5kwN0zlH7qzPvAY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C/8R8ONRyKNmOMkTIr9uO4ym9qnmiw5h8tJ8VXGGv5dCnvL6fhm/eLR1lFVa8G4r6
	 9ZZSfERzMOLIXCd8NQowkocEBwI7aq+ORggMdFJtjWUuo7FTFg1T047r7rspcvwyW+
	 94IutKbPGq6qyZIrQ0gEp+kojMD6tyhjpdGSMLJ0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A800F805A1; Mon, 18 Sep 2023 17:57:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E7AFF8057D;
	Mon, 18 Sep 2023 17:57:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00A6DF80425; Sat, 16 Sep 2023 21:16:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2406F80212
	for <alsa-devel@alsa-project.org>; Sat, 16 Sep 2023 21:16:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2406F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ku4dD7h1
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-31ffc8ead75so97707f8f.0
        for <alsa-devel@alsa-project.org>;
 Sat, 16 Sep 2023 12:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694891788; x=1695496588;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vwUo4LhXW6t1Gnv3Q0htjfrVL7zsllgauCJSS4C+aNg=;
        b=Ku4dD7h13oz3MKhWAr/VCzml9+mjpZrvF8BwVeqnDTZfPtApXLnTTjTWc64U3d7+aV
         7+wBDvaQgmXg6kUfSoNsaUqFRNsJf7V7U0HSUDeugDLjA3qbFKJ4+9pNKLCejazpGxDv
         D6tVjVUtO7ZK6yRj2Msjf5v8sESFdQAGHmDrekC2yDx2sQgJFdYacVhtSXBtPit9V4iX
         UvPBcHOSXS8XGDtPSs5l6qocqVGuIiolS/b2Zy8DFedpxxcbCnTZx9Mn+q1KTWAj0RU9
         5/UpBsw+EC7WSzBP69tvlJA20Apur2rGCWNiZ1+Q7f4/ZcQ6cSQY4OX5OiA0Nx5L0eyy
         zrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694891788; x=1695496588;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vwUo4LhXW6t1Gnv3Q0htjfrVL7zsllgauCJSS4C+aNg=;
        b=EeTccd5qUEZ9wGGoLPeFuzsYgR7ktcOXhF1vEEsIPFX7fc/0QktcrEE18rJa1Zvpm7
         ytoegZEFOpJblgYQ/UAZU7zqi/fx9tFpVri2U2qS0+JDkVCO4a64bUYydUkLvla11/dl
         PUqOd0tSywlCNrwhMOFfzVqcGDYEZvzIZ2yYdn7yqoy97w2RWZyV7gWPBWBPDBPKNOH3
         3Z+h8mX9Dxtyfle1jguh8COOxoSwycUgszvN+oADIXhVwJY2F6C2ovd2fdc7mOdxmkAf
         aiehZyFrryAGHIcqpbXLZRmLjMvTR+8MIn6SxMGOv45dsVSNRs4PwSrweUGe3m0J5pAn
         2N7A==
X-Gm-Message-State: AOJu0YwnUBlHjSAQPzXgnXOQhowM/lTUBR3qyoWK7ZKX0rBt/ssPO6Pl
	TyA+rqRTZ6MrzPSLwUeh0FH0UeBLLrk=
X-Google-Smtp-Source: 
 AGHT+IFQvgWlTqJ+ytOsAKXGLEU/ChOtRbJNqGOsj29RBk91cgJULaEEW3Hth1jXthX00cPN+Zp19Q==
X-Received: by 2002:a05:6000:1f9c:b0:320:b1e:7e6c with SMTP id
 bw28-20020a0560001f9c00b003200b1e7e6cmr163143wrb.3.1694891788289;
        Sat, 16 Sep 2023 12:16:28 -0700 (PDT)
Received: from [10.0.0.26] ([178.160.241.68])
        by smtp.gmail.com with ESMTPSA id
 d6-20020adfef86000000b0031f82743e25sm7883184wro.67.2023.09.16.12.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Sep 2023 12:16:27 -0700 (PDT)
Message-ID: <f1c8d747-dcf6-a913-f6d5-37fdfe3e2be6@gmail.com>
Date: Sat, 16 Sep 2023 23:16:26 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] selftests: ALSA: fix warnings in 'test-pcmtest-driver'
Content-Language: en-US
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230916-topic-pcmtest_warnings-v1-1-2422091212f5@gmail.com>
 <96ed6e41-65ca-7410-e2d9-78bd18bdf844@gmail.com>
 <128d057c-0d60-418d-7129-093ea59b8870@gmail.com>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <128d057c-0d60-418d-7129-093ea59b8870@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FWQRLJUP7QWGDRCHMVJLHFAFYZT53L2K
X-Message-ID-Hash: FWQRLJUP7QWGDRCHMVJLHFAFYZT53L2K
X-Mailman-Approved-At: Mon, 18 Sep 2023 15:57:48 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FWQRLJUP7QWGDRCHMVJLHFAFYZT53L2K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 9/16/23 22:25, Javier Carrasco wrote:
> Removing an unused variable is actually removing a blank line from a
> logical point of view. Is an extra patch not overkill considering that
> it cannot affect the code behavior?

Well, no, it is not, as the line is not blank (nothing except removing a 
blank line could be considered as blank line removal) :) And an extra 
patch is not an overkill in case if you are separating logical changes.

However, rules may vary from one subsystem to another, so it is up to 
Shuah to decide take this patch or not. My opinion is that such changes 
should be separated into different patches.

