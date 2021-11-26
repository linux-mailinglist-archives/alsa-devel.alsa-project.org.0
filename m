Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C30B045F1BC
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 17:21:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15CD21940;
	Fri, 26 Nov 2021 17:21:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15CD21940
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637943716;
	bh=LzzPOO+RM6FEOiFNwxVrD5niwYNDvz2u+GaEY3CfkBM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kvmSG5jL1FQ2wlFeFnnuTlB3pfGzAQPq4jQW8Ee/1QyjdmKpvHrysFC/KUuZth96R
	 5jzZOGJLT2Wyd+SpeRpIQf0l/B+VZtk7FWfuIRHqQzl5wYRSQR9+z7x4QJMfbrmzWD
	 iGQ3tlz3fIMI7yh2y/16op+HheOuVhJBgjNjQDdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20B72F804FD;
	Fri, 26 Nov 2021 17:19:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F677F804CF; Fri, 26 Nov 2021 17:19:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EA91F80212
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 17:19:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EA91F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kHcqo3Hd"
Received: by mail-lf1-x129.google.com with SMTP id k37so25544372lfv.3
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 08:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jZtmNInV251GqgFq3K9ZRWdCyBV26EPK8i39JKkeuGY=;
 b=kHcqo3Hdoj+Nqd8Ud4iK9R/J/uH0C/whKTjYqjDf/tc4gbFtOi20b+X0fwScJI3XgE
 w1uJD3Kn/ZPx+GJe5Ni17mAKfxobdslbSTtHt9ZgYI7mD54nlnN3Xn5N+OUh5jS86tqH
 1R29ze3ftawnZjR8t+tOedRBH7Bgl4wPJiRGm1oiD0WronEIfoQAoQDfPmZ5oHkhjxTJ
 BM1grZQI4H8T34r+xH4xnqdbWnR099DKjL3t/aqmVQsRFZUBTcRk7nnb1dIOjN05Eqcz
 kFQmwBFUjNiHiZkWrHOc6vH2BJTE8t+Lw8shx9I+HJWQloEOtGR+Xt3SvRqzQmbJt0G/
 z45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jZtmNInV251GqgFq3K9ZRWdCyBV26EPK8i39JKkeuGY=;
 b=0JsYe/I8ap1+v4HXSQrOfLNI9BQmEIEz7i1Qm0nPIoMj1/Gw8uqp0jLJv/8n7ZlYzp
 RmxWDIFEf41e56dHh78xpFh2W9gTumnys8R8i2DhMl84I9I9YAD9IzDr7wgh/G8BbYZ/
 yPX83J06S/DrajxEglDODH8qJCdESuTKpeJ5SOODEHjBbPoHUAEf9F8Q3V8Yo5zWH27g
 yO9H9KtPgxMnAf99eAJmPLup/3Lp4Em60wpc/6Jctp7i19FMH5detJD2V1cjEr0kSlrL
 5AaMpDSzrCawnUAWmybqV0LrybUqYjivhQ326Wl3DBj7bIRfJQoyeAfAQ2lXB1Hag1Ac
 a8Aw==
X-Gm-Message-State: AOAM531AaNvWWMheMFJC+LAvB4nndcTosRd1XswfqfqyIvKM+NPW86QI
 XMWAIjgUnZiLEk45R9V5llU=
X-Google-Smtp-Source: ABdhPJyu83chU0nnqPvnIxvSELamyDC2FkUBRpE0GuXjevFykLKZzCD2MrUwMLgf0AfqXE32YyaF5A==
X-Received: by 2002:a05:6512:2212:: with SMTP id
 h18mr32046721lfu.55.1637943582592; 
 Fri, 26 Nov 2021 08:19:42 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:42 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 04/20] dt-bindings: host1x: Document optional HDMI
 sound-dai-cells
Date: Fri, 26 Nov 2021 19:17:51 +0300
Message-Id: <20211126161807.15776-5-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
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

Document new optional sound-dai-cells property of HDMI node. This node will
be used as endpoint of HDMI sound DAI graph.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index e61999ce54e9..27b746f28f31 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -297,6 +297,7 @@ of the following host1x client modules:
   - nvidia,edid: supplies a binary EDID blob
   - nvidia,panel: phandle of a display panel
   - operating-points-v2: See ../bindings/opp/opp.txt for details.
+  - #sound-dai-cells: Should be 0.
 
 - tvo: TV encoder output
 
-- 
2.33.1

