Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 703A25E7F24
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 17:58:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00FDC1E9;
	Fri, 23 Sep 2022 17:58:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00FDC1E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663948735;
	bh=Y/9GpdglSciFv5lO8I8anvVgjOIIcqQkf3S26XMLo7M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XQg0L44VJyISNLrPIpCCGHsyBuPiPMCqiNGXHRa9Vgq44fG7uU9QqGSdOhVz3nFvO
	 vCBITIcK9GtkuOMKUOIWOd5hpvp4m6XsiMJS0ONpHmb5H9ROxAq63wJEwHsfXBaeYz
	 F1XPhqWMQK6+RC4d+snD+n/SobO6ExP5hRTjcMPU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D9CDF804D1;
	Fri, 23 Sep 2022 17:57:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E04F4F804D1; Fri, 23 Sep 2022 17:57:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87E49F801EC
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 17:57:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87E49F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="MKPUXAAv"
Received: by mail-lf1-x133.google.com with SMTP id j16so1005613lfg.1
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 08:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=hOgaSJV/qvshW50YoXul8vltWjgqBUI4d7EfeiEA4BM=;
 b=MKPUXAAvaHSrIM4Us8EwlpoRHPY3EvytcNQ8V3FJPDu62QIfKK6mI4892tWNP6yehZ
 erE4WyAyNalnxfDd0xlZnH3CMUresc4WdqtqUf9OTfZP+N68rTDd6KH4jCfX/YOvGtTJ
 nOreixgDnKWdczMNGBvh89puBhDNp6OubPGDI9I7PlcdEjvXcrC801omCmI7XnzwmZYy
 ll3q3W3p8htZqu9vWdSfGGHl2uHMBjU44UdMnMmWNLIZlCHzZqJtMxTigiymKohb03/t
 ykKlSKpek5vY+sibK/yXD1+exLoXM2nKkv4Gpv9UI8wtAjPoK5coIKiyCYSpfRcVhrFq
 1+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=hOgaSJV/qvshW50YoXul8vltWjgqBUI4d7EfeiEA4BM=;
 b=W00s8T5B722KLK6+qQsgBQd1AlobysAjneSC5SuCSUYAwAAtS15Q1NNIgzoM3s2hWK
 wHK9aUT7D20S+ShZFXaOtdcc0RZj8dMIP3BYd7DCmYJ8rBozorWRYAiZAof4YJdxpiTx
 NYPgFU0T+wMINZePTsenX3QPZMLQ1cuJaY3xzprsIxORgVu0DdnobqS1C6NQSiED8D18
 /itd44tNDRZsW//W3GeXVk8xYgPzoDvEDDUNQ8Rw6HqEuTVAR3ptCPOx0NHWZ7AjMubb
 firS2eTigPKJaSW4rb063N+XzieKAGsFvE77wqLmwwhZyhSnvldZPQX2j+dQmjSlcEZW
 w9Lw==
X-Gm-Message-State: ACrzQf3E3X63KZkEdjoqdhAG1rJduU2Qt/sWBI5KaD3oxjdGSjEhcJa5
 8YmxwZT1peTHxoaZF3B3lBDz5w==
X-Google-Smtp-Source: AMsMyM6a0qhq/H+1+xSmcaZG6QjlDYqHTpFfeGibPe6fhDBAO3rpFsP92G7Vzpexp0uDV9zvPHflWw==
X-Received: by 2002:a05:6512:3f90:b0:48a:826d:f727 with SMTP id
 x16-20020a0565123f9000b0048a826df727mr3317397lfa.281.1663948667475; 
 Fri, 23 Sep 2022 08:57:47 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 be17-20020a056512251100b0049a4862966fsm1502286lfb.146.2022.09.23.08.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 08:57:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] slimbus: stream: add checks for invalid unprepare/disable
 usage
Date: Fri, 23 Sep 2022 17:57:36 +0200
Message-Id: <20220923155740.422411-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

slim_disable_stream() and slim_stream_unprepare() are exported, so add
sanity checks preventing unmatched/invalid calls.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/slimbus/stream.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
index 75f87b3d8b95..7bb073ca6006 100644
--- a/drivers/slimbus/stream.c
+++ b/drivers/slimbus/stream.c
@@ -407,6 +407,9 @@ int slim_stream_disable(struct slim_stream_runtime *stream)
 	struct slim_controller *ctrl = stream->dev->ctrl;
 	int ret, i;
 
+	if (!stream->ports || !stream->num_ports)
+		return -EINVAL;
+
 	if (ctrl->disable_stream)
 		ctrl->disable_stream(stream);
 
@@ -438,6 +441,9 @@ int slim_stream_unprepare(struct slim_stream_runtime *stream)
 {
 	int i;
 
+	if (!stream->ports || !stream->num_ports)
+		return -EINVAL;
+
 	for (i = 0; i < stream->num_ports; i++)
 		slim_disconnect_port(stream, &stream->ports[i]);
 
-- 
2.34.1

