Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5475BCA78
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 13:14:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39F57161E;
	Mon, 19 Sep 2022 13:13:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39F57161E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663586049;
	bh=5WwrEg9RPcd0x61ppYtYhhK5TbQk5GSPxFcuuR6aktc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DcYxh/AR2j+KZ+GE2ULAIMSrGyD4jITgomGAOpHeYAUtS5jwUfSs4JvFXZY+bPBfc
	 HMiJmzRRWxb2uvD2Ss583f6a7RCaEF7YB/nEJuBH3eXS8iykJ8G4Fm1q/CPPRWiKVU
	 nq9sEQb0OTXCuTn1apAEUDVD3w/P5ssMt+c+kEaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73E9AF804AE;
	Mon, 19 Sep 2022 13:13:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DA1AF804AE; Mon, 19 Sep 2022 13:13:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22F34F800C9
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 13:13:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22F34F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="DesRJont"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1663585984;
 x=1695121984;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UmCsk+shjy5qu5dw1fM/f6/rDCelAQiyZQXXy+VkQbs=;
 b=DesRJont64po/n1Q6mZ2ml/NOIdq/Nfq+ovg8vV3TMec8fdTyhwXvVee
 HRXEvhUQEiIksgRkEKhUhd6PZUEVirL28srfFVr4SA4LvJdACXUFkGDRJ
 fWIPUCF5gaTfSdnb4Wa1nXP15cnln2YXUcjZ2lj7xElBsy7QIQ1c3h9do
 +G2LBbNkB1L8Y/U3MmCtyg7yteVFUSpCLcUwFsty5n8GOYAzHzB1WRwAP
 s3kgUqQaOMhen3A28dfeFBI07Tz/gBO3dBLYd3eXq+LXPhoRpki+H5086
 Md9Zd79+gDqSf3ZapEYgXlNpn4TbejBR0h3Fm4awGKJ3IdEXDe2SAB3jw w==;
From: Astrid Rost <astrid.rost@axis.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 0/3] ASoC: ts3a227e control debounce times
Date: Mon, 19 Sep 2022 13:12:55 +0200
Message-ID: <20220919111258.3774-1-astrid.rost@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, Astrid Rost <astrid.rost@axis.com>,
 kernel@axis.com, linux-kernel@vger.kernel.org, Astrid Rost <astridr@axis.com>
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

v2 -> v3
 Changes in the yaml file:
 - Renamed ts3a227e.yaml  to ti,ts3a227e.yaml.
 - Changed "ti,micbias" default value to the reset register value.
 - Skipped some obvious descriptions.
 - Removed unused include.
 - Node name is "audio-controller".
 - Removed register value from the description.

Signed-off-by: Astrid Rost <astrid.rost@axis.com>


Astrid Rost (3):
  dt-bindings: sound: ti,ts3a227e: convert to yaml
  dt-bindings: sound: ti,s3a227e: add control of debounce
  ASoC: ts3a227e: add parameters to control debounce times

 .../bindings/sound/ti,ts3a227e.yaml           | 94 +++++++++++++++++++
 .../devicetree/bindings/sound/ts3a227e.txt    | 30 ------
 sound/soc/codecs/ts3a227e.c                   | 58 ++++++++++--
 3 files changed, 146 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/ts3a227e.txt

-- 
2.20.1

