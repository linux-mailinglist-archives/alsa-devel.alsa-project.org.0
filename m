Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 352314C72A2
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 18:27:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 097CB184E;
	Mon, 28 Feb 2022 18:26:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 097CB184E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646069248;
	bh=zqfA3X7xSf8BybwYdCBjLw+1iJx28rIQY29OyTt3+zg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eGva8/gn03CTwQvJTcEdlkB/D9yckbEEPUNa6dbXOFxJi0jGyxeQlv/18PWg5qYlp
	 bIP8Rw+XwmmHP2wgtYd/w5fhCsb7xHcQIUwsApCTDsns3lzXqiM7yrkoZ/wMVC+Ir6
	 3P4kjLX7DOioioEk+M/Zu9eKecumDz16RXzbV08U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BABBDF80511;
	Mon, 28 Feb 2022 18:25:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E1E7F80511; Mon, 28 Feb 2022 18:25:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32DF8F80125
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 18:25:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32DF8F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Qu+fHpeN"
Received: by mail-wr1-x42b.google.com with SMTP id d17so16556010wrc.9
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 09:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yvzT6l9BiPYrs+bU9uwRIaPTuYIMWgEcekkBhq5JP8k=;
 b=Qu+fHpeNMxJy5zLFRoLMWxsXMgLo58Ef/jRu8wDZj82XLJiM5F8bGB70Ez/AbNijLn
 k8VWr+amgFMAV24Z496cMyDdFkWFokZqlhGFOGMlTHbrOvY2tX/4LGR82401KK5HJC35
 sZDJaVZ7ryPDWCpw5iXYyua+gcILPDxQuR9FyHt5yGL4jWP06JQhGZzAO30RyZhn5f9N
 OjljJk+Ae8/wE2AOt6MrWLx61HSqO136jp7aywDWQofEjdyI1p0zHgX0F7HUghHcoXRi
 pNlzJjEGpNWTups9edT9aCoJC3CNpAYb/mjb3vwPiedTRdeRY68/5bdZXyXfSpUu13yc
 QfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yvzT6l9BiPYrs+bU9uwRIaPTuYIMWgEcekkBhq5JP8k=;
 b=pzzqo4/iVvDecDtrYlq7GFwsIxCLQVpDEg8qAq6KPFE8h90NEyGkV03ByI1E4xoh1u
 nrP+7MwgbgzN827AhZCgFQ3unD8ItIupiigsBr+2dtap+lmd3dX4hxLackiIECFNlD6u
 NQpmvFubPQpsKRLYMZu5goqMltK3jYf150OwMm6SMAhjxVVRaWvkspo4932zTLFFVi2N
 4eyRDHcKXB8UKHDNCneW3HiFqusjDdKWSnE3XdihLRY75qJjNzX//cpn0RiYBOFGtXV1
 Kbc/Fmi/wV/2SXOBtbo5u4S8aDrJSJVCJ1sX4nkpVcU7EQBXoPKc2dyXEPh7/hJnEbeA
 qCPA==
X-Gm-Message-State: AOAM532ZmtNVL+GtqN8BYvv4Npaf4nPcIEpp8rAV/0prq02l+hM9Pe7V
 XdZyu6yM26rXd9UfHVYUJD8H0g==
X-Google-Smtp-Source: ABdhPJxLGIwim7aiGspyvls/E1qsudDF1oAD8X7BsUscoVh4EVZOrO42H4kP6XT0HYMt4hXFSTKz0g==
X-Received: by 2002:adf:910a:0:b0:1ed:c3fc:2dcf with SMTP id
 j10-20020adf910a000000b001edc3fc2dcfmr16786007wrj.430.1646069142139; 
 Mon, 28 Feb 2022 09:25:42 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a7bcd15000000b0034efd01ee16sm11514124wmj.42.2022.02.28.09.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 09:25:41 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robh+dt@kernel.org,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH v3 2/3] dt-bindings: soundwire: qcom: document optional wake
 irq
Date: Mon, 28 Feb 2022 17:25:27 +0000
Message-Id: <20220228172528.3489-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220228172528.3489-1-srinivas.kandagatla@linaro.org>
References: <20220228172528.3489-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
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

Wake IRQ is optional interrupt that can be wired up on SoundWire controller
instances like RX path along with MBHC(Multi Button Headset connection).
Document this in bindings.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../devicetree/bindings/soundwire/qcom,sdw.txt     | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
index b93a2b3e029d..51ddbc509382 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
+++ b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
@@ -22,7 +22,19 @@ board specific bus parameters.
 - interrupts:
 	Usage: required
 	Value type: <prop-encoded-array>
-	Definition: should specify the SoundWire Controller IRQ
+	Definition: should specify the SoundWire Controller core and optional
+		    wake IRQ
+
+- interrupt-names:
+	Usage: Optional
+	Value type: boolean
+	Value type: <stringlist>
+	Definition: should be "core" for core and "wakeup" for wake interrupt.
+
+- wakeup-source:
+	Usage: Optional
+	Value type: boolean
+	Definition: should specify if SoundWire Controller is wake up capable.
 
 - clock-names:
 	Usage: required
-- 
2.21.0

