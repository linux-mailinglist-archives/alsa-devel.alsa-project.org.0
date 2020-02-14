Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D67C15D836
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 14:16:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1E531682;
	Fri, 14 Feb 2020 14:15:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1E531682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581686188;
	bh=TLsUGcv6omKGueZAKMqN8lefN389sxySMO+6VLeLMFs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XupKSnxavPiM7FwEBg+SP1awIPr9zw9Eofywgpu86ibUJ6l0j59jeEPvejOzl/r2T
	 3J5NJepAtFJmBz/GuL8CwxtnKgMizXxP28yfjuVF+jLFvr0d7NqNFm5T98VR0bv2WB
	 r2txdTcXryaonihc9ihp6B8sXbNGt8CFmAgDR+7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16A1BF80138;
	Fri, 14 Feb 2020 14:14:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B0FCF80158; Fri, 14 Feb 2020 14:14:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50DC5F80138
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 14:13:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50DC5F80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="N422ErcP"
Received: by mail-wr1-x444.google.com with SMTP id w15so10857442wru.4
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 05:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sx2gKjAQJal87pQJbLzDoMa1/1VjjJ5Q248YqNAOaeA=;
 b=N422ErcPs9NI0qQ9oVh8hQQl5TMjeSe4c4P3iVWsbGe1Ufj2jDDOuRWEMhjjZ5QFpe
 AW8ZMdjeYX9cnNx+/7/qRXb5L45+g8ASci1nw7zmvrlk3df/JnQngoeanBhgKfDzlbdt
 JgdO9SIL0WD1fwHAZ1n5HSGa2Yj0h9ZHHRufJAYNcS9RdvaXcBfMaN7tt3VqKGaxIb22
 mVlPU0P6tatHNqV8k7eV4JGfwBXs+89328BCQ6tknbNxUDMu/+Erxbxp3y2A3HM7rFwo
 +Cc+jXo5o42RwZP4LJwOp1MTVua74Jb1c+KQwCJuTngywi6ZWtXTDP0MhI5wqnUHvAcZ
 mKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sx2gKjAQJal87pQJbLzDoMa1/1VjjJ5Q248YqNAOaeA=;
 b=I8XPRkxXxr6JZGUiaPmcaQ4E/+uglLJGU5d0kSnf7avMQ4MvFdeAEqwn0sU2TbQya6
 tqaqNPls7RuIpyKw+obP+1nE/rNDasYr5gf2wfRmISZf7CvKrPz3NtBr0IETK88E89nF
 w2cnyTye0FocnNRmevLBcFhxLVm3T8n0r/0cy8CfhaKyn9eFDN4lO2/9K1CIbq6uAEE7
 2HxzeDfgjLdWbuqmc3qAkCpAN6yM4hNSAalws78yu9k3TorhFECyOFguRuh7xZtugE8J
 PJaCY9hj4wxR6ppShF25390fQihq8+FpkOwPB8roroI74/BXCH7sRx1UQCx6rK3Egt69
 gRSg==
X-Gm-Message-State: APjAAAXCT9FWhq22BIWK/o4bRFnWfH8mqfKghY1LUOfQgcdLQGqW2iIv
 pOqAwWmbm9TS/RZNH/KSg6fEaw==
X-Google-Smtp-Source: APXvYqwPovlBw5L+IhhgUPCRfLNltnNqjwAk6wy8BfWcbw70VU71jYxmICvuD2qHagjj9wv+rO5uBA==
X-Received: by 2002:a05:6000:124b:: with SMTP id
 j11mr3718396wrx.285.1581686035381; 
 Fri, 14 Feb 2020 05:13:55 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w7sm6760792wmi.9.2020.02.14.05.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 05:13:54 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Fri, 14 Feb 2020 14:13:46 +0100
Message-Id: <20200214131350.337968-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200214131350.337968-1-jbrunet@baylibre.com>
References: <20200214131350.337968-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 1/5] ASoC: meson: aiu: remove unused encoder
	structure
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

Remove an unused structure definition which slipped through the initial
driver submission.

Fixes: 6ae9ca9ce986 ("ASoC: meson: aiu: add i2s and spdif support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/aiu-encoder-i2s.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index 13bf029086a9..4900e38e7e49 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -28,13 +28,6 @@
 #define AIU_CLK_CTRL_MORE_I2S_DIV	GENMASK(5, 0)
 #define AIU_CODEC_DAC_LRCLK_CTRL_DIV	GENMASK(11, 0)
 
-struct aiu_encoder_i2s {
-	struct clk *aoclk;
-	struct clk *mclk;
-	struct clk *mixer;
-	struct clk *pclk;
-};
-
 static void aiu_encoder_i2s_divider_enable(struct snd_soc_component *component,
 					   bool enable)
 {
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
