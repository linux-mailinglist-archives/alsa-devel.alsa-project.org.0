Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1012C445E2B
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Nov 2021 04:00:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 837E71688;
	Fri,  5 Nov 2021 03:59:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 837E71688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636081225;
	bh=2SMivJVrGyIv6Sj47KXreRY9HtzgtAR/28R1v/HhQ0w=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IRAYZrJnColLuUs4pUFwQECjGPD3FsvS0OtJvgR3muuKwKx6bPIBJi9edFLQF/uDD
	 wxTSYyOMBhQwLmkF/etCH1SsZ25ov6uf0HuTvXZs3Go1YFtovzzAJ6FMVgGQGcCuGR
	 5SN0y00E0n33YeQOKv6XQ0Z8On+Abhe0sbJhKxUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61DD7F80279;
	Fri,  5 Nov 2021 03:59:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21DF1F8026A; Fri,  5 Nov 2021 03:59:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1391F8012A
 for <alsa-devel@alsa-project.org>; Fri,  5 Nov 2021 03:58:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1391F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="iZejZ489"
Received: by mail-wr1-x42f.google.com with SMTP id u1so11515012wru.13
 for <alsa-devel@alsa-project.org>; Thu, 04 Nov 2021 19:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=2SMivJVrGyIv6Sj47KXreRY9HtzgtAR/28R1v/HhQ0w=;
 b=iZejZ489uiEwNswIoDkxrSm1+hw5nmku820vv0pNVbcybdvGBOgnZyMAAV05+CbiZ0
 CgCnBQxYMdcbz1GEOtA/mcJdiosFSbS+gzmF3KlfIehaq2SFsxj/kbG+CbhQSHwe2mg7
 E0Y05n0yUgpQ6SFVepO8Ojj6aNpZnDWtbN/EM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=2SMivJVrGyIv6Sj47KXreRY9HtzgtAR/28R1v/HhQ0w=;
 b=4u/HzPIN7Bbg6VrCp0GKSHFyE98cj9diQTrKjPh6bq84obf6pV8bOFH8ZSWJMmykGI
 PT0fhUZgGf/F7I/H+I64pjSr2rKAEQiWOOiO8H3xLxvqzQYG8ErP6d4sEjZbUVbhvl/l
 qE/hxOhpwNOdVgwEuDdhV7YKfdo23FOag7BvYCA6TjN6H3+Y99VSQzdvAqfffVokgWyH
 jLWuLjJSb0nWi9WSDB6snwu+TdatDL6EGSPJIYYSEA/wWG428u36lTdDv2WozNwgNdWE
 6gSE5LeZ/TE0HCGFTt423hYR/nYc0H69Q5YHLrkNb0YhMkhCicBcs7uWsKMmud1LT7cm
 6+Tg==
X-Gm-Message-State: AOAM532A4LQ/yCDz5HMcea7HUD/4TDUIGgwaI9nivda4lJDMf9GatQQg
 jGaCWN7qZNPCkCmAAu5CNn1ULeL722RibiHymQGPdQ==
X-Google-Smtp-Source: ABdhPJzjcue2lVuH417mbsk7UkEQX22jLjG/F1yh9i56YE31+rFNKNCx8CpilsELVFf1++MVNbxtuewea7RT3+/g7UI=
X-Received: by 2002:a5d:6d8c:: with SMTP id l12mr28590662wrs.435.1636081137136; 
 Thu, 04 Nov 2021 19:58:57 -0700 (PDT)
MIME-Version: 1.0
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Fri, 5 Nov 2021 10:58:46 +0800
Message-ID: <CAGvk5PoVp7LoFbaq93_F0Mf9xHzOqSt-HpK0gYh4WMAHrJ6vag@mail.gmail.com>
Subject: The regression caused by snd_soc_dapm_enable_pin
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>
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

Hi Takashi,

The patch 5af82c81b2c49cfb1cad84d9eb6eab0e3d1c4842(ASoC: DAPM: Fix
missing kctl change notifications) caused the regression on some
ChromeBook.

The reason is that some drivers check the return value of
snd_soc_dapm_enable_pin, like kabylake_ssp0_trigger(Which caused a
regression). In addition, some SOF drivers may be also affected by
this change(e.g. sof_sdw_max98373.c). Could you help to fix it?
Thanks.

Best,
Yu-Hsuan
