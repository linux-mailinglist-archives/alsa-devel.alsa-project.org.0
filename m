Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFEC6610AE
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Jan 2023 19:00:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB90735E9;
	Sat,  7 Jan 2023 18:59:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB90735E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673114444;
	bh=KpNPtoWtSU8ydsvE/mK3W+cUogeAgwBi7lQ7A9MHyOc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Re9bRF823tfzqrxOxGnm1A7xhlLZgZKYjgiHtK7PO2Ro+hTROpFw3UA+qckdVOyl5
	 A1VmLgXvuHpKAQPoYpFKo/9pK+K77auWwBqOoKTe+gA8PQw8H6M4eZT5cMdRJGvxdu
	 79+8fReX2T0E8TJN4Zaj6hk/XUHjuZJoNRG9UR5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98D06F800C0;
	Sat,  7 Jan 2023 18:59:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62F29F804AD; Sat,  7 Jan 2023 18:59:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DBE7F8027B
 for <alsa-devel@alsa-project.org>; Sat,  7 Jan 2023 18:59:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DBE7F8027B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=compal-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20210112.gappssmtp.com
 header.a=rsa-sha256 header.s=20210112 header.b=wMIOyxfy
Received: by mail-pl1-x62e.google.com with SMTP id v23so159086plo.1
 for <alsa-devel@alsa-project.org>; Sat, 07 Jan 2023 09:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iWqmgQf0ITiBcZh6JNhizBnvL7irlNgfSV2PoqtxyOw=;
 b=wMIOyxfyvHuC8e5Aj6CB86Nw70h9LBzXvBV1QA9bp/cj6fSM7QyfknVz52mhPEPidk
 a1zsQzUy5Qq7BA4Ks65U5UYG+sp3s+EBb25I2XDJ2dcahqqjpM60S5LbDLZfRpx2MeFU
 W7nfaCWOroj4S4MucO++lqXNHZVD+7BdFUnEzq659JgK4gdHmWhnogPQqXUkmUxBgp5a
 Ua/h1lO+/UUDk4aU/llV3Dk9KtpcdmChz7iAN5oZkUagA7INeCQhFf3pz9/QqMnZ5Gww
 FlwN4i2TSMyEqfdVC6acojXTwY3qO43cpWjfuEQnQa2sYVZKFU4f/Vp8pm576XC0SbMc
 5nLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iWqmgQf0ITiBcZh6JNhizBnvL7irlNgfSV2PoqtxyOw=;
 b=kst2EgxVWFuaggiRqPkiVJ6sZJECeGASADm2ngOZ9uILyggJgP2nW59ZzImX93OW4g
 zMSSGsRNtpkIEHaSxYyW9kE+Gjs1t9F0rngF1PWplBaP0j/lGaO/y7o0SZCKu06ss/M3
 YJ7FyzFFyhXvTulKoQ20xPtuBihsVUlX33cQ0W3JFXCFi0qSVPeJ//LBe1OlM8hI4pow
 KWW+cLLgoAcbJMItLtvjunX18vza+stNYyeGgRKjW7g9Nt/nnwlb9tu+yzaSSULpvj02
 IBoMFgz866/zyax969u0t9UoQfMA3e3w/CyZzJbcgQXUDZy3Na0f8+SxpNgpFy5OyaN/
 pPHQ==
X-Gm-Message-State: AFqh2kqlpwLvRSjRIoRGlPpiFarvH9w39rSimoei9P+VLHx6ZX5QIq1i
 5fvSMTAzSrCfgt4hr4G+vFO8LA==
X-Google-Smtp-Source: AMrXdXtVpHJdVOh4RfHSJOx0P/jtbPc2ZkMWo8tGt2ZaF7BG1czvecWZCiKuu3acIhIcAZwpeKeMbg==
X-Received: by 2002:a05:6a20:1a84:b0:a7:89fd:884c with SMTP id
 ci4-20020a056a201a8400b000a789fd884cmr66257655pzb.11.1673114380551; 
 Sat, 07 Jan 2023 09:59:40 -0800 (PST)
Received: from localhost.localdomain (36-226-16-237.dynamic-ip.hinet.net.
 [36.226.16.237]) by smtp.gmail.com with ESMTPSA id
 g84-20020a625257000000b00580978caca7sm3102886pfb.45.2023.01.07.09.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 09:59:39 -0800 (PST)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1] ASoC: mediatek: mt8186-rt5682: primary_codec_init() warn:
 missing error code? 'ret'
Date: Sun,  8 Jan 2023 01:59:33 +0800
Message-Id: <20230107175933.12973-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, "chunxu . li" <chunxu.li@mediatek.com>,
 Dan Carpenter <error27@gmail.com>, kernel test robot <lkp@intel.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 tongjian <tongjian@huaqin.corp-partner.google.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The function primary_codec_init() should return 0 if dmic_sel is null.

Here is the warning message reported by 0-DAY CI Kernel Test Service.

smatch warnings:
primary_codec_init() warn: missing error code? 'ret'
...
2022-11-02  141       if (!priv->dmic_sel) {
2022-11-02  142               dev_info(card->dev, "dmic_sel is null\n");
2022-11-02 @143               return ret;

return -EIVNAL;?  return 0;?

2022-11-02  144       }

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>

---
 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index af44e331dae8..b333950aa3c3 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -140,7 +140,7 @@ static int primary_codec_init(struct snd_soc_pcm_runtime *rtd)
 
 	if (!priv->dmic_sel) {
 		dev_info(card->dev, "dmic_sel is null\n");
-		return ret;
+		return 0;
 	}
 
 	ret = snd_soc_dapm_new_controls(&card->dapm, dmic_widgets,
-- 
2.25.1

