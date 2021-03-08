Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1077331FAC
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 08:06:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8906D17D4;
	Tue,  9 Mar 2021 08:05:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8906D17D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615273567;
	bh=OptlZg6irweDLctm99cGstYl95Oy0uWL8IJIiBiSFNI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WPr3eZjJG7QLZCUNo8Avg+XZ0cRdZzUfbljpBKXJZdGy3K6QuxLWUMKmqGN5Lnlrv
	 0tC4hD6WTPWFi8fGWvW4dQnWHdJOYWJ1DxJ3oCud9463+QUC9WxOVBaLHTi3hDqf42
	 eZl5TUvLvOj7H/YrMxnXAgdUqqisTUia/hB0MLC4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AF44F804B1;
	Tue,  9 Mar 2021 08:02:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 009DCF80139; Mon,  8 Mar 2021 23:20:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C7E3F801D8
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 23:20:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C7E3F801D8
Received: by mail-qk1-f175.google.com with SMTP id z190so11072598qka.9
 for <alsa-devel@alsa-project.org>; Mon, 08 Mar 2021 14:20:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2nLGhU249ZcCP41v2AJxxfRKP+1L9wkodIps38S1Daw=;
 b=ZICvejszlSQfBDGsqoxmicnBpbnPEqjr9UVE76g4pVEM//kaqws9e/9NhbW2Lh5mIG
 RiJhxgZUV8o1M3IBCwmyCw+ufsyGAAZzs31P5NZmX0EOrCNCtuvU4tmbjagPPBohp49s
 jMK40SgMH5JrmP0dXZjMK08N5/LQcm3YYltgXCcjHqoerPZE7Fbg2aOS+9y7qg3Qhb9h
 0yJQvinuVocwATNx8lUnsosr/S08yzbe0vDT7oPtm+zOpgQeHlArBP3CzeUI9kqEa531
 EB1fKfJGxK++oRxo0DfuKocZbW3wM6Ve1sUIRrA+i9v0bWjTo9bfmbKws65vQBfqsbI8
 hjMw==
X-Gm-Message-State: AOAM533WuS7hkMjM+ZfOOHcQj6tpakgam3GWj7Bke8DuXCmkMAG187ws
 fh587A1g0ryr28pViO4FiXk=
X-Google-Smtp-Source: ABdhPJxZZkNlwdpEdg5eSzwb7QmqKDFtwZRFwL1HSRj+FmieLqM/u98NqPXzCamN/MJa9PmTrM+fhQ==
X-Received: by 2002:a05:620a:20db:: with SMTP id
 f27mr23557222qka.51.1615242020625; 
 Mon, 08 Mar 2021 14:20:20 -0800 (PST)
Received: from dpward-laptop.. ([2601:184:417f:5914::53e7:ddc3])
 by smtp.gmail.com with ESMTPSA id y1sm8676722qki.9.2021.03.08.14.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 14:20:20 -0800 (PST)
From: David Ward <david.ward@gatech.edu>
To: Oder Chiou <oder_chiou@realtek.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ASoc: rt286: Handle headphones in combo jack correctly
Date: Mon,  8 Mar 2021 17:18:17 -0500
Message-Id: <20210308221817.12908-4-david.ward@gatech.edu>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308221817.12908-1-david.ward@gatech.edu>
References: <20210308221817.12908-1-david.ward@gatech.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Mar 2021 08:01:59 +0100
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 David Ward <david.ward@gatech.edu>
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

If headphones are detected in the combo jack instead of a headset, set the
index register RT286_CBJ_CTRL1 to the correct value (from the HDA driver).

Signed-off-by: David Ward <david.ward@gatech.edu>
---
 sound/soc/codecs/rt286.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/rt286.c b/sound/soc/codecs/rt286.c
index c0129edf5993..7e67165a43e6 100644
--- a/sound/soc/codecs/rt286.c
+++ b/sound/soc/codecs/rt286.c
@@ -260,6 +260,12 @@ static int rt286_jack_detect(struct rt286_priv *rt286, bool *hp, bool *mic)
 				else
 					*mic = false;
 			}
+
+			if (!*mic) {
+				regmap_update_bits(rt286->regmap,
+					RT286_CBJ_CTRL1, 0xfcc0, 0xc400);
+			}
+
 			regmap_update_bits(rt286->regmap,
 				RT286_DC_GAIN, 0x200, 0x0);
 
-- 
2.30.1

