Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEE16C62BD
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 10:06:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CD39EBF;
	Thu, 23 Mar 2023 10:05:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CD39EBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679562394;
	bh=8fDgTYrfEVLrfxcWEZwXD5AoyoDI00UEFVDYVTBJUBg=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mREMDLRqZhK4p7lOXPd4CBOVT/N+LONd82lpJ118jMUnja21sP5B2fiBbB+p8T5pC
	 WEum4BSlM7IVoYJzy9ae5xJOSBw0tjeWKS2muERtDPB8q9ycZJG9LxIU6p4iMxb1Yv
	 x53PUEQBgj045aZMnnYjqI5V8eM30gvhHzpBCWtI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0A62F800C9;
	Thu, 23 Mar 2023 10:05:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98E5BF802E8; Thu, 23 Mar 2023 10:05:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5459F80254;
	Thu, 23 Mar 2023 10:05:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5459F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZaQXzTUj
Received: by mail-wr1-x434.google.com with SMTP id l27so11306385wrb.2;
        Thu, 23 Mar 2023 02:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679562332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtM1/6aT9Hs8L0/Z5EjLhrB2E2q0vn+Gu2UY/Kc0m8I=;
        b=ZaQXzTUjeJuWR7nWdtwf4QSQSdcp3+kIhkGEgjk4f9tZsWJ+yaUavlgvydHIWxalI3
         HvEEDOq4X7xCsTnh3p7f8o/6hsJvrzNP/yqFTDT5Eoq1mY2RqO5Ul1b0qyxW3DGycnKS
         1rGttUrCkEzU4rRdc9roM5Xx4ENsPKbfZx84SWouYOB55n1GhB19aBnzrn0eqyHvAd+R
         AspCR5MEgXgrp+UN78HUpy9xIt3Dd3bfRXImxDWkM8Xvu8S41n6gyoV3Iz60PY+u+wMQ
         aHvIVQaZOFa7t4AcojFK5rlrVKej1wFVLTIdmTeOBIaJP0JHbzavD/fzd5MO+nTPaCVc
         8YEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679562332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZtM1/6aT9Hs8L0/Z5EjLhrB2E2q0vn+Gu2UY/Kc0m8I=;
        b=I+ARt93ngWjKaK1J8y8lbzq5SwWobGvZOaTZfyvduviYNvDO9ljtnR7cDA4LbJ7hzG
         wDBC6Y+G/+L6EtORMPEODxY1/7NPMaf4hp3gJbk3NSKK2Shky4pJsokkZ5UV9czAjVHP
         75U43dNeTe041wAsjtWS6taRK91e2fFFhe+iXI7HUOUpWsun6/J81NQxwoq04caqwfTQ
         ea4AKFjvFa6PBj0YW5lpoZINKRCsfsWBvSbJmPi03wB8+dT6QLKpKGEA3d/a8iP21AK8
         TUCSXNEO+h0xa9Az6tk2kdTgaLM/5y1PKajDp9P8KPj/zyYYran47zAirWfDjuZ2ZDbp
         2fuw==
X-Gm-Message-State: AAQBX9dpgTi44DtXMFUaCBU2aS9UFijdguuY+dW/ZJMcM08RLZeSLo+r
	dNTkwfLgC8NEZs8O1QK3VsE=
X-Google-Smtp-Source: 
 AKy350Z9vPGF5pLhiKFKopvx4kjzoGNumrNcki7pJup/RNEkcWBlS3eBt8/YiZoRHJr9f0BLq0yB7Q==
X-Received: by 2002:adf:dc12:0:b0:2ce:a85d:5319 with SMTP id
 t18-20020adfdc12000000b002cea85d5319mr1793247wri.39.1679562332546;
        Thu, 23 Mar 2023 02:05:32 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id
 o10-20020a5d684a000000b002d89e113691sm6623425wrw.52.2023.03.23.02.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 02:05:32 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	sound-open-firmware@alsa-project.org,
	alsa-devel@alsa-project.org
Subject: [PATCH][next] ASoC: SOF: ipc4/intel: Fix spelling mistake "schduler"
 -> "scheduler"
Date: Thu, 23 Mar 2023 09:05:31 +0000
Message-Id: <20230323090531.67679-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3TQ7F2FBFH65ASPOODABJNH3F3R3RHNT
X-Message-ID-Hash: 3TQ7F2FBFH65ASPOODABJNH3F3R3RHNT
X-MailFrom: colin.i.king@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3TQ7F2FBFH65ASPOODABJNH3F3R3RHNT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There are two spelling mistakes in dev_warn messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/sof/ipc4-topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 12775fcb6b54..de7213237b27 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1990,7 +1990,7 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 		pipeline = swidget->private;
 
 		if (pipeline->use_chain_dma) {
-			dev_warn(sdev->dev, "use_chain_dma set for schduler %s",
+			dev_warn(sdev->dev, "use_chain_dma set for scheduler %s",
 				 swidget->widget->name);
 			return 0;
 		}
@@ -2149,7 +2149,7 @@ static int sof_ipc4_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget
 		u32 header;
 
 		if (pipeline->use_chain_dma) {
-			dev_warn(sdev->dev, "use_chain_dma set for schduler %s",
+			dev_warn(sdev->dev, "use_chain_dma set for scheduler %s",
 				 swidget->widget->name);
 			mutex_unlock(&ipc4_data->pipeline_state_mutex);
 			return 0;
-- 
2.30.2

