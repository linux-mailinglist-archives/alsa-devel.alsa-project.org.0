Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2178E15196C
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Feb 2020 12:14:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF4641697;
	Tue,  4 Feb 2020 12:13:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF4641697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580814877;
	bh=Lc0pdooCcRHdKuR7YkCUAV03KdnZ3arOE4WAAZOldlI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kv4y94QTFRAhLp3M9wE17wbOzuVpse5BAcj5K1wHeyhUtab4kpumAXM7KEQBlyDGJ
	 WETC1jMyglWVZYNGukCr3rQ1PSIZ34mMVV8FFBHDWPIjL4s8KHBXlvHtNXS94P8U+6
	 C6uk4d1XoSAMtzuexx848WbAeS2lMtzV/NrRQB9o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B69FFF801DB;
	Tue,  4 Feb 2020 12:12:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FBC5F80162; Tue,  4 Feb 2020 12:12:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0BC5F800AB
 for <alsa-devel@alsa-project.org>; Tue,  4 Feb 2020 12:12:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0BC5F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QR9hOFh8"
Received: by mail-wr1-x444.google.com with SMTP id z7so22392363wrl.13
 for <alsa-devel@alsa-project.org>; Tue, 04 Feb 2020 03:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=euRgUOHMwfJN66fku2jYxRm29ftSwRr6fu8SbqY0eAc=;
 b=QR9hOFh8+DQ+Wvt/lNZuDlLWHuHNVU2IaRasepwiUHsedECyFbyY48yqEPWM46xj2j
 s8MB5JYLY6Q60MBOot/ORXhodw2GJm/Ox/iyFC68DjNH/LpQhF6OUWUQJj9EEcZMU2q1
 /4bBog0EPt0RpSrgYJtvESydtn3pYJhLHVOd+2Cuw9PatT8UMB3jEd4pPUEbzA7wwHWt
 mIOQLUGGL/hIULvoI7fl9eW0jSpDoVgoaUphCna44YwSA91qE5XxSRTjyZ7rZN0VM4Ud
 V0ghFEnNcZFYzVPsNQCN8LWBp6RQNHomFMKolXW61dReQbALB/w7HuQMJztKGg8UxxiN
 ToaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=euRgUOHMwfJN66fku2jYxRm29ftSwRr6fu8SbqY0eAc=;
 b=DMZEOWYUwAHjdLy4QasZEMSAxlZBV5G+9W+VZbQk9aTnPurHcmTnpc9Xmo/0pf015h
 2DyBYquh474j2R/qz05o9Jj1oFWgFZu8PhS4ZbeVaEClj6i11c3FBW8B75lMlF+NsA11
 BgpDbBdU7g7uhs37p+uMqPSASOPvcCMYSLRVbitxB1yc+qFSZ6YBRWchACiBUiMWTDVH
 RT7Uuei5g1tHYqTga9vy7NDrWzHkixvQoKcoklB/Bt9rOWyAbg1Jolnj6r5uKb/X1TXv
 DxCiiv1+9ghKO9laYmHyaL8IuORaxFObWx6vkGikCXC8pOXSRvuTnUVBho/5KB7WWrhf
 OhdA==
X-Gm-Message-State: APjAAAXOgirwfxYmXLb1kV8qMh+DmIdFdgZTJ3wnbbz+Zs3gn4LzRPV6
 A6t2iMvz8OAs6TspUzXRJm1g4A==
X-Google-Smtp-Source: APXvYqxJ3p0f3NqaYyzd6dHvDo+rS6RPnTDwxFF8uIb22oszcbFEPq5OjqcdifqgHTlmhog/UyIEhw==
X-Received: by 2002:adf:ce86:: with SMTP id r6mr4772043wrn.327.1580814766507; 
 Tue, 04 Feb 2020 03:12:46 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id v12sm3239378wru.23.2020.02.04.03.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 03:12:45 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Date: Tue,  4 Feb 2020 11:12:41 +0000
Message-Id: <20200204111241.6927-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, sfr@canb.auug.org.au,
 alsa-devel@alsa-project.org, lee.jones@linaro.org,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v2] ASoC: wcd934x: Add missing COMMON_CLK
	dependency
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

Looks like some platforms are not yet using COMMON CLK.

PowerPC allyesconfig failed with below error in next

ld: sound/soc/codecs/wcd934x.o:(.toc+0x0):
	 undefined reference to `of_clk_src_simple_get'
ld: sound/soc/codecs/wcd934x.o: in function `.wcd934x_codec_probe':
wcd934x.c:(.text.wcd934x_codec_probe+0x3d4):
	 undefined reference to `.__clk_get_name'
ld: wcd934x.c:(.text.wcd934x_codec_probe+0x438):
	 undefined reference to `.clk_hw_register'
ld: wcd934x.c:(.text.wcd934x_codec_probe+0x474):
	 undefined reference to `.of_clk_add_provider'

Add the missing COMMON_CLK dependency to fix this errors.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Changes since v1:
	- Rebased on top of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git next branch

 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index c9eb683bd1b0..286514865960 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1334,6 +1334,7 @@ config SND_SOC_WCD9335
 
 config SND_SOC_WCD934X
 	tristate "WCD9340/WCD9341 Codec"
+	depends on COMMON_CLK
 	depends on MFD_WCD934X
 	help
 	  The WCD9340/9341 is a audio codec IC Integrated in
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
