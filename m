Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5A954DA8E
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 08:27:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E14511AD5;
	Thu, 16 Jun 2022 08:27:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E14511AD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655360872;
	bh=Ko1oBEftpnc9fDvcTL0afVHaYWdNB7qCj0xqCnddT+w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZrhPv0jfB9XE//zhqVCWgQ6WpWH3Lz+9Zmbq583Z+mcXGSa/2Y6lMuDSkMeKe92/1
	 iWUm2GxgvO6LY/jlKseFL7ROt6DBZzjjiBiAu1Yw3fV9ZaJeNYOImznTA+XqjawlQy
	 LYJehbcBwR/Yc7vJbfmsjpndTA5O+AAou6d+YgPk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07BDFF8051F;
	Thu, 16 Jun 2022 08:26:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76767F804D0; Thu, 16 Jun 2022 08:26:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26F53F8012A
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 08:26:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26F53F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="DWwCvKiU"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Urq+w+FN"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 566EE3200A40;
 Thu, 16 Jun 2022 02:26:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 16 Jun 2022 02:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1655360759; x=1655447159; bh=bh
 uLv+Q2nSNM/p4QOnabQDlNKfFDhf2mr0itZ8fuvwo=; b=DWwCvKiU708Va+XgKd
 kuWv1eTwBzzhEfDyRjdQjdiLfMSZFnx0B3ygFTu/F1fg+mWnJ6a7q1qXQnEfQoUE
 ZXHWJbD1f08TPo081pbWRBHpp3vbv2Nn3eS6QCZvQrw3fF9B7X2DAq8HCSQti2Tk
 ibWRzG/r09PeeJhLPkgx63+p4xXaLw/iCmrcFfy5kO9BLHn5CKHoV45Oo4y2Q76L
 KEQKYASpD0OUmBK0YaXF3kxTvbizA8FrtdKrROx6ZMN74cmb4daGw29xvNpj0jHh
 zcJ3Iw3EfWYNxc3or/x/vdQkY5WljvZcYYW/PxhARKjLQA7JZh7DtL+MNS/O7Uma
 DDPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655360759; x=1655447159; bh=bhuLv+Q2nSNM/
 p4QOnabQDlNKfFDhf2mr0itZ8fuvwo=; b=Urq+w+FNFf1g5+WwlBbkpOFt5H4hr
 Ja0Q8zfzpGgCt117vjo1wWPvASYdHs8KBM0xz+ZGg+/F+qXY40NXCxL739jq5+z2
 yEgDv41ZaYnRI6Trrj/O1ROUl9M7rF1TTGA6evJPmjkxv+iRLTpvNRIXKStA8uzX
 nlYt/n7eZS34SSGCSCywwuS7jT7De+ZMtNkJsnqeyJPKPIoQZLJYFlcKUAzZxNs/
 0TuiaQyNfMM1XIXo9kkqNZQwbabxXuWjw5YpiGnGbriecN0NfK88eaROksReogV/
 6BKczhT/RyRadfpwuQ4eVw5c7pBRMvRaKXW02DXAZIggkhns+KykP+ECw==
X-ME-Sender: <xms:98yqYjwMb-C9YX14H997o8IOFEQ60ImGhb01YGEkSu6Av9ZqzwOctQ>
 <xme:98yqYrQ5jOuWcbZsvF517QooaxDnjXyMQjUqMGv_xTwXedSCn4vdSEz99d5hRbisI
 8IO5ogxzU8SiWhluA>
X-ME-Received: <xmr:98yqYtWh3Ie6pOuTtSOVb18vDDCwP17eQzvGzSyuaXgQpBgeIOXbRYPZPzqVWc1Xt8r78VCseQq3XhRosqkMeBmkdRD-vhxj314FQTdhB17PPRUipJshWedd9KaAK8R5z8cctw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvvddguddthecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghm
 uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
 ggtffrrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeeh
 gfdufeeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:98yqYtixlT2LFqmpxTTsKUJ9v2kamxFT2MUEKZqBIvUa2yRTb_gGwQ>
 <xmx:98yqYlCN6DV7OvH2OlUhOycdT0dtvj9ZDGrfBg3Lc_4rrMiAx9gTGw>
 <xmx:98yqYmKnoAm0eVnNZCEOpHeWCJr5uKZfggaAV97rdtP0HwUHZfpmOQ>
 <xmx:98yqYtaSQHzcq7YnwC3IbA3qrnr09L3cF4tpVs46h6dzOydKBafIJQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jun 2022 02:25:59 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/3] ASoC: dt-bindings: sun50i-codec: Add binding for internal
 bias
Date: Thu, 16 Jun 2022 01:25:52 -0500
Message-Id: <20220616062554.57266-2-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616062554.57266-1-samuel@sholland.org>
References: <20220616062554.57266-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 alsa-devel@alsa-project.org, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

From: Arnaud Ferraris <arnaud.ferraris@collabora.com>

In order to properly bias headset microphones, there should be a pull-up
resistor between pins HBIAS and MIC2P. This can be an external resistor,
but the codec also provides an internal 2.2K resistor which is enabled
by a register.

This patch adds a device-tree property to the sun50i-codec-analog driver
to take advantage of this feature.

Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
[Samuel: split binding and implementation patches]
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 .../bindings/sound/allwinner,sun50i-a64-codec-analog.yaml    | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun50i-a64-codec-analog.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun50i-a64-codec-analog.yaml
index 3b764415c9ab..66859eb8f79a 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun50i-a64-codec-analog.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun50i-a64-codec-analog.yaml
@@ -21,6 +21,11 @@ properties:
     description:
       Regulator for the headphone amplifier
 
+  allwinner,internal-bias-resistor:
+    description:
+      Enable the internal 2.2K bias resistor between HBIAS and MICDET pins
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
2.35.1

