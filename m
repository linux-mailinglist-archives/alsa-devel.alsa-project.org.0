Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8691B4E86EE
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Mar 2022 10:23:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29703169A;
	Sun, 27 Mar 2022 10:22:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29703169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648369380;
	bh=V0dSqGtbuv5+3sX3jxJi8eFATGQpNC3BdFnNSjfKlqw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Lu5WZZCpBNANkai3r+BtXDgEr38E7kexk53iqrb8kjQVBxyWjkpeBuXU2LGid8NpI
	 llbB4V//pgQulW+3YVx2Uzh9w2Mg6Bhqy7RdUy1ot0h5SxMVeQdpZNJHMTqRSSxptf
	 GjNBmBoBtTNX72d8JSf/ERVh/00fT2W/FPSejWas=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C42AF8019B;
	Sun, 27 Mar 2022 10:21:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0E73F80161; Sun, 27 Mar 2022 10:21:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B4DCF80121
 for <alsa-devel@alsa-project.org>; Sun, 27 Mar 2022 10:21:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B4DCF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aRWl1/Pr"
Received: by mail-pl1-x62b.google.com with SMTP id w4so12229256ply.13
 for <alsa-devel@alsa-project.org>; Sun, 27 Mar 2022 01:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=Mhix+urzc1FsDasWqNeU8stTynB6saIQVpKl08OSCjk=;
 b=aRWl1/Pr3/FHCGVeOLGeCqVbwbyOUpu+WXyGSqMuAWaR5sT8rAfgabm3jVAaHYkQhf
 PeF7S4fHnoTgfIOXCUJ0MOrLBz/TYahv8inuOHiCHM8LDnUkbiJDuFeWo627eBVliVY6
 +R/aC6Ur0jk2FsD7n8oNlhyjpDYw5nsYWlAQEY8wbNlfkRy4Y+/jMqqkgVV9xVWO2fqG
 gEAQdDHMm/4FWLFgPlcC3S9sMIvHBMkesMGfGuw/v9DNh2wtELCd6XsEo6Bfl2DOq5z4
 Z6ul1iSsdX2tMZ5Eo91iqt7VbO/cvSR0p2x3diwTkeJC+zk/BDQvzuDdWGZ6lP/wf8Hf
 WHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Mhix+urzc1FsDasWqNeU8stTynB6saIQVpKl08OSCjk=;
 b=yp9V4qc754phETzhKOi82kvBkf2/pBhgHigqQRI1OPbQJE++kba+Y903kHmQdwB5Ny
 q7x031DTH7jNUhGAqANuNjN3k/xaNY14IXCMLD0cwAC1tzfBLkr8nMuCtMb1bVBfL011
 xVopD94FGztzRngZXTReZweqjBmURUgYxQIsUwPU2eHBOfVzRcCcvAOPCsLJFm5pEX89
 Ym1gLxW9cV/Mx9o7t1+eZ+ldjV8+3wbQXKqvegyxIeamqJIkjgMdSpoNHoMxOoP2/Rbg
 8cYCDzgyNutsz8fZeUSDCBOEg0YgLxi/tWe+mvKDm6NagQawByE/B5eA0EXIl7o88CBw
 m6zg==
X-Gm-Message-State: AOAM532yjfltZqbOdhnsE+IUE3S45gqdaP2Fx/8j61XcNubzbneVwgXg
 Z8OvnVlK50npRyCr2bUkRuzpHJrA3Ro=
X-Google-Smtp-Source: ABdhPJyCR76yNDb79V+3zmBV84Cq54AmXRpo6EPzFSzVrRRlixTTvFbW58p5I87J9LdC9dwd4MdDxg==
X-Received: by 2002:a17:902:e74d:b0:154:46d4:fcd1 with SMTP id
 p13-20020a170902e74d00b0015446d4fcd1mr20397397plf.58.1648369304850; 
 Sun, 27 Mar 2022 01:21:44 -0700 (PDT)
Received: from localhost ([115.220.243.108]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056a001ad000b004fb358ffe86sm3753370pfv.137.2022.03.27.01.21.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 27 Mar 2022 01:21:44 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Subject: [PATCH] soc: soc-dapm: fix two incorrect uses of list iterator
Date: Sun, 27 Mar 2022 16:21:38 +0800
Message-Id: <20220327082138.13696-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, Xiaomeng Tong <xiam0nd.tong@gmail.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

These two bug are here:
	list_for_each_entry_safe_continue(w, n, list,
					power_list);
	list_for_each_entry_safe_continue(w, n, list,
					power_list);

After the list_for_each_entry_safe_continue() exits, the list iterator
will always be a bogus pointer which point to an invalid struct objdect
containing HEAD member. The funciton poniter 'w->event' will be a
invalid value which can lead to a control-flow hijack if the 'w' can be
controlled.

The original intention was to break the outer list_for_each_entry_safe()
loop if w->event is NULL, but forgot to *break* switch statement first.
So just add a break to fix the bug.

Cc: stable@vger.kernel.org
Fixes: 163cac061c973 ("ASoC: Factor out DAPM sequence execution")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 sound/soc/soc-dapm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index b06c5682445c..2a5a64d21856 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1686,9 +1686,11 @@ static void dapm_seq_run(struct snd_soc_card *card,
 
 		switch (w->id) {
 		case snd_soc_dapm_pre:
-			if (!w->event)
+			if (!w->event) {
 				list_for_each_entry_safe_continue(w, n, list,
 								  power_list);
+				break;
+			}
 
 			if (event == SND_SOC_DAPM_STREAM_START)
 				ret = w->event(w,
@@ -1699,9 +1701,11 @@ static void dapm_seq_run(struct snd_soc_card *card,
 			break;
 
 		case snd_soc_dapm_post:
-			if (!w->event)
+			if (!w->event) {
 				list_for_each_entry_safe_continue(w, n, list,
 								  power_list);
+				break;
+			}
 
 			if (event == SND_SOC_DAPM_STREAM_START)
 				ret = w->event(w,
-- 
2.17.1

