Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6D92419D3
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 12:37:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEAA71614;
	Tue, 11 Aug 2020 12:36:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEAA71614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597142221;
	bh=PnIsAgseScuuaujleqYaGPmk7PwvxiPyEEPaKjLhew8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CGeCN+DtkzA3JpmriSdHNVuSIedwLrePvnsNB0retW2XRZhi3RGqq4ISt1RpPCz2T
	 jggZt1NQiKAW0xBk7aB7N5FxM3c8TLlEULjFgIkTRUdyAWcEvqxSThkv7boMbEHMKm
	 zEme3xIbS8EpI/nrR6Vx7T1pKTCNjzArvfcuzZg8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DA26F80162;
	Tue, 11 Aug 2020 12:35:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46F4AF80161; Tue, 11 Aug 2020 12:35:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5447F80118
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 12:35:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5447F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="FaYh00uP"
Received: by mail-ed1-x541.google.com with SMTP id di22so8665136edb.12
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 03:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uRwIOipcItrxEdvc73BAciFxrjXyyFnJHwCmi01GD6k=;
 b=FaYh00uPA0inU6V6X2XtdZN53s+We0TQUPc9IhKJ3DbWywQJQ+i0UAQxlILma4ALQo
 IyOcKDSGziasn+GtzETnNfBUyQdbmIgZmGVvuf0HFrvQdgW/zE+hYMYiMGZAJsF+ThPs
 siOxI+L5Ibaa8SCuUr4vQXMPPziiyCHH+YPXyRsN4inm8UUENDKzhOlRPiSTymjY3SQ2
 VDdyS9wWP7/pBtZRewKvOJ69hnPNpzC6MkhXVjeZvW9NWZeguZjak6jl/vpwlXRa8Y8w
 irs1XnmomSkDKmr88V1QU74osUol2sTOfAgb21IMXAGgjc251BsYZPdpb9Puc2jGEvPm
 XwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uRwIOipcItrxEdvc73BAciFxrjXyyFnJHwCmi01GD6k=;
 b=T+xZ3Qhn0+WRBgIhy1l+TcIVD7MJCFoGr5wuMUS+zFa+FtUzCM03hmkW7eLjGckSW9
 nWfhfunWLljQRsq5PoAZ8LcOQ36IJspInDaVzhfmPfZ6iXSxSXsT7y9KcaMtxAHfdHVi
 601Pb5u/dhPmtNAgkbkwA8yoCVeQi5PTUpmXL1DiewHqFRHHGXgIwO0YKitT9shhvkFj
 7Tt53Dh+oEX8nCHfoRcoBDK5qWjq0xHTjJ+4/EZsyCiiKzb8EemYJIfV7ZfjYlpgPqAP
 sSEh26LXC6qidJpiOBOWms0UMiq76exCwl0Ih/s6hb4DSvQLosm60ZeRHqy4AUuoHwcH
 ippQ==
X-Gm-Message-State: AOAM533Xx5bnWa/+AX610BliZv9xD0NkJyrqTd58RQSWPsJcjGkDVqn7
 vAd0p1qMSsJ07juFrL7SXIdf6vjbbao=
X-Google-Smtp-Source: ABdhPJy8ApjorAKEGaNyUAsmOZgPX5uvHrh5fbCJQl0ALsJMNqZQ4GtLfP/Z4GNVsouofKCKA2PxnA==
X-Received: by 2002:a50:fc0e:: with SMTP id i14mr24919687edr.346.1597142108347; 
 Tue, 11 Aug 2020 03:35:08 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id q2sm14639997edb.82.2020.08.11.03.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 03:35:07 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: msm8916-wcd-analog: fix register Interrupt offset
Date: Tue, 11 Aug 2020 11:34:52 +0100
Message-Id: <20200811103452.20448-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, john.stultz@linaro.org
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

For some reason interrupt set and clear register offsets are
not set correctly.
This patch corrects them!

Fixes: 585e881e5b9e ("ASoC: codecs: Add msm8916-wcd analog codec")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index 4428c62e25cf..3ddd822240e3 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -19,8 +19,8 @@
 
 #define CDC_D_REVISION1			(0xf000)
 #define CDC_D_PERPH_SUBTYPE		(0xf005)
-#define CDC_D_INT_EN_SET		(0x015)
-#define CDC_D_INT_EN_CLR		(0x016)
+#define CDC_D_INT_EN_SET		(0xf015)
+#define CDC_D_INT_EN_CLR		(0xf016)
 #define MBHC_SWITCH_INT			BIT(7)
 #define MBHC_MIC_ELECTRICAL_INS_REM_DET	BIT(6)
 #define MBHC_BUTTON_PRESS_DET		BIT(5)
-- 
2.21.0

