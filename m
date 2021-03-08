Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F20C331FAA
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 08:05:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 091AD17EF;
	Tue,  9 Mar 2021 08:04:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 091AD17EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615273520;
	bh=5NND8fD7aenwqPv48d7y96RipxSlAYKosA8+fm888Yc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gSdkiCnRmtB+EDc4la5ZZswlwFk8At/dFp9SEDwyI4SEuBn6TdxeCJ2HIkZ2hizuA
	 c7pXO4Jl+cisnO90p3rSrRY2D0No3pknpvyqFlsyMUkikxMTXQvLlv97MXZkkAj2pH
	 iNx7W7Kde3BeUznoovXqdDs7O0ONPtRApXk+0tU0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F486F80475;
	Tue,  9 Mar 2021 08:02:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0074F8020D; Mon,  8 Mar 2021 23:20:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A701AF8016C
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 23:20:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A701AF8016C
Received: by mail-qk1-f178.google.com with SMTP id 130so11062578qkh.11
 for <alsa-devel@alsa-project.org>; Mon, 08 Mar 2021 14:20:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8wLOjkx8Aw550chRq6bfwY018S+0d9yEzCRGLO7c+iQ=;
 b=U0CbguTkA1oFIprH6jS2uU/LjC6paGcmdFhNuWT6NKh4Z3aC5eJJu5NWdwwoFo3lnR
 wIXGmf6Dtw/m5vllFAlmGw8GAWEO2YRgwLRGgaRgfAQ7IZTzD9GAkg5uiqiZI9gZ4Rqc
 qT7kkDsagXvLOiTZMXoDxpoSBVwEP31Zg6z0m/6YKle5Zedvs+HfTuNpXl/xnrFyW7bw
 CwCKPeTB/OTbQGyqAVaXur+87mO7jouumv5pqpepu7WSPsIq3VIufLos8Ad/7hLk8y72
 MNf+ZKDPj3eygyBov2ju5M578XwVFGJ21mtoQMBLwybN+CjRMyFEUX71jWotHtc7n9Cj
 ONhw==
X-Gm-Message-State: AOAM531UQkx7BeU+g7X1BZHIOlMVR/mCYFVTcSdFeAbC+Yar5J9oKQ+x
 RtzuemVtgRQ+BaFQJ+hHClE=
X-Google-Smtp-Source: ABdhPJyS8AAwQdPfiGOCRS0IAxVVrVOhiSmcAytyZVzRDxD1L6MUq7d5NA65ij86KE7L9uJtRo2utQ==
X-Received: by 2002:a37:630a:: with SMTP id x10mr22334583qkb.326.1615242018237; 
 Mon, 08 Mar 2021 14:20:18 -0800 (PST)
Received: from dpward-laptop.. ([2601:184:417f:5914::53e7:ddc3])
 by smtp.gmail.com with ESMTPSA id y1sm8676722qki.9.2021.03.08.14.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 14:20:17 -0800 (PST)
From: David Ward <david.ward@gatech.edu>
To: Oder Chiou <oder_chiou@realtek.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ASoC: rt286: Make RT286_SET_GPIO_* readable and writable
Date: Mon,  8 Mar 2021 17:18:15 -0500
Message-Id: <20210308221817.12908-2-david.ward@gatech.edu>
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

Otherwise, the GPIO configuration for the Dell XPS 13 9343 is not actually
applied, so the headset microphone does not work.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=114171
Signed-off-by: David Ward <david.ward@gatech.edu>
---
 sound/soc/codecs/rt286.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/rt286.c b/sound/soc/codecs/rt286.c
index f9b29782b62a..e16e7237156f 100644
--- a/sound/soc/codecs/rt286.c
+++ b/sound/soc/codecs/rt286.c
@@ -171,6 +171,9 @@ static bool rt286_readable_register(struct device *dev, unsigned int reg)
 	case RT286_PROC_COEF:
 	case RT286_SET_AMP_GAIN_ADC_IN1:
 	case RT286_SET_AMP_GAIN_ADC_IN2:
+	case RT286_SET_GPIO_MASK:
+	case RT286_SET_GPIO_DIRECTION:
+	case RT286_SET_GPIO_DATA:
 	case RT286_SET_POWER(RT286_DAC_OUT1):
 	case RT286_SET_POWER(RT286_DAC_OUT2):
 	case RT286_SET_POWER(RT286_ADC_IN1):
-- 
2.30.1

