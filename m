Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B98343E32F
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Oct 2021 16:11:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4002016BB;
	Thu, 28 Oct 2021 16:10:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4002016BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635430265;
	bh=0eqcxZircQWR0eDxKLxiauIpZRNpVDa8kjzov4XzOA8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KGr4QFckmzTK7dZRSfo1xRLweyXhyHf/Uny3C2GV28rXrMUKmF0c7QltHVPFYHnFE
	 rVsPoaf38U7nqc6m8Qx1vR9vUawZyB1EspfgqbtdgUGWsUWHKEVN2SwaRJNDLhwpEo
	 ZeyRzn5U8FFsDpo/jSgeFSPEV4UHtDx8aTyWzJQM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2598BF800D1;
	Thu, 28 Oct 2021 16:09:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8CDEF80300; Thu, 28 Oct 2021 16:09:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4522AF8010A
 for <alsa-devel@alsa-project.org>; Thu, 28 Oct 2021 16:09:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4522AF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="HCRdeLx0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19S847jo014865; 
 Thu, 28 Oct 2021 09:09:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=4FX2fuwgRXUP3OXTschhGuPxmM50MdJ1IjGtnvPd+K8=;
 b=HCRdeLx0joiEgWt11vmYKkWrW5jbY/934JKZnnyOUlxRk3M2TO2YhEF+8vp0V4V3n5YB
 zFIt69YTS/iG0Ovcjl9XAuPSXUXJEBTbEkz3zEAiy6eW3qCFyKrHd8LAIim5p1pgrwbh
 vAYqcxiVf8Ia+5l5hDiFhgD69bhqlpFHDoGEybwaqZ5s87eQF1BUd3K5PklxNZtpcsn0
 QVYF1rw8Y4PxFtPIoJo5G6/RGt+RRFDk30ddnxbuFSj48uxRXYjGjd2XYwId0g7Ifq1g
 BRQJSZ1UuAjy/1C/UmcI3g8Z4l0dSeiSjxtaBSnMvdOnEXfxtATfyvxI7mNdpMTHhRbg Mg== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3by8p01bp1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 28 Oct 2021 09:09:09 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Thu, 28 Oct
 2021 15:09:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Thu, 28 Oct 2021 15:09:07 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.32])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2A7A311DC;
 Thu, 28 Oct 2021 14:09:07 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>
Subject: [PATCH 1/3] ASoC: dt-bindings: cs42l42: Correct description of ts-inv
Date: Thu, 28 Oct 2021 15:09:00 +0100
Message-ID: <20211028140902.11786-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211028140902.11786-1-rf@opensource.cirrus.com>
References: <20211028140902.11786-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: NxXuASVleh6ICgOHS2HgSM__x5eyEYpC
X-Proofpoint-ORIG-GUID: NxXuASVleh6ICgOHS2HgSM__x5eyEYpC
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

This swaps the descriptions of the 0 and 1 values to match
what the driver actually does with this property.

The background here is somewhat confusing. The codec has two
invert bits for the tip sense. The DT property should have been
for the TIP_SENSE_INV bit, which is the one that controls the
detect block. Due to some misunderstanding of the hardware the
driver actually implemented setting of the TS_INV bit, which is
only for swapping the sense of the interrupt bits. The description
was taken from the datasheet and refers to TIP_SENSE_INV but
unfortunately TS_INV has a different purpose and the net effect
of changing it is the reverse of what was intended (this is not
clearly described in the datasheet). So the ts-inv settings have
always done the exact opposite of what the description said.

Given the age of the driver, it's too late now to swap the meanings
of the values, so the description is changed to match the behaviour.
They have been annotated with the terminology used in the datasheet
to avoid the confusion of which one corresponds to what the datasheet
calls "inverted tip sense".

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: da16c5579353 ("ASoC: cs42l42: Add devicetree bindings for CS42L42")
---
 Documentation/devicetree/bindings/sound/cs42l42.txt | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/cs42l42.txt b/Documentation/devicetree/bindings/sound/cs42l42.txt
index 5d416fdaf023..3b7705623980 100644
--- a/Documentation/devicetree/bindings/sound/cs42l42.txt
+++ b/Documentation/devicetree/bindings/sound/cs42l42.txt
@@ -19,13 +19,14 @@ Optional properties:
   (See Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
   for further information relating to interrupt properties)
 
-  - cirrus,ts-inv : Boolean property. For jacks that invert the tip sense
-  polarity. Normal jacks will short tip sense pin to HS1 when headphones are
-  plugged in and leave tip sense floating when not plugged in. Inverting jacks
-  short tip sense when unplugged and float when plugged in.
+  - cirrus,ts-inv : Boolean property. Sets the behaviour of the jack plug
+  detect switch.
 
-  0 = (Default) Non-inverted
-  1 = Inverted
+  0 = (Default) Shorted to tip when unplugged, open when plugged.
+      This is "inverted tip sense (ITS)" in the datasheet.
+
+  1 = Open when unplugged, shorted to tip when plugged.
+      This is "normal tip sense (TS)" in the datasheet.
 
   - cirrus,ts-dbnc-rise : Debounce the rising edge of TIP_SENSE_PLUG. With no
   debounce, the tip sense pin might be noisy on a plug event.
-- 
2.11.0

