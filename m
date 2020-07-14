Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 357D121F5B0
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 17:05:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7465F167A;
	Tue, 14 Jul 2020 17:04:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7465F167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594739113;
	bh=gnxBbe5G+yoNDDiQa0bKfgCoXxcTb7IOdyHhJFomqZ8=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lVpYFLkwVuNgw7ejosyN3ZSvNNBfSugob4lz5YwdSFau31d9kT02ThL42cNKIbJ2+
	 vqqfjA0qNdrgnShhN+TVdKXW+FHP9XXJAvZNxGD+GqGcYWRx/SujPOPuNKjx4XlExy
	 pErXYQz0RVlswEjxBnGKFqqdutA0O8vPRVjh4aTk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 522E9F8020C;
	Tue, 14 Jul 2020 17:02:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0CD1F8026A; Tue, 14 Jul 2020 17:02:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE8FBF80113
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 17:02:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE8FBF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aWvmFCz1"
Received: by mail-ej1-x62f.google.com with SMTP id n26so22373239ejx.0
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 08:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language;
 bh=+7FxhJGEiCxVEpSPfHCBpb/qmnx4TKyENB6n2AvzGto=;
 b=aWvmFCz11YrNMYcJ+kxijpqlLluF427FU99dkCTnqwdUxjQaQ4Jp0KvkBtZM+OJ3EX
 ouCJfA5SU1UqpgxiJQWs+7K4TOvqpvw8r3zkBF//+NsIKuSGU8/5AoqupYPdRcEo2VSM
 Qk0wWy9tzqPDVpnL37lo0mXQtmp8twbbDAKfdhrJ91+rCUqYKd/3Vj5myyxEuD6V6O5E
 pZL7kW2qv0k6+i9K47xEKYzHjd5UHUsfLMZ07tz1uftlJN6Plf6ksvZDrwqpyRUAPMKg
 LR46lV9a2fHsSHKBh9YIieqULzwS/F2Pg1DaH56gw3pmpJvyPell0H9OW7WUVSxh6rcH
 PCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language;
 bh=+7FxhJGEiCxVEpSPfHCBpb/qmnx4TKyENB6n2AvzGto=;
 b=j9aTuk7eqyxzLOqKnuKkMDI8vQQHC8EKfuPgludRzKVECtkEHZ8kxP/X2vQ3jjWvz8
 7UJDukE43TVgG2OehkTVT3LcbAIetyWU8C1PRQcgSEfbmxW7pxksz+SzoZzGJhFOp/yD
 YI8JV8hZf4jOjAKXAD17OhFcwPS7GaBo5Ti0j3Z53qQB52iCAU2WH2HGiBZ3ws0bCrZP
 QVglhylCI4qk7X4hSV76phBQ6vRRzjAFtUsOOdF9Ycgl7CnoDIfeJljqThhsQXA0IsdY
 Ke/knPELrMFPbFNgH7NmRFOTYAjc9VTa1QxciJAhnnNTt6p+Sqcpk3hbKg2L8XHCIM4S
 d5vA==
X-Gm-Message-State: AOAM532ObeMkd+vxn/OKFtPp9Z7HF1dLLgZDlm2W0Xw5tWxDATBoSKxZ
 sEINByT1rJwt4rjegsux07PvaemV
X-Google-Smtp-Source: ABdhPJw/WgGF12gcrTfVZ9hgJ7n53fF7yPpe41CVTRFXYCfzKUsPcw6zSCqe0V04bCbM3AIDslxvlg==
X-Received: by 2002:a17:906:4a17:: with SMTP id
 w23mr5115069eju.360.1594738967459; 
 Tue, 14 Jul 2020 08:02:47 -0700 (PDT)
Received: from ?IPv6:2001:1c01:2f03:7200:763c:d807:63d8:4d15?
 (2001-1c01-2f03-7200-763c-d807-63d8-4d15.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:2f03:7200:763c:d807:63d8:4d15])
 by smtp.gmail.com with ESMTPSA id l1sm15075500edi.33.2020.07.14.08.02.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 08:02:46 -0700 (PDT)
To: alsa-devel@alsa-project.org
From: =?UTF-8?Q?Ren=c3=a9_Herman?= <rene.herman@gmail.com>
Subject: [snd-usb-6fire] Unmark struct snd_pcm_hardware const
Message-ID: <a7f59f2a-510d-4a69-53f8-2bc134a9b74d@gmail.com>
Date: Tue, 14 Jul 2020 17:02:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------209D9E0EB7AB5748619C373E"
Content-Language: nl-NL
Cc: Torsten Schenk <torsten.schenk@zoho.com>
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

This is a multi-part message in MIME format.
--------------209D9E0EB7AB5748619C373E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

struct snd_pcm_hardware pcm_hw is in fact changed in usb6fire_pcm_open()

Signed-off-by: René Herman <rene.herman@gmail.com>

--------------209D9E0EB7AB5748619C373E
Content-Type: text/x-patch; charset=UTF-8;
 name="0003-snd-usb-6fire-Unmark-struct-snd_pcm_hardware-const.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename*0="0003-snd-usb-6fire-Unmark-struct-snd_pcm_hardware-const.patc";
 filename*1="h"

From 114ca1103f0545b320db658c794cd5ad6723272a Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Ren=C3=A9=20Herman?= <rene.herman@gmail.com>
Date: Sun, 12 Jul 2020 01:44:53 +0200
Subject: [PATCH 3/3] [snd-usb-6fire] Unmark struct snd_pcm_hardware const
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

struct snd_pcm_hardware pcm_hw is in fact changed in usb6fire_pcm_open()

Signed-off-by: René Herman <rene.herman@gmail.com>
---
 sound/usb/6fire/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/6fire/pcm.c b/sound/usb/6fire/pcm.c
index cce1312db93a..8ccf6384eff9 100644
--- a/sound/usb/6fire/pcm.c
+++ b/sound/usb/6fire/pcm.c
@@ -40,7 +40,7 @@ enum { /* pcm streaming states */
 	STREAM_STOPPING
 };
 
-static const struct snd_pcm_hardware pcm_hw = {
+static struct snd_pcm_hardware pcm_hw = {
 	.info = SNDRV_PCM_INFO_MMAP |
 		SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
-- 
2.17.1


--------------209D9E0EB7AB5748619C373E--
