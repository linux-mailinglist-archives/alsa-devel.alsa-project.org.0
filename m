Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 301F0394406
	for <lists+alsa-devel@lfdr.de>; Fri, 28 May 2021 16:17:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1F9416DC;
	Fri, 28 May 2021 16:16:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1F9416DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622211462;
	bh=xiYAYJ4ReoERjHj/7lnXJ2gG8qm27EGp9h0Zicsjm2A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gEi7RXjEqpqA8DTpDCRGxSTT29dbo1++TLDOrEfL2ybzlREGRhNOco0dzHBOIULmX
	 /KUSpwNxE65jGlsJ021S66K2Rgvh9SlT9lYOQSju2k4gWFrfSKBajU2rltSAQthfCQ
	 tx4z8bJdR3cFidFeaN1VnibTuu3IrwjVnJUmCmTQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8803F804CC;
	Fri, 28 May 2021 16:14:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46F43F8026F; Fri, 28 May 2021 12:51:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40CE0F80264
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 12:51:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40CE0F80264
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mailoo.org header.i=@mailoo.org
 header.b="PxlCSR5w"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
 t=1622199078; bh=xiYAYJ4ReoERjHj/7lnXJ2gG8qm27EGp9h0Zicsjm2A=;
 h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 b=PxlCSR5w+TtcWNQHVtNEN71h0mP8zqj3o/bahrQk9tNcUrkjvVKOvUPT2RWtrqbpG
 NM4LtC/9dDoWqWaaYOd+eOCgzAL7Eoe8eBZN7fIO1BvBcB4vik48jKIJwhJX9WKDzR
 bT3X4eLMuBe9fSq+C4TxGo8EcRZuI5c2FdD/dU5w=
Received: by 192.168.90.15 [192.168.90.15] with ESMTP
 via proxy.mailoo.org [213.182.55.207]
 Fri, 28 May 2021 12:51:18 +0200 (CEST)
X-EA-Auth: SD0V86Q8ap8CtVY4uhieJZ54T3WTDESiy4Rm1MXlEiRfL4uMado0R8JV+UTvoTYVF21OAyIoqgWrrDhofMvhjYe2atea8x1ShV+x+68wU5E=
From: Vincent Knecht <vincent.knecht@mailoo.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 1/4] ASoC: dt-bindings: nxp,tfa989x: Add tfa9897 support
Date: Fri, 28 May 2021 12:50:58 +0200
Message-Id: <20210528105101.508254-1-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 28 May 2021 16:14:26 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Stephan Gerhold <stephan@gerhold.net>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Vincent Knecht <vincent.knecht@mailoo.org>
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

Document TFA9897 bindings.

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml b/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
index 45db5776550c..46ddc1f3fc0c 100644
--- a/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
+++ b/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
       - nxp,tfa9895
+      - nxp,tfa9897
 
   reg:
     maxItems: 1
-- 
2.31.1



