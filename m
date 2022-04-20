Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E75507F49
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 05:04:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98A81190F;
	Wed, 20 Apr 2022 05:03:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98A81190F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650423881;
	bh=fqhtPEYcYs7WvweTrecxZvl/2OQnaypcmwfQpW537Jw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CyOOyQ0qqKG+u2p7g/GKh/dVs+kich+t4p3qVqdjzHR2HMA4hhKYVdk/pjV+HX2uO
	 wvlJdHtPeXQBOlj/ku+tqMLqJziwU/1ci1qhYztthjM4xOhGfJN3W7xZaYlgF1FYkX
	 V0gCE57alou4bNpZpqnzr7eEg0JMyNzvuTAzWWeE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECF9CF80254;
	Wed, 20 Apr 2022 05:03:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11BE9F80246; Wed, 20 Apr 2022 05:03:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49491F80116;
 Wed, 20 Apr 2022 05:03:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49491F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VkQntLRq"
Received: by mail-qk1-x72f.google.com with SMTP id d198so344363qkc.12;
 Tue, 19 Apr 2022 20:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CCQfkH82Dpv/txvDTzosoWFisSIFdL3o03R2vl6HtCM=;
 b=VkQntLRqujQdmG7D7luBRFasyuLd5VGWWy2Njp865rEjOFK2iFgQg2wIml/G4Yj100
 WSzW6E+o2/57UuXD7vlNZ3VRDQ89pvsH/XFRIyKM3s/VpvLEeIb1eldZLXbogwuXi9mj
 Pwk4trmtwiR9vdLZsHvQ1gimsQSuE+5VxzpoCZBM5VEehNtPP8tVSdoOWD6nQ8TjvX+s
 c6R9mQebiqxK+PQpmshJAp8Kbc4Mbl0SubhIMQUDzs7EYfbK4sh1Y+p8r5XLpFgAbPnB
 uB0LZdqJga8u7r+cXp529exkgtFXwENl+quRn6bOdPolFbpx8tDw7IWFvV3LOQlrDviv
 cOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CCQfkH82Dpv/txvDTzosoWFisSIFdL3o03R2vl6HtCM=;
 b=JVHur/QLnLg9uW38N0pREXiNb/huFc+js5uigZqfNlefa1j5q7OCXgfB1gBpmCcST/
 bdItv62KzQLY3kU8zLg/Tzp2/1GIvtZRp7nh75l1eFONbb64E0irFYMiVpw+E2IFZlRV
 qu6Nde3HSavvuLZTKAhZ8LWReQKCjI3yiGKv64fdRQ5KYko6ynqAOkEwzBTisFeKKuUd
 1g3/cRmrZwRAEzVXqe3jfvVz+ZBvuNCwTEVKhF5kZkjkjGEADzl5UW6JlbcpE5SwVxxq
 ollTp+fuVeN9vzchZ7DLCIzcwEnoYHdQDQR6C/NQkvPdlMZcrvvGMF+yKrxU6hGPMybe
 EqGA==
X-Gm-Message-State: AOAM531T1mQbXteD1M49FloybIuE957qfioNeF5oNIQViGkqLeO2AYwz
 ZGO34j6prbSKFGiCrDfTGNs=
X-Google-Smtp-Source: ABdhPJy1C1g2Kf4YHazszq9HYtDEp84aNZiOFK2Mc6gSxH+oWhyqN7sscDsElcGcafi1CGbWt1/Z0g==
X-Received: by 2002:a05:620a:404f:b0:67e:a3ed:472c with SMTP id
 i15-20020a05620a404f00b0067ea3ed472cmr11563949qko.556.1650423811803; 
 Tue, 19 Apr 2022 20:03:31 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a05620a0e8400b0067b1bcd081csm843587qkm.66.2022.04.19.20.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 20:03:31 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ASoC: SOF: using pm_runtime_resume_and_get to simplify the
 code
Date: Wed, 20 Apr 2022 03:03:15 +0000
Message-Id: <20220420030315.2575691-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>,
 lgirdwood@gmail.com, Minghao Chi <chi.minghao@zte.com.cn>,
 ranjani.sridharan@linux.intel.com, broonie@kernel.org, daniel.baluta@nxp.com,
 sound-open-firmware@alsa-project.org
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

From: Minghao Chi <chi.minghao@zte.com.cn>

Using pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
pm_runtime_put_noidle. This change is just to simplify the code, no
actual functional changes.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 sound/soc/sof/sof-client-probes.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index 797dedb26163..c4c6e03c8133 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -503,10 +503,9 @@ static ssize_t sof_probes_dfs_points_read(struct file *file, char __user *to,
 	if (!buf)
 		return -ENOMEM;
 
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0 && ret != -EACCES) {
 		dev_err_ratelimited(dev, "debugfs read failed to resume %d\n", ret);
-		pm_runtime_put_noidle(dev);
 		goto exit;
 	}
 
@@ -568,10 +567,9 @@ sof_probes_dfs_points_write(struct file *file, const char __user *from,
 
 	desc = (struct sof_probe_point_desc *)tkns;
 
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0 && ret != -EACCES) {
 		dev_err_ratelimited(dev, "debugfs write failed to resume %d\n", ret);
-		pm_runtime_put_noidle(dev);
 		goto exit;
 	}
 
@@ -621,10 +619,9 @@ sof_probes_dfs_points_remove_write(struct file *file, const char __user *from,
 		goto exit;
 	}
 
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
 		dev_err_ratelimited(dev, "debugfs write failed to resume %d\n", ret);
-		pm_runtime_put_noidle(dev);
 		goto exit;
 	}
 
-- 
2.25.1


