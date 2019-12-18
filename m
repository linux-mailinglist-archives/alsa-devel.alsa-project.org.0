Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7C6124F35
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 18:26:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A4D91672;
	Wed, 18 Dec 2019 18:25:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A4D91672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576689975;
	bh=Tgf/jw8hj8MnGYSNhCIp/HHcoiOhduAdvLE1BhZSqPw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RrgX1rHy9mAiss7d83eij0wTSRWvXHMD2EFteQZsFeuZvyyzCIB2l5dQI75FJ//PH
	 sgTm2WIWECVA4d3IKHpiWbD+HGubqR2hHpW8IXOhU/cX3SYMzSGrSQypN6cxFtea/B
	 DVTziy0csiKP5vtwx8F5ScjKODULMI5P3v5Nj6H8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6FF4F8014C;
	Wed, 18 Dec 2019 18:24:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E7E5F80247; Wed, 18 Dec 2019 18:24:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5A92F80096
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 18:24:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5A92F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="WL6LQvaJ"
Received: by mail-wr1-x443.google.com with SMTP id c14so3161346wrn.7
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 09:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gkeDNQUJ3ikeTDqUkF4Gryc9YGb0Gj5eqNCbDtkdhPw=;
 b=WL6LQvaJ9GGlUjw9H2P/1hGp29WTQgH0SjF3vxM3PXuoSHkCPIJMZ0/moLtc9sKgF+
 JEh6NAbPqIWRs+wngIArKVHOaQSYykBTrlkNfSRW5F8uLnOYl7JY1UB6HVoQXdY3kEMO
 QVPbDjuu41bQvjV9npjWA3XGgU7mNTizqkPWaq8m8TTm8pEn3o7oHmiP/QDEr8b4hWy1
 gB0B7bA0p4nRahqNbn8k7FC58AA9TFFrBbxaBSXJ4WNCY3mEi7BmrGLsi4VkqvTiLIFP
 c/ym3SuKFZDF8BCpRPf5wTGrB/t9RvWsnyq/Mj8chxROlsIi0KDJel1ST8/iTOySbmG6
 A/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gkeDNQUJ3ikeTDqUkF4Gryc9YGb0Gj5eqNCbDtkdhPw=;
 b=Su8h8pTNnz6Kx4chsV3Ex6WLfMxuRZTsXA2sNBloLN/kmJ7fAurB40SWrNfRXQvqSV
 NiF4RxzWLmeX2yr59Qwbsp8Q5jiEzLHdVu8PAKuzKnct6Et64HkIrUj+8VBV++EO8cpE
 vAuqnWeRmmZ9O+nRNucPffBQKoqjZWJGB8quQlvH7+BJWxG80iEzEpfQ3aaSf7Ikz401
 Wtjg4S0Wx0AtGUrAxKnAsigR4PAFKEpmiH/Wa+rChjuvjZKQcCQt/YQ2gqJiRfCX8p/p
 dZD1AIX3qU7HE5arVdl4+9RnvhVAI1Y3/7kNNyqjidCY3/vLgv1A8RlxVjj+1+hDOBBL
 P+Lg==
X-Gm-Message-State: APjAAAUtXjxfgZtXw5wgEEQMzm4EGbAp2c792gYCqZ0LlZMbG/592KA7
 cF1dXROCi9LsOhqn6xin/s8IKg==
X-Google-Smtp-Source: APXvYqwBahCJsSlMYv9H8BS5x9yINh/xRKEr1G8MnVvK/fUdISZ8dpu38/NOPkP1wQV26nQIfcBMEw==
X-Received: by 2002:a5d:4f90:: with SMTP id d16mr3902176wru.395.1576689865056; 
 Wed, 18 Dec 2019 09:24:25 -0800 (PST)
Received: from localhost.localdomain (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id 4sm2883231wmg.22.2019.12.18.09.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 09:24:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Wed, 18 Dec 2019 18:24:16 +0100
Message-Id: <20191218172420.1199117-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 0/4] ASoC: meson: axg-fifo: fix depth handling
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

This patchset improves the handling the depth of the different fifos
found in amlogic audio subsystems derived from the axg family.

Initially, it was reported that, when the period is less than 8kB on sm1
and with TODDR A, several period are coming at once. This is because the
field related to the fifo request threshold changed on the sm1 SoC and
also because TODDR A instance is significantly larger compared to the
other instances.

With this initial issue fixed, I used the opportunity to improve the
driver and properly deal with the different fifo depth found in these
SoCs.

Jerome Brunet (4):
  ASoC: meson: axg-fifo: fix fifo threshold setup
  ASoC: meson: axg-fifo: add fifo depth to the bindings documentation
  ASoC: meson: axg-fifo: improve depth handling
  ASoC: meson: axg-fifo: relax period size constraints

 .../bindings/sound/amlogic,axg-fifo.txt       |  4 ++
 sound/soc/meson/axg-fifo.c                    | 50 ++++++++++++++++---
 sound/soc/meson/axg-fifo.h                    |  9 ++--
 sound/soc/meson/axg-frddr.c                   | 33 ++++++------
 sound/soc/meson/axg-toddr.c                   | 21 ++++----
 5 files changed, 76 insertions(+), 41 deletions(-)

-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
