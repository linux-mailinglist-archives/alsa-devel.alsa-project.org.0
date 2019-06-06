Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 090B3372BE
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 13:24:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81FF31663;
	Thu,  6 Jun 2019 13:24:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81FF31663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559820298;
	bh=yG5E2qUxxpxF41Te+U4m+MY3je/5UpaIY0dHb9cyTTY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UweYz6PRLI4E5CkhEKFyQrqXIKH+f8WpBz47HklwfuH2a2sktVkgJPKLH9peyW4N2
	 ZtU9NVFblXWeZ1mZx3YZf1dGh2kNKx8J7WX0nTzCeyYu5TXScEEfGrk6E25CGrQHwm
	 kuZwR21JHt5qhHDqn667UQx1YjArJg/mG8yf/9hc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9642EF8972E;
	Thu,  6 Jun 2019 13:23:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DC9AF89710; Thu,  6 Jun 2019 13:23:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 894EEF896CE
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 13:23:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 894EEF896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="EwkWNm95"
Received: by mail-wr1-x442.google.com with SMTP id b17so909954wrq.11
 for <alsa-devel@alsa-project.org>; Thu, 06 Jun 2019 04:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pr9e4dK0lnGJ2yEy2umbpZ8NBL7aMcK376HEwfKTTSg=;
 b=EwkWNm95uFdLdM6RVx3Tj6uT8um7i0aQEk1uRiVUv6JiohjUK7uiq6SBosLxySlReZ
 w4+rqFTLDLLwOXiyiaTuRODHY2MCzFPoj4wGmCszy3QpM4x3VDY0toxgqWrOg5qgDiBy
 Wf0JxWZ0DuyF8axVyO7cJknAe+UoMA5tKaVllx1TOlExCep8ehzJtmLPY3MCL4OHXj0U
 ZpZITzyhYsNsYtt1HZVVGAarS8nclV9zhm43p1sT3GBHR4IL8n0Y9KsOy5SEOZDdIiPD
 uexzGvIpYaO2St7WwsvcujbC56A8JY9lH2lIb0tGY5YqwTBNRRKf9xdwlic898Xi7qqc
 fW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pr9e4dK0lnGJ2yEy2umbpZ8NBL7aMcK376HEwfKTTSg=;
 b=lEHDyQZjdcGUaV+yO5HntTRqZYjelciCjdzM+VuM90lfLqDCq1/gz2AQcSVTqCEzaw
 6xaSNV7msSjPnchdm8HffHUjEKcaDd53DvWwUXV5SMp2LhRoRbHVEU9gbHNtvudt+PuN
 eb1L1+FNiqUPyWOAFJD5uSVqkwNSudmykQVzwz5ILj4ypIaXSpu8NSfIIfOeYYveWg01
 DG/TieIagJ1UHDmQgb7zjK4fQYE4xumOiIMWjlcFVo2udbobe2cVxLzJHWtohgx0RSEh
 jxmRb+28LhBE0Fxi6MMIIYB5dlVbwDiktW/19kx08ClBBK7jaPsR+HBgc7pku5Gi/DbX
 LHPA==
X-Gm-Message-State: APjAAAXSfRzPfbgnvqIBvo3weJEGQosTy1uqVjFPdOmgmKiydUB6obtP
 JibZvGRNsVD3abagh6wGvUDdmw==
X-Google-Smtp-Source: APXvYqwyiior9PPfwKkJcFzeIeybdOuBR2JLMi76La9WAds25CUUSZ1rFmNh/oK2g0Eo/Lfl17HItA==
X-Received: by 2002:a5d:5342:: with SMTP id t2mr12198131wrv.126.1559820187229; 
 Thu, 06 Jun 2019 04:23:07 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id f21sm1558333wmb.2.2019.06.06.04.23.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 04:23:06 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Date: Thu,  6 Jun 2019 12:23:04 +0100
Message-Id: <20190606112304.16560-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] soundwire: intel: set dai min and max channels
	correctly
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

Looks like there is a copy paste error.
This patch fixes it!

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/intel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 92be6ad84e8d..317873bc0555 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -721,8 +721,8 @@ static int intel_create_dai(struct sdw_cdns *cdns,
 				return -ENOMEM;
 			}
 
-			dais[i].playback.channels_min = 1;
-			dais[i].playback.channels_max = max_ch;
+			dais[i].capture.channels_min = 1;
+			dais[i].capture.channels_max = max_ch;
 			dais[i].capture.rates = SNDRV_PCM_RATE_48000;
 			dais[i].capture.formats = SNDRV_PCM_FMTBIT_S16_LE;
 		}
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
