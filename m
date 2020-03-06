Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E6617BE84
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 14:31:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8266C74C;
	Fri,  6 Mar 2020 14:30:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8266C74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583501464;
	bh=TXvinOvj/i5kB5STNj6B8BZbDsslsyKX+SyeFv4ZdCM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jg920LzaFWp76ovZ4XW/Amej08d0t3eCEV7BfMPB+gtTtVxmuSfaag5kL9q0odu4E
	 oBB9g1fOHMfyYvQAgyPRqola1x+pEZcGLEx5ZSejYa3p1CqXU5Lvarg9vNFwLb0AyQ
	 w/LWuNqhkKpQsrkgANk7/WSnl590tlOB/mapMOCQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97B29F8028D;
	Fri,  6 Mar 2020 14:28:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06732F801ED; Fri,  6 Mar 2020 14:28:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70FEFF801EC
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 14:28:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70FEFF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="GJXKccIX"
Received: by mail-wm1-x342.google.com with SMTP id i9so2409229wml.4
 for <alsa-devel@alsa-project.org>; Fri, 06 Mar 2020 05:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l0753ioxbAPf/XAPghmG1eWdLr2jDSu4uvwHYqISpUE=;
 b=GJXKccIXYhtSv6vXeqTHPXu03DjzWWFPmE/k4I1cAtmzKPhXUw6TW9pBcFvqKJON1i
 EtHMynUyVZ59/pNCPASagVEh7/tZ1h6gdHirsjJLo6H5YXdebW0h8TSYObV67tD1wNAT
 YZ6DGBeUeRlcqLZn7mQtVllaxuHRZ0imk9IsOFGLMXuh3uZeoOZM5l94FJW30CQY5DT7
 x+5aO45M+JhORnnqXmoC0foP22mmqTU1FQruGO9jHfwBJpl1sijDARm/0DKR/4EsB6a5
 jwPNgWncYYtzjUeW3p21xIIaVvl9hEG5NLfqTOXJoJaD18vgRLt8f1fMMVqSiVHjkan2
 /htg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l0753ioxbAPf/XAPghmG1eWdLr2jDSu4uvwHYqISpUE=;
 b=Z7lOiTuJxU9+K8YLB1VI2hPfJsJg2yowQItpry2i/K71N/zwrq6k90YH1D+EdPk0bM
 6LvZSB9fbex3l/oFt+PhmycTbqOlBpY0Y8uUEn8vcI6CYnjxXSYebOQqkmM6V8ll0svY
 Ki9isXdyr0gHCxSzbnpEYQYoNq6fSmXfyog+kLoXovmOsFKBOz1JZkCweJ4hS31Kk7Bl
 qFFYzvBgPN0oMJSVHDe3nqqYriGDFutgZJIesXWJ9va5OfO0X70m8Nx7JwA5504DXLvC
 bkUzb8Q2vtVW/5rucZwVurLvAUM8R9k/oxVNZRaZZCXiEXpMP23ssBw3JDL8ZVE8L0QV
 xgag==
X-Gm-Message-State: ANhLgQ3LayXLajZhkimzRirjjiV8XW5G9OxLVmI3fFIrlsef26/VzaPF
 EqhSQO6ynsV2Xbb3xEAvmowhmA==
X-Google-Smtp-Source: ADFU+vvFAL6t94Px6BzYAVsj2oEIZBnA3NwxwlqG0OuAe/dK6SNKzCDjT5t8fHLRzEcpjjNgS0s8sQ==
X-Received: by 2002:a1c:df07:: with SMTP id w7mr3933609wmg.7.1583501293500;
 Fri, 06 Mar 2020 05:28:13 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id t1sm53349237wrs.41.2020.03.06.05.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 05:28:12 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 2/2] ASoC: wcd934x: remove unused headers
Date: Fri,  6 Mar 2020 13:28:06 +0000
Message-Id: <20200306132806.19684-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200306132806.19684-1-srinivas.kandagatla@linaro.org>
References: <20200306132806.19684-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

Looks like there are some unused headers, remove them.
Seems to be missed while moving to mfd.

Reported-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 83d643a07775..5269857e2746 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -3,7 +3,6 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
-#include <linux/gpio.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mfd/wcd934x/registers.h>
@@ -11,10 +10,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of_clk.h>
-#include <linux/of_device.h>
-#include <linux/of_gpio.h>
 #include <linux/of.h>
-#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
-- 
2.21.0

