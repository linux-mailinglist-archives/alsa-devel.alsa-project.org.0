Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 343DD424BD9
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 04:42:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C42541612;
	Thu,  7 Oct 2021 04:41:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C42541612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633574559;
	bh=WnOj3nDnOlWbXBemhgNWFlSBmGzYfqHP/xoy1vfWwBs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rnqZ62xvoWM4EkFdhqSyhcSJ1dosOKYDYbV+mRN0mr2/iyx/RyGxY5I1mJVISzimP
	 sRSJHQqrZNwu20J7mDGh12DvMBG6sEt1zq51CzaX99Z8WbgiDef2BUq9g3AglG/FSK
	 gkEAlCcR02xNIwaABjdv5RPyvV4JFb/mbW/4GQ00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 132CCF804CF;
	Thu,  7 Oct 2021 04:41:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9D7AF804BD; Thu,  7 Oct 2021 04:41:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dnyon.com (unknown [IPv6:2001:ba0:1800:12f::1])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5097AF80259
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 04:41:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5097AF80259
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dnyon.com header.i=@dnyon.com
 header.b="eM3BbXs0"
Received: from dnyon.com (55.red-81-39-194.dynamicip.rima-tde.net
 [81.39.194.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dnyon.com (Postfix) with ESMTPSA id 9ABF03FD73;
 Thu,  7 Oct 2021 02:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dnyon.com; s=mail;
 t=1633574467; bh=WnOj3nDnOlWbXBemhgNWFlSBmGzYfqHP/xoy1vfWwBs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eM3BbXs0iVWapdWcoLfVGu3NOEAmh08RxiUFLfXi85PhgfMonfw1Xr2PF+OemI/Vj
 YSyrvS/lQGfNIkd2k9YvBSAi/0VvQs2e7aBMhSQYTPFrS+qtQ0a4XFDOTinc9pfuxp
 Xku5bft6xbavjlcJUefxqHeyKB31t2aMRdljtshwcepULprw9SAfPqRbmA3r9OQSLi
 2QOitprEyTezEwrKu9iqHbMUZ7OxGU3Inq9zM+9CKMabJjzjQUAk0clTAv2qYfUoI+
 kcYNdh+TplYNWnibSydFKO1ikJKX7jJclxahGz5jbv8SDMHwLsiu+1K19OqdEDKCIG
 jouS3qTqLOwGg==
From: Alejandro Tafalla <atafalla@dnyon.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 ~postmarketos/upstreaming@lists.sr.ht, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] dt-bindings: sound: max98927: Add reset-gpios optional
 property
Date: Thu,  7 Oct 2021 04:38:58 +0200
Message-Id: <5004d52da527bf1dd9e5b17e20b2ce50a0b57b5a.1633572679.git.atafalla@dnyon.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1633572679.git.atafalla@dnyon.com>
References: <cover.1633572679.git.atafalla@dnyon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Alejandro Tafalla <atafalla@dnyon.com>
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

Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
---
 Documentation/devicetree/bindings/sound/max9892x.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/max9892x.txt b/Documentation/devicetree/bindings/sound/max9892x.txt
index f6171591ddc6..98cb9ba5b328 100644
--- a/Documentation/devicetree/bindings/sound/max9892x.txt
+++ b/Documentation/devicetree/bindings/sound/max9892x.txt
@@ -30,6 +30,9 @@ Required properties:
 
   - reg : the I2C address of the device for I2C
 
+Optional properties:
+  - reset-gpios : GPIO to reset the device
+
 Example:
 
 codec: max98927@3a {
-- 
2.33.0

