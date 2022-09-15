Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 977785B99D8
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 13:41:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B70F193A;
	Thu, 15 Sep 2022 13:40:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B70F193A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663242098;
	bh=EXZv6nkDmXjp3XEiWR2kXqiuF46HjW/uBSh8YMHfDMU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kAKtFkNRsjndiolLrygSMe3XhN2+EJrbkowFPyGtKtTWmAg9d/Ef8xTf9iuutAs7n
	 3i8KW4FouwhRJAWQ7yZPDXNez5SU3ht974Pmk5IS8vHdu2Zdj43Zh2tIEmw9STjyFE
	 WG3+ypNqYLPJZ6zbI3NGflHdgDX92LmGdKs8h6R0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1343EF80482;
	Thu, 15 Sep 2022 13:40:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73A14F800B5; Thu, 15 Sep 2022 13:40:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8A37F800FE
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 13:39:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8A37F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="DYgOQmg7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1663242001;
 x=1694778001;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DYJJ4qQiFhJJxICE6A+XbC2JNWpWJvGPHCHazCi+ciA=;
 b=DYgOQmg7Clozgp4qOUWM79Yd5IpW0v4Qsp6Gd1vyFwBJ2rYRnBkvnyyE
 n4Z0cVHTGVex5iCeknUJagzxzq443aHLOTDUSU3X1Vb7/naadt2MHKhvC
 9crSsgfejAlaFmZAM8MISOnHfJNQEy9wimKKYs0Vt1qH38sNQNqYV18R/
 WUOX2ml6VBgpQarzQl5trS08J5rh2DL7q7u9j+OcROAFU8LgNLPgYDybV
 XbZe7U5uW9sqJ0nM3N/2JRSxGMf/zA+6XLx1x8KiX/au1B3rcEAPVrfGL
 TH/Au7LwmJJNDiETA7jaqUZQ8VdsDBhGaXvZJLKKhX85ILp3bnQdmJ1XO Q==;
From: Astrid Rost <astrid.rost@axis.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Dylan Reid
 <dgreid@chromium.org>
Subject: [PATCH v2 0/3] ASoC: ts3a227e control debounce times
Date: Thu, 15 Sep 2022 13:39:52 +0200
Message-ID: <20220915113955.22521-1-astrid.rost@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: Astrid Rost <astridr@axis.com>, kernel@axis.c,
 Astrid Rost <astrid.rost@axis.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

From: Astrid Rost <astridr@axis.com>

PATCH 1 - convert ts3a227e bindings to yaml.
PATCH 2 - add ts3a227e bindings to support debounce times.
PATCH 3 - add ts3a227e driver to support debounce times.

v1 -> v2
- Converted the devicetree-bindings to YAML.
- The debounce-times are in ms. The closed match is used, if the
given times do not match the register values.

Signed-off-by: Astrid Rost <astrid.rost@axis.com>.


Astrid Rost (3):
  dt-bindings: sound: ts3a227e: convert to yaml
  dt-bindings: sound: ts3a227e: add control of debounce times
  ASoC: ts3a227e: add parameters to control debounce times

 .../devicetree/bindings/sound/ts3a227e.txt    | 30 ------
 .../devicetree/bindings/sound/ts3a227e.yaml   | 98 +++++++++++++++++++
 sound/soc/codecs/ts3a227e.c                   | 58 +++++++++--
 3 files changed, 150 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/ts3a227e.txt
 create mode 100644 Documentation/devicetree/bindings/sound/ts3a227e.yaml

-- 
2.20.1

