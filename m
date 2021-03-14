Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2502C33C283
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 17:53:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 443C617B4;
	Mon, 15 Mar 2021 17:52:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 443C617B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615827214;
	bh=4apaHA0qWvkNuOFGC0DM+7Wi8Hn3BTbQ962xVxeniuk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gT4i2KYVEB11lUz5zMdrj6cqEEevRVP5PaOINn/MhceMocOM6pHZcOhZADqZ1Cp3S
	 JGExZxgUG7a/y8HY5tpXo3xtYU3i9HIcoVuogvn1gs43Lo2pzh+aaJVOm98EKhwJpF
	 0rhuRhEfrUxKkRFGZzH+LuD+lQ8H2ynqJzG1DYk0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA115F80254;
	Mon, 15 Mar 2021 17:51:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88E50F80218; Sun, 14 Mar 2021 08:44:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 324E8F8010E
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 08:44:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 324E8F8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="t+9mz/aj"
Received: by mail-pj1-x1030.google.com with SMTP id
 q2-20020a17090a2e02b02900bee668844dso12760815pjd.3
 for <alsa-devel@alsa-project.org>; Sat, 13 Mar 2021 23:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/UsNynLrn3gfHIh2wsBU8ZzW+u+h32Tr3P8Iq5YLDLQ=;
 b=t+9mz/ajPiRLOk68DvwWtoI0cpnltyJYBWLf/QmINFLPoXMOQU2qkVCWNt37oL0Did
 keytkbI3KwDcuJ7H+VzlvGf9i9yFTqVmdXCjLYiRiL290Urd7IB6jRQtGrOHUH1ZwUus
 ySG5+sttGNE4skfMVOoJ4hXJu//4oBWlDInDf0HX5GBXDlGuOT9uTVZZ4WV9efKvLnuW
 x12lKZ1mXUN6BVzAgq6mEwVKaULHbyiPkiWZXMNGJIWr+ecedJbzP7hlcUlLgKynbzh2
 jSfYZEOn9GwWuxtKZDqnALN3qH/LRbJdfgGcV8iXIHr8dPLe8mZAsm1ttg72bh1dM1aP
 CZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/UsNynLrn3gfHIh2wsBU8ZzW+u+h32Tr3P8Iq5YLDLQ=;
 b=QqiRe93WWkoiwmTLPJ2TO2i5IMRQ0n8iWJo4jeR9UN1UGeFprJCloW0yrL1FueHdE9
 wF/hKHqA1xCxynognHDrgX5h20yksa7zMIL/BercOT39VzrIchV7Zi6yQesaFYqnatTk
 UquTS4GDlrsU3H2C10X2UKO/4aXzkv1igH4Y2jO5LhjiE7BQjMBXJzfKIu3N5GzNzNuV
 ipPu4qI01aRSesyH5bMqurC32geBHpGCEKw5e81G1GK9sf92GNRdwVNoyimbCP/SV4X2
 zA8gwFB0fZOwWoGafV3x70ZxOs0mNHLh4mIY2ZfctcEjb2tgJaIx1KdWjlXKqLZsPHk9
 CIPQ==
X-Gm-Message-State: AOAM530vBbAeNMsVMyrA5PObM+PpTQ0B+Gkld7C89/2TCfA3nwgMDHxv
 A0B66uc30PrJ9a2KDl08U2o=
X-Google-Smtp-Source: ABdhPJwuxcTvmVu5hn0qpomzXOQp/3fisYEWSPaQUb/FM2qn9IF+ZEri4CF9gE72gRiuno7IidPpNg==
X-Received: by 2002:a17:90a:1502:: with SMTP id
 l2mr6749122pja.149.1615707886392; 
 Sat, 13 Mar 2021 23:44:46 -0800 (PST)
Received: from nick-Blade-Stealth.lan ([2600:1700:6d11:6f:aa3:33d6:bd6f:3286])
 by smtp.googlemail.com with ESMTPSA id
 z2sm9830560pfa.121.2021.03.13.23.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 23:44:45 -0800 (PST)
From: Nick Desaulniers <nick.desaulniers@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>
Subject: [PATCH] ASoC: Intel: Skylake: skl-topology: fix -frame-larger-than
Date: Sat, 13 Mar 2021 23:44:33 -0800
Message-Id: <20210314074434.164868-1-nick.desaulniers@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 15 Mar 2021 17:51:49 +0100
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Nick Desaulniers <nick.desaulniers@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Mark Brown <broonie@kernel.org>,
 Mateusz Gorski <mateusz.gorski@linux.intel.com>
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
 sound/soc/intel/skylake/skl-topology.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index ae466cd59292..cdc916c91301 100644
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
 		struct soc_enum *se =
@@ -3631,14 +3636,13 @@ static void skl_tplg_complete(struct snd_soc_component *component)
 		sprintf(chan_text, "c%d", mach->mach_params.dmic_num);
 
 		for (i = 0; i < se->items; i++) {
-			struct snd_ctl_elem_value val;
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

base-commit: 65f0d2414b7079556fbbcc070b3d1c9f9587606d
prerequisite-patch-id: 4d05aad8c2b50c0c3b4447dd842abe8b1b840927
-- 
2.25.1

