Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 784F04C72ED
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 18:29:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5B7B185D;
	Mon, 28 Feb 2022 18:29:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5B7B185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646069392;
	bh=JknZHNEd0AcZMapR9SfLgmdDXoqZeOhbJMwek+l+M6g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XXaTiag4otgHOb64pXBJJKS+2w1rv6NacUpq/Aa5uJ8fl0r64LRzXCQOG6DkuRyNN
	 +FL1n5oAu3Rxp6z9bvnG7qUznGF3L5OEa0Osp/Q1/7kgiT2CHOUTJ18isDxtyHmWE5
	 2v89ri/ea9ljkdOYh9wgu46RDd+EtWTNrUndCJdU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8433F8025C;
	Mon, 28 Feb 2022 18:28:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7A86F80507; Mon, 28 Feb 2022 18:28:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F211F80125
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 18:28:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F211F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="NWo0/pFm"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21SFwZIi005113;
 Mon, 28 Feb 2022 11:28:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=hJyMgu10+wDVVVmx3Uz2z1AZCqWoyXyWQeA8jODxgcU=;
 b=NWo0/pFmdBE5l35It4SLiVOMW9FocenTW9+5OPtfww8JmLcwKzYOcBAn/3/McZMoam3b
 gZ3ErTzwRqClezgiRYhZsmcxRZenjBClcpnu7ZEyEumMGnbcrnbP3q/q1/h7CUuW321N
 9cmIxGkJizYUliXOI8rVHJIm5HTL7S8KwnGljUGsd4tSrWUkYofKPFQikGFod6mdpLeO
 Xt4Nfxx/l7vXkogCGkbdwdnVFEjz44E7fiqN9pBbsrT6zOPE2nfuXS+af5+RWPti8m61
 5xaM3ehjXN59dq7ERyRF+m6Esanmb2bl1NirhCOXq2eOJ5LmPeFihZFD3tqHSxca0yIk GQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3efjg5thq9-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 28 Feb 2022 11:28:00 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 28 Feb
 2022 17:27:58 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Mon, 28 Feb 2022 17:27:58 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.213])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D0E3B11D1;
 Mon, 28 Feb 2022 17:27:57 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH V3 1/2] ASoC: dt-bindings: audio-graph-port: Add
 dai-tdm-slot-width-map
Date: Mon, 28 Feb 2022 17:27:53 +0000
Message-ID: <20220228172754.453783-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220228172754.453783-1-rf@opensource.cirrus.com>
References: <20220228172754.453783-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: gjOhI31-cuws5YeiF9dweQtsVHZUV4Wf
X-Proofpoint-ORIG-GUID: gjOhI31-cuws5YeiF9dweQtsVHZUV4Wf
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

Some audio hardware cannot support a fixed slot width for all sample
widths, or a slot width equal to the sample width for all sample widths.
This is usually due either to limitations of the audio serial port or
system clocking restrictions.

This property allows setting a mapping of sample widths and the
corresponding tdm slot widths. The slot count is also provided for
each slot width - although this would almost always be the same for
all slot widths this allows for possibly adding extra padding slots
to maintain a fixed bitclock frequency.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 .../bindings/sound/audio-graph-port.yaml      | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 476dcb49ece6..5c368674d11a 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -71,4 +71,24 @@ patternProperties:
         description: CPU to Codec rate channels.
         $ref: /schemas/types.yaml#/definitions/uint32
 
+      dai-tdm-slot-width-map:
+        description: Mapping of sample widths to slot widths. For hardware
+          that cannot support a fixed slot width or a slot width always
+          equal to sample width. A matrix of one or more 3-tuples.
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        items:
+          items:
+            -
+              description: Sample width in bits
+              minimum: 8
+              maximum: 64
+            -
+              description: Slot width in bits
+              minimum: 8
+              maximum: 256
+            -
+              description: Slot count
+              minimum: 1
+              maximum: 64
+
 additionalProperties: true
-- 
2.30.2

