Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B56A7F5CF9
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Nov 2023 11:54:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED93CE7A;
	Thu, 23 Nov 2023 11:54:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED93CE7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700736859;
	bh=5K1plBGfiqp6iHe2MX5U7+fgSNWE53bCZzyPjQTtvL8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GVMpsbECEvT2ZAvVMSiDNzpMEbLScLmqD/e+DDNMzTOc/61cSeFSBVEbcAkUWsg4x
	 0DDhFsRnJ+4tCfKduHlsdAqDzcKHQY7cLiNqyCLqHSugxANabzcoFJoF2BqjPR41DV
	 uZwfdZWCXS14PyYP9fW98wlJZbt1w7AQlZNiqHLY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DFBBF8058C; Thu, 23 Nov 2023 11:53:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83B57F8055C;
	Thu, 23 Nov 2023 11:53:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB648F802E8; Thu, 23 Nov 2023 11:53:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30EB7F80093
	for <alsa-devel@alsa-project.org>; Thu, 23 Nov 2023 11:53:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30EB7F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lM7e55PQ
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-548b54ed16eso999993a12.0
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Nov 2023 02:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700736817; x=1701341617;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fXU3VapMuxm+OHdxhm9E3FdyezzmvFUHPr+Qvx5uEeo=;
        b=lM7e55PQOSNZdixl22dFDuu7ouy2i+5JO5VvAAorLTVPXNfRl4omIA3/bMhFxfgWHu
         Ys5jp7fmiIKMhn9GXjQRS48bP5OIYWviPAdmIIwFCPZaFuB0xmHwJG7ggrCM+/Ir7VkA
         LL+LqOqSBjFL3wN70TX9JxrlC+4E5eaQ+BqnX/oVvyC+47faitcseyCZ019+SYAjMauC
         NgAB8bIv3h/QQrDHRYqsM6vuK3bgGc9f4igKoNOOB8d6lZxNPKpT1ygWlA5GV5/nIZck
         +44m8nPX7UghwH6FIAxWQshiBiwoO8nRzPohjixg+jXADNtmMQDI4EXX31TCCPpUta/X
         xVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700736817; x=1701341617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fXU3VapMuxm+OHdxhm9E3FdyezzmvFUHPr+Qvx5uEeo=;
        b=vQVj3kti+j5X01WJq220xIa4AsE8xKIxnhF8wGuJuUU/dGqrT9a4SGzA3OaKNaFHFC
         bFJV0t4tbDre5hyGhpKaRb6UZlRQXaYfKrmCrP5039DifeHDtRA5UKsX6wyotC5YgWWa
         AWDgCwnKsinxHcQtOAAhohg/fwfSM/vNuLPOsYqc8hlL7kx2WbMHj9faNsU56Cgc7sfy
         J3SlM1wyepOC/fC5nXZsF5sEMyvbkgxQWb4VHv9OhnA8Tk/yrlf5w0GoGruPoG9TXgGf
         W9unpNl5nZcL7GLHymYGCzdgL10Uasxeqp7SR0LSwvVzKSmaRh5oQEoTl/orP3Q2FoQB
         jnuQ==
X-Gm-Message-State: AOJu0YzsWBor0EcfUGMPGQ5+++DImDO4vBcNf0LRatlcxtlpPEyBEe1R
	iBoRnIeNdGzAIGeEKe0ysU0iZ3N6uYslOyB4VVc=
X-Google-Smtp-Source: 
 AGHT+IGJB4AU8eFOfo2dYz6wrhqCVEFEhT1IVtkxagyVUOc+WtZFn2exlewHWw/fxkDvma7X5xvmyQ==
X-Received: by 2002:a50:871d:0:b0:543:b9ae:a0d5 with SMTP id
 i29-20020a50871d000000b00543b9aea0d5mr4060236edb.4.1700736816809;
        Thu, 23 Nov 2023 02:53:36 -0800 (PST)
Received: from srini-hackbase.lan ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 f18-20020a05640214d200b005486228190dsm513130edx.42.2023.11.23.02.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 02:53:36 -0800 (PST)
From: srinivas.kandagatla@linaro.org
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.de,
	yung-chuan.liao@linux.intel.com,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	krzysztof.kozlowski@linaro.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] soundwire: qcom: set controller id to hw master id
Date: Thu, 23 Nov 2023 10:53:32 +0000
Message-Id: <20231123105332.102167-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354;
 i=srinivas.kandagatla@linaro.org; h=from:subject;
 bh=ljBkIaNKS9KdRWAJPNWyfkmMFwRfm1vJDp7GGFK8o1k=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBlXy8oclKJu3tGkmYiZnaZIA+W3UyQgpfftPMlP
 bVZZGYkp02JATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZV8vKAAKCRB6of1ZxzRV
 N1wEB/9jIGoxEIeqSJm3JoDJr1R5p6OjuWizPPXlshOzrcaVQStrtBAxIGaAUtyK1KsuXwGvB/u
 XyKG83pSf+tf6A7bpTG9ofIfrvgpv+KBIWFASzpiIp+5prGNH3HnY7hv6vXJ8wlGrgWCMTBy3Wv
 bTdqX6FoM853lIt8N/SLcOJw0abDNujzTCypJK4q8t/CyR//lPcoR3lxIpmRkKeXwo5PnzN8eez
 +UVDbO/4bmTZVOIm8w6QRS3+2FLQJVCyWH5LEQ1hSKYv7MUZQyi19ho1BCctX7VuUKloSJqio+e
 JPXO21e2J/p0rhhDJx3ABqNdj4v/8Y8GZ9r3EyaSnFge/8Fr
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2S22QTRLCCMPXHE6VMNLQM6MKBKFJHL5
X-Message-ID-Hash: 2S22QTRLCCMPXHE6VMNLQM6MKBKFJHL5
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2S22QTRLCCMPXHE6VMNLQM6MKBKFJHL5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Qualcomm Soundwire Controllers IP version after 1.3 have a dedicated
master id register which will provide a unique id value for each
controller instance. Use this value instead of artificially generated
value from idr. Versions 1.3 and below only have one instance of
soundwire controller which does no have this register, so let them use
value from idr.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---

This patch depends on "[RFC PATCH 0/2] soundwire: introduce
controller ID"
https://lore.kernel.org/lkml/4815c8d6-635d-415c-9e02-4e39e92a3d6d@sirena.org.uk/T/
patchset.


 drivers/soundwire/qcom.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 8e027eee8b73..48291fbaf674 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1624,9 +1624,13 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 		}
 	}
 
-	/* FIXME: is there a DT-defined value to use ? */
 	ctrl->bus.controller_id = -1;
 
+	if (ctrl->version > SWRM_VERSION_1_3_0) {
+		ctrl->reg_read(ctrl, SWRM_COMP_MASTER_ID, &val);
+		ctrl->bus.controller_id = val;
+	}
+
 	ret = sdw_bus_master_add(&ctrl->bus, dev, dev->fwnode);
 	if (ret) {
 		dev_err(dev, "Failed to register Soundwire controller (%d)\n",
-- 
2.42.0

