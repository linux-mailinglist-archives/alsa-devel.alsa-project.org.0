Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B685330D221
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Feb 2021 04:24:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BD0F1721;
	Wed,  3 Feb 2021 04:23:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BD0F1721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612322681;
	bh=09fjbfART3fxbCJXcr01J0uZ+umlEByl7aPlAtdNkbQ=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c/Tz3DxqD4H15DZbzaREwZvj2cbqiBu5YQ52zJQ4v7OCcWDXsNqXSdELdun7AmTpi
	 8gv+zMomeavNwAQsRR0VtFd5OmpDHo4kO8CQugH9dr/M5wQi/ZQtKGovYlgQjJK5ln
	 fKkWyqKEpD51OUfOHD0WEyz7OL04LfKTv83F5mVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CA08F8025D;
	Wed,  3 Feb 2021 04:22:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF209F80224; Wed,  3 Feb 2021 04:22:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE316F8013C
 for <alsa-devel@alsa-project.org>; Wed,  3 Feb 2021 04:22:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE316F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="COESOUHp"
Received: by mail-qt1-x849.google.com with SMTP id j14so16043538qtv.3
 for <alsa-devel@alsa-project.org>; Tue, 02 Feb 2021 19:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=u2Iqq872P7p/YU4FllDin0kiXJhazvea/L0CppZ6PYM=;
 b=COESOUHpwIoP4LIPzl61yrHlk8gapzkAlKa7MFi0NpK78Gl6ALBkFvuSoi3WBvwhH2
 Dm9uqqRgSaFpyPKk5ZZl0NDtw9tk2GXHBvdX0M/L//dxxQaizppVwLPwKHDENjOiCZXK
 HrWwpBhQjogQ2fZfIPnJAVS1qC43DiasHtjPzVIsquaGUxmRg9mDtzIYCMFAI2GfWLiO
 M7kN8WWihvXkj87Pq8UEs2a2fp2pIJUH4oljIv9bzJdo4hmnmHV8KHVQ/6TDgIJLhapL
 neG/rhmpqxT78Ov0NRPnqMgZYAuGVSKQVjTlYlw5EMGteaoysts/HDtRMsSMWPE/TWZX
 ppIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=u2Iqq872P7p/YU4FllDin0kiXJhazvea/L0CppZ6PYM=;
 b=BykExzygrAat/RFlKU8R7baQF75aqckW4SxBrCecRrkxED/4jAGBN/NCDTDjkGetF1
 q5sMxCbx7nN6ReKH5PUcNT7kQc5gyC3/YbuXn3jg8PR7vg6lqup4RKjP4GrhhTegX2CD
 Onn7isZ8gs6HqOzeTQCGkL+qy6atiERDdW91EMeRo4NcFYvDfiiGCqSXcstuEUcR6nkb
 YHSMythQLINJat8VOqTK8OCtq/d3mTs4FLERrV8+62nKRkpbRjSYtskLYPvzbjNi2xvG
 LuKfDnGKTp06BO4xV9f6PsLuyrEMSMfPkpfH4tWq8l6iHOjXNlIHk4DikgBfImlzTjBA
 No+w==
X-Gm-Message-State: AOAM530PuX5kgZjiybTs+x1VtaASEI0DG3vF84nQouZipeYaq6qQqq8d
 uGAmrwVXImf8lts/4J6hepStgOKlekvY
X-Google-Smtp-Source: ABdhPJy+gSTj31iBZMaMhA+kjwrZkTDmRU0J0RVYiVZ0La7A+VI/hmptiFIywE1Jw7Sx1LbjNT7FfBBL/Wo5
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:dc88:dd2b:a03:4076])
 (user=tzungbi job=sendgmr) by 2002:ad4:5bc8:: with SMTP id
 t8mr1222680qvt.36.1612322535414; Tue, 02 Feb 2021 19:22:15 -0800 (PST)
Date: Wed,  3 Feb 2021 11:22:00 +0800
In-Reply-To: <20210203032201.2882158-1-tzungbi@google.com>
Message-Id: <20210203032201.2882158-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20210203032201.2882158-1-tzungbi@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v3 2/3] ASoC: mediatek: mt8192: use asoc_substream_to_rtd()
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org
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

Uses asoc_substream_to_rtd() helper.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index e7fec2d75e3d..7a1724f5ff4c 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -42,7 +42,7 @@ static const struct snd_pcm_hardware mt8192_afe_hardware = {
 static int mt8192_memif_fs(struct snd_pcm_substream *substream,
 			   unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
@@ -59,7 +59,7 @@ static int mt8192_get_dai_fs(struct mtk_base_afe *afe,
 
 static int mt8192_irq_fs(struct snd_pcm_substream *substream, unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
-- 
2.30.0.365.g02bc693789-goog

