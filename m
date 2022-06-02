Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B2853C8D9
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 12:38:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 356731845;
	Fri,  3 Jun 2022 12:37:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 356731845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654252726;
	bh=94AZfQNzohTSikU20D9y+1gErKKAeCfmcpY9ea6/fGk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oBJ3ncT41mgp3VGyWo6t5D4oa0qO1L8CVQhVLJHGTe6fCf6VvRJKOHlsBaHSJPZsZ
	 TGHlVpzKToff6ik06PnLbbWnwND7rHms/Zg2wTJiw5KJ7lbtiJZ6bz+zQ2Qi3HrxNi
	 1cAqUYbKO9QD16ZnwtTVoBzVYihCKYSauvzKw8Q0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71912F80124;
	Fri,  3 Jun 2022 12:37:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B3C1F80149; Thu,  2 Jun 2022 18:45:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.shift-gmbh.com (mail.shift-gmbh.com [85.10.195.145])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36881F80149
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 18:45:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36881F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=shiftphones.com header.i=@shiftphones.com
 header.b="SPkvOhTj"
From: Alexander Martinz <amartinz@shiftphones.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shiftphones.com;
 s=2018; t=1654188336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=imGM7saNPOQ6vbKogvcqXOICfijWBW6J11L5perWAFg=;
 b=SPkvOhTj83B6oiJW3ZAr24eQ87yTw5YKMp8thSdc+8WpuYXGlWvxUk4x3VYgij5bb4pOhs
 dQbS4mOPX1RWY/Pu1wgAh41UG3hwC2EZcw7HcMoEg1c33blT+f7q5V4f9tTARR3kOdlYZP
 CaQTjPSJF7G4uIaPouDVMMwa6fYRIa1l9h+NRSaZF55+ua8vne/ugrWaUnXXmUk09tKKKm
 dnW8FXetCsw1XtkBuauUiw366+SuKbEOwAmKxtDq9Lostm16iyTS7ZfyVurzQf4wiS30LI
 ftKT364RV/wmI64x5etHJMHvwIOyC0MmW06r1LmlAzXMSc6SM1CKtYNnKPxrAg==
To: ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 2/2] ASoC: dt-bindings: nxp,tfa989x: Add tfa9890 support
Date: Thu,  2 Jun 2022 18:45:04 +0200
Message-Id: <20220602164504.261361-2-amartinz@shiftphones.com>
In-Reply-To: <20220602164504.261361-1-amartinz@shiftphones.com>
References: <20220602164504.261361-1-amartinz@shiftphones.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=amartinz@shiftphones.com
 smtp.mailfrom=amartinz@shiftphones.com
X-Mailman-Approved-At: Fri, 03 Jun 2022 12:37:02 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Stephan Gerhold <stephan@gerhold.net>, Dylan Van Assche <me@dylanvanassche.be>,
 Alexander Martinz <amartinz@shiftphones.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Caleb Connolly <caleb@connolly.tech>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org
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

Document TFA9890 binding for tfa989x.

Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
---
 Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml b/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
index b9b1dba40856..7f2e68ff6d34 100644
--- a/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
+++ b/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
@@ -15,6 +15,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - nxp,tfa9890
       - nxp,tfa9895
       - nxp,tfa9897
 
-- 
2.36.1

