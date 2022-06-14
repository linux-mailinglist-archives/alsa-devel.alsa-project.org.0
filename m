Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DA054B8C6
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 20:39:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F2BA18D5;
	Tue, 14 Jun 2022 20:38:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F2BA18D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655231960;
	bh=6qVj/5d2je6xtcp+oKvZSx23Kk5BUZKZLhflCuDwjWc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NIrVmMHqtLhBeVJBHgdqpJY6JKooKwkQMDqcZcRednAyJsciQ0Aif75gH0Nd2GVe9
	 n1m7GFf/JmG27+ZKaHmHCaVyk1vCOnj3QN+8uA99qBqUR7CHTnVSdxzRKgXL+M/rEn
	 9+nefIBcE4iDXL239SGpCIHSoAhM8tFfUqnq4dfA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 723FCF800D8;
	Tue, 14 Jun 2022 20:38:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FBFFF80139; Tue, 14 Jun 2022 20:38:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF4DDF800D8
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 20:38:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF4DDF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nrg+QsCK"
Received: by mail-wr1-x435.google.com with SMTP id x17so12411926wrg.6
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 11:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WsJ5u2umY9+S+mCev0i/Sc2pgxCFrn1uJHhSVkU6Img=;
 b=nrg+QsCKmHI0Bt8jlxnugL6kmmj7Q2M/0Oqzm6eeYPqd6Xq/8Eno1RgjevR4EWVzTq
 kLeQcpw1i7J8QXjOlwrrPSVJHubL920hzCbb1L8Ijo5UZtcIDk4OL5VLpQsxnuDFHM9I
 wxx69E18GZJPZpPBOUwOLmBMevbA4DSUJE2BESoR0bp2s109g8RRLpOWqS+zOOYoUeEZ
 GHy0K39iuSb5G0dYXcQvLJhJQ0G6FJwXZDyvx0kyhac4OudcP0Se19obqIQ2jr8KgyUG
 cYakpuFk5ncN8Jp5a0WTegYE3ZrICStS+X6ZxdWtn6IWcrYPGEE9oBspB3Le0l/1ymC+
 Lptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WsJ5u2umY9+S+mCev0i/Sc2pgxCFrn1uJHhSVkU6Img=;
 b=6Bd3b04zFk9YoswoOftLdZLulY2ydgL9/g6CODcecyfMYQ6PqOhyo0J7LIlnPvVAUz
 lkVHXHGKF+5EChBfyqvENnY/rMC8d5q+iNxwQEK1IpglVAjubFGfNX5pjl/wh/7UIRAb
 4IzCj415i0xLF5Y6KO32Puj6L7BWxVdYSVwfDjfhGh3L6l0uCYZ5FzItXe9ADsGWD20s
 ZhUS1QhzmH/kGnaYWiM1IrGWb05KSgVlITXoA+zz5hcN2zpKWk3hcnG//hac+Zz49SEd
 t0YxLSC4gubZWLaFJQvAZhtVWKhZU4b0GuLWujeHRAOvJn0Or/4ETl1SEzH9mZQkU8Nf
 fEHw==
X-Gm-Message-State: AJIora8cfr/6hCurDlTez0XdvM777M5KU6/8YtUYzQMruKq5ZYQlLRth
 fIv1DbF5S9VKg19KmkF3/Uo=
X-Google-Smtp-Source: AGRyM1uAsMJfnYLUOIdK4OUtkl30vxeZBgEqqzIgFwWK3F8AHsx9AfxTYTNGfrwUzmhPuq6IWdl1sg==
X-Received: by 2002:a05:6000:1f8b:b0:219:bee5:6b77 with SMTP id
 bw11-20020a0560001f8b00b00219bee56b77mr6103544wrb.658.1655231891386; 
 Tue, 14 Jun 2022 11:38:11 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 a4-20020adff7c4000000b0021033caa332sm12928303wrq.42.2022.06.14.11.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 11:38:10 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: Skylake: remove redundant re-assignments to
 pointer array
Date: Tue, 14 Jun 2022 19:38:09 +0100
Message-Id: <20220614183809.163531-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

There are two occurrences where the pointer array is being assigned a value
that is never read, the pointer gets updated in the next iteration of a
loop. These assignments are redundant and can be removed.

Cleans up clang scan-build warnings:
sound/soc/intel/skylake/skl-topology.c:2953:3: warning: Value stored to
'array' is never read [deadcode.DeadStores]
sound/soc/intel/skylake/skl-topology.c:3602:3: warning: Value stored to
'array' is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/intel/skylake/skl-topology.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 9bdf020a2b64..e06eac592da1 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -2950,9 +2950,6 @@ static int skl_tplg_get_pvt_data(struct snd_soc_tplg_dapm_widget *tplg_w,
 		block_size = ret;
 		off += array->size;
 
-		array = (struct snd_soc_tplg_vendor_array *)
-			(tplg_w->priv.data + off);
-
 		data = (tplg_w->priv.data + off);
 
 		if (block_type == SKL_TYPE_TUPLE) {
@@ -3599,9 +3596,6 @@ static int skl_tplg_get_manifest_data(struct snd_soc_tplg_manifest *manifest,
 		block_size = ret;
 		off += array->size;
 
-		array = (struct snd_soc_tplg_vendor_array *)
-			(manifest->priv.data + off);
-
 		data = (manifest->priv.data + off);
 
 		if (block_type == SKL_TYPE_TUPLE) {
-- 
2.35.3

