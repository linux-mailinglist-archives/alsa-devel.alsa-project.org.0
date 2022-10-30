Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F00612BE6
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Oct 2022 18:27:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63E0D1631;
	Sun, 30 Oct 2022 18:27:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63E0D1631
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667150870;
	bh=Ol3U4+L6I2LaLz41RRaq7KhYVao1tWyqzaMi6x/0eu4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FJjJxHyJ2oUQdkMhAUtygqk3pT/m6AdPODCYkAE1MVasA4InzWxXAQJXWN2gkHFl0
	 Uf5ajnnB+Y+3k9ZNL/wWPncJjSf6qN632/AFmNH6VKTbzrTQxpZwTl5Pepr7Z23j86
	 NqrZO5UEgTvKMknA3yyXPU8iBjFq5uEjnprF8j5M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28885F80553;
	Sun, 30 Oct 2022 18:26:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B5CCF80552; Sun, 30 Oct 2022 18:26:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDB1FF80551
 for <alsa-devel@alsa-project.org>; Sun, 30 Oct 2022 18:26:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDB1FF80551
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=compal-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20210112.gappssmtp.com
 header.b="kI23bVMa"
Received: by mail-pj1-x102d.google.com with SMTP id
 d59-20020a17090a6f4100b00213202d77e1so14038923pjk.2
 for <alsa-devel@alsa-project.org>; Sun, 30 Oct 2022 10:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V80UGbFaefodELDsnmOH1hIVX1sH5nHYnUjMRM/2dyE=;
 b=kI23bVMawUnZtojoj3JoYjTDdj1zCB29PnaZvUCvkDgWTFM0e/8pS8IQ7gf5LOUtAR
 Kz/4KtGCybjZqoi5H47WeXDYuuSoALQvrZSy8vXJDW7zaCtAoV2Il7X9pDLvrEwEmAom
 NYEXK7xOJSpiaE7IWbVgljDRknEejMatudlRlfo6E2ElpqIhIecpDd3+CACp54gc8S22
 Dsa3AeZVTvKqAXAD5Rq+nIK/0Yr9lh0UfzT1anQv1v8I38voK7KO+tC8lChtPsRmu+GV
 r/evczQqJVEVs/yk0olvUpxv0gNAX5oaKUz0+rvImnDTAkefCdqGs8qbWhK04fS4KF6o
 2ISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V80UGbFaefodELDsnmOH1hIVX1sH5nHYnUjMRM/2dyE=;
 b=ZjLzyWZ4KlL9GgX2T/KEkl4aVPxhvcAmdVFI4WCYSCT4HJOUR+vLJbf333Mh19a1EB
 jCLb9PI3Ld2ZqahPswKZTN1NidHMMhTm04hyMdVopAR13+1VQrf6dSE7lqyutbFrHw2e
 pQ658XG5d9ZUSs63Kza1YQ3+h5y0MsnDvnfUMSyYjbDcqQjIuapfyBjzg1ccfSYBWl+b
 S42x7clwY24phC0FHBrU53lA6+jxCHSeOjp/sJLmkza7nh8k7Tw3ILw3+AV9l5ookhj1
 1BcdaSI1n9vARH8xZF3IHEq9Il9he14rOqXOgFhuH1n4e1H9WnLCWlb/ZTbvPI64nzrr
 faCw==
X-Gm-Message-State: ACrzQf2q3ul/FFVlfcuFudbRcEV2drU7Dd00wmcZljHrdEolANPcVjlt
 FO4lt+k0Hc1SGf2m9mwWVaHznA==
X-Google-Smtp-Source: AMsMyM5mLUixD4AFeMv/fO9d/F4MvRCyMhpZRQgxNtDO833SzZnEAml0bZqv/D126e+xIFxmrHAMkQ==
X-Received: by 2002:a17:903:4d4:b0:17f:7ecc:88e3 with SMTP id
 jm20-20020a17090304d400b0017f7ecc88e3mr9668808plb.169.1667150785495; 
 Sun, 30 Oct 2022 10:26:25 -0700 (PDT)
Received: from localhost.localdomain (118-167-185-125.dynamic-ip.hinet.net.
 [118.167.185.125]) by smtp.gmail.com with ESMTPSA id
 q14-20020a170902a3ce00b00186c6d2e7e3sm2933881plb.26.2022.10.30.10.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 10:26:25 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] ASoC: mediatek: dt-bindings: modify machine bindings
 for two MICs case
Date: Mon, 31 Oct 2022 01:26:08 +0800
Message-Id: <20221030172609.1635096-2-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221030172609.1635096-1-ajye_huang@compal.corp-partner.google.com>
References: <20221030172609.1635096-1-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 "chunxu . li" <chunxu.li@mediatek.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Mark Brown <broonie@kernel.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

Add a property "dmic-gpios" for switching between two MICs.

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Change-Id: I5b59ac23e761fdc078a2227da14fe170c8df6388
---
 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml         | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
index 4fc5b045d3cf..8c24cd1f1906 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
@@ -21,6 +21,13 @@ properties:
     $ref: "/schemas/types.yaml#/definitions/phandle"
     description: The phandle of MT8186 ASoC platform.
 
+  dmic-gpios:
+    maxItems: 1
+    description:
+      dmic-gpios optional prop for switching between two DMICs.
+      Ex, the GPIO can control a MUX HW component to select
+      dmic clk and data form a Front or Rear dmic.
+
   headset-codec:
     type: object
     additionalProperties: false
@@ -68,9 +75,13 @@ examples:
         compatible = "mediatek,mt8186-mt6366-rt1019-rt5682s-sound";
         mediatek,platform = <&afe>;
         pinctrl-names = "aud_clk_mosi_off",
-                        "aud_clk_mosi_on";
+                        "aud_clk_mosi_on",
+                        "aud_gpio_dmic_sec";
         pinctrl-0 = <&aud_clk_mosi_off>;
         pinctrl-1 = <&aud_clk_mosi_on>;
+        pinctrl-2 = <&aud_gpio_dmic_sec>;
+
+        dmic-gpios = <&pio 23 0>;
 
         headset-codec {
             sound-dai = <&rt5682s>;
-- 
2.25.1

