Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BBC75DE9
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 06:44:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AE301F7C;
	Fri, 26 Jul 2019 06:43:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AE301F7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564116251;
	bh=pOllHkFoBr9oujcgZvpOEJvK+ag0MXZ8L8jwyubmGwM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sFjYxFvgTdmhSjEUG34obN1dOfMRuVGB8Tu3Xj8dIUe2aErTPoAeI9EiRn3SwiD8a
	 xKON2awCR0QT0DFXYZItr7KUjptAQsEU5BkSXnBdXexkGp7I2RnKPkn+3cXD8p+KpH
	 UvngEGfDOrDDR6C0Xw/KJBjuFFYvOEtSTx/PhtZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD4ADF80368;
	Fri, 26 Jul 2019 06:42:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06E73F80368; Fri, 26 Jul 2019 06:42:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FDD3F800E8
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 06:42:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FDD3F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Hm635lZZ"
Received: by mail-pg1-x542.google.com with SMTP id f20so14894134pgj.0
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 21:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eq62dV3aG3jd/W9zqRWfepVRB8FhgcYvUn8Cc6l9GkA=;
 b=Hm635lZZN0RARpzAb9ayexcKn9YXj1XlLee2lITYorBDY2KOsISLHVejwgEYcg6Nc0
 ZqhT1sHlG9s/X0ETZP/JU0sFKEZfCI/zwx6FZHpw1WBMbMM+jyC+fd8EFxcdysy7wZMH
 YYPvEnctY6Zda/l2Cl2oxKrjCh5ExnnUiBHjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eq62dV3aG3jd/W9zqRWfepVRB8FhgcYvUn8Cc6l9GkA=;
 b=WscqoOX1NGk3tmMA+xUoqKHoiB9TMDlAGnH8IpbupjKx/0I8RoTLVY+FyXRYX4Syy8
 +tyZXCmoCcCVM2qx5QtwucFZt7y4CrCCCzWaRqjj42GqOXJJBQCoEvxGN3UaCTygFqtQ
 I9EoWr6oamxCPML/lqsGvN/dFF+ADagYFDPq68QqnqZ3UC9+rDNksEznWDhbiCGRGiqa
 2HR9wjr44Dn7BKGqBYy/IvIeVWa9fgpoXqk6fXve4mskNO4wLOTYDMla3mXKp4h2+0ke
 1bSU1vZ+uwr8Te6fgAuaeul6mFIp1Kbwy9zuKl4JNDSrv7ZsUmMEMlqrMYrOmd+NZ3kf
 O9yg==
X-Gm-Message-State: APjAAAUQAT9UZAypJUX6CflG2u1+LvrDhfIpiJvLfcSrcHqoczbKc/D5
 k0MLAiiydVb2d0tQ7wP7tqOL8g==
X-Google-Smtp-Source: APXvYqzyDNFdueHohA8SGN1O6dmRutvK/f1c35LtOqHGnJFqaLCJWNkNKPAQTGdjzMb/377e4SAgXA==
X-Received: by 2002:a17:90a:9905:: with SMTP id
 b5mr98357683pjp.70.1564116135769; 
 Thu, 25 Jul 2019 21:42:15 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id t7sm41702252pjq.15.2019.07.25.21.42.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 21:42:14 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri, 26 Jul 2019 12:42:02 +0800
Message-Id: <20190726044202.26866-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, dianders@chromium.org,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, tzungbi@chromium.org,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 dgreid@chromium.org, mka@chromium.org, linux-arm-kernel@lists.infradead.org,
 Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [alsa-devel] [PATCH] Revert "ASoC: rockchip: i2s: Support mono
	capture"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This reverts commit db51707b9c9aeedd310ebce60f15d5bb006567e0.

Previous discussion in

https://patchwork.kernel.org/patch/10147153/

explains the issue of the patch.
While device is configured as 1-ch, hardware is still
generating a 2-ch stream.
When user space reads the data and assumes it is a 1-ch stream,
the rate will be slower by 2x.

Revert the change so 1-ch is not supported.
User space can selectively take one channel data out of two channel
if 1-ch is preferred.
Currently, both channels record identical data.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 sound/soc/rockchip/rockchip_i2s.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 0a34d0eb8dba..88ebaf6e1880 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -326,7 +326,6 @@ static int rockchip_i2s_hw_params(struct snd_pcm_substream *substream,
 		val |= I2S_CHN_4;
 		break;
 	case 2:
-	case 1:
 		val |= I2S_CHN_2;
 		break;
 	default:
@@ -459,7 +458,7 @@ static struct snd_soc_dai_driver rockchip_i2s_dai = {
 	},
 	.capture = {
 		.stream_name = "Capture",
-		.channels_min = 1,
+		.channels_min = 2,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_192000,
 		.formats = (SNDRV_PCM_FMTBIT_S8 |
@@ -659,7 +658,7 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 	}
 
 	if (!of_property_read_u32(node, "rockchip,capture-channels", &val)) {
-		if (val >= 1 && val <= 8)
+		if (val >= 2 && val <= 8)
 			soc_dai->capture.channels_max = val;
 	}
 
-- 
2.22.0.709.g102302147b-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
