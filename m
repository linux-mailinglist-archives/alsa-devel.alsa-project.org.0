Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C328B2A6
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 10:39:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 139D71669;
	Tue, 13 Aug 2019 10:38:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 139D71669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565685560;
	bh=rPEtpErXKecXyZ4midmUUX2khfWA0Vcr9admbgXHbOo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HGvA1hycD6lEloy4CXUVBv9OLZjJ/+9Yd4YilmwwuIlVIObuPpnICPeh+1ySJbn/Z
	 R94cLf5sJl4JaNodWm5graFuLYKDcdZPTIIB12lfkbJeyIhpUunojcFzJ6mCZHkxPK
	 YkF453lztMlz7yV/RyiZ/fhof00Au0H5O/G0qcl4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8428EF805E2;
	Tue, 13 Aug 2019 10:36:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93E94F80273; Tue, 13 Aug 2019 10:36:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1BC4F8026A
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 10:35:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1BC4F8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="z1KFlnpe"
Received: by mail-wr1-x441.google.com with SMTP id r1so7859124wrl.7
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 01:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yY3j+tzAidsewEpOKH7pvngWyOrXZYN1znzf8G8c2/o=;
 b=z1KFlnpe7m6oruIQ8cwwyUe0xYtx70XatCj0QTT3fQG0wWPqOetxuINiLncLjFTWTm
 99H1BtzfFj+UnuZcErc7bAJTBHGV4j1+4Z5/JyC7VOEUNZIcuuvAzstG9O1gv1RCckId
 TzAMy2Yy5ely6dY38GSWw68qaAwxhYG8sqLPPCksZXgXydyiUuJ0K3sGK/2ut4K19N5Y
 1RF8aEmiY8gLCqkR3QzdAwpqB9f7CbTOvf5THnii6yVLwT6BZA0ObfQ3ZdJYT2W8rKoY
 ZD6dc/JtTu+Oukif2+WVSMwzax90gO1e/MjO1I4Phxk/93Ispzxbp3zCuDhM3ZTKwCEt
 bcFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yY3j+tzAidsewEpOKH7pvngWyOrXZYN1znzf8G8c2/o=;
 b=qCub/xkh4qgo+ouPi833O0bi7wmjU77k6whT6bB3h2Gc7s25W3wFx1U/7yoc1qs/Ah
 wI88AiTTsgby+eWjrrhecvQAMm5oLe9IiOCY4o2O90wXbm3gxw9XO5VqhBHEcjucl8hY
 HvgzkKy5TTzENmzaTX6gMBBfMKuEn1Pqs4KcaT+kkgft55ylvaqtrq6wAKHKJKWafWGX
 DX2ZKjT8h+BBloPdRFW0wP6nKf7lg8ovIwReVveUyZermwcC9Y43u3gMOCS1qCf3IzBj
 gdGk2PvU6kwyB3gzLEsjJ5Lm0mPmoZYMlz+rKN2DDhFzUBT+FQw3XvZ2qQR6uPZyuTIW
 e7mA==
X-Gm-Message-State: APjAAAUTfIqguKYhhHIb6nGiVIVfVF6TxBXkqiidUSNnHjJBMgpVAlaH
 ZzXceSbLqFUGH+jSADNH/yv5hw==
X-Google-Smtp-Source: APXvYqySdA0FxJMGYIhbPWPNlaaNMqY14nOQdlvcbZOf6sDtJJSN0OFSBC4FzOtGc7e8Ynj8q0FmxA==
X-Received: by 2002:adf:dc51:: with SMTP id m17mr47047026wrj.256.1565685356898; 
 Tue, 13 Aug 2019 01:35:56 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id o11sm8651822wrw.19.2019.08.13.01.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2019 01:35:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	broonie@kernel.org
Date: Tue, 13 Aug 2019 09:35:47 +0100
Message-Id: <20190813083550.5877-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
References: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, spapothi@codeaurora.org
Subject: [alsa-devel] [PATCH v2 2/5] soundwire: stream: make stream name a
	const pointer
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Make stream name const pointer

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/stream.c    | 2 +-
 include/linux/soundwire/sdw.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 60bc2fe42928..49ce21320f52 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -863,7 +863,7 @@ EXPORT_SYMBOL(sdw_release_stream);
  * sdw_alloc_stream should be called only once per stream. Typically
  * invoked from ALSA/ASoC machine/platform driver.
  */
-struct sdw_stream_runtime *sdw_alloc_stream(char *stream_name)
+struct sdw_stream_runtime *sdw_alloc_stream(const char *stream_name)
 {
 	struct sdw_stream_runtime *stream;
 
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index aac68e879fae..5e61ad065d32 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -830,7 +830,7 @@ struct sdw_stream_params {
  * @m_rt_count: Count of Master runtime(s) in this stream
  */
 struct sdw_stream_runtime {
-	char *name;
+	const char *name;
 	struct sdw_stream_params params;
 	enum sdw_stream_state state;
 	enum sdw_stream_type type;
@@ -838,7 +838,7 @@ struct sdw_stream_runtime {
 	int m_rt_count;
 };
 
-struct sdw_stream_runtime *sdw_alloc_stream(char *stream_name);
+struct sdw_stream_runtime *sdw_alloc_stream(const char *stream_name);
 void sdw_release_stream(struct sdw_stream_runtime *stream);
 int sdw_stream_add_master(struct sdw_bus *bus,
 		struct sdw_stream_config *stream_config,
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
