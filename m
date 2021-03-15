Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ECC33C28A
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 17:54:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF69017A3;
	Mon, 15 Mar 2021 17:53:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF69017A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615827262;
	bh=s/DKnn03+Wkwuwww2UTJkmyfmpTFr0KdqvX2lkzMGoc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MqoNdwNoRy9hPkyFZ3kRaLOoyPTZeRhdoMtqbL+Gv5bnx6Ter8nV2NegyPbqgdx1c
	 Q5T0L+k875RU8Ky+/3lWPkSdwWelfjX8moMmcyg7sYFcaztHq9fktn9U9tEENZqeuM
	 xIkKX97r4he1Q9GTVzrqZnme50H5VbSYnl35qEkM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B744AF80424;
	Mon, 15 Mar 2021 17:51:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37FB9F80218; Mon, 15 Mar 2021 02:39:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10549F8010E
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 02:39:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10549F8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="G980fo3R"
Received: by mail-pf1-x42d.google.com with SMTP id y67so5604216pfb.2
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 18:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aGqV0l6/x/GxBVirCNeqaoHtTJlTX8f5e3u4gvZa+P8=;
 b=G980fo3Rcpn+Zr4OizAKE1jawcEafv6s6F1pLvyfUKz+uVPcdmBie9Xmy/MwTs2iwk
 kCN9Jf01I4vlDfOd9anIOp0xNfPF/fiZpaaAma6Y74vDmqj7rQ9ayBdB+lr0QNkIJbq0
 UK8hod2fdKT3arKahIX9n+kuYCiWRM3haZG5DkqbH5BUJANJQOxOdD5vV4GgNHhD1TNC
 lnQ0VXxw4OB8+Bf0Enli+xkNJegZHYQX3pHSuEUSGV6nSemgTr8QiQMW/YIGwjXe0bcR
 6Fqo2Yz9/6O7wFY4iUg+sMcrEO23kLnzf6KfqNm0T6ZGXPjEbiqbr4tLGjkFNagWhLDx
 OjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aGqV0l6/x/GxBVirCNeqaoHtTJlTX8f5e3u4gvZa+P8=;
 b=D1BNxi+pQDUMB1DWH/cEEQUpqI8hz/4d74GbX0teZiOOhGEjkqYwlYQD6IiziZN2Pf
 VVZwK6+X+cekXX3WPQL+ICzk+gSJ9KxQcpLrawibyh89oAF6NRWf1U+WYvkX0lZxCnaj
 byHzyy6+zy29ghfFZz9ndC1fx5FP573uLHywquEBlpshBo/CbZ+6L9D0l+veqGGY9RiL
 WF4fKfm+cz0xD2wDTZG9ZtgQIHsH5S5QKreggu1FMydCxkJq3A2EObwFd6WenjVg5oGf
 OirGrhkLxmt0LJAAuytQcghq73Z5wFXM66cZanTcrPRxUDGEAjGN0lOJoqSUHHIpxf77
 ALDQ==
X-Gm-Message-State: AOAM530QSH967VqP6aZzv2eb27eT6RH5+iuG2lJduP8UM1lx10NluYkw
 BDv8nT44FRHsl7dVqfQ5LOI=
X-Google-Smtp-Source: ABdhPJzjjppKucqAMAWslnrDSgAkFrxGEqmGKcfESUxQj68jYI/Yif7t+SKGzyqoGGDj+lPHlrwm0g==
X-Received: by 2002:aa7:85c1:0:b029:1f4:4fcc:384d with SMTP id
 z1-20020aa785c10000b02901f44fcc384dmr8462224pfn.10.1615772354062; 
 Sun, 14 Mar 2021 18:39:14 -0700 (PDT)
Received: from nick-Blade-Stealth.lan ([2600:1700:6d11:6f:e593:d5dc:8119:b8b2])
 by smtp.googlemail.com with ESMTPSA id 8sm8444588pjj.53.2021.03.14.18.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 18:39:13 -0700 (PDT)
From: Nick Desaulniers <nick.desaulniers@gmail.com>
To: nick.desaulniers@gmail.com
Subject: [PATCH v3] ASoC: Intel: Skylake: skl-topology: fix -frame-larger-than
Date: Sun, 14 Mar 2021 18:39:08 -0700
Message-Id: <20210315013908.217219-1-nick.desaulniers@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAHp75Vdy083+5K=4sViwg8uNJ1_6agECYbjMSFEGXX9VTO85WQ@mail.gmail.com>
References: <CAHp75Vdy083+5K=4sViwg8uNJ1_6agECYbjMSFEGXX9VTO85WQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 15 Mar 2021 17:51:49 +0100
Cc: guennadi.liakhovetski@linux.intel.com, cezary.rojewski@intel.com,
 liam.r.girdwood@linux.intel.com, mateusz.gorski@linux.intel.com,
 yang.jie@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Julia.Lawall@inria.fr,
 Andy Shevchenko <andy.shevchenko@gmail.com>, broonie@kernel.org,
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

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Nick Desaulniers <nick.desaulniers@gmail.com>
---
Changes V2 -> V3:
* change to kmalloc+memset to fix logic error, as per Andy.
Changes V1 -> V2:
* rebased on mainline.

 sound/soc/intel/skylake/skl-topology.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index b824086203b9..c0fdab39e7c2 100644
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
 
+	val = kmalloc(sizeof(*val), GFP_KERNEL);
+	if (!val)
+		return;
+
+	mach = dev_get_platdata(component->card->dev);
 	list_for_each_entry(dobj, &component->dobj_list, list) {
 		struct snd_kcontrol *kcontrol = dobj->control.kcontrol;
 		struct soc_enum *se;
@@ -3632,14 +3637,14 @@ static void skl_tplg_complete(struct snd_soc_component *component)
 		sprintf(chan_text, "c%d", mach->mach_params.dmic_num);
 
 		for (i = 0; i < se->items; i++) {
-			struct snd_ctl_elem_value val = {};
-
 			if (strstr(texts[i], chan_text)) {
-				val.value.enumerated.item[0] = i;
-				kcontrol->put(kcontrol, &val);
+				memset(val, 0, sizeof(*val));
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

