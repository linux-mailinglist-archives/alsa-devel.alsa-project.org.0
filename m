Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 743B9386AE
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 11:01:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFB0E1614;
	Fri,  7 Jun 2019 11:00:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFB0E1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559898094;
	bh=p5O4hjeHrNFyT8pfpkr99xxobycLX0VDDYnOaTyHacg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=enX1ld00uMWNiHbJ7MUwjayY/R6Ecc57GCl9scjwBLFtdlp1TKW+xv2bM9emgL10O
	 DCgywJTpjN83XC7NfjscLDtSt8syg1hsw0gSFLP7nXXWkIE9+D5GBZgxmoSnHPjNhL
	 bskxsFietpws6l5oagSt9BEG3Txw8szDLBiMj0Yc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69C3EF89743;
	Fri,  7 Jun 2019 10:57:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD79DF8971C; Fri,  7 Jun 2019 10:57:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 339F3F896EE
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 10:57:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 339F3F896EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="EzEoTfGd"
Received: by mail-wr1-x444.google.com with SMTP id r18so1300974wrm.10
 for <alsa-devel@alsa-project.org>; Fri, 07 Jun 2019 01:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z8fhTKi+VVSku/kTsVKcccq1Qmu0W95y7iOKJ1nv6hE=;
 b=EzEoTfGdVVOJaynPLsXEMeFeVZtwTwFhyXtQrI3rKSqV8H3ZfGdTwji1udaIHaABtU
 VRi7cV8cfw10eJmJA6JkkjKO6TWHpa9XkC5CeNbYGfIHnGvg65jpgYllHCt3qau+2Y6P
 F3OJyai+Tgym6KERBDCWRrLJxSUzn6oWlzcmpaAe6+OeQkZ71p8ggDE0mCJsCoYIyyYT
 E+MkkhO4wyx5E6SbCB4M5cqmF7ZjB5JBHnnOcYxigGXAniCpYuTgGQHRCfoEUFHbsXVq
 0YtuslOjmDWk6Hb8CwiiManM+xzyc7+SdLPM624xRaiy5ccjkKeSYuu/jRZCgvtADZMU
 kknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z8fhTKi+VVSku/kTsVKcccq1Qmu0W95y7iOKJ1nv6hE=;
 b=CWOd9C/W1NLR6s25YK76gFokiO1grs6zyfrG0LTomEGyaVy8xvGCCv5R9X11JKEVy8
 AwAerUU8TEKrSodGz4YFncqgsBA+UJSThu+Nop7fmjqBSaxBRAwBwLH0cstlvBXJGP0c
 WurC3byKlYYWpN7FAVQJl13zSWCzl/KR3vKJ6m+nkoPE28GctGnLKI3Ez6IVSxpEP9I4
 04wN33LsW1e7fyXO2+AGmqE2zBkQNP4eEQetylDkJSpNy5XoBiZGpFvb4OzSBvPtlXGU
 Q967hUuRnojZLm0wuc+N/mQJWsr9neR/SVOq+QY+fIGMyOd7tcs+HkmZQl7TfkfbHrO5
 Fl4w==
X-Gm-Message-State: APjAAAXhLieLL/N/6/AfJd3O7l59V0KUnBrh/mRR2PoPrRtbKsR/ofgj
 697vAUrzDTIhGV7PY5nqmhbYxw==
X-Google-Smtp-Source: APXvYqxJuz+HGJNvMdyev3P2gMFBfXJAsHfbMi4yuIHtTZ+l1w/7//HtLuMqhwXZe+b2dMcLe2ZRiA==
X-Received: by 2002:adf:b605:: with SMTP id f5mr1981678wre.305.1559897832270; 
 Fri, 07 Jun 2019 01:57:12 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id d10sm2035308wrh.91.2019.06.07.01.57.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 07 Jun 2019 01:57:10 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Date: Fri,  7 Jun 2019 09:56:41 +0100
Message-Id: <20190607085643.932-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
References: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [RFC PATCH 4/6] soundwire: stream: make stream name a
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
index b86992145799..8da1a8d2dac1 100644
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
index 80ca997e4e5d..457be7d09a4a 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -831,7 +831,7 @@ struct sdw_stream_params {
  * @m_rt_count: Count of Master runtime(s) in this stream
  */
 struct sdw_stream_runtime {
-	char *name;
+	const char *name;
 	struct sdw_stream_params params;
 	enum sdw_stream_state state;
 	enum sdw_stream_type type;
@@ -839,7 +839,7 @@ struct sdw_stream_runtime {
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
