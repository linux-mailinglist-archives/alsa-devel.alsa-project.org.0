Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B6671052A
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 07:11:33 +0200 (CEST)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5AD474C;
	Thu, 25 May 2023 06:25:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5AD474C
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFECBF8057D; Thu, 25 May 2023 02:46:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EAE1F8057A;
	Thu, 25 May 2023 02:46:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C6AFF8057B; Thu, 25 May 2023 02:46:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B82E0F80558
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 02:46:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B82E0F80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=DoBOGQ+m
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-64d2e8a842cso1222499b3a.3
        for <alsa-devel@alsa-project.org>;
 Wed, 24 May 2023 17:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684975600; x=1687567600;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RomvB4DA9ojeYiKa8NyqSxbnHiS1nQrYLO/v9EOcUE=;
        b=DoBOGQ+m2clOgR685J/bD4OBoNNP8RRxcyCdrcnX07MqvSNTXoT9c/QipttkT2tL2U
         oMrWjMZzqzWzFDnfDYnEob/i0/EDWa9UvNX8V+CDG4bT3/berfnMMoJ3T8H8asQYkZrz
         zjDXEMYSXFQRi911epIIzymL3A5DTwgP9DprgjP4084++HuDnJxLBXMe0HZ0RLRpJjLh
         gPl/K5D2ZGKOOHV/qO4s0VU+jHNMLYbTQMt2oVmCp4QC7/uNTllRiaFOHXRWCT2Ex5so
         gRGsBQRDVu95Ceh8p3p24K++HTsNpTCDzflT34UeUfgHbJ2ytYlN4Gc5SyXVnwFdzxba
         XCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684975600; x=1687567600;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+RomvB4DA9ojeYiKa8NyqSxbnHiS1nQrYLO/v9EOcUE=;
        b=B1TnGM9jl52+Cj2Ji7fe2ouICNuewUaxwrUGGG7JtINcPvvmjF2aor4otZoDdai5Ng
         DEknsJ6IYyeqJM5r2K/h6dbztziKvNN2zs4HotnyNFbHjdnh+N41ojSWbKSFOoB5/26X
         p3IFGMVpjkcKr9eZytYxceRubqFoYv+UDplMEKOecLij+UeIknxMP6UJhHeCfuBIJmmr
         +2ckHAm4SxIJ9RmCPy9BSiv1B3PbKCsBDe+E0Fm7H6Ybj8vIY1LLAVBuIoqOKQC9W2VC
         6Eq5BQjhmfY9dNlbcg1885aCb4s5lUjpRreHCeaXDHnJyRw/FpOGyJnNyDaHa2pGzXrY
         eH1Q==
X-Gm-Message-State: AC+VfDxPOFSqJc5cfKYv4CLZww46LA0YAK2o8Ik5W4u7L4bUu61V3iS4
	Yq0SmEDAnCZFO5v1mwKce50lI1tHhP4=
X-Google-Smtp-Source: 
 ACHHUZ7Jk8m0u/sCue3c9rNgAMYF2sIXb2Nu8/W340oQ/6nb3GFgnMnAp8gh/SWNGvJJ+IZ/ktkYTg==
X-Received: by 2002:a05:6a00:1881:b0:646:1f13:7fce with SMTP id
 x1-20020a056a00188100b006461f137fcemr6569792pfh.2.1684975599960;
        Wed, 24 May 2023 17:46:39 -0700 (PDT)
Received: from [192.168.43.80] (subs32-116-206-28-12.three.co.id.
 [116.206.28.12])
        by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b0063b89300347sm43308pfo.142.2023.05.24.17.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 17:46:39 -0700 (PDT)
Message-ID: <1d497dd0-958b-6385-b7fb-ae852e3e733d@gmail.com>
Date: Thu, 25 May 2023 07:46:31 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Linux ALSA Subsystem Development <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Karthik Bala <Karthik_Ramani@hotmail.com>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: =?UTF-8?Q?Fwd=3a_XPS_17_-_Intel=c2=ae_Smart_Sound_Technology_for_MI?=
 =?UTF-8?Q?PI_SoundWire=c2=ae_Audio_=28device_not_recognized=29?=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JP43ZGR2WLDSPXXG5HVBBGYCVDHULIUT
X-Message-ID-Hash: JP43ZGR2WLDSPXXG5HVBBGYCVDHULIUT
X-MailFrom: bagasdotme@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JP43ZGR2WLDSPXXG5HVBBGYCVDHULIUT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

I notice a bug report on Bugzilla [1]. As many developers don't keep
an eye on it, I decide to forward it by email. Quoting from it:

> Ubuntu (Lobster) 23.04 not recognizing Intel® Smart Sound Technology for MIPI SoundWire® Audio.
> 
> gnome-control-center showing dummy-output. 
> 
> I tried with the latest mainline kernel 6.4.00-RC2, still sound not working.

See bugzilla for the full thread.

The reporter said that he had problem only with integrated sound card on
his laptop, and he also attached dmesg and working audio capture from Windows.

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217461

-- 
An old man doll... just what I always wanted! - Clara
