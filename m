Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B333F740EC3
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 12:28:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35A0C1E0;
	Wed, 28 Jun 2023 12:27:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35A0C1E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687948129;
	bh=JtIT4Hqt+djRcdfadtXsU/Ytcg1mA3IL9et/U7dIvg0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LVKytAYtVOchnDxFSVKcXOVhWy220vdGNz8xD4l9ZmEOB9h07QUDqFZaXoEJMAQfR
	 cy7uUk7VPShAZizCzdbNI56XreVhgMTovVhoOgzdCf2IWA69kxLtMD0F6PxjwoExQr
	 cvX39I0GB8OGSBrPXZnGiDqfHqvCjdx/eyloeEOE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 420C6F80580; Wed, 28 Jun 2023 12:26:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D90F3F8057F;
	Wed, 28 Jun 2023 12:26:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27B9EF8027B; Wed, 28 Jun 2023 12:26:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D569F80246
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 12:26:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D569F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Y6Q+PawF
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-313f18f5295so3615634f8f.3
        for <alsa-devel@alsa-project.org>;
 Wed, 28 Jun 2023 03:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687948000; x=1690540000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srR4qXI4SOaRzuTnNjTHD1luV6fZZPzoY3QYdalo8qI=;
        b=Y6Q+PawFy+kJaRdCZCPHXwMw9ZqLRbomAw6YgjOi9KVEfS/4P/HbDrP9ZhJRU6ywOe
         iPv0i8olWL0oVFvuiIRH981wrhd+0pzPMqEy0D0ZgBge/cjyeDZ73H6a0WW82n704GUS
         4Y+Wk0SCIcMFW7ghIYsQg9J15d+lSu6A4sqaWr3IocqBnd+WBewi6ZB7hEw7JCckIql5
         FB4i5VDkAG78WKb1JBJChHG/5jncfE8sX84cDYXoNG4syCvR7JTv6mmK4Japm2OWV8Qy
         wiiX9wGTj6mkM9Z74fzUTnghT2FI9trCV2M1LmWw3YvtarKYty56k+D3F+H0+NoLgpO5
         yY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687948000; x=1690540000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=srR4qXI4SOaRzuTnNjTHD1luV6fZZPzoY3QYdalo8qI=;
        b=c7FJvHWmVK02CtC1q56pxnG3g6tnXb+0sNJ4AfokFFXOzp2qNzgfPoTkYbtciZ9KAB
         iWOLY8ii10HWU8r0QZ1tafhrIZsFXlFCIL2N0bl8raivOJ42vyx5dRnKe2+pSmdMrcS1
         BriFYOZdiNgDWUuXm89swKzbTabUXl3OSxqPZGAURfd1328FT+iWEkfOauSa+Hl52TVo
         m59RDxuh7HLjB2WxTvsc/YmReL099i8aIyZukVYrRHy/oqHtrRmoLRmIJw7Ecre9C43Q
         HxqdY3sBu+KDR6L887jCcJgHNjSIbMYhcnv/HPpRnBxrJBJMt72Nuu/7LY44FwCOKYXI
         lE1w==
X-Gm-Message-State: AC+VfDzgxoA7iKqnQMMQoILxxYBYiPCP1h/GT2Eqd1XOzKxc7iWw4hxh
	fAw8upm1YPgDI6uaEB1iOtLlrQ==
X-Google-Smtp-Source: 
 ACHHUZ5S4H9zXhddpOXM9tKWiI2dGOx62qaeBcYbU97WH85fLsREvkzVPMEm3gY/9OG0jwyaeyA//w==
X-Received: by 2002:a5d:5307:0:b0:313:f60d:4958 with SMTP id
 e7-20020a5d5307000000b00313f60d4958mr5463674wrv.53.1687948000700;
        Wed, 28 Jun 2023 03:26:40 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 a10-20020a5d53ca000000b003140555c0ddsm2467780wrw.56.2023.06.28.03.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 03:26:40 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: krzysztof.kozlowski+dt@linaro.org,
	andersson@kernel.org,
	broonie@kernel.org
Cc: robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	johan+linaro@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 3/3] arm64: dts: qcom: sc8280xp-x13s: Add audio topology
 firmware path
Date: Wed, 28 Jun 2023 11:26:21 +0100
Message-Id: <20230628102621.15016-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230628102621.15016-1-srinivas.kandagatla@linaro.org>
References: <20230628102621.15016-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IPBDGP22NNMVWELZ2E25FAIFYSRUDT6R
X-Message-ID-Hash: IPBDGP22NNMVWELZ2E25FAIFYSRUDT6R
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IPBDGP22NNMVWELZ2E25FAIFYSRUDT6R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add audio topology firmware name and path in dt so that we can
specify full path for it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 7cc3028440b6..0160b8e7d64f 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -924,6 +924,11 @@
 	};
 };
 
+
+&q6apm {
+	firmware-name = "qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin";
+};
+
 &qup0 {
 	status = "okay";
 };
-- 
2.21.0

