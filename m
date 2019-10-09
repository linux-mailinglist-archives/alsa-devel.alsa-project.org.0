Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA10D0D13
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 12:48:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EAD41614;
	Wed,  9 Oct 2019 12:47:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EAD41614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570618089;
	bh=sWgSPXH1xHwxk/rQjdloHA+mlGIKPWfOdNaPpxnKqG8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OKwY3DyC6Mz5KGsXCDDm6VhGmkySPVuvu+PA2dnLYllF6ynNsPfQIoyoSp1E6Qudl
	 eqPssTHrPg2n5QDUUNm+R+bVKaGuGpeMuDfa7sfQYkrZF9FHhxYZ98wKHw+AViqtpT
	 W67F0BqbKfldp7RQb4crqwie/f3q29Hy2BK7IF0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DDE1F802BD;
	Wed,  9 Oct 2019 12:46:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15AF9F80113; Wed,  9 Oct 2019 12:46:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80988F80113
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 12:46:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80988F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RJZeN1la"
Received: by mail-wm1-x343.google.com with SMTP id y135so4478430wmc.1
 for <alsa-devel@alsa-project.org>; Wed, 09 Oct 2019 03:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bLt5Gpr+TBYMqPJckYDfypWA6Ci7GEvQRrL7skWxG/M=;
 b=RJZeN1la5DmYjMu7aEtVsZxkzkziIx5DoE0FOl6k0Gy69PkBvwxSj7bKVvvAX5NSAv
 7C4BiuBGD1HbiwaeB7rJIP7sG6AFMKZJtHieX2I5hXxGttR6KG6m6P2t9VdR7ngJXgPX
 C8thnd80knly0m37L9CTTL0FnJ0z0KrgTIXoCgY8daWSx1pKdyy2BhGg/k0A0GroKDZI
 rPzUMzf1HVUycYXUG0buy4nw8hHIZvOtjOunUOqnPrFnF0eDJk5R9Hw9RZl5BDXjQg3Q
 waqeilWohfIHKefEDD6kOe6zAjwVGuYCy49sTvsnvKkjbDsW4VFuZWsso0/q5Xe3Wsbn
 aj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bLt5Gpr+TBYMqPJckYDfypWA6Ci7GEvQRrL7skWxG/M=;
 b=i5FgsJQDX9sZXp4nIVWTGPY+r+0Gm3OuhKX8s33Y3EmQRgPXvBqDonH1CuLCtfXWCZ
 DipGHXQfdRW8qPVM84gXlgsHoNTA+oPDVgFcJZ111qUsUHL/Kie+EjtU7fhgqdhbLuFX
 cML0u+CZSXPS+QCjdbR8pGpq9aFy//OXQoxcEpmG4/UBU3UO+FdW3GUiZpCniTl4tyiD
 bN4y1ach6H9PevLhFhngKzDtPLTjCwhlGal64KS2BIQqBnVzSCLynCCJbzg40frMQFOq
 pAQxwiblUiyGW09OXIuA2GQWmJz677AKq/8EpeUj7SzvqpbMHQXYfByga4738+XYf0xT
 4ERQ==
X-Gm-Message-State: APjAAAXnmVKbRN3rSHjey2s18hWZlDfSNX+bfKzqrIU3zeqbATkJU2My
 4ggDY+L1z2exKu0vaMyb5KAyww==
X-Google-Smtp-Source: APXvYqyHCZJHAK2FkQAKsfFkzde/fa2r2D1UAddHZlRYXktMUnNw5SOqGgFY6CIRgjSVSyMGvTmoMA==
X-Received: by 2002:a1c:1901:: with SMTP id 1mr2091192wmz.28.1570617978608;
 Wed, 09 Oct 2019 03:46:18 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id g4sm2131248wrw.9.2019.10.09.03.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 03:46:17 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Date: Wed,  9 Oct 2019 11:46:03 +0100
Message-Id: <20191009104603.15412-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 spapothi@codeaurora.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Gopikrishnaiah Anandan <agopik@codeaurora.org>
Subject: [alsa-devel] [RFC PATCH] ASoC: soc-dapm: Skip suspending widgets
	with ignore flag
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

From: Sudheer Papothi <spapothi@codeaurora.org>

For wigdets which have set the suspend ignore flag asoc framework
shouldn't mark them as dirty when ASoC suspend function is called.
This change adds check to skip suspending the widgets with the flag set.

Signed-off-by: Gopikrishnaiah Anandan <agopik@codeaurora.org>
Signed-off-by: Sudheer Papothi <spapothi@codeaurora.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/soc-dapm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 13544f7c850b..4ecfd32e59b8 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -303,6 +303,8 @@ void dapm_mark_endpoints_dirty(struct snd_soc_card *card)
 	mutex_lock(&card->dapm_mutex);
 
 	list_for_each_entry(w, &card->widgets, list) {
+		if (w->ignore_suspend)
+			continue;
 		if (w->is_ep) {
 			dapm_mark_dirty(w, "Rechecking endpoints");
 			if (w->is_ep & SND_SOC_DAPM_EP_SINK)
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
