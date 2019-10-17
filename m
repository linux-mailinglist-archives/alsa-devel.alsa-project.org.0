Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECBDDAF25
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 16:06:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08319167D;
	Thu, 17 Oct 2019 16:05:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08319167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571321202;
	bh=VFloyy2cBHbUQsvklV6Tubs1rzKfhk/+vp0vrzWf6Po=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YbC7akWZbfmmCfdugQkLrSkM1SGGo9ejQGyfBTr/8AEd8Kn8/ejTIysw2Ifm4tSeJ
	 njw76dtHiJokhfg2E/ZJHAeV2L9ir18hQdNHPTkuEHN5341EmX1an7chxMQOlgFsrT
	 7jmSYprMK5wAHRk9i/GRs5vyOrt0Y1B1ICp9nzLw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD42EF80674;
	Thu, 17 Oct 2019 16:01:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F6F2F80642; Thu, 17 Oct 2019 16:01:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 699DBF80637
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 16:01:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 699DBF80637
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="co8u00mk"
Received: by mail-vk1-xa4a.google.com with SMTP id a7so974893vkg.2
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 07:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=NOI1mPAa3UePrvEcyGGunRNPwSdTxXGP0axdxShAK4g=;
 b=co8u00mkNN4YqCXon4IqCiiYFPoEvBQ3dyNyGtx43GJvnTt1HTGWkdHp1AF7H295In
 ojScYXCnfdl607cZ3fMAhlTwq9G3/97EJ9XXNiHyAutDJhDBMDrM+xskz9VT0RDwOCNr
 HAmnARLBIZ4jRg1otlN3dmLatXmqQ6tOj2qFPQOQ8bsqhSjPmnlSKxO4mA761Trr9/sz
 9l6r0JOVhV+08enzyZA1gc3p4FcZwkvrgMTY8vZ6nnJbM/8AkVD3dQQDwBH7rj2uWYbm
 rIg9rxmMeBYoEkccod418osq33OnrabkZ50XW4b8ylTN+RZUN7FqwaFQaw1ssV3sblNE
 Rfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=NOI1mPAa3UePrvEcyGGunRNPwSdTxXGP0axdxShAK4g=;
 b=A5Po+sHArNm3uEfD85+/4pBHIHGeqIBGchMB6NYnkOs2GfURPNswM6isabFAgGhXcR
 PWLNqr65MLT0frAjQlsaeBswd1BDNIvFmlzNs4ycUt/+TrIQUrhfA9+RvfeX2YfrShJ0
 Um1oMdzhhB0i4VvEPgoH2Ll/lifbmo2b5CQVaQrH4Yolg1jTs0F0go2WmcQRq8VZokVz
 yKNwedFEUu5jUDSPZWYjtOH8lKVAwQ0voPfYNo9x4Lf9yv8CnSAuvuuabx64O1mcxYO0
 y2OIqrHMnLR8Wrl1iriRdI+chO/U1eZQ7qizvW+9oXon2RkJKfaJLDd2gqfQFbho7Kgo
 Qf3g==
X-Gm-Message-State: APjAAAWY40mOciqAjsRPoEJccIGKE4a8ZJ2E1GWtt8NykHPosQx+Fhof
 AO+SxMK3s33S4v55E5qfteicFGnkjrI/
X-Google-Smtp-Source: APXvYqxgcLB2fmxnEjzm9XFMmssqasHVsiK0nsCfeENxnDCDnfxF/CHrxmAxhwYjplMkMFfm0mGjb2gr9zfO
X-Received: by 2002:a1f:5ed4:: with SMTP id s203mr1996971vkb.61.1571320863872; 
 Thu, 17 Oct 2019 07:01:03 -0700 (PDT)
Date: Thu, 17 Oct 2019 22:00:11 +0800
In-Reply-To: <20191017213539.00-tzungbi@google.com>
Message-Id: <20191017213539.06.I0df85fe54162426e31f60a589d9b461c65df2faa@changeid>
Mime-Version: 1.0
References: <20191017213539.00-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.700.g56cf767bdb-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, Benson Leung <bleung@chromium.org>,
 tzungbi@google.com, robh+dt@kernel.org, enric.balletbo@collabora.com,
 bleung@google.com, dgreid@google.com, Rob Herring <robh@kernel.org>
Subject: [alsa-devel] [PATCH v4 06/10] ASoC: dt-bindings: cros_ec_codec: add
	SHM bindings
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

- Add "reg" for binding to shared memory exposed by EC.
- Add "memory-region" for binding to memory region shared by AP.

Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../bindings/sound/google,cros-ec-codec.txt   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
index 0ce9fafc78e2..8ca52dcc5572 100644
--- a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
+++ b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
@@ -10,8 +10,26 @@ Required properties:
 - compatible: Must contain "google,cros-ec-codec"
 - #sound-dai-cells: Should be 1. The cell specifies number of DAIs.
 
+Optional properties:
+- reg: Pysical base address and length of shared memory region from EC.
+       It contains 3 unsigned 32-bit integer.  The first 2 integers
+       combine to become an unsigned 64-bit physical address.  The last
+       one integer is length of the shared memory.
+- memory-region: Shared memory region to EC.  A "shared-dma-pool".  See
+                 ../reserved-memory/reserved-memory.txt for details.
+
 Example:
 
+{
+	...
+
+	reserved_mem: reserved_mem {
+		compatible = "shared-dma-pool";
+		reg = <0 0x52800000 0 0x100000>;
+		no-map;
+	};
+}
+
 cros-ec@0 {
 	compatible = "google,cros-ec-spi";
 
@@ -20,5 +38,7 @@ cros-ec@0 {
 	cros_ec_codec: ec-codec {
 		compatible = "google,cros-ec-codec";
 		#sound-dai-cells = <1>;
+		reg = <0x0 0x10500000 0x80000>;
+		memory-region = <&reserved_mem>;
 	};
 };
-- 
2.23.0.700.g56cf767bdb-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
