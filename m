Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEE924C89C
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 01:34:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C70771689;
	Fri, 21 Aug 2020 01:33:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C70771689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597966452;
	bh=IzG2252/GtmYR2U3KHYvq2rpb+U8NbK5RUGLzOodfpE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ct2sYbxhYo3ZPE/EYO5LUSEjzwoRdesvkQxAdqZakl1BJAHAWlHClx3aYqQmT8MOK
	 G2jKPVeIYFFnUSXhqWHCIcZXgDBskxYwARyewngoKyg6d223NsBJJXbUpEtUDW4Xs5
	 nZIVOoXeWfLoAsNtDxJPGaeQlzesF9VRCfQ9DIgI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6BDFF801F9;
	Fri, 21 Aug 2020 01:32:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D13C9F8023F; Fri, 21 Aug 2020 01:32:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 111FBF800D3
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 01:32:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 111FBF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="bd5MBqTu"
Received: by mail-pj1-x1035.google.com with SMTP id nv17so7517pjb.3
 for <alsa-devel@alsa-project.org>; Thu, 20 Aug 2020 16:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oHRUaXVxFTwOM/ib33v9O2zJFH8XkU6FcMZ3065ZAnE=;
 b=bd5MBqTuXT891F0ZO2St+ccmRXmL6vB8zWdxaQ9Yo0srssHXevWXdnFfw9mA80DdB2
 /6q1aLZTTyoxzfctmqcJSeMibeVgv8TzdD3WOroHZTDiK2EqVAUySCgfln/awjOGY66x
 m7MhEnX5N2IPtWSIgmz4TnDsd/equMzbWlvPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oHRUaXVxFTwOM/ib33v9O2zJFH8XkU6FcMZ3065ZAnE=;
 b=nWob5x4adrU1KoJijxU9f/5DzyE+BxLCJB0WK836fdO01alRQS4vHIIcK1WkSqY3XT
 IYwR3ne5HcON7Gs8N5T/J7RNGeeBdTrXqapVYQ+Y/aiyquACm/dScg7P8T65wCTD0Eqk
 LXe6iWthFjAHD7jznNz+m43uMZDHMvv5rUaOokm6oq73QbWjdwqTqOBbCxD+iGLLqLWj
 P0D+svo+c2+TNYSPSmYFaVUUX6WS7nSTu80VBV1TiLaWqAax7NYeKiFdAPuep3A6oqxb
 OSDcItqdDQ4L865q/b9l7zifehhLh4FKtgeLitGHfQpDAItIapktmZbt0oQEbBVmKbX+
 BuBQ==
X-Gm-Message-State: AOAM532y9b44m4XGOEtFZd5xapRYhsxVQctmXtZbnzLepnEHiWgjOf/z
 QWsM9E8p+FTlG/nM2VKMqt5WPC/o4u3N6Rw=
X-Google-Smtp-Source: ABdhPJzlRkIwsZo1jjq4KU07iXLGV99n/PDyupimpGDtwW+5WQeEeuW2hBOPoRg+PPQeou2vgbnbFw==
X-Received: by 2002:a17:90b:784:: with SMTP id l4mr141635pjz.96.1597966336215; 
 Thu, 20 Aug 2020 16:32:16 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:7220:84ff:fe09:2f18])
 by smtp.gmail.com with ESMTPSA id lk16sm6297pjb.13.2020.08.20.16.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2020 16:32:15 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ucm: Add JackSwitch definition
Date: Thu, 20 Aug 2020 16:32:04 -0700
Message-Id: <20200820233205.505925-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Curtis Malainey <cujomalainey@chromium.org>
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

Some codecs can differentiate headsets based on the number of rings.
Should we choose to differentiate the config we will need to be able to
select based on the jack event code.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 include/use-case.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/use-case.h b/include/use-case.h
index 2363c3ed..80148a7b 100644
--- a/include/use-case.h
+++ b/include/use-case.h
@@ -386,6 +386,9 @@ int snd_use_case_get_list(snd_use_case_mgr_t *uc_mgr,
  *        to e.g. automatically mute speakers when headphones are plugged in,
  *        but that's application policy configuration that doesn't belong
  *        to UCM configuration files.
+ *   - JackSwitch
+ *      - Represents the jack switch value for this device. Value is a base 10
+ *        value of a switch code in input_event_codes.h
  *   - MinBufferLevel
  *	- This is used on platform where reported buffer level is not accurate.
  *	  E.g. "512", which holds 512 samples in device buffer. Note: this will
-- 
2.28.0.297.g1956fa8f8d-goog

