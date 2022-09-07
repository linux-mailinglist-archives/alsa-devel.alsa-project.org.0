Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2CD5B16BD
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 10:19:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52D6816BC;
	Thu,  8 Sep 2022 10:19:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52D6816BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662625197;
	bh=jo3wHA8Ehuzo8XzoHFIfvfcftMQwO0XB/5AWBv76Nes=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vKkh6MmFWuojWgK0vMrBv6twtzQ3j8invZqtxxTYg0waZVjiZwLzuvFuvaSb7O37N
	 4gkphJ8pfL4sw/0nzlKwLsxacyxO02dgWbiioMDTKjEBG4J+oDSJPDTcXRGzyJkEBl
	 CYhTgM4czQILwNNY8dEGDB6cSGY4imBmtHb7xOc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6780FF803DC;
	Thu,  8 Sep 2022 10:18:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 181AFF8028D; Wed,  7 Sep 2022 15:58:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2069F8023B
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 15:58:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2069F8023B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="TTelaBDO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1662559113;
 x=1694095113;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p4pwoRqjcrypDWv1qomhRQL50yJNPV0RDYOaGGrbH/M=;
 b=TTelaBDOJ1kRMsy+lTHE2ZudSZw4hrJR0AVy+RszmRhQ2jhtxxCdWJbj
 3o823Eyu38XUlPQ92R75DPlFbRUW8CKsqbO1wppWT7iquH/ksY9o73K3f
 oiQtBKcbOOYEAY4orlH8EtIR+wSlccjRge0tpnA56MyL5lDNSxZov6T/3
 QxnzkxkYsbuDRypojPW1g3FINRrKWaRXNgLcfNLCb33A5ckX0eZkbEcyF
 /6NchAT1wKnU+nNbvrbfdNASJFkPFCOoMwSSepcd/PH1x2yVcjgTAGhCi
 9Gg2lD7Z6o60I6xb8y/P0BbjSEHRREBxa+cjcpMFa9b0YO6aBuk9ehVnk g==;
From: Astrid Rost <astrid.rost@axis.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH] dt-bindings: sound: ts3a227e: add control of debounce times
Date: Wed, 7 Sep 2022 15:58:27 +0200
Message-ID: <20220907135827.16209-1-astrid.rost@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Thu, 08 Sep 2022 10:18:26 +0200
Cc: devicetree@vger.kernel.org,
 alsa-devel-mejlinglistan <alsa-devel@alsa-project.org>, kernel@axis.com,
 Astrid Rost <astrid.rost@axis.com>, linux-kernel@vger.kernel.org
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

Add devicetree parameters to control the insertion, release and press
debounce times.

Signed-off-by: Astrid Rost <astrid.rost@axis.com>
---
 Documentation/devicetree/bindings/sound/ts3a227e.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/ts3a227e.txt b/Documentation/devicetree/bindings/sound/ts3a227e.txt
index 21ab45bc7e8f..a4aa4154c54c 100644
--- a/Documentation/devicetree/bindings/sound/ts3a227e.txt
+++ b/Documentation/devicetree/bindings/sound/ts3a227e.txt
@@ -17,6 +17,15 @@ Optional properies:
       Select 0/1/2/3/4/5/6/7 to specify MICBIAS voltage
       2.1V/2.2V/2.3V/2.4V/2.5V/2.6V/2.7V/2.8V
       Default value is "1" (2.2V).
+ - ti,debounce-release: key release debounce (datasheet section 9.6.7).
+      Select 0/1 to specify the release debounce time 0ms/20ms
+      Default value is "1" (20 ms).
+ - ti,debounce-press: key press debounce (datasheet section 9.6.7).
+      Select 0/1/2/3 to specify the press debounce time 2ms/40ms/80ms/120ms
+      Default value is "2" (80 ms).
+ - ti,debounce-insertion: headset insertion debounce (datasheet section 9.6.5).
+      Select 0/1/2/3/4/5/6/7 to specify the insertion debounce time 2ms/30ms/60ms/90ms/120ms/150ms/1s/2s
+      Default value is "3" (90 ms).
 
 Examples:
 
-- 
2.20.1

