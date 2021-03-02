Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BC4329C42
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 12:23:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 620721719;
	Tue,  2 Mar 2021 12:23:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 620721719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614684232;
	bh=w7yyQAee/9lKt2kJMAucZCJ21tW0mF97NV9iiM97/ok=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pvzDx/cuTbxrP2lX7XQPAtaPFXLzoXpXNI8dxsQbUE4a0Grtk/uslsZgNNgExgWWa
	 bLLQ0Il3UD9MWxvMzI7zideSLy42CfY6Wi3SppXL3WU27VPIucNN5s6pQuNqoP4Po8
	 uQd5g64U0A5NTjf5lDOZZcgKbZY0It8H6NX2ED+8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49EA7F802E2;
	Tue,  2 Mar 2021 12:22:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27FC3F802E2; Tue,  2 Mar 2021 12:22:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92143F8025B
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 12:22:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92143F8025B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rAeqU7sA"
Received: by mail-lj1-x229.google.com with SMTP id r23so23440673ljh.1
 for <alsa-devel@alsa-project.org>; Tue, 02 Mar 2021 03:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6Pw3GTr/GjOIi01Z3q0PpRjgmUtwICxpPYij6S5wwcI=;
 b=rAeqU7sAJzvubjRxRBvRPb0Xflif2/Ah/bGNEHgWmu+/qMN17futs5w/h0G2v5btvR
 ulRQ7DirUjesXRkGzZfp1Lho3KVLbwvkKQlo+3su/+lWoKp+Zs5L7Bdx/8dLlSBUnPOl
 8wxQV4GfyCy/19GKbdc1SZ1VEYOqAtNT8iUtBaK8pDQramHT1kYhKejtTATwZe1lVaO5
 +CW1jzinKThVdFaH9ZUGdojzZMdg39nlbrJkz/Io/LT+0XHkJ9rZj28tclXXmFyyc0iv
 l87aJSmd2WUZmHX0WYuh+jXeG9hl1Ao+eLoEg6JZp5tSObo5bWGeJbYkARntYkvYVgkd
 FNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Pw3GTr/GjOIi01Z3q0PpRjgmUtwICxpPYij6S5wwcI=;
 b=Iuy0QsYIi6Dfa9pbZFETD5og2kWBnUm0c+wHdRhFzAyk4VAFPIlaXBTTXoNRKL/yla
 Qbnr88fJTQ8vyBh989iRoGYtKr7M/4MWlhvUyeAX+R9+LuvxZbWLVyvA0iYdgjqki/90
 OdGOQWM4pUdXf3sdGvtLJmzAd93Iw8HNTg4a/i5gld7cvLiwF1kZZ65c7eRIYkr3yCBU
 GVbQsjUXoy5n6jof1d6um6+8KLTpUNcRvg21q8R82IDBAZOEZebhBU5JvPDFQT/gQRt8
 mMRhYVtyL5TAaZbpf21NWFk+Ww4PY/s7TZ1zp8Ei0kIp475VmWSR2laJjafoY+0u+YzE
 b1gA==
X-Gm-Message-State: AOAM530TrLY7BRbi1LZbmbB15T1atxTpUlPtrG4RtyYTCiv3xOkF3QZm
 hu6MindWzUdGXKJkC9PYga1iwARaNHQ=
X-Google-Smtp-Source: ABdhPJz+HoWgkAqzXnvMEVoBpss7bHPZEO+Q5RCteeV43AIfK/+skRujNOfzl7jNkdQpdps0XG12ng==
X-Received: by 2002:a2e:9f08:: with SMTP id u8mr7152270ljk.50.1614684125824;
 Tue, 02 Mar 2021 03:22:05 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id w7sm2691078lft.0.2021.03.02.03.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 03:22:05 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v1 2/5] reset: Add
 devm_reset_control_array_get_exclusive_released()
Date: Tue,  2 Mar 2021 14:21:20 +0300
Message-Id: <20210302112123.24161-3-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302112123.24161-1-digetx@gmail.com>
References: <20210302112123.24161-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Add devm_reset_control_array_get_exclusive_released() which is wanted by
NVIDIA Tegra drivers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/reset.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/reset.h b/include/linux/reset.h
index 3bee086f1f06..ab240a8648ee 100644
--- a/include/linux/reset.h
+++ b/include/linux/reset.h
@@ -534,6 +534,12 @@ devm_reset_control_array_get_optional_shared(struct device *dev)
 	return devm_reset_control_array_get(dev, true, true, true);
 }
 
+static inline struct reset_control *
+devm_reset_control_array_get_exclusive_released(struct device *dev)
+{
+	return devm_reset_control_array_get(dev, false, false, false);
+}
+
 static inline struct reset_control *
 of_reset_control_array_get_exclusive(struct device_node *node)
 {
-- 
2.29.2

