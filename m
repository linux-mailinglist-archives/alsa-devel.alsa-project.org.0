Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F11A5126F72
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 22:12:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F76685D;
	Thu, 19 Dec 2019 22:11:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F76685D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576789926;
	bh=1POjPEtEflTMyjkwffusj3P5dmZtSMh1nqAFHluxFKA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nw2ibtU+DwV4q9ETU+ijlxUeoUolWpQXFEboF544b46hX+SV/HLcM1Xd4mG5JNf3e
	 8Gg76G0VpkoH6f1+t4FnIwbpx7bLebkArte3KZI4+bcLqc8X6kqkubst6aGpEl0Gpw
	 8BQet/HwCCC9zMD7SVGLZFLaRz6o2AW2cwmX6DwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99B10F80253;
	Thu, 19 Dec 2019 22:10:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1708F80253; Thu, 19 Dec 2019 22:10:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from node.akkea.ca (node.akkea.ca [192.155.83.177])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1CA9F80218
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 22:10:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1CA9F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=akkea.ca header.i=@akkea.ca
 header.b="kKyLSAXL"; 
 dkim=pass (1024-bit key) header.d=akkea.ca header.i=@akkea.ca
 header.b="HOlRWkeR"
Received: from localhost (localhost [127.0.0.1])
 by node.akkea.ca (Postfix) with ESMTP id 0CD6D4E2006;
 Thu, 19 Dec 2019 21:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1576789802; bh=l91r0YDEN+oe9jxf3D6wJpDm6U1PN8Ku0lGaSjCm2s8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=kKyLSAXL9WXcCaj7tecU6Rnw6SLgMpLvZWifvwRl8R2TWaqu58nuDuO9MGLWQ8cZu
 ODW1yTOzmP5d/pWekQfNsZP+BQME+4lGv1cqagySyIAI80ECVVLRgWYB+/mhVFvvlh
 udmdQIHVqFHb33ZiEThMpFGc5spfm1uONZihw5pk=
X-Virus-Scanned: Debian amavisd-new at mail.akkea.ca
Received: from node.akkea.ca ([127.0.0.1])
 by localhost (mail.akkea.ca [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lT-jJpG9j64k; Thu, 19 Dec 2019 21:10:01 +0000 (UTC)
Received: from midas.localdomain (S0106788a2041785e.gv.shawcable.net
 [70.66.86.75])
 by node.akkea.ca (Postfix) with ESMTPSA id 906254E200E;
 Thu, 19 Dec 2019 21:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1576789801; bh=l91r0YDEN+oe9jxf3D6wJpDm6U1PN8Ku0lGaSjCm2s8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=HOlRWkeR3xYnbjNyjFf6ded9lgCi9Q7odWr5GnzBHjKMbLan+8opD04SPESwIGp/Y
 DrPAFmpVWhm2uKN6GPJNz5iEk4C3etcSoO1ZCJCjs+Kd1QfPK1K9i8wXCsobrN/ALt
 wGu1n6kPN6pdieQSh5QEGUgPSQnrvDGGCRnA3jeU=
From: "Angus Ainslie (Purism)" <angus@akkea.ca>
To: broonie@kernel.org
Date: Thu, 19 Dec 2019 13:09:44 -0800
Message-Id: <20191219210944.18256-3-angus@akkea.ca>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191219210944.18256-1-angus@akkea.ca>
References: <20191219210944.18256-1-angus@akkea.ca>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, kernel@puri.sm,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] [PATCH v3 2/2] dt-bindings: sound: gtm601: add the
	broadmobi interface
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

The Broadmobi BM818 uses a different sample rate and channels from the
option modem.

Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/sound/gtm601.txt | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/gtm601.txt b/Documentation/devicetree/bindings/sound/gtm601.txt
index 5efc8c068de0..efa32a486c4a 100644
--- a/Documentation/devicetree/bindings/sound/gtm601.txt
+++ b/Documentation/devicetree/bindings/sound/gtm601.txt
@@ -1,10 +1,16 @@
 GTM601 UMTS modem audio interface CODEC
 
-This device has no configuration interface. Sample rate is fixed - 8kHz.
+This device has no configuration interface. The sample rate and channels are
+based on the compatible string
+	"option,gtm601" = 8kHz mono
+	"broadmobi,bm818" = 48KHz stereo
 
 Required properties:
 
-  - compatible : "option,gtm601"
+  - compatible : one of
+	"option,gtm601"
+	"broadmobi,bm818"
+
 
 Example:
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
