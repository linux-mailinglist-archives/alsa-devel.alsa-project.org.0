Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 310D542DEFE
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Oct 2021 18:15:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2961166F;
	Thu, 14 Oct 2021 18:14:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2961166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634228105;
	bh=R69y6zYlN8CH5FnJQxDIZTa7FsZNanhG9Lzj/i4IjV4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qnX0crrOvB5LnYQkxQ3GuRmiZRku5z4OjTKSASsW/hhS5G7Go3dBIvfbf+XPabMoH
	 KBQMYRaFxA60SJQkTNTgh90e6zV/q7rwgrbjATHAGdhvyJWCF2nBV17Qya3PJyKW84
	 Ojn0SbUSMcMm/dyAIWgNEWqNCij+QmEenzWsXQM0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FB8EF80245;
	Thu, 14 Oct 2021 18:13:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBA47F8016C; Thu, 14 Oct 2021 18:13:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C607F8016C
 for <alsa-devel@alsa-project.org>; Thu, 14 Oct 2021 18:13:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C607F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DopyTCt6"
Received: by mail-wr1-x42e.google.com with SMTP id g25so21048135wrb.2
 for <alsa-devel@alsa-project.org>; Thu, 14 Oct 2021 09:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MpQlQNCXARciYprQkeu7l6U8+AuEKROU5Z3kKaJ5pRw=;
 b=DopyTCt6liTXwN04S83JM1SzJZzqGu0aUhfn8LVrYqJ4rmN9bKD9r5EPCBg5ztLHB3
 B+BANx/tXToxMjMD30bbdzriDs9YAOoP+KjzeSEdCJIDdSfd4Smq56lmC9rrOtQRtE/1
 JAHBfbsHaa+zmssZtY1CR1q4SZrxowU7v8TskwZbJuX6Pu0AOqEcGnDn3VUXLqVnel8d
 crz5Bk3LZ2hEUk5+rscClxXhtVbNxFaXtPXhNu61VMhO1b4H1aNHYma/4dTq3lvtwuFp
 66ixnEZuif07BVEC5Xz7GxCWRJHGX8g1P0+Oh52Z2im/erKMmPvoIUH2o1lOue3Pk208
 ZEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MpQlQNCXARciYprQkeu7l6U8+AuEKROU5Z3kKaJ5pRw=;
 b=DsmH8xK6kjnu/dETVWydvsgMsmvE4DtaNqhsPaKsGBY2RwGCxLc20GjS2qTbGIeCPc
 YXACCNbQyBaMfRLsDpl4FQVZznG90xFvzEb0pLePhJjSvsjFBOppxfCtBTuRB8gT5iVg
 w+LdWcWgf0a0fOOgIb74jM02K4l/cvXH9I0Bhcd12o0+AZm5Q7dd+q2WW5y4dBpT4PlG
 LsyoI6tOZMg8t2n3+/Vo25MK4NEfvglcVZaJPxmtPkFuLZKpZ4i1knGBMSQc2zgHyNUE
 /gNNGh7fs9ugjdto8Nf03v/2sPUnkOVibqduRnJal/CN7qRkrbyznGQV40ZlU/NKXxBf
 VwvQ==
X-Gm-Message-State: AOAM530iu8EEMS/eUTasqC6THhfO/xnHogIArRCnSmz4NX24sqFzsujA
 isDqCxq21GnQxxg/Gd8RI+2/Cg==
X-Google-Smtp-Source: ABdhPJy7THuSDqqfo3Q2gOVeE8TSM2f1kmTIm1pZOKSWuqsSajlSKs7220EbXk+VKY55/0eZ7uA6/Q==
X-Received: by 2002:a05:600c:4103:: with SMTP id
 j3mr20574664wmi.30.1634228013741; 
 Thu, 14 Oct 2021 09:13:33 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id p7sm1808615wrm.61.2021.10.14.09.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 09:13:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: soc-component: improve error reporting for register
 access
Date: Thu, 14 Oct 2021 17:13:30 +0100
Message-Id: <20211014161330.26645-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com
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

Currently errors on register read/write/update are reported with
an error code and the corresponding function but does not provide
any details on the which register number did it actually fail.

register number can give better clue and it should be easy to
locate the code and fix.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---

Personally I found this patch very useful while developing and debugging.

Ex: below error 
"ASoC: error at soc_component_read_no_lock on soc@0:codec: -16"
did not provide much info except that it failed to read,
but after this patch error message looks like:
"ASoC: error at soc_component_read_no_lock on soc@0:codec for register: [0x00003125] -16"
which was easy to locate and fix.

 sound/soc/soc-component.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index a08a897c5230..c76ff9c59dfb 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -13,9 +13,10 @@
 #include <sound/soc.h>
 #include <linux/bitops.h>
 
-#define soc_component_ret(dai, ret) _soc_component_ret(dai, __func__, ret)
+#define soc_component_ret(dai, ret) _soc_component_ret(dai, __func__, ret, -1)
+#define soc_component_ret_reg_rw(dai, ret, reg) _soc_component_ret(dai, __func__, ret, reg)
 static inline int _soc_component_ret(struct snd_soc_component *component,
-				     const char *func, int ret)
+				     const char *func, int ret, int reg)
 {
 	/* Positive/Zero values are not errors */
 	if (ret >= 0)
@@ -27,9 +28,14 @@ static inline int _soc_component_ret(struct snd_soc_component *component,
 	case -ENOTSUPP:
 		break;
 	default:
-		dev_err(component->dev,
-			"ASoC: error at %s on %s: %d\n",
-			func, component->name, ret);
+		if (reg == -1)
+			dev_err(component->dev,
+				"ASoC: error at %s on %s: %d\n",
+				func, component->name, ret);
+		else
+			dev_err(component->dev,
+				"ASoC: error at %s on %s for register: [0x%08x] %d\n",
+				func, component->name, reg, ret);
 	}
 
 	return ret;
@@ -687,7 +693,7 @@ static unsigned int soc_component_read_no_lock(
 		ret = -EIO;
 
 	if (ret < 0)
-		return soc_component_ret(component, ret);
+		return soc_component_ret_reg_rw(component, ret, reg);
 
 	return val;
 }
@@ -723,7 +729,7 @@ static int soc_component_write_no_lock(
 	else if (component->driver->write)
 		ret = component->driver->write(component, reg, val);
 
-	return soc_component_ret(component, ret);
+	return soc_component_ret_reg_rw(component, ret, reg);
 }
 
 /**
@@ -765,7 +771,7 @@ static int snd_soc_component_update_bits_legacy(
 
 	mutex_unlock(&component->io_mutex);
 
-	return soc_component_ret(component, ret);
+	return soc_component_ret_reg_rw(component, ret, reg);
 }
 
 /**
@@ -793,7 +799,7 @@ int snd_soc_component_update_bits(struct snd_soc_component *component,
 							   mask, val, &change);
 
 	if (ret < 0)
-		return soc_component_ret(component, ret);
+		return soc_component_ret_reg_rw(component, ret, reg);
 	return change;
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_update_bits);
@@ -829,7 +835,7 @@ int snd_soc_component_update_bits_async(struct snd_soc_component *component,
 							   mask, val, &change);
 
 	if (ret < 0)
-		return soc_component_ret(component, ret);
+		return soc_component_ret_reg_rw(component, ret, reg);
 	return change;
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_update_bits_async);
-- 
2.21.0

