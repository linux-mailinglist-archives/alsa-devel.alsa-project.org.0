Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E64BF60CC3A
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 14:44:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B883531A;
	Tue, 25 Oct 2022 14:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B883531A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666701848;
	bh=wPZY9l0+jlBdtipx3EDsjoTgmvDjjxj9XrB+JG4g/rs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JBZmYInhouOA9jSU+kmWzzLswe81zl4NutFSe8T3oPfUVhzDZAk/GOWXCT9JdgR/l
	 nTck9fMG6aGFZa/oTlg2WzarEpMxtCXX9wC7sgUtcjAl48uZktmuGU4BQCx2zEWNPq
	 xIjp4ANRw+W+oqfHAq359Aeka1y5TixsP9M4Uryw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 275C8F8056F;
	Tue, 25 Oct 2022 14:42:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A89CDF80559; Tue, 25 Oct 2022 14:42:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB1F9F80559
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 14:42:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB1F9F80559
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="p7sLxOhF"
Received: by mail-wr1-x42d.google.com with SMTP id l14so13382737wrw.2
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 05:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Ic2JEDn8iIKh6kokfWzyIvyt1AwKkoMppVSCI5C57s=;
 b=p7sLxOhF7+RJa8UpoEmVVGga9/XxYJpHt9VYi4nB27HDInsNdVKl7A7Y7xodOhf69i
 cH4p45wrXBpH/+j58uHRVEPx6mxh/2gQckDVhrgiGCsUh2ynjtz/IBUS9xWyK2fYpC97
 ds2Ro5NO2Ho8uNlbpqNj6GO2mpGF4KKPfRwhoSf+FnqBq9kw4hpbqz5kplGxdOap8pvc
 nkTIEyN5cbLojENWjdgwwecAr4ejh7T8CkVx6Cc6JRqgtS7O5SoOxMymWmJexfOrWeoK
 Zm82tzz/g9IR2WW1Wkt62/F8UDLk7lV/5fp9xSUxnVSXRy6hoTpp6OcmSUn8vhSmBfHS
 3CSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Ic2JEDn8iIKh6kokfWzyIvyt1AwKkoMppVSCI5C57s=;
 b=5/759/gNNEK3TDguW2+tVLGEar40U5HG3iWsMM+4Gw8RZVtWUvFw6y+l4lc4nvhfz/
 5F51H1DZgh25+JmGs3qxnoW0XM6WIzwJNMSbSjxAwcwtwTnEbErPqvIPFzY/sM50YDoa
 vtOMfUXbBb2JxAf2szh0moA036ZvnbqOnhC4aYZSPTSqTZRSp2RZOE+JFgnkMsSb8HXn
 E601FcOIC/JwROme1MMxEdnciRke0bOyZ/A+5g5WM95D+Yx4fMaSM19py0Mp+izrVjOi
 zws5Xw6wDuiikejI3fbOUloztLGnxt8w7Iu9nUo688B70/KiOtuAq8flDUviz2VKr5gJ
 DUBg==
X-Gm-Message-State: ACrzQf37sAXNaPH87BH6OW9DdbsQDJG0eBINAtUnV+nGZ5Fdn/giYQZA
 3jgZh/OILJHj7t7gq4LSsYk=
X-Google-Smtp-Source: AMsMyM4PfHc5iZZPnvgw3lB96B0iv3Tf8sL+cm4ldHaMrUPmjOZBcBtMm3ogjXQBRx7LsZBd9zG5SA==
X-Received: by 2002:a05:600c:1c1e:b0:3c6:fa3c:32a9 with SMTP id
 j30-20020a05600c1c1e00b003c6fa3c32a9mr15113010wms.203.1666701720859; 
 Tue, 25 Oct 2022 05:42:00 -0700 (PDT)
Received: from localhost.localdomain (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84]) by smtp.gmail.com with ESMTPSA id
 ay19-20020a05600c1e1300b003a1980d55c4sm11250664wmb.47.2022.10.25.05.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 05:42:00 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 3/4] ASoC: dt-bindings: rockchip: i2s-tdm: Add RK3588
 compatible
Date: Tue, 25 Oct 2022 14:41:31 +0200
Message-Id: <20221025124132.399729-4-frattaroli.nicolas@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221025124132.399729-1-frattaroli.nicolas@gmail.com>
References: <20221025124132.399729-1-frattaroli.nicolas@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
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

This adds the compatible string for the RK3588 SoC.

Signed-off-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
---
 Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
index 8646cdc692d7..0503f4f3fb1a 100644
--- a/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
@@ -21,6 +21,7 @@ properties:
       - rockchip,rk1808-i2s-tdm
       - rockchip,rk3308-i2s-tdm
       - rockchip,rk3568-i2s-tdm
+      - rockchip,rk3588-i2s-tdm
       - rockchip,rv1126-i2s-tdm
 
   reg:
-- 
2.38.1

