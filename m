Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0D81A7913
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 13:05:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E6BF16A5;
	Tue, 14 Apr 2020 13:04:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E6BF16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586862342;
	bh=NEXF3ezdf542MnbQ15GHQkULaaUEy4QyP2AyRlL6ogE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YubNVdhvkr1P0KDNqAB7pc+C//toTp6C8XUr62dzzJeDz9elyfdfs018DFUg5nADA
	 qpoEi7LjSeZEpCyoVYJgN0QYMzgFkacWbhWNyJcXitBvOl8yg1Kdb7e8uQQVyR83xR
	 fV+WfCHitOS/1ob4wcXT5g7Qd2uf6SOAMZB9FEjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1FF4F800F5;
	Tue, 14 Apr 2020 13:04:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CE1AF8013D; Tue, 14 Apr 2020 13:03:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88F85F80115
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 13:03:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88F85F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DT7CG0ss"
Received: by mail-wr1-x443.google.com with SMTP id h9so13797676wrc.8
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 04:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kozp6i3Lacgef5+4DSMHoj7MA9dOzLCEz2jUPeMWfbA=;
 b=DT7CG0ssfUne9lNYdPJ9Ecue56wKlgS2k6+ncHI0dPVClo4XpziRxwmp23K8foCmoW
 Ies2xoFcXT9MXxE5iA+V6bHWY+JTD6hewBKACAJeqfyZDKIu8GPbEaLyvgNm+U3awvAt
 mbopGWym3uqalLQSDP58sUntlxfxDSo4HkgjF/Hk+TLm9DQOgxAbf3YLvRuHfd5iQ8LN
 waM/w2GqFMv0wIzsspgGB4Q9OZRyN7XXo9NgIMwnnkJDf5ZLlvpdoJnatqsbTlL1FUGF
 sG2ZBK/c90tuKWrzt4k0obq2TMLvpzB1+Ny8vy/agL4I3jM4rhJ8kO4XAHSm675H/RBU
 4y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kozp6i3Lacgef5+4DSMHoj7MA9dOzLCEz2jUPeMWfbA=;
 b=jK3/FtH5Vi/qDEjDIMNQKZIpWiiHWaRfpjPHmp5mT2+xsnrC/Sn+iO8+sE6yeZdSZ4
 4ZHlYt2Vd2UzXqaS5guZcLEkHH+jaBUNx/bBuyduj0Ck7PCrBJXJC6SCvqxzoX5VwVlv
 UghGWG8FhHmqnRBxW/IDJw8xBvEPzX4wy/LU5TFhuGtldGNTTSZLbLKzbk5CoJsuaREh
 Ciq2L3py3vf/FVkLy/E4nLtzF6EQ4vI2XZuMy06IaiFJ0HQb7CTLh2cqLDaEDx/EE9vd
 +VbJnEu9m0+4t1f2UVrs7zoNL0QxfWRW+tIaDSGUab3YpR94+Z3Oe64SYambQGAIXF5U
 6mQQ==
X-Gm-Message-State: AGi0PuabX/jCTZv1YMbDxRDDXMUX6d3A6d0ztuQ9q8pgeh2PbxbjVu8n
 xC8vBcLuH6susBKr2Y52h4Vl4Rk6Q5s=
X-Google-Smtp-Source: APiQypLnFggHzw40uCeOKStfMH7DEa3ix/MQQT+27B0+i0Gpd4CjYgAioKfmQb4l8jR9Raq4nljbAA==
X-Received: by 2002:a5d:664f:: with SMTP id f15mr22603091wrw.72.1586862235663; 
 Tue, 14 Apr 2020 04:03:55 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id 5sm17989784wmg.34.2020.04.14.04.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 04:03:55 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [RESEND PATCH] ASoC: wsa881x: mark read_only_wordlength flag
Date: Tue, 14 Apr 2020 12:03:47 +0100
Message-Id: <20200414110347.23829-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: vkoul@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
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

WSA881x works in PDM mode so the wordlength is fixed, which also makes
the only field "WordLength" in DPN_BlockCtrl1 register a read-only.
Writing to this register will throw up errors with Qualcomm Controller.
So use ro_blockctrl1_reg flag to mark this field as read-only so that
core will not write to this register.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Hi Mark,

For some reason this patch was missed during last merge window,
Other patch in this series is already in mainline.
Without this patch audio is not functional on DB845c and other SDM845
based platforms.

Can you please take this for next possible rc.

Thanks,
srini

 sound/soc/codecs/wsa881x.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index f2d6f2f81f14..d39d479e2378 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -394,6 +394,7 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA881X_MAX_SWR_PORTS] = {
 		.min_ch = 1,
 		.max_ch = 1,
 		.simple_ch_prep_sm = true,
+		.read_only_wordlength = true,
 	}, {
 		/* COMP */
 		.num = 2,
@@ -401,6 +402,7 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA881X_MAX_SWR_PORTS] = {
 		.min_ch = 1,
 		.max_ch = 1,
 		.simple_ch_prep_sm = true,
+		.read_only_wordlength = true,
 	}, {
 		/* BOOST */
 		.num = 3,
@@ -408,6 +410,7 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA881X_MAX_SWR_PORTS] = {
 		.min_ch = 1,
 		.max_ch = 1,
 		.simple_ch_prep_sm = true,
+		.read_only_wordlength = true,
 	}, {
 		/* VISENSE */
 		.num = 4,
@@ -415,6 +418,7 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA881X_MAX_SWR_PORTS] = {
 		.min_ch = 1,
 		.max_ch = 1,
 		.simple_ch_prep_sm = true,
+		.read_only_wordlength = true,
 	}
 };
 
-- 
2.21.0

