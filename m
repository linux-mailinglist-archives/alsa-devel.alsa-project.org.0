Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5414387BB
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Oct 2021 11:01:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F8651675;
	Sun, 24 Oct 2021 11:00:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F8651675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635066069;
	bh=edaOULKcIPSqN06uR8YMKZSATK8xiZRc12utDsr7zZg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WPEVPBdYB3LSWivPp4H2a16VmUEFNyi5K0m2yxFE1WQlT/nN9cryi9cVYq7WRVny8
	 U9/niG5ViHkPoo3ij05vHMLQ6+/ievauDQkJyHuHDNnF0y55nK+0tuPYCu709/nZYn
	 /FiBCdXjx0bqSmGcpUQsTBKogSsYyxNAHO5dvX0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E45EF804C2;
	Sun, 24 Oct 2021 10:59:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18F52F80086; Sun, 24 Oct 2021 10:59:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from msg-4.mailo.com (ip-15.mailobj.net [213.182.54.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4907AF80086
 for <alsa-devel@alsa-project.org>; Sun, 24 Oct 2021 10:59:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4907AF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mailoo.org header.i=@mailoo.org
 header.b="fdc6mPrk"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
 t=1635065952; bh=edaOULKcIPSqN06uR8YMKZSATK8xiZRc12utDsr7zZg=;
 h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding;
 b=fdc6mPrk8KUwC7r4mIi12cO7J64tpZSYCnHn6Regq2NhsHyinEZZogAJXcu51kvUw
 QbC/lTNEOAdPFzOiGvow6spTltonXdEepoyFawFV49V7AZiXTTZjJmvqMfKshA1j8u
 UTUjDQ92mxAEFRsAVZ/k9xTLIVVqD94s3Lc/dDkQ=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
 via proxy.mailoo.org [213.182.55.207]
 Sun, 24 Oct 2021 10:59:11 +0200 (CEST)
X-EA-Auth: 3r99JCI1a8z8dSvQ8+piqA3S/XcW8wmuinX4GEnRGm09T5i26nBrdfB/q31gd8dASxgOja3G3ARQaeOvtGDcvxrrSW68lLOtOPy4JSsaK1Q=
From: Vincent Knecht <vincent.knecht@mailoo.org>
To: stephan@gerhold.net, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v1 3/4] ASoC: dt-bindings: nxp,
 tfa989x: Add rcv-gpios property for tfa9897
Date: Sun, 24 Oct 2021 10:58:39 +0200
Message-Id: <20211024085840.1536438-4-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211024085840.1536438-1-vincent.knecht@mailoo.org>
References: <20211024085840.1536438-1-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Vincent Knecht <vincent.knecht@mailoo.org>, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
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

Add optional rcv-gpios property specific to tfa9897 receiver mode.

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 .../devicetree/bindings/sound/nxp,tfa989x.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml b/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
index 7667471be1e4..a9e15baedafd 100644
--- a/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
+++ b/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
@@ -12,6 +12,16 @@ maintainers:
 allOf:
   - $ref: name-prefix.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nxp,tfa9897
+    then:
+      properties:
+        rcv-gpios:
+          description: optional GPIO to be asserted when receiver mode is enabled.
+
 properties:
   compatible:
     enum:
-- 
2.31.1



