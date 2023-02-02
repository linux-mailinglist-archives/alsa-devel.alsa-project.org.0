Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D97BE687F5D
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 14:56:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4508FE7C;
	Thu,  2 Feb 2023 14:55:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4508FE7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675346198;
	bh=26O0NO/Hy2JFBCd9wk5B2KqKhiZtBRyTpqOAfDhnge8=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vQIKwHmB1eWRwm87rSlTjjmb+nqJojBJvmcVXWnqpJ0iAG6bsHSatgswGbG842weR
	 7HxhLqIw5xnU+umgEFrUsFR3xgGLJjG65v7lpBCfcTMN5nFT4zmGs5+haudWV3PgqD
	 wTen1ymOzIH5ZeKIjsw+b9hzsgwWja4kRFhq6S34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A95ACF800E3;
	Thu,  2 Feb 2023 14:55:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2559F804C2; Thu,  2 Feb 2023 14:55:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FCECF80169
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 14:55:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FCECF80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Gge2CQbv
Received: by mail-wm1-x330.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so3785770wmb.2
 for <alsa-devel@alsa-project.org>; Thu, 02 Feb 2023 05:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:content-language:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=a9BBQUqB0Sm7Tud/YEdVG0PBDErjDrRzpyyI5ZM1kgw=;
 b=Gge2CQbvadHolXyOce3v687PMEiuALPhjgbGbHrVh5tWqf+sWR2CFudTun+Mkgd/HL
 20xRVHaZoCvjQKiU3u0jnyMcbqo8+2WuD2B48z1RmF0a4TUTXvPYrShijX+4XeZhlzwK
 TxqKN3lY2TFSxcauCsxh++zYFgHx+bz8cs/07L2xHfhIUY1zKt/FA8x7YVV9Qp6SvGOZ
 pFhhYRJ0aqajblCPFaAlikI8TC2WFShqEoBqAGPPi9fcHefQowMcZ1n5qRaPXn9cmwZM
 DKqPDQI0tKEJgYHRMAVI0saWlcoQYAZcCNrdm0bxlO7RCY3EmaxxptvyM7zUdnCWhmrw
 MWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=subject:from:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a9BBQUqB0Sm7Tud/YEdVG0PBDErjDrRzpyyI5ZM1kgw=;
 b=5KkCI36g0c2cnnRHux3VIq2P0q3FhQAOcDAWRk1l01s4b7tSoxFLgmeqAiqWlRLBxt
 1DWoDchy8xUYSaL0qopivOxXeqRKZdrRAWHQuXAZezvTI9q5HRulpWP9e5SJ0oQ0fBt3
 s6Cbuad57AZcckrvA4NoscuoGFrbZ6vrfQBN9T7NL7Qg80U5/aZlamvp0z8kxBsfoeDW
 k9HCjn8CCk7SVdLAiAz3yWIp/T9t3Y44uwWyXeE3mRn7x4VzByTlFZWaD+dTj5eEEVXW
 P0XGYUj9Fpfk+en1eimoGvSNggeE4hsofxGfVb2Okwrf/k3YaZfYmWeCrFIxq0G90Idi
 gT/w==
X-Gm-Message-State: AO0yUKU3umrTXTv3k/wBYRDk3B8L72zcFpnogIcYS07MnqOvN/zBbeIN
 calZqndM2bpEauvMFC1djZKIQK3eTQs=
X-Google-Smtp-Source: AK7set+HDRnandI8WPWnpDzs2kLuvWAF7PZli9uYd0LReXI0568VG8P5zDgeQj2xH6iLOHsrCGbpfw==
X-Received: by 2002:a05:600c:3b8e:b0:3df:9858:c03e with SMTP id
 n14-20020a05600c3b8e00b003df9858c03emr1837081wms.19.1675346126225; 
 Thu, 02 Feb 2023 05:55:26 -0800 (PST)
Received: from [192.168.21.204] (surfbythesea.plus.com. [81.174.134.71])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a1c4c12000000b003dc48a2f997sm4366950wmf.17.2023.02.02.05.55.25
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 05:55:25 -0800 (PST)
Message-ID: <70ff4e3a-b171-131c-a039-4fc99aa4bbfc@gmail.com>
Date: Thu, 2 Feb 2023 13:55:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: alsa-devel@alsa-project.org
From: Alan Young <consult.awy@gmail.com>
Subject: Overflow in calculating audio timestamp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

sound/core/pcm_lib.c:update_audio_tstamp() contains the following 
calculation:

         audio_nsecs = div_u64(audio_frames * 1000000000LL,
                 runtime->rate);

This will result in a 64-bit overflow after 4.4 days at 48000 Hz, or 1.1 
days at 192000.

Are you interested in a patch to improve this?

The same calculation occurs in a couple of other places.

Alan.
