Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B795633CF
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 14:56:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 424F8823;
	Fri,  1 Jul 2022 14:55:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 424F8823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656680199;
	bh=pKCTWUliJDDf198anYBWs1i6HW/CTWUS8w6QC1i65qI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fMTZISEdqBv3Xz9/VbBPIvX4Xot8lsqjZkjzzlTraSWXXypxQolPsSkYAJl/W07xS
	 Pxt2z76SM8sipGyl37JUhgX82olVIYbMoOLiVo4fdoLR3cLHA/3CwQZ91wG6DCpEJj
	 GgnRQ4qFndawRClhwykaRO1xwgE7Fru46rFkHi9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F148F80256;
	Fri,  1 Jul 2022 14:55:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 973FEF80155; Fri,  1 Jul 2022 14:55:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E560F80107
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 14:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E560F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="D0AhKSEZ"
Received: by mail-wm1-x32a.google.com with SMTP id m184so1271231wme.1
 for <alsa-devel@alsa-project.org>; Fri, 01 Jul 2022 05:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2/zpAUSXHcaK7+lz3X+at5X7Rn81jEs7bS7mt8AYxnk=;
 b=D0AhKSEZcFIDBZ23WtrHIbfZg8MnEF/dKg4mqa2PGaifGv7RQe7whTR/TxHhD5REk8
 j/Xxxo9POeccf3YCBnnku8MldUOgMVE/EiI/vEufpyUDDBol4dzImfjNHbmHiHrXIhdE
 gseBf4Stys2CAlHvdgvqBa/BpKVjkRvsLQPSZ2svmkpPT1lJNXkxtp5L/jSy5LZPnP5q
 8QYUy4CU/sP+rCnAMTxyrziH/Wm8kzkh6s53OQenz2baGYp8BmOxlR6s8JrPuQculXrR
 dtrwz9QwEj7SSm2HjLgG3EBIdm56c4FckBu9FcjO0KS6PzgbcI5OwCdgkqFHLLg2QqBB
 B8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2/zpAUSXHcaK7+lz3X+at5X7Rn81jEs7bS7mt8AYxnk=;
 b=TzBLZ92tmW3MseyTCRA1rwo8LPV9cI4gNiLuL68IGds+1+COtZgKCGY3wn4Vson0nH
 VK3+ufrXuxES/uXWG8Q2dfluGSVqxD5Gl5Fgol6O+45GJQP9Xv/9hocpgEV/F88SgMft
 waavsy5EIgzVlKoUTlXzWn3FliAuMcIC88R69J3BF1nSSL+I8x3UFFP2MyOUHqNiWqVa
 KPgSbVCUugvHJpSXMKtnjhoZcDtA2BGergyjmYHBISykDsJupxSY2gUJ19RlMsxBao2F
 Vexlk9kltYsfBs1x0Gf00NUyJqhcWCu00xa2MLJK0SCIWHBdI/QsdTY5LcP99YpUY3nx
 swqA==
X-Gm-Message-State: AJIora9367l2K+pGA86GRz8e5Od2lk1HrNHV/sKAqlfluNXdar6Q9Wfo
 YXvIZcLuiFF3jW/7DN0JdefCbQ==
X-Google-Smtp-Source: AGRyM1uKRBghJ6kcFj5l5By8aD2i2YYibOuzmE+MmY5PZ5v4hYIXCXbw+CXC0mQh5PUqeSel7HmEsg==
X-Received: by 2002:a05:600c:1d96:b0:3a0:30b6:bb1a with SMTP id
 p22-20020a05600c1d9600b003a030b6bb1amr17589862wms.93.1656680129537; 
 Fri, 01 Jul 2022 05:55:29 -0700 (PDT)
Received: from srini-hackbase.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 i1-20020adffc01000000b0021b5861eaf7sm22798386wrr.3.2022.07.01.05.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 05:55:28 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: codecs: wsa883x: add missing break statement
Date: Fri,  1 Jul 2022 13:55:15 +0100
Message-Id: <20220701125515.32332-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
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

Add missing break in one of the switch statement.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: cdb09e623143 ("ASoC: codecs: wsa883x: add control, dapm widgets and map")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 40c7d64a9c41..dcd88175b9cd 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1204,6 +1204,7 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 						      WSA883X_SPKR_PWM_FREQ_F300KHZ);
 			snd_soc_component_write_field(component, WSA883X_DRE_CTL_0,
 						       WSA883X_DRE_PROG_DELAY_MASK, 0x9);
+			break;
 		default:
 			break;
 		}
-- 
2.25.1

