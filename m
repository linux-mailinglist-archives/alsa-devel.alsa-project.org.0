Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2332078C6
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 18:16:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FE90187D;
	Wed, 24 Jun 2020 18:15:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FE90187D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593015363;
	bh=67EeWk1kzvyPqaG1ulIjrKHm9bNV9VBtKcXZnk5qHZw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=D09VUD7dY7Km4vJaHzlo6DoEhg2X7F++5R3d2sYvjid+5YL+O2/2eQKDk3Wal9Mye
	 S/kk0r7rLgzyFy0jUMRhkjRL/MMCb61ujE2g2hhUFPf4NwyY4w6RHudVTj9wREh5z3
	 vsZeocq6WaY821NBjwo3Wtg5oKxctbOl19NZN578=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB3BCF8012F;
	Wed, 24 Jun 2020 18:15:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DF62F801DB; Wed, 24 Jun 2020 18:15:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D66AF800B2
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 18:15:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D66AF800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="O9+Xgjp1"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05OGF1cl038472;
 Wed, 24 Jun 2020 11:15:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1593015301;
 bh=PERrQrRfdmam6H0p9AISJ5uvgazKR0B7qBwzzHc92JA=;
 h=From:To:CC:Subject:Date;
 b=O9+Xgjp1yiFV1ez/tC5FJaYDrH7dzhajKNpZbiK31kD8bvPAqFwo3n721Ww7l2lhT
 3onjWEhL7U2JN3QYoO27m/SaNPniSKNqaGJwqH0OqpXi979pGI3r8pL1VTRCQYzKLN
 p0NBdi0LROr/Bi3KAxnUkJGY0XdK+1zP3/aSPyIo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05OGF120079293;
 Wed, 24 Jun 2020 11:15:01 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 24
 Jun 2020 11:15:00 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 24 Jun 2020 11:15:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05OGF0de112577;
 Wed, 24 Jun 2020 11:15:00 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v5 0/7] TAS2562 issue fixes and slot programming 
Date: Wed, 24 Jun 2020 11:14:52 -0500
Message-ID: <20200624161459.19248-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: robh@kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>, devicetree@vger.kernel.org
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

Hello

This series fixes issues tih the shut-down gpio device tree allocation and a
code format issue found.

While working on a project slot programming for the tx and rx paths needed to be
enabled.  In addition the vsense slot programming needed to be configurable and
not directly a simpler adder to the isense slot.

Finally the yaml conversion patch was moved to be the last patch in the series
so that the fixes can be applied and the yaml can be reviewed appropriately
and does not hold up the rest of the fixes.

Dan


Dan Murphy (7):
  dt-bindings: tas2562: Fix shut-down gpio property
  ASoC: tas2562: Update shutdown GPIO property
  ASoC: tas2562: Fix format issue for extra space before a comma
  ASoC: tas2562: Add rx and tx slot programming
  dt-bindings: tas2562: Add voltage sense slot property
  ASoC: tas2562: Add voltage sense slot configuration
  dt-bindings: tas2562: Convert the tas2562 binding to yaml

 .../devicetree/bindings/sound/tas2562.txt     |   34 -
 .../devicetree/bindings/sound/tas2562.yaml    |   77 +
 arch/arm/boot/compressed/fdt.h                |   66 +
 arch/arm/boot/compressed/libfdt.h             | 2072 +++++++++++++++++
 arch/arm/boot/compressed/libfdt_internal.h    |  173 ++
 sound/soc/codecs/tas2562.c                    |   88 +-
 sound/soc/codecs/tas2562.h                    |    4 +
 7 files changed, 2462 insertions(+), 52 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/tas2562.txt
 create mode 100644 Documentation/devicetree/bindings/sound/tas2562.yaml
 create mode 100644 arch/arm/boot/compressed/fdt.h
 create mode 100644 arch/arm/boot/compressed/libfdt.h
 create mode 100644 arch/arm/boot/compressed/libfdt_internal.h

-- 
2.26.2

