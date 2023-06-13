Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7FE72E419
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 15:29:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BB56AE9;
	Tue, 13 Jun 2023 15:28:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BB56AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686662953;
	bh=koUzvEiCVL4ZV3eZE7rt/JBpHYifR93ypeG7YKwMHqk=;
	h=Date:Subject:From:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WE9kDT6SQCiy+GW5+P6JOrqW4ZMduWGTVJtwlxHSlNjUPuV+LZO3qPuuwqWKMpv5E
	 qwfLd8SZc5HL+jYl6zfqVrEi622oq65qMPUngNEL2s6oHm0V5Zyu5/GrOGZY/3q582
	 vYJYVi2R8M2qLgKLF+2+loGbqfkvyjlHEZd7aiTs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7287F80301; Tue, 13 Jun 2023 15:28:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CCBAF80132;
	Tue, 13 Jun 2023 15:28:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2838BF80149; Tue, 13 Jun 2023 08:24:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A933AF80093
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 08:24:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A933AF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=Cvn1KURu
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-bce24604eeaso1372420276.0
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Jun 2023 23:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686637442; x=1689229442;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SksGVuYCcpsJS5jmOyFVtMmk7sbrZYWWYhHorGtkCYg=;
        b=Cvn1KURuUQhom3FaKEax20iu/wRaoEiE+9IlyMWWIGvmYOydnM3Fbia3p3JYFkG+RA
         79Kx39PwldBaXf9s3FZJRMs3Dxdn+VqpVnfMUNBTddetvkg5SuEx+Ourqz6HdUFX76WX
         kqB4YCKy1WOxSMSQ/HghElbCNBtlZAXc+2YXlpmAFddwrIO865Zjv5CnjDZUbKqA0Np7
         uHVlrgjkSHMvsRKpgnXbRDRReCBmcYlgGVHF/KII5tQzwunuWWx0krZ2Z/Hmt7TQfRdg
         TgKKvc0ShTp2X83gkNhOLw5dm5ro1bozBtFfo7BHd8oUDDdPH+BQZOYe7aw3PBB1A2dk
         83Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686637442; x=1689229442;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SksGVuYCcpsJS5jmOyFVtMmk7sbrZYWWYhHorGtkCYg=;
        b=hk4t8iPxuvzLomajzRLwM/lk9xgLk0MIgCLRjhuECxfWQPWhmqUCQVUDhS1n5CBkx6
         Cjcf0hPbp2K2dUE0QoJ6iCYBB0T0sJiGc4dnC31CmkCoKpHtIxXZ2f1CAzobNipcl/Q5
         UGpc8a0qWY6/75YXJAvz6LJHJXc9keXLXw7E7AAcRjAOyoD72kdYBOM7Zri0UA1jKwuT
         EAqXeVJwMrK1IokrBlR9JRyPcy9YR4PLTAxVezppkWYSVv+AmTu2JdYxoxwCyced9EDo
         gad1WxH+Npt9uzcuNu9MvOJjtrDbwzHzwTDcFbSK9Fv1XZLoOuf1Or5Q20APpZ302kfM
         X3qg==
X-Gm-Message-State: AC+VfDwfmZnEm/BxAk+1uPLCLIrAidcciHsxfM/avdl+D1H5vUbRDMFK
	RlyjSRNBxY0W7nwM7UtzyZctz1zAiOyTLgsgYw==
X-Google-Smtp-Source: 
 ACHHUZ7MsfCSnI9ZnIsllvUmu8OVRtd5lAnbhP5r+QUWm1RA9r7epvJv2CV2dCkQTlRGDW/LSP6fFyjXpFb9Xgka4g==
X-Received: from yixuanjiang.ntc.corp.google.com
 ([2401:fa00:fc:202:8f9c:a67:3aa8:51ac])
 (user=yixuanjiang job=sendgmr) by 2002:a25:ad1d:0:b0:bd1:ae45:5447 with SMTP
 id y29-20020a25ad1d000000b00bd1ae455447mr208027ybi.0.1686637442066; Mon, 12
 Jun 2023 23:24:02 -0700 (PDT)
Date: Tue, 13 Jun 2023 14:23:50 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230613062350.271107-1-yixuanjiang@google.com>
Subject: [PATCH] ASoC: soc-compress: Fix deadlock in soc_compr_open_fe
From: yixuanjiang <yixuanjiang@google.com>
To: vkoul@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	yixuanjiang <yixuanjiang@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: 
 3gguIZAsKCuMdNcZFSONFSLLTTLQJ.HTRFQXF-IJaJQFQXF-UWTOJHY.TWL@flex--yixuanjiang.bounces.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AYEOVOU5PIL2BSVRADMXZBT6N67XJOPT
X-Message-ID-Hash: AYEOVOU5PIL2BSVRADMXZBT6N67XJOPT
X-Mailman-Approved-At: Tue, 13 Jun 2023 13:28:14 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AYEOVOU5PIL2BSVRADMXZBT6N67XJOPT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Modify the error handling flow by release lock.
The require pcm_mutex will keep holding if open fail.

Fixes: aa9ff6a4955f ("ASoC: soc-compress: Reposition and add pcm_mutex")
Signed-off-by: yixuanjiang <yixuanjiang@google.com>
Cc: stable@vger.kernel.org # v5.15+
---
 sound/soc/soc-compress.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 256e45001f85..b6727b91dd85 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -166,6 +166,7 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 	snd_soc_dai_compr_shutdown(cpu_dai, cstream, 1);
 out:
 	dpcm_path_put(&list);
+	mutex_unlock(&fe->card->pcm_mutex);
 be_err:
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_NO;
 	mutex_unlock(&fe->card->mutex);
-- 
2.41.0.162.gfafddb0af9-goog

