Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0577933C289
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 17:54:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8165616D3;
	Mon, 15 Mar 2021 17:53:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8165616D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615827252;
	bh=yMDpIStQR4zH7dPlsdnG4nJGYx3sId+yKxSBVCpKTEM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dY8JOgj1CYue/TAo6l+BMOHP8wkhzeie5GEjX7dkyltX7unNEXsy8QX4YJ8yLgJvK
	 S6HhB2giMM/z8I8xOrTf4mD4qWBdx3Yy7MXk8MT+rx7Pjr6RsVV2aWFdnxX88Jj/7k
	 QUuA+70er31BjGqCehX4uA6LFWTyak/LkhdVXMbk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE34CF8013F;
	Mon, 15 Mar 2021 17:51:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8192F80218; Sun, 14 Mar 2021 09:06:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 262F0F80100
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 09:06:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 262F0F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="G3Y6yivP"
Received: by mail-pj1-x102c.google.com with SMTP id gb6so7216952pjb.0
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 00:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+bXA6USXXf109kPN2SOHKYnrZwby0HZ2THc1y1K25TU=;
 b=G3Y6yivPa58rOuro/9lEATBfZExqHF5rvchwObszi6o6PK0CqQcKh3FdsUSTkEtz1J
 Oy1SEcZlt/HaDp+8yp0yedHl7aZ+90p++ZcXWJpUHclikcd3nFHYL7Zl49stvuLRfKHv
 8nRfWTxPY5M0stzPVNK1Pb6SLYUpjEZhpifUV4vtnKJgTesZZ2iofHip4WXjXWFPG3PY
 x/Qj5RMwvGKeWFJR3/uVOVBUwmpuiGhtVYm1FiJTLz0wUyk6h2LM9YYqPtgu/gbXCBPU
 Z1+CvUMklE8XXjRXqd7Fa4MlKrO6yFxnkBXKV3ikJxAD2kPfCC5X8NwdM1fApvZy+yLW
 6qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+bXA6USXXf109kPN2SOHKYnrZwby0HZ2THc1y1K25TU=;
 b=nY8WSU3MJPxDnsGPqts2Slb8bjICao/fAujJuZO73IDl0ad86faSCgSQKgx3kkr4lx
 Cdg/zdj46MNjOTN/nWqSDhs1lKFGx5wifn3yYofIUthEGGDe03PtjBh2bfBqF75Xz7Fq
 5qCqaYeO+BZQZzvAZMvrBJVSaGc1Nkxk0LXVSeqZlOQw6ICKHr0AwpglabqG0o46axLX
 sOSrt92FdvOIMG13yKwS0HouLtSRlwXVb7xrJSqwhC2xEh0DK8M4i07sTsDiwGL5VvgH
 DDxctica7VgWT9/34G2qLJ3FmkgVs83j7PPhvK6NsHXF4KZmK/TktomhKwj+KGvqT5FP
 28jA==
X-Gm-Message-State: AOAM533b8/n2TbWMpbeLuQQw3Rl4XppmokwcqCCdmMlBVQYfOkj6/w/D
 1M9Yco1H98s2tu3TWgeCwhY=
X-Google-Smtp-Source: ABdhPJxXFqS4n3T/tv2hr/Rrm5Gohn8JYplE+kLI06g3oq9mAPxz0mAia30K8wHD4C+Yq/+4LBXcnw==
X-Received: by 2002:a17:902:bf92:b029:e6:bc0:25ac with SMTP id
 v18-20020a170902bf92b02900e60bc025acmr6662299pls.49.1615709179641; 
 Sun, 14 Mar 2021 00:06:19 -0800 (PST)
Received: from nick-Blade-Stealth.lan ([2600:1700:6d11:6f:aa3:33d6:bd6f:3286])
 by smtp.googlemail.com with ESMTPSA id
 r186sm10177565pfr.124.2021.03.14.00.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 00:06:19 -0800 (PST)
From: Nick Desaulniers <nick.desaulniers@gmail.com>
To: nick.desaulniers@gmail.com
Subject: [PATCH v2] ASoC: Intel: Skylake: skl-topology: fix -frame-larger-than
Date: Sun, 14 Mar 2021 00:06:13 -0800
Message-Id: <20210314080613.190663-1-nick.desaulniers@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314074434.164868-1-nick.desaulniers@gmail.com>
References: <20210314074434.164868-1-nick.desaulniers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 15 Mar 2021 17:51:49 +0100
Cc: guennadi.liakhovetski@linux.intel.com, cezary.rojewski@intel.com,
 liam.r.girdwood@linux.intel.com, mateusz.gorski@linux.intel.com,
 yang.jie@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Julia.Lawall@inria.fr, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, tiwai@suse.com,
 andriy.shevchenko@linux.intel.com, pierre-louis.bossart@linux.intel.com
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

Fixes:
sound/soc/intel/skylake/skl-topology.c:3613:13: warning: stack frame
size of 1304 bytes in function 'skl_tplg_complete'
[-Wframe-larger-than=]

struct snd_ctl_elem_value is 1224 bytes in my configuration.

Heap allocate it, then free it within the current frame.

Signed-off-by: Nick Desaulniers <nick.desaulniers@gmail.com>
---
Changes V1 -> V2: rebased on mainline.

 sound/soc/intel/skylake/skl-topology.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index b824086203b9..566d07b4b523 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -3613,10 +3613,15 @@ static int skl_manifest_load(struct snd_soc_component *cmpnt, int index,
 static void skl_tplg_complete(struct snd_soc_component *component)
 {
 	struct snd_soc_dobj *dobj;
-	struct snd_soc_acpi_mach *mach =
-		dev_get_platdata(component->card->dev);
+	struct snd_soc_acpi_mach *mach;
+	struct snd_ctl_elem_value *val;
 	int i;
 
+	val = kzalloc(sizeof(*val), GFP_KERNEL);
+	if (!val)
+		return;
+
+	mach = dev_get_platdata(component->card->dev);
 	list_for_each_entry(dobj, &component->dobj_list, list) {
 		struct snd_kcontrol *kcontrol = dobj->control.kcontrol;
 		struct soc_enum *se;
@@ -3632,14 +3637,13 @@ static void skl_tplg_complete(struct snd_soc_component *component)
 		sprintf(chan_text, "c%d", mach->mach_params.dmic_num);
 
 		for (i = 0; i < se->items; i++) {
-			struct snd_ctl_elem_value val = {};
-
 			if (strstr(texts[i], chan_text)) {
-				val.value.enumerated.item[0] = i;
-				kcontrol->put(kcontrol, &val);
+				val->value.enumerated.item[0] = i;
+				kcontrol->put(kcontrol, val);
 			}
 		}
 	}
+	kfree(val);
 }
 
 static struct snd_soc_tplg_ops skl_tplg_ops  = {

base-commit: 88fe49249c99de14e543c632a46248d85411ab9e
-- 
2.25.1

