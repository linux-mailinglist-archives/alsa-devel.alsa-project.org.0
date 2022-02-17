Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2224BA1E3
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Feb 2022 14:50:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF6F91ACE;
	Thu, 17 Feb 2022 14:49:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF6F91ACE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645105800;
	bh=3/ZtY9vZpPq0kfIn2aZotpgx6r0R6suIH/KKSGTmJbo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k5ioxBgreYcxxNu/jw9xOg0ieemoYxzvZBDXHGVKZL++VB+lsDZxRSn4XvMF/IJZM
	 l1rLoWO/v8ju1clpnOqq6OaQ54dPiXJCua3YNKHmKIFXZxhzBpGLs3ES/GzGtQYcvW
	 mjTkJ2HPRJduqFRVl65rOjDhBfNLl/BzpJ33Miws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A21AF80246;
	Thu, 17 Feb 2022 14:48:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3071BF804D6; Thu, 17 Feb 2022 14:48:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C222EF80249
 for <alsa-devel@alsa-project.org>; Thu, 17 Feb 2022 14:48:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C222EF80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="EcFTIw9B"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21HCNFGP030051;
 Thu, 17 Feb 2022 07:48:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Uh8AyLBAG4qIzsXNtiDc4oAV8d43DRpyK27/SmkxrXI=;
 b=EcFTIw9BAVTqvy5P0dYcjGfJL9+KBIJlDEEG+Mtx1E92zvu4qwJ8zuRFpOHbQYLdsArL
 EvKXbpwAX0y25v8L4rlXPijAuesjXbOaBbtrwaVuBfo8jovMpIz2WIHdY3Ibvx1MgIVt
 sNbq0+UMDZHy0ySjrrz3u6QgAfZKgWgfERkRQRSe2+FrJsCsSpsZE4jzPibbWsI2kufm
 FIwLnRPIgn1CKPJQ2GZ1BDg1QpfevVNGkNp7su8x84tjXbDhTsg8e7X0AX68Lv8wx/k8
 4SLq1uy7OLGanGamhu77KVq+CHvuH7gJR/k8mpmmdMjfktYsrlrOVYxBE/3VM+HJ/HUn xQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3e8nyda81w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 17 Feb 2022 07:48:41 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 17 Feb
 2022 13:48:39 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 17 Feb 2022 13:48:39 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.199])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 115BA11DC;
 Thu, 17 Feb 2022 13:48:39 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH V2 1/2] ASoC: dt-bindings: audio-graph-port: Add
 dai-tdm-slot-width-map
Date: Thu, 17 Feb 2022 13:48:34 +0000
Message-ID: <20220217134835.282389-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220217134835.282389-1-rf@opensource.cirrus.com>
References: <20220217134835.282389-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Ho48_Ro26eK_WO_Der2J9WeeRmnOXvAS
X-Proofpoint-ORIG-GUID: Ho48_Ro26eK_WO_Der2J9WeeRmnOXvAS
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
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

Some audio hardware cannot support a fixed slot width or a slot width
equal to the sample width in all cases. This is usually due either to
limitations of the audio serial port or system clocking restrictions.

This property allows setting a mapping of sample widths and the
corresponding tdm slot widths.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 .../devicetree/bindings/sound/audio-graph-port.yaml        | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 476dcb49ece6..420adad49382 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -71,4 +71,11 @@ patternProperties:
         description: CPU to Codec rate channels.
         $ref: /schemas/types.yaml#/definitions/uint32
 
+      dai-tdm-slot-width-map:
+        description: Mapping of sample widths to slot widths. For hardware that
+          cannot support a fixed slot width or a slot width equal to sample
+          width. An array containing one or more pairs of values. Each pair
+          of values is a sample_width and the corresponding slot_width.
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+
 additionalProperties: true
-- 
2.30.2

