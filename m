Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A740446E090
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Dec 2021 02:58:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28B1F2330;
	Thu,  9 Dec 2021 02:57:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28B1F2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639015118;
	bh=lBFyJ6TUdlVcQnJR2n6aFER/bC1ANZUpM8iUTKkCDRY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XQqWAWHAd7xTI8HVNi/90vR7KE+RWBpsP0kkglvG5YxzKzkUGkbyn3J95vTfTzXtr
	 7N4GDWKcJBQYxt7SNNfSHVurxMgxeDJtIPe372Hezt4n6CT+sFAH9kwMTuwfLWyO8j
	 uJ94dOvhShwSKZEEPa8DiXoV4NhafO2cbYQZbTeg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C440F80103;
	Thu,  9 Dec 2021 02:57:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50498F804E5; Thu,  9 Dec 2021 02:57:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B31FF80217
 for <alsa-devel@alsa-project.org>; Thu,  9 Dec 2021 02:57:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B31FF80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ba1znVjX"
Received: by mail-pj1-x102c.google.com with SMTP id
 f18-20020a17090aa79200b001ad9cb23022so3608219pjq.4
 for <alsa-devel@alsa-project.org>; Wed, 08 Dec 2021 17:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X5JhuTQaSxTx893jA8OEYjLZ6m+UdW5ZaFdhJ6c8uD0=;
 b=Ba1znVjXLY9GcEcVgPC+HjDyG9n6vEr76BaqSF45Rkblx6GhAiq8SPzc9NJLA23TTx
 QT0pbH1LhxSGNgAeqp8W9y1G2PYsmJx//5tjLbJ20xIy3iOXFJKaAtVBNo7YsorhwAAT
 LU5EllIYETKOGr487pn8D/Ehhg8Es07ACMwAVhNT4x4HrsQijtW51S9o+GuHvukAZoIb
 71+he2EX2hylva4nv7QvraTYh4Pus/ACybGeZR99wQAXKtAXx4GMQff9Qx8RVxygHwzD
 UlduSGJvGrYaPjs050TLuLiG43iKTiq/JYM496cEeqUxyh0alkKc/YZCbyXaN4P/L3xn
 8d1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X5JhuTQaSxTx893jA8OEYjLZ6m+UdW5ZaFdhJ6c8uD0=;
 b=wuPaGQkMvS32myjwE6Wx7lITqnOUJJkWVKK6GwrGavpVlUY3rB/mlkB86ST67lr6v1
 kYWAGj/M2QW/rUhOYtwMaJIlyHkBUWD5XWMtDpDKExKeZrN3TiKoRni/wRVexAxA21HM
 QVZvVDkdwyHQxVwZpsUCG52ZDwY5l0L6+JMiJIAFtvBTZv+3sOS4GGNEOjn/EdcYXb/7
 4Wj/jKwVTdlcAfCMW3KmN796134At5BSSeL5pIzp9FQ6LakBX3T9EJH5Ng/OJHuL+g05
 UXtF6JrOBoCucz/AOY5Tw1vuRxFBFSCmssfVx6TJ292RZkNhAwR0qi5E9/BjMtWh0npw
 71LQ==
X-Gm-Message-State: AOAM531AnrH52y/bsFnih+TS1Gu5UB+xSmvFGzgxwqg7WZQD8HAGL4HA
 0hvG8sLCphHUBYgfttwqHpA=
X-Google-Smtp-Source: ABdhPJyn5cV0V2r/Ax01DHo15SrmY4+pGt+Dmaz+wqBD3YLt3imwzKNbDbcT3qSwczTEmqQdiaDiKA==
X-Received: by 2002:a17:90b:351:: with SMTP id
 fh17mr11764748pjb.19.1639015032987; 
 Wed, 08 Dec 2021 17:57:12 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id i3sm4546748pfe.75.2021.12.08.17.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 17:57:11 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: lgirdwood@gmail.com
Subject: [PATCH] sound:soc:remove unneeded variable
Date: Thu,  9 Dec 2021 01:57:07 +0000
Message-Id: <20211209015707.409870-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 srivasam@codeaurora.org, lkp@intel.com, kuninori.morimoto.gx@renesas.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, chi.minghao@zte.com.cn,
 broonie@kernel.org, pulehui@huawei.com, Zeal Robot <zealci@zte.com.cm>,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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

From: chiminghao <chi.minghao@zte.com.cn>

return value form directly instead of
taking this in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cm>
Signed-off-by: chiminghao <chi.minghao@zte.com.cn>
---
 sound/soc/codecs/mt6660.c  | 5 ++---
 sound/soc/codecs/wcd938x.c | 6 ++----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/mt6660.c b/sound/soc/codecs/mt6660.c
index 358c500377df..3a881523c30f 100644
--- a/sound/soc/codecs/mt6660.c
+++ b/sound/soc/codecs/mt6660.c
@@ -47,13 +47,12 @@ static int mt6660_reg_write(void *context, unsigned int reg, unsigned int val)
 	struct mt6660_chip *chip = context;
 	int size = mt6660_get_reg_size(reg);
 	u8 reg_data[4];
-	int i, ret;
+	int i;
 
 	for (i = 0; i < size; i++)
 		reg_data[size - i - 1] = (val >> (8 * i)) & 0xff;
 
-	ret = i2c_smbus_write_i2c_block_data(chip->i2c, reg, size, reg_data);
-	return ret;
+	return i2c_smbus_write_i2c_block_data(chip->i2c, reg, size, reg_data);
 }
 
 static int mt6660_reg_read(void *context, unsigned int reg, unsigned int *val)
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 52de7d14b139..0033d61d42e8 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3083,7 +3083,7 @@ static int wcd938x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *compon
 						int micb_num, bool req_en)
 {
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
-	int rc, micb_mv;
+	int micb_mv;
 
 	if (micb_num != MIC_BIAS_2)
 		return -EINVAL;
@@ -3097,9 +3097,7 @@ static int wcd938x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *compon
 
 	micb_mv = req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd938x->micb2_mv;
 
-	rc = wcd938x_mbhc_micb_adjust_voltage(component, micb_mv, MIC_BIAS_2);
-
-	return rc;
+	return wcd938x_mbhc_micb_adjust_voltage(component, micb_mv, MIC_BIAS_2);
 }
 
 static inline void wcd938x_mbhc_get_result_params(struct wcd938x_priv *wcd938x,
-- 
2.25.1

