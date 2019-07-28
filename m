Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7BA78125
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jul 2019 21:26:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37081184B;
	Sun, 28 Jul 2019 21:25:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37081184B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564341998;
	bh=u/DrY4cjWs4ogDrv+Pcnk+9T4h4J7lpaCBfT8yCgsXE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f8ZehtWhvuNjgfQzogRaEsOGP1uVdDyh88mYfdt/AZgt8sWvpVc3t70S502r4KAdc
	 aX7GTEXvRjd/sFmdYLN+C4ZHRvP4hvtUOaiKTuBt3lrE781s6dDb/hR+pYJ4ypJ8UD
	 w+5UCMtyMzW7BlLkhEwSlvuAv3PG4/rYNrbAobaA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DD6AF804CB;
	Sun, 28 Jul 2019 21:24:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4AE4F804FD; Sun, 28 Jul 2019 21:24:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4DBCF80134
 for <alsa-devel@alsa-project.org>; Sun, 28 Jul 2019 21:24:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4DBCF80134
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 26F60201282;
 Sun, 28 Jul 2019 21:24:46 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 15AE6201275;
 Sun, 28 Jul 2019 21:24:46 +0200 (CEST)
Received: from fsr-ub1864-103.ea.freescale.net
 (fsr-ub1864-103.ea.freescale.net [10.171.82.17])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 5B56E2060A;
 Sun, 28 Jul 2019 21:24:45 +0200 (CEST)
From: Daniel Baluta <daniel.baluta@nxp.com>
To: broonie@kernel.org
Date: Sun, 28 Jul 2019 22:24:22 +0300
Message-Id: <20190728192429.1514-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kernel@pengutronix.de, timur@kernel.org, robh@kernel.org,
 Daniel Baluta <daniel.baluta@nxp.com>, shengjiu.wang@nxp.com, angus@akkea.ca,
 tiwai@suse.com, linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com,
 linux-imx@nxp.com, viorel.suman@nxp.com, festevam@gmail.com,
 mihai.serban@gmail.com, l.stach@pengutronix.de
Subject: [alsa-devel] [PATCH v2 0/7] Add support for new SAI IP version
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

So far SAI IPs integrated with imx6 only supported one data line.
Starting with imx7 and imx8 SAI integration support up to 8 data
lines.

New SAI IP version introduces two new registers (Version and Parmeter
registers) which are placed at the beginning of register address space.
For this reason we need to fix the register's address.

Changes since v1:
	- removed patches from Lucas as they were already accepted
	- addressed comments from Lucas and Nicolin regarding
	device tree property naming
	- removed comment saying that "datalines" must be always
	consecutively enabled (this is not true, checked with IP owner)
	- added new patch to document newly introduced compatbile
	  strings
	- removed patch introducing combined mode as I will still need
	some time to figure out how to properly allow users to set it.

Nicolin,

Unfortunately I couldn't find any clean solution on handling registers
address shifts. As mentioned in patch 5/7 Tx/Rx data registers and
Tx/Rx FIFO registers keep their addresses while others are shifted
by 8 bytes.

Even if I could create two regmaps as suggested I will still need
to update each call of regmap_functions.

Daniel Baluta (7):
  ASoC: fsl_sai: Add registers definition for multiple datalines
  ASoC: fsl_sai: Update Tx/Rx channel enable mask
  ASoC: fsl_sai: Add support to enable multiple data lines
  ASoC: dt-bindings: Document dl-mask property
  ASoC: fsl_sai: Add support for SAI new version
  ASoC: fsl_sai: Add support for imx7ulp/imx8mq
  ASoC: dt-bindings: Introduce compatible strings for 7ULP and 8MQ

 .../devicetree/bindings/sound/fsl-sai.txt     |  10 +-
 sound/soc/fsl/fsl_sai.c                       | 331 ++++++++++++------
 sound/soc/fsl/fsl_sai.h                       |  82 +++--
 3 files changed, 293 insertions(+), 130 deletions(-)

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
