Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3393F9169
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Aug 2021 02:50:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62FA716D0;
	Fri, 27 Aug 2021 02:49:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62FA716D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630025409;
	bh=jJhO5xr4jD4L5Fq2yS4IKTWH9i1/r3XD/SgbtwKuSp4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ldVw2yFibUMc3lRvGg3H5XcPemlbYzlOFdYmUJmpz1gFQybRDjogIcSfW3ujaXjM/
	 LB10bpegTbKKOkSK1bi6XoSTMaYOkgZlwXyIlS63zHzYPbBYacl9K2SSwfWQkLhedG
	 wcVvU2MtZN0PWRCM9/RYLMeKxfoC9RIblED/4ABg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAA94F80224;
	Fri, 27 Aug 2021 02:48:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD525F801D8; Fri, 27 Aug 2021 02:48:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B84D1F8013F
 for <alsa-devel@alsa-project.org>; Fri, 27 Aug 2021 02:48:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B84D1F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="hcGRC258"
Received: by mail-pf1-x42a.google.com with SMTP id m26so4240654pff.3
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 17:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7P3yGvpBJYZTbfVO9vdp7nhv6sGS5hNUXHv3tavShLs=;
 b=hcGRC258WWXv0Zn4leDw7HcTNFc/KUywLUZ6oOmkTHSjxWGvNQsVNZ40qm3oz5nKdZ
 H3oJ7CUGndGqsx25Wvm1oAl2OHaPY5i1fiM20y8xbvqjrwW3Nctvj46OTIolvowrXWsq
 RLHLgyqgWZP1hg88ur/aVfksvAnaGxjvBzcSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7P3yGvpBJYZTbfVO9vdp7nhv6sGS5hNUXHv3tavShLs=;
 b=UR2PJ6+VDYEIH+4gIA/taaHJ+PYm0+kXGJ9oPrEHnbvxcWYCWhqchW1nKdx/Z06sWB
 +UBjDlo3JXHS/e9uqVZgAvg29qbwhyG4hG1I7POTtO2Y8YePsPHwSePjTcZkhY8/8vFZ
 lTUDemy4QzYLTg8DFpXVcTAyH5jXQ7e5j+IH0oeBLxCoLicGRGCGJrDmT8A63cyKIJX5
 Nrmvlag43g79c2D8L9X5JBa6mc3iR56rGloBvJuQO62R7hSPopS9Fs99QQ074mqPDNDd
 0+V5tb8cIwxipaGCNZLXi7sFmQvlwQVXQ6uJ0J+bym/0N/nw7lEYNhPTKuQ4JbTrCl7g
 GQGQ==
X-Gm-Message-State: AOAM532PujqAvPNG8xBAnHZ8W7U1ofwMCy0eKbzOG01cQcQ6DJBrE8jG
 0fB7xeoTpf19bnGr1W/fy0NUAI64OE9sJA==
X-Google-Smtp-Source: ABdhPJxQszY5/eViak38osQUCzxe1jUoCt4XOlaIPpdd6q63dJ1N2so1JtYxngv0wJ4+ptNmOovZvg==
X-Received: by 2002:a63:d001:: with SMTP id z1mr5745239pgf.368.1630025316929; 
 Thu, 26 Aug 2021 17:48:36 -0700 (PDT)
Received: from zsm-linux.mtv.corp.google.com
 ([2620:15c:202:201:515e:ea9f:fb49:198d])
 by smtp.googlemail.com with ESMTPSA id z1sm8979258pjr.0.2021.08.26.17.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 17:48:36 -0700 (PDT)
From: Zubin Mithra <zsm@chromium.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: pcm: fix divide error in snd_pcm_lib_ioctl
Date: Thu, 26 Aug 2021 17:48:21 -0700
Message-Id: <20210827004821.3658015-1-zsm@chromium.org>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: groeck@chromium.org, tiwai@suse.com, Zubin Mithra <zsm@chromium.org>
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

Syzkaller reported a divide error in snd_pcm_lib_ioctl. fifo_size
is of type snd_pcm_uframes_t(unsigned long). If frame_size
is 0x100000000, the error occurs.

Fixes: a9960e6a293e ("ALSA: pcm: fix fifo_size frame calculation")
Signed-off-by: Zubin Mithra <zsm@chromium.org>
---
 sound/core/pcm_lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 7d5883432085..e41b4e01aa37 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1746,7 +1746,7 @@ static int snd_pcm_lib_ioctl_fifo_size(struct snd_pcm_substream *substream,
 		channels = params_channels(params);
 		frame_size = snd_pcm_format_size(format, channels);
 		if (frame_size > 0)
-			params->fifo_size /= (unsigned)frame_size;
+			params->fifo_size /= (unsigned long)frame_size;
 	}
 	return 0;
 }
-- 
2.33.0.259.gc128427fd7-goog

