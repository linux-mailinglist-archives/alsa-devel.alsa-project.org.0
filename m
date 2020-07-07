Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E696A216F64
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 16:54:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B3201684;
	Tue,  7 Jul 2020 16:53:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B3201684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594133680;
	bh=NduOh9cz21SnIR4ktnoe+9goE08Tx82xLQJVhtsfrzM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vIeZSEiOfV+xRCSyVCZsxl0ThdX9NqeqUQiPdk89pZQDy2No4wOkMqZzmbodK9At0
	 NLTuo2enFK7WfJorqxf6ZaSJ7I1pILvj2HhJDaH64tuJB2Iqvu6Olno1ORZD2Maxww
	 F50Y3buDN9fkFqnf7E1o1HUGSujzErIIQUMj9zSg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10FEBF80274;
	Tue,  7 Jul 2020 16:38:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 093D6F8033D; Tue,  7 Jul 2020 16:38:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E750F8033D
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 16:38:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E750F8033D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="hdVvmbc6"
Received: by mail-wm1-x343.google.com with SMTP id l17so43541272wmj.0
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 07:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ud7YS/nxWFCEKdfNWplmyakfpWkMMmFHvetIuQwMK9A=;
 b=hdVvmbc6H8PwBoroBapEBPzE9/EFUUU817fbd+RBL7zPFgItN7L4xyOaxhlf1na/8c
 LMBNV+oT5rzwx30qpZ+wDWOjMIjUSaVmx+EmRVFKOvVd7i2lCUFSTzZLyUs73kJUsbwM
 wu6fVue7GztMQ8WruqtI15zrgwytI+/ajgHgzLBEL5m8yLLLpgE8Zq+Qhnm15pWdIyuQ
 oo/DdwXXxK+QqZ0yKA8UD17YV7EHxNTnjWdN17INYOMbbJClegREeHXngIqUB2WpLPeU
 zS8/+WxQ0fm6MiMeJEsqhHGXgy5Bbh4EBspUF3t6Nw035JLN08dX71/lvitC55km0PgS
 rmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ud7YS/nxWFCEKdfNWplmyakfpWkMMmFHvetIuQwMK9A=;
 b=qKHthZ6LY6c05oiJxtxDQ+aQ+oe7CCYAB4KGul1tfUNFFvgASf3uyLnq1WZrTjS+jt
 61B71Hd6NJPK//4oRHrKrGvSBct1oU18gb3+R6h9tQsSo2G8X1cVzGRkLBhGS9Rhmndy
 zvJl9wRwjuhQuyQHADk3WmvU+1PeRbgwt+5VfC9Qvy7+CwTAPF0c5A0O5xAErwsEMlX3
 OA8m0SCg1ZiTDE09FKcxs32pO0fAJmbl8owuU9SGCRIfkgx6tGeVGdxsm0bTbDKh9WEX
 zrATINm3+rrbqahv3C/SxR3y3jmi1BlCHTsjZ3ynhRdAnJYBQ53MZmrH6n8BsRamSrji
 YEJA==
X-Gm-Message-State: AOAM532MyKxQziRsKlFYes4vueO5Obs/Zr0+mGyR8Y9PpS9MVgYg5DwL
 xZrhDIYunxxZ51vHsiJoqBq44g==
X-Google-Smtp-Source: ABdhPJyIynXVm4wMkx4aYF2hvbtr7ah/gc4UneovvHYT7P6LTuGCXP0MOFSEAqHEfIgZ7mJ6vCRLzQ==
X-Received: by 2002:a7b:c1cc:: with SMTP id a12mr4748090wmj.112.1594132701677; 
 Tue, 07 Jul 2020 07:38:21 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id y16sm1276131wro.71.2020.07.07.07.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 07:38:21 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 25/28] ASoC: codecs: rt5631: Demote misuse of kerneldoc to
 standard comment blocks
