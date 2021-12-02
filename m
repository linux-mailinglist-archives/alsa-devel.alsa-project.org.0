Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E596D466B3E
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 21:57:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87FCE28FA;
	Thu,  2 Dec 2021 21:56:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87FCE28FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638478644;
	bh=RlvDJ8wKei3tRWQ9k/2Pef8NU7VcVV/O7Zavo0DFVTw=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nlNSK4aYw0ffxJVeN8tWiAH4BwOKYVg9x+nDcn7xG2L3xEZmXFplfVA4/vGbG0NKe
	 AAy/kqdXIox/kSNvr1RHdJpQodB3mMSkSrnPXzkyOzhhW6kpF5ET3QwZNx5hPHQeVR
	 L81yeFhEx5+/RCOvqA7oPw4R8oEcTI7A8J1aA6LE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D35C9F8023A;
	Thu,  2 Dec 2021 21:56:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 768DCF8020B; Thu,  2 Dec 2021 21:56:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A31EF800CE
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 21:55:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A31EF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OUHmAOxB"
Received: by mail-qk1-x731.google.com with SMTP id t83so1290275qke.8
 for <alsa-devel@alsa-project.org>; Thu, 02 Dec 2021 12:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=nzF2UM3a9gk3N5Y4bTr5eA3bHQVmthriUqq9Elh4G+8=;
 b=OUHmAOxBAU3h/pN8G4CxZDsxAhBIFkonJaUhnHMws3ZvzRK/3RfRUrgQjjjDBabMxg
 yyiXiA0m+I0s0IXFM6JdZnIWXhFs99cgzy+YZQ0ktR1Q1mGjanso75wzsBn7mbDBatrb
 D4bRpS4lSVhn0e1RGCBKksG2cm04sVo3t8dLIg6WeGpGY0Py0030pesptFV7xKitTqcY
 2SD+snvz9PI52WwjBa9sOKrS2W/1QrJzVMT/j9A9+3KtC7cgayBKttiwNB5PB37zKq5p
 6wGxQU3TS5EhVkrFsnQ+OyF0oWEy4NSaQ8SyM89wC/QiaTrzH5dgWAA3IRFTT+wNeSBT
 ScFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=nzF2UM3a9gk3N5Y4bTr5eA3bHQVmthriUqq9Elh4G+8=;
 b=ZpWipXr+jah5fU1SrMCPO/LNq39USAJ3IL4qQ5KtD9vRW1BHTQ3t0pG5q1qHh5sIfi
 WRVg8yz6546/BsX3zQEL5rXjrE9TNDIVnjLpdp/da9ZxeA247AdhJdObK0I34NfTpWPs
 SQ27gjOJpIPgnMIs/7WMrqeO9+dcOiQT9yB9bVpWb0MXfsvQy+Nut7Km85Fpi4DFYnjf
 72BOjlfSML/wpueZWslKlvC8eXmeYUAZjBGOcVF+I1Vk5g3yyO2jn3bZpf2bSfGwwfTt
 pPzs+8Z5EESVCj1LMB1Inj0oq9cZPVh2s1r/PT215T4nrL5PWNfK2r0dqTkH0OEIdvA2
 FvEA==
X-Gm-Message-State: AOAM533HTL65YZCkx3nau++lnfZQSNehYbDLL3Yg8TAoz4tbwzjnpp64
 RpgPQkz9ZqKFNyhsiMc+adsrX5cDAIFwTw==
X-Google-Smtp-Source: ABdhPJw6duUtixXgjKnBYnoxVQmiW2RlDJV8IDLgtXNMMunegXP5xt+YWPHsJ6QvnthFxzsoef2fzA==
X-Received: by 2002:a05:620a:17a9:: with SMTP id
 ay41mr14120552qkb.280.1638478554816; 
 Thu, 02 Dec 2021 12:55:54 -0800 (PST)
Received: from geday ([2804:7f2:8002:7bf1:59c9:7624:9b4a:10d2])
 by smtp.gmail.com with ESMTPSA id d17sm647908qtx.96.2021.12.02.12.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 12:55:54 -0800 (PST)
Date: Thu, 2 Dec 2021 17:55:51 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] ALSA: usb-audio: Reorder snd_djm_devices entries
Message-ID: <Yaky19EeHagfRSTD@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: William Overton <willovertonuk@gmail.com>,
 ALSA-devel <alsa-devel@alsa-project.org>, Olivia Mackintosh <livvy@base.nu>
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

Olivia Mackintosh has posted to alsa-devel reporting that
there's a potential bug that could break mixer quirks for Pioneer
devices introduced by 6d27788160362a7ee6c0d317636fe4b1ddbe59a7
"ALSA: usb-audio: Add support for the Pioneer DJM 750MK2
Mixer/Soundcard".

This happened because the DJM 750 MK2 was added last to the Pioneer DJM
device table index and defined as 0x4 but was added to snd_djm_devices[]
just after the DJM 750 (MK1) entry instead of last, after the DJM 900
NXS2. This escaped review.

Let's reorder the entries in snd_djm_devices[] so they match the Pioneer
DJM device table index #define's.

Reported-by: Olivia Mackintosh <livvy@base.nu>
Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index d489c1de3bae..d4cd880b5c6c 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -3018,9 +3018,9 @@ static const struct snd_djm_ctl snd_djm_ctls_750mk2[] = {
 static const struct snd_djm_device snd_djm_devices[] = {
 	SND_DJM_DEVICE(250mk2),
 	SND_DJM_DEVICE(750),
-	SND_DJM_DEVICE(750mk2),
 	SND_DJM_DEVICE(850),
-	SND_DJM_DEVICE(900nxs2)
+	SND_DJM_DEVICE(900nxs2),
+	SND_DJM_DEVICE(750mk2)
 };
