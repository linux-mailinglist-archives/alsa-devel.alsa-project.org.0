Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 212F52EFD98
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Jan 2021 04:47:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE2691731;
	Sat,  9 Jan 2021 04:46:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE2691731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610164014;
	bh=1r0jkhWao4jCvCuJB8Tvd717NYt9rYqaq1al9iSeO3U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eJ/cOpEh/LxK4lvSxR2PE4BxChhTu+JD7fsyNMxsZ7AzzB7BtFYAF1OgFFcT67saw
	 JrLLr5vUeBIYX7jux0NqbSDvxeytpU8cfSnIe85JTiz/t3lN0vOrWH/XeAOzYF6qZ0
	 s9prlGkPuGu1jt6AFHqg24QIuArosCltr4aeKENU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B835BF80149;
	Sat,  9 Jan 2021 04:45:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CF90F80258; Sat,  9 Jan 2021 04:45:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17DBBF80159
 for <alsa-devel@alsa-project.org>; Sat,  9 Jan 2021 04:45:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17DBBF80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZH83PzSw"
Received: by mail-pl1-x62b.google.com with SMTP id x12so6694736plr.10
 for <alsa-devel@alsa-project.org>; Fri, 08 Jan 2021 19:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=uB92DUbwohcnWwVtbyujXH7Yz0oL9MOyb3SwRnmiePo=;
 b=ZH83PzSw6BIe8d/gDKZbJ3TGaNxxV8mPkaTkEnHVw2p4eFmTYUJmXhg4Z0OqN+ev8Q
 n5nK/kYnOJVmhs6JHUwKxVkErgoLJB5xvTGTcEjQ4lwzX33GbUnLmhRJt+1k/1GyYEoL
 P7FXOaLeKr+p5xlN4YOr1aFDzN712XzDyR6eMYVDkNFO/QVq4/Ii3VtpeCYEwYfmuo63
 nZR0cm+cTkxILfm3wGRkUX2QkVonbIUtWY1+IVeR6XyfrxfB79vnPAGjpjNub6dfFX3F
 Fjob7Z36mV9QXDiNwWYBz/pRCdfHLcI/gr+99suxk2CmxN/xG/oKT7N4kxq1vsTkKrxX
 xxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=uB92DUbwohcnWwVtbyujXH7Yz0oL9MOyb3SwRnmiePo=;
 b=JL2tEyvHN3sugI0ICZH9Ui1N8c7UQ3tdwfdLcO7ckA6dozQmUnHA2YvhBV09MJY+t0
 /BZ9T3MTfOuU4D2hfHS4Jlbbqbapo2jUO9ml3ojzLkO1oxZMBPoqeNKBKjBVcXNqOBgV
 clbJJ57hZMicMPg4e0/nKzEbo3xurgwPHqqmmKWyU9CgEgZnuBBpxZjnhpNzPjK/7O9a
 Pd+GjhawSzQ7fctpTpY/hz4WmTCFqWxGfLvKvokDsLFjpLNzSf/1iR4O/q35+nTSQvvq
 uC5ILBsGgSyUQTZpFLl2E4YaJijNI/vO9T4hK+RhI1Iz2yMp3iFM1rmA7qfta+emJIfi
 7U/Q==
X-Gm-Message-State: AOAM530MfB+23uqLqytJppwbql90G6fZyG0Ge+zYbuRzZuoAl6NwSZ+S
 ScuzOlmAJGetkm4D6bXMb9k=
X-Google-Smtp-Source: ABdhPJy7/bAYzdNNmr61Zjr56SHx1fNrknsK8odyIFCPYl80ubIOMXYQATWQICuH69Pz+TBfaJgZiQ==
X-Received: by 2002:a17:90a:5911:: with SMTP id
 k17mr6976465pji.152.1610163898789; 
 Fri, 08 Jan 2021 19:44:58 -0800 (PST)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.171.171.27])
 by smtp.gmail.com with ESMTPSA id q12sm10770952pgj.24.2021.01.08.19.44.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 Jan 2021 19:44:58 -0800 (PST)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoC: soc-pcm: return correct -ERRNO in failure path
Date: Sat,  9 Jan 2021 09:15:01 +0530
Message-Id: <1610163901-5523-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Souptick Joarder <jrdr.linux@gmail.com>
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

Kernel test robot throws below error ->

sound/soc/soc-pcm.c:2523 dpcm_run_update_startup() error: uninitialized
symbol 'ret'.

Initializing ret = 0 and returning correct -ERRNO in failure path.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
 sound/soc/soc-pcm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 481a4a2..29328ce 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2432,7 +2432,7 @@ static int dpcm_run_update_startup(struct snd_soc_pcm_runtime *fe, int stream)
 		snd_soc_dpcm_get_substream(fe, stream);
 	struct snd_soc_dpcm *dpcm;
 	enum snd_soc_dpcm_trigger trigger = fe->dai_link->trigger[stream];
-	int ret;
+	int ret = 0;
 	unsigned long flags;
 
 	dev_dbg(fe->dev, "ASoC: runtime %s open on FE %s\n",
@@ -2441,6 +2441,7 @@ static int dpcm_run_update_startup(struct snd_soc_pcm_runtime *fe, int stream)
 	/* Only start the BE if the FE is ready */
 	if (fe->dpcm[stream].state == SND_SOC_DPCM_STATE_HW_FREE ||
 		fe->dpcm[stream].state == SND_SOC_DPCM_STATE_CLOSE) {
+		ret = -EINVAL;
 		dev_err(fe->dev, "ASoC: FE %s is not ready %d\n",
 			fe->dai_link->name, fe->dpcm[stream].state);
 		goto disconnect;
-- 
1.9.1