Date: Tue,  7 Jul 2020 15:37:39 +0100
Message-Id: <20200707143742.2959960-26-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707143742.2959960-1-lee.jones@linaro.org>
References: <20200707143742.2959960-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, flove <flove@realtek.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
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

Little or no attempt has been made to document any of the demoted functions here.

Fixes the following W=1 kernel build warning(s):

 sound/soc/codecs/rt5631.c:72: warning: Function parameter or member 'component' not described in 'rt5631_write_index'
 sound/soc/codecs/rt5631.c:72: warning: Function parameter or member 'reg' not described in 'rt5631_write_index'
 sound/soc/codecs/rt5631.c:72: warning: Function parameter or member 'value' not described in 'rt5631_write_index'
 sound/soc/codecs/rt5631.c:82: warning: Function parameter or member 'component' not described in 'rt5631_read_index'
 sound/soc/codecs/rt5631.c:82: warning: Function parameter or member 'reg' not described in 'rt5631_read_index'
 sound/soc/codecs/rt5631.c:367: warning: Function parameter or member 'component' not described in 'onebit_depop_power_stage'
 sound/soc/codecs/rt5631.c:405: warning: Function parameter or member 'component' not described in 'onebit_depop_mute_stage'
 sound/soc/codecs/rt5631.c:443: warning: Function parameter or member 'component' not described in 'depop_seq_power_stage'
 sound/soc/codecs/rt5631.c:515: warning: Function parameter or member 'component' not described in 'depop_seq_mute_stage'

Cc: Oder Chiou <oder_chiou@realtek.com>
Cc: flove <flove@realtek.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/codecs/rt5631.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt5631.c b/sound/soc/codecs/rt5631.c
index b5184f0e10e34..f1ace236c401e 100644
--- a/sound/soc/codecs/rt5631.c
+++ b/sound/soc/codecs/rt5631.c
@@ -64,7 +64,7 @@ static const struct reg_default rt5631_reg[] = {
 	{ RT5631_PSEUDO_SPATL_CTRL, 0x0553 },
 };
 
-/**
+/*
  * rt5631_write_index - write index register of 2nd layer
  */
 static void rt5631_write_index(struct snd_soc_component *component,
@@ -74,7 +74,7 @@ static void rt5631_write_index(struct snd_soc_component *component,
 	snd_soc_component_write(component, RT5631_INDEX_DATA, value);
 }
 
-/**
+/*
  * rt5631_read_index - read index register of 2nd layer
  */
 static unsigned int rt5631_read_index(struct snd_soc_component *component,
@@ -357,7 +357,7 @@ static int check_adcr_select(struct snd_soc_dapm_widget *source,
 	return !(reg & RT5631_M_MIC2_TO_RECMIXER_R);
 }
 
-/**
+/*
  * onebit_depop_power_stage - auto depop in power stage.
  * @enable: power on/off
  *
@@ -395,7 +395,7 @@ static void onebit_depop_power_stage(struct snd_soc_component *component, int en
 	snd_soc_component_write(component, RT5631_INT_ST_IRQ_CTRL_2, hp_zc);
 }
 
-/**
+/*
  * onebit_depop_mute_stage - auto depop in mute stage.
  * @enable: mute/unmute
  *
@@ -433,7 +433,7 @@ static void onebit_depop_mute_stage(struct snd_soc_component *component, int ena
 	snd_soc_component_write(component, RT5631_INT_ST_IRQ_CTRL_2, hp_zc);
 }
 
-/**
+/*
  * onebit_depop_power_stage - step by step depop sequence in power stage.
  * @enable: power on/off
  *
@@ -505,7 +505,7 @@ static void depop_seq_power_stage(struct snd_soc_component *component, int enabl
 	snd_soc_component_write(component, RT5631_INT_ST_IRQ_CTRL_2, hp_zc);
 }
 
-/**
+/*
  * depop_seq_mute_stage - step by step depop sequence in mute stage.
  * @enable: mute/unmute
  *
-- 
2.25.1

