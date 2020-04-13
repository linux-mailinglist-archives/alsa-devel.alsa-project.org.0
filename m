Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B30111A686D
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Apr 2020 17:02:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D83816A2;
	Mon, 13 Apr 2020 17:01:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D83816A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586790138;
	bh=Q+r4k8vT6svAARZg9z4Qj5yNiW04N39oFT7sm+gUogA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cAG/6Pz0z4WSPafuTKmL4gSvdJKyjdp8GH6XPVhJjvS5W8I9iEBgzlT5sWCB+m9vo
	 w32ZDeor9rpbDx4cbLqbSTMKC4r/vJgIRVmDIEA2Yeo6Vs0Zg6l0CrxcNJU2k1QfcE
	 FtC1BssvsZ3KV8gHwGhHoZKUj3RsoFwGIUCa8ihU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ADE2F8025F;
	Mon, 13 Apr 2020 17:00:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49DE8F80245; Mon, 13 Apr 2020 17:00:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CF91F8010E
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 17:00:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CF91F8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WUoNsVLk"
Received: by mail-pf1-x442.google.com with SMTP id v23so4611442pfm.1
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 08:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zrph/+gZAtIASueUsDAgG/8rvQ8jFIYjYDg/r9WrEUk=;
 b=WUoNsVLkBiay/Efa18YzPd5qHBMpaJqUdy28yTYnXEMtr3c9wQj3QGDHcTn/P7U2HU
 MDCbY/Vvr16omjzRbfgmUYv1GXOxTgZ9TyXqLAMOq6DjuvjsgofREtNG19eBOloxDMZf
 1SgI2MBwIC3ZaOMpJIqir08zJwKRKSJtqGZ/w3815C8CwxIZ4m335Q85KUFW/bdxfP4U
 UFtoaBXfkgazXQuBFj3mmrbRaAMZxUCAZ42h7bDnwIF1Z+N0NXC95EC318Ty3eYKxhgD
 STlzg2U1mvevc9AWecnGJW1Y5wfrlUvSB5y+9pt3db8qhD/yv5DPR+0SJukf42MzVslO
 vXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zrph/+gZAtIASueUsDAgG/8rvQ8jFIYjYDg/r9WrEUk=;
 b=Cu5AQVuFBC+BVj2zqY06gJ3OKUfrCIEKckieMZWTCImXYJSBMWE3h0E9bluf11Otl7
 VFxHwXzcOO1sLV8NOvxX5xwFLuz2C7ZMPQW1tWVXhIQwCSYMEPVakpAu0t7kAeJrwE1I
 M8nhl4dUqR+Sj3qY3uiLgZpw+t+Kn322J3ffYMu6lbos01d47U/yFUvXZC+dla3lJa98
 QzDJdKRvuD3G1FxehYzR8bSKyVwveOjuhrFjXMoe3DdGLTLspuTYhbz0GxcEdVqu5UXE
 BWtB3ZHKeJA14GnWbIKcCngeJ3OgCmC+UmaBt1dPi9NfU4WGm7BmlgbIU2qO73ImpOcC
 cxvw==
X-Gm-Message-State: AGi0PuaL0FehQ/QG7c8xmNsD6Yp0vfP4mHqTGqh2xNjKAOwO1a+jmkhb
 YRLHAQ/RRtQa6RsiX+63QUI=
X-Google-Smtp-Source: APiQypKxE7qTiHURlqIR73OkZldHi1Syz1QsAOSos0ifC35YHRsrA9zbSh2tYWPAj5HARPXv2PRkdw==
X-Received: by 2002:a63:d049:: with SMTP id s9mr16725100pgi.384.1586790025093; 
 Mon, 13 Apr 2020 08:00:25 -0700 (PDT)
Received: from localhost.localdomain
 ([2408:821a:3c17:4dc0:450e:c0f5:953f:5e47])
 by smtp.gmail.com with ESMTPSA id r6sm3599920pfh.110.2020.04.13.08.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2020 08:00:24 -0700 (PDT)
From: youling257 <youling257@gmail.com>
To: perex@perex.cz
Subject: [PATCH] bytcht-es8316: fix Speaker or Headphone no sound if enable
 Mic or Headset
Date: Mon, 13 Apr 2020 22:59:57 +0800
Message-Id: <20200413145957.22459-1-youling257@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: hdegoede@redhat.com, alsa-devel@alsa-project.org,
 youling257 <youling257@gmail.com>
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

alsaucm -c bytcht-es8316 set _verb HiFi set _enadev Mic, Speaker will no sound.
alsaucm -c bytcht-es8316 set _verb HiFi set _enadev Headset, Headphone will no sound.

Signed-off-by: youling257 <youling257@gmail.com>
---
 ucm2/codecs/es8316/EnableSeq.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/ucm2/codecs/es8316/EnableSeq.conf b/ucm2/codecs/es8316/EnableSeq.conf
index 551b79b..53bb115 100644
--- a/ucm2/codecs/es8316/EnableSeq.conf
+++ b/ucm2/codecs/es8316/EnableSeq.conf
@@ -1,6 +1,4 @@
 # Disable all inputs / outputs
-cset "name='Speaker Switch' off"
-cset "name='Headphone Switch' off"
 cset "name='Headset Mic Switch' off"
 cset "name='Internal Mic Switch' off"
 
-- 
2.25.1

