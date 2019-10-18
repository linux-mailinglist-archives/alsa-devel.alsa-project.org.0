Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B840DCFD4
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 22:14:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C9A885D;
	Fri, 18 Oct 2019 22:14:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C9A885D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571429694;
	bh=wF9rBAUGUnvdpSC3cRXDARudX07um5Tie++XODwqB3k=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TN2mTHRi3qi8kfZpuVSI7OtMRQMx9O5OUEOo8qGaVmED2F8M2oW7mQE5N/7By6M+d
	 NZG0pPXYb+vI8LTRKuJrPNKC5dl5UOvF/EuL0bFgTTHyu+f+/tpLI3Y6OORaFZAIm+
	 E77DilJquB0xvBYrgSMgv352HoraSRzsh8bLrbQY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 533C3F8072C;
	Fri, 18 Oct 2019 22:05:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C7E4F8065D; Fri, 18 Oct 2019 22:05:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 590C6F8065A
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 22:05:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 590C6F8065A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="dq/rt5hZ"
Received: by mail-pf1-x444.google.com with SMTP id q5so4500497pfg.13
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 13:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UrGM4XMPIZ54nhe47WX7fEV/zcd4T2H47VLwVS3uqjA=;
 b=dq/rt5hZnLLA9YEOJojUqQ36gLCnDfWs9WJuseP3hso+Rsgt681xrs+CCw4MO4b8/y
 E7JgQsK3+QgqXSvlRtFJciD6uKtnjwczJRVE/IS1q/nStT6fm/ymNgPpjdMbhHMaCjWO
 X1OFaC5wygMhGhZJ7WdZ3pUo8Q7n9G6d0BW9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UrGM4XMPIZ54nhe47WX7fEV/zcd4T2H47VLwVS3uqjA=;
 b=gSB7XONr7C8Ky4A8ooOhsj29jXbTxqfBne47VqPyHwV7/xKtme0VdNWvaEFIwELzgr
 +2WGy6vQ3h962h9qRZpFik9EuWovg6w3PiPQYsMBAjf87vrhJtTZMGzqpn62hayLIgyu
 v7pgMjW1YYrTlYff7mqIL7Z9NPJliCwGCsoJhacht9QIgoA+YQQXDybURK/ASW05wfRS
 jMWq2ciuONdDlAFQraJg0IJk8o+I6whPlccSL7sv8vmdVOxR/lVfu+Rgh/FyIlRyh501
 ITPiRhpRXOVTW3A0fD0JwcI8ovDDvqBAMTGSbpf/yLorlcuCSkVmFRyDgFOuEth+9tze
 IBcA==
X-Gm-Message-State: APjAAAWDXiJWENv03LJ8mfEZCMfmU8ccn5K6nmCrtqB3oV6PCoYUNvnN
 m4GEGc33J5l40zhFW/9CNQA+JA2xNzPE
X-Google-Smtp-Source: APXvYqztEqL94ERvQE3ay1oGJnlxaIaEBtXCiVYzxpO8cBq1pIl+p8F98VW3BaAgxV7KItiOJbr54A==
X-Received: by 2002:a17:90a:86c7:: with SMTP id
 y7mr12618859pjv.82.1571429122618; 
 Fri, 18 Oct 2019 13:05:22 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id g7sm13895384pfm.176.2019.10.18.13.05.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Oct 2019 13:05:21 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Fri, 18 Oct 2019 13:04:49 -0700
Message-Id: <20191018200449.141123-13-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191018200449.141123-1-cujomalainey@chromium.org>
References: <20191018200449.141123-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bardliao@realtek.com>, Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH v2 12/12] ASoC: rt5677: Wait for DSP to boot
	before loading firmware
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

Wait for hardware to startup. If we load before hardware is ready we
could end up corrupting the firmware.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5677.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index fdc3e5d6f9430..123d68baa4d72 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -894,6 +894,7 @@ static void rt5677_dsp_work(struct work_struct *work)
 		container_of(work, struct rt5677_priv, dsp_work.work);
 	static bool activity;
 	bool enable = rt5677->dsp_vad_en;
+	int i, val;
 
 
 	dev_info(rt5677->component->dev, "DSP VAD: enable=%d, activity=%d\n",
@@ -915,6 +916,18 @@ static void rt5677_dsp_work(struct work_struct *work)
 		rt5677_set_vad_source(rt5677);
 		rt5677_set_dsp_mode(rt5677, true);
 
+#define RT5677_BOOT_RETRY 20
+		for (i = 0; i < RT5677_BOOT_RETRY; i++) {
+			regmap_read(rt5677->regmap, RT5677_PWR_DSP_ST, &val);
+			if (val == 0x3ff)
+				break;
+			udelay(500);
+		}
+		if (i == RT5677_BOOT_RETRY && val != 0x3ff) {
+			dev_err(rt5677->component->dev, "DSP Boot Timed Out!");
+			return;
+		}
+
 		/* Boot the firmware from IRAM instead of SRAM0. */
 		rt5677_dsp_mode_i2c_write_addr(rt5677, RT5677_DSP_BOOT_VECTOR,
 			0x0009, 0x0003);
-- 
2.23.0.866.gb869b98d4c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
