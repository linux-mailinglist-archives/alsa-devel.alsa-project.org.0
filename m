Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F5F4EA48D
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Mar 2022 03:22:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C5941843;
	Tue, 29 Mar 2022 03:22:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C5941843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648516978;
	bh=5u/Pa+d+k7Lq+l76Pc1ONp5TA9ztK901DfYiN/QclJE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=stnHgeaInmtRrP/y7+854BzzZ8zZnb+NGFRQkfHmGTyG5yt/Qc8zEIyfoS1+HNxXB
	 n4WVqLRhnBu9QFwRR1lKwXrpoh6KhVsudKCniTjgpHnmUcg1rBpgb5Z/KsSVz/Ppt9
	 nyMMbAkst6T6CrWDSa5GHmkWqLr2sXYuZrQsxluk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5A2EF8026A;
	Tue, 29 Mar 2022 03:21:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8873BF8024C; Tue, 29 Mar 2022 03:21:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E68C9F80121
 for <alsa-devel@alsa-project.org>; Tue, 29 Mar 2022 03:21:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E68C9F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CDT/Buav"
Received: by mail-pf1-x435.google.com with SMTP id z16so14469880pfh.3
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 18:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=nGUt+aj/CNfWrM2Ds8HvT/Dl56Vks6aVB/g96nW8bf8=;
 b=CDT/BuavpP8mQxwjlPaichjpYYhA3Pw5JcLcuD/nscNa9g9fnbkC3tpHyJqdSexocF
 zFhQRERUhpt+lkdFizRqiSfEzjvH94C69yp6cRX2WnpK9ax1Z/pulaCRMCJkMmdtu1/m
 kqKBw8HtGQgdVEFMMuJdfWWoounDtqP92su7IXtOCPxCVpFWJgwZ555vugcwen10Bw+Y
 3zFCWzY8DEZAiRXmmsAlMptcmOJ0l3XDPVmDWbCKj5Ez/+UmTuJyDO8oYwBixSrRCL8o
 AJtCVg3evK6iTcQA0t3sBdngLoQRMxexm4kaWSC404LdoglxH6F8HdK7Hjzuv+zjydj0
 +ftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=nGUt+aj/CNfWrM2Ds8HvT/Dl56Vks6aVB/g96nW8bf8=;
 b=LNptu0U59+R3YJYNwl8FEL4c3jZ13W7+2K6iRBfnZ0DQvBlhMXAlzrPaybpEQhWb3m
 GsqQNdN1xvv2UOuW0ZxNrA2rqNQ1DlDsp4xTVv5PvphrnQqvtML9CaUsff2DGPRogJYe
 OW8LVZ3WkiJtUjy0JJAISY8g+EcOc+hy06tzkLSVMIZ/nBgm14DTsG1kSp/o1ENETRLT
 7iaHfQMVTtGFq8NhygLBMqM6o0NeBQI4mW0KPggYMWBLu+VUTpW+iEPdVOofQKXvH/YO
 enKjkCOaKovjpMCi1P6sgwzzl1lMXwvDOEe+QKa+xXe9wY0gkj7XPSm4CVN9njydbwd/
 av3Q==
X-Gm-Message-State: AOAM530PeWzGX89ZxpPziBGk4h4KygWUr6DxUPQ2O7Q8IMYJEUw0Oj7H
 BqPPeP6SAeqnBXIv2TWfYao=
X-Google-Smtp-Source: ABdhPJwDvk6CTkxu40Th8VYA7G8Ypnxcz3UfPRvUwaSKEbrhu8GZ/6nnc6yLDNCGDEC1DyUuejQVKQ==
X-Received: by 2002:a63:5020:0:b0:382:4781:7f4c with SMTP id
 e32-20020a635020000000b0038247817f4cmr176192pgb.230.1648516904993; 
 Mon, 28 Mar 2022 18:21:44 -0700 (PDT)
Received: from localhost ([119.3.119.18]) by smtp.gmail.com with ESMTPSA id
 i15-20020a63b30f000000b003803aee35a2sm13711447pgf.31.2022.03.28.18.21.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Mar 2022 18:21:44 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2] soc: soc-dapm: fix two incorrect uses of list iterator
Date: Tue, 29 Mar 2022 09:21:34 +0800
Message-Id: <20220329012134.9375-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, Xiaomeng Tong <xiam0nd.tong@gmail.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

These two bug are here:
	list_for_each_entry_safe_continue(w, n, list,
					power_list);
	list_for_each_entry_safe_continue(w, n, list,
					power_list);

After the list_for_each_entry_safe_continue() exits, the list iterator
will always be a bogus pointer which point to an invalid struct objdect
containing HEAD member. The funciton poniter 'w->event' will be a
invalid value which can lead to a control-flow hijack if the 'w' can be
controlled.

The original intention was to continue the outer list_for_each_entry_safe()
loop with the same entry if w->event is NULL, but misunderstanding the
meaning of list_for_each_entry_safe_continue().

So just add a 'continue;' to fix the bug.

Cc: stable@vger.kernel.org
Fixes: 163cac061c973 ("ASoC: Factor out DAPM sequence execution")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---

changes since v1:
 - use continue statement instead (Mark Brown)

v1:https://lore.kernel.org/lkml/20220327082138.13696-1-xiam0nd.tong@gmail.com/

---
 sound/soc/soc-dapm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index b06c5682445c..fb43b331a36e 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1687,8 +1687,7 @@ static void dapm_seq_run(struct snd_soc_card *card,
 		switch (w->id) {
 		case snd_soc_dapm_pre:
 			if (!w->event)
-				list_for_each_entry_safe_continue(w, n, list,
-								  power_list);
+				continue;
 
 			if (event == SND_SOC_DAPM_STREAM_START)
 				ret = w->event(w,
@@ -1700,8 +1699,7 @@ static void dapm_seq_run(struct snd_soc_card *card,
 
 		case snd_soc_dapm_post:
 			if (!w->event)
-				list_for_each_entry_safe_continue(w, n, list,
-								  power_list);
+				continue;
 
 			if (event == SND_SOC_DAPM_STREAM_START)
 				ret = w->event(w,
-- 
2.17.1

