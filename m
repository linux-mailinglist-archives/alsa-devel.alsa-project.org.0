Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 148BC42AE97
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 23:16:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70090168F;
	Tue, 12 Oct 2021 23:15:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70090168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634073406;
	bh=W4gCIrAGXERnwE3cQfIvskKiswP48t6/sb9lj9LghTA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n2/qwlOjKJcwd01Y2qDGlzJJg17Q0T2fil48HlOrVXmGLxLpBxesdXjiJvLRWZlTw
	 EY6GD9QbpTwB6vobLdiHgOeXvMYsAVVXnKKxP36xo03CGILDIxhTaajiEsDPuHubzt
	 OFCxukhKL4mKup8V9UuavlqjOesUEvINv+CGfdtg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9A84F800CB;
	Tue, 12 Oct 2021 23:15:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FFFAF80212; Tue, 12 Oct 2021 23:15:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 594EEF800CB
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 23:15:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 594EEF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Wa8LeIAT"
Received: by mail-lf1-x12a.google.com with SMTP id y26so2321727lfa.11
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 14:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bRMO0z5rTRyoYHGRA8sAjbt4Yk595vyUUqlmV7aHWE4=;
 b=Wa8LeIAT7oIwgjxcaVjMzphzxb+0WJ0kl6XTeqWwLUKqAGwu7E5ZW9OujQ62ge7qyF
 2t6tm75GjISjkKdkhapoD9HutSZ/rMZVrEjTOXjEEsaJjmGt+9035YPLD+Prx309pzoD
 cCc3b9M6XylQ9P9SAeD0bbrA9AA0cWK7byz/DtWr2k40CN1CHDem/yRGWjMZQ5rxByuW
 3lHzsXUM66BFBhoEiL2Kn0lPO1P46M1ooIvzbDg/ayNtPQCWLnM5sG71yhSjevJedAlK
 +esH2VsCqrMcfJWqx7+WMq+2VjNhCyWHGlTsL513eJeXZj51jF4fnmIxEbMZle14/C96
 VbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bRMO0z5rTRyoYHGRA8sAjbt4Yk595vyUUqlmV7aHWE4=;
 b=z4uF6bHOgeT28hWAq0wkgG+0AhAA6aTWS2iKXJkk6UfwzmJwhvvRKZEmMTgOwO1m4n
 w8cpE/FoGVgAhiUGCZCs1+sjtXynIqqSSP8LyRWBcN9q7DZQWvvvZFZzxZ6fVrIYccNS
 sj19mudmSv09xxru0y8TnVvuskoZbBD4Kt0h1OMBVWnqVRGcQsEcANG1Yj0KorI5bv8f
 PhzKeVCe7z23DWSCZadbj4QyrMgaOsGKVGOLGjy/fWE9sRS57CVoEs39i4fIUH9ZSke2
 qR1YR0REQxKEPVD/b0NnQLgbsd28IDa5/USLi0UurwahIOnQOQc7zQSGGSbiq8q8vREG
 NmEA==
X-Gm-Message-State: AOAM531nkzDcKGjrVNKB/6ZZoEnmW3vTw57wZphTLwPvGXmBVCmBVbIQ
 taXbOTDoKxDVINjlqP++am4=
X-Google-Smtp-Source: ABdhPJzex1DnN+8pV4Yeexc04aFMuXAGDTxNuEP6mVTEyiUgsO4+RF0VzccF5dtADuruU2tVwwjPhA==
X-Received: by 2002:a2e:9b12:: with SMTP id u18mr23476462lji.447.1634073310313; 
 Tue, 12 Oct 2021 14:15:10 -0700 (PDT)
Received: from localhost.localdomain (h-158-174-22-5.NA.cust.bahnhof.se.
 [158.174.22.5])
 by smtp.gmail.com with ESMTPSA id l23sm1362132ljg.99.2021.10.12.14.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 14:15:09 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: amd: vangogh: constify static struct snd_soc_dai_ops
Date: Tue, 12 Oct 2021 23:15:06 +0200
Message-Id: <20211012211506.21159-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

The only usage of acp5x_i2s_dai_ops is to assign its address to the ops
field in the snd_soc_dai_driver struct, which is a pointer to const.
Make it const to allow the compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 sound/soc/amd/vangogh/acp5x-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/vangogh/acp5x-i2s.c b/sound/soc/amd/vangogh/acp5x-i2s.c
index 2705e57eb713..002db3971ca9 100644
--- a/sound/soc/amd/vangogh/acp5x-i2s.c
+++ b/sound/soc/amd/vangogh/acp5x-i2s.c
@@ -348,7 +348,7 @@ static int acp5x_i2s_trigger(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static struct snd_soc_dai_ops acp5x_i2s_dai_ops = {
+static const struct snd_soc_dai_ops acp5x_i2s_dai_ops = {
 	.hw_params = acp5x_i2s_hwparams,
 	.trigger = acp5x_i2s_trigger,
 	.set_fmt = acp5x_i2s_set_fmt,
-- 
2.33.0

