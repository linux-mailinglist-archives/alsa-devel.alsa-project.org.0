Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD74069976C
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 15:29:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20DC0EAE;
	Thu, 16 Feb 2023 15:29:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20DC0EAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676557791;
	bh=VIGNX+nJcCFPEeWabI5oHob/hcgsvWcaskG8e9nhRww=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gRvrfdHq4zVetKSRMyoz6SK4r566m3lukB72UFW58qNiPcnHMWNZRIYyiuV3+fwBW
	 URN4OnpV01I0+t+FR+uxtLRcAbtkQ75VXu1YOnsIiX7BxWjVGabuEDkSpzvJ39fBTi
	 TEIC/DESHVxzQriKsPMMHVsbJUtCdjXdOjSJsZgk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2D87F800E4;
	Thu, 16 Feb 2023 15:29:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9F47F80496; Thu, 16 Feb 2023 15:28:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B622DF800B6
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 15:28:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B622DF800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Kh/nCKeu
Received: by mail-wm1-x329.google.com with SMTP id p5so1694301wmg.4
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Feb 2023 06:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rNK4VnHvNCmP8XNvu7i14YGbIOfy1cUxhBAjEemW9tw=;
        b=Kh/nCKeu3jPS1d16sHhwKPrki0sxEDOQsmPYGznYiV+osvzll3h01HxEO9Efctrtgb
         sJaWKAgvHJze8LLpT0Tk4XCOcETwbgAjvNYklm6e4H3rtDggkXiQP+c0mBbiD7h1LM54
         gSn0rWlOQMkfcjYmWjpA23VX2m/cTtkussYgXCU+dAVyLBTyFD4AFhvRko24eg0YGU+g
         k00hcF97XtLXRqMR1UHLSmhzL3DsANS7PGU8ZJDboL1wBVQnkib4NPrkiQpx+awv2dAr
         1c74yRORghWDv54TOndHkA5TCSQGuX4Q0D+FxpTThojeqARhb9DaCz9bsDcFHF9/czfB
         cOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rNK4VnHvNCmP8XNvu7i14YGbIOfy1cUxhBAjEemW9tw=;
        b=Y+S9G6NI7j2euhvQni3NSvvkhJI40HNzu89rXrRzKdKoVuj9M53jdhRIf7hNY0O/au
         RXLXPo7On/g4YUm5/YneFKRQ/9jrcr7VqvA7OLg71bH8tDTnlchohymhLeUtU8t+dAUi
         12ZjuRFWVSg6Gne82AwOxBrMz2ZhqdkAhFBwKMfuBSXmtfzoA2hgKI4yIw0LfAreNOVn
         g3CxGp/KM5PTXYhTDF3u3TtLp8XKDQnFaFGsqeURDEDHp9wshmreUKPA6718Vktwm+62
         THka6bANIrw7q2GGUrjB8cBh7TyxIqju8k1YTkntIAEXzW05XChRrVzPfGEoEl/TUCUa
         /Agg==
X-Gm-Message-State: AO0yUKXc7QV8BbLbCzwFHzCdw/PivzzSpNYkBlUHwc+55KDjxls/k64L
	8GSgWcZjvRlnGSX93yTrrjNMd8zZXeg=
X-Google-Smtp-Source: 
 AK7set9PXoHvU/hPA35RL84BO65vAFb9t3q71WQmzMI4/WaVibvFWY9lopGs1Db8qGYEsdgr9qABPg==
X-Received: by 2002:a05:600c:43d3:b0:3db:2df0:f2b8 with SMTP id
 f19-20020a05600c43d300b003db2df0f2b8mr5466011wmn.36.1676557731832;
        Thu, 16 Feb 2023 06:28:51 -0800 (PST)
Received: from localhost.localdomain (awyoung.plus.com. [81.174.138.22])
        by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c198e00b003db0ee277b2sm5709726wmq.5.2023.02.16.06.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 06:28:51 -0800 (PST)
From: Alan Young <consult.awy@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: pcm: generate default audio timestamp
Date: Thu, 16 Feb 2023 14:28:46 +0000
Message-Id: <20230216142846.1984099-1-consult.awy@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IHQ52WLM6U5E46TE7C2I3Q2DTHZAZADJ
X-Message-ID-Hash: IHQ52WLM6U5E46TE7C2I3Q2DTHZAZADJ
X-MailFrom: consult.awy@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: pierre-louis.bossart@linux.intel.com, Alan Young <consult.awy@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IHQ52WLM6U5E46TE7C2I3Q2DTHZAZADJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If there is no get_time_info() available or the requested audio
timestamp type is AUDIO_TSTAMP_TYPE_DEFAULT then need to set
audio_tstamp_report.actual_type = AUDIO_TSTAMP_TYPE_DEFAULT (in the
else clause near the start of snd_pcm_update_hw_ptr0()) in order for
update_audio_tstamp() to generate the audio timestamp from the number
of frames.

Fixes: 3179f6200188 ("ALSA: core: add .get_time_info")
Signed-off-by: consult.awy@gmail.com
Reviewed-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/core/pcm_lib.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 8b6aeb8a78f7..943f5396fc60 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -289,8 +289,10 @@ static int snd_pcm_update_hw_ptr0(struct snd_pcm_substream *substream,
 			/* re-test in case tstamp type is not supported in hardware and was demoted to DEFAULT */
 			if (runtime->audio_tstamp_report.actual_type == SNDRV_PCM_AUDIO_TSTAMP_TYPE_DEFAULT)
 				snd_pcm_gettime(runtime, &curr_tstamp);
-		} else
+		} else {
+			runtime->audio_tstamp_report.actual_type = SNDRV_PCM_AUDIO_TSTAMP_TYPE_DEFAULT;
 			snd_pcm_gettime(runtime, &curr_tstamp);
+		}
 	}
 
 	if (pos == SNDRV_PCM_POS_XRUN) {
-- 
2.31.1

