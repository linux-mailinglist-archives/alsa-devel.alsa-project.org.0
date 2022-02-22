Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5B34BF972
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 14:30:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA13518C3;
	Tue, 22 Feb 2022 14:30:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA13518C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645536653;
	bh=Fl2vw4JFGEzddoj5boC6dFb5Kly88/psF4j3WyB2glQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fj1+CAVzelmQVGD5XjFN0vdc6xpnYee0MRKrexMPzihhPkae1I+c7s8Qvz6yh8n19
	 T2R/ZOTp2kjXEzPTC8BpdRZNrYCkjwXF65hds+zxYGqCqTHJ/7tf/rUctygNOlZSxz
	 9TsBxWOg/m21g+n4XprGhVTj1cnvdnpVtWSUt+G4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF2E7F800F5;
	Tue, 22 Feb 2022 14:28:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88538F8051C; Tue, 22 Feb 2022 14:28:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A422F800F5
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 14:28:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A422F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="inPGJiFG"
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 47330405D7
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 13:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645536522;
 bh=bxf6nJLttPRsL7dBKXZgcCS/RsJRiJgMR1Ys1z/0BT0=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=inPGJiFGhpmqpC1lplrkZmDrG4enItXj5xARB4lc5cdaeYCynhjHV2uOwA8PmECTy
 +p18O+fob5cZLtKcwYR5rkT35eF76SFdv5eeC3b+0QpiJFGGJdva3uMcBpI5pzJXut
 XR3oQR1k3OsUZzL10usZUAPNg4IdlM9iVm3K5096lfFrrjknmUjOtHlBfD+61UtmC7
 qR5tY01GVdFkcVaF/GJtQmL3SkJH9gEjIRuyNSbWhdUuk0ZDNnuLfU1+2ni/BpR71i
 f5/y3xmggk2fVxa9ZfH0oDnj0i9qPemKf9NkxtOmUV9HAV4pXPe8k/oIMl6caNXTPO
 Kbn9U5mt2m0xg==
Received: by mail-ed1-f70.google.com with SMTP id
 y10-20020a056402358a00b00410deddea4cso11923587edc.16
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 05:28:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bxf6nJLttPRsL7dBKXZgcCS/RsJRiJgMR1Ys1z/0BT0=;
 b=DU2yH/s5/8KXq4mRONj5Ja9/0jZFcZVql50xTQ+8Erv1OyUhQ/NKYclf51i9c+Nht0
 mBWfYTqOT9sQqoLyfkcGPRg4BNAErZ6QrGU5BZmZPIfFnLiDsZ09eUI37+jSxuTM3Ibo
 jb9d1mJryhIiMttN8+rgmhTARYpA+W0tKxzyo3BFqBKcxF7JghjqwZareRDZVuFTjCUG
 Y2+cPW1tbr9ejUO7PUfwH/i29K0j2uqwSKn8XaKV9bkc7NqiPWtF4yhqLZ/a2tUpafh2
 2HVh+d2xNmXK5VDSGdvo3FqcBMF9cqRmqITASTu+HTJb2NtCgJJbcsnZfjrsrbVvV7h8
 +9pQ==
X-Gm-Message-State: AOAM5325kzn4cfGQAQtIw6U80E0/+quHeTvWGjb+IZVZo5KLbWZajc5i
 74j1J0EftdWBwIZBqNlET6n0SSIsii8eoBm/nElHEpUnzchhxV9qBxsCGeeAuIrjIpNatZKYqKD
 x7TbiBn52oV6xnrCFORKeeT7ZB9CsEy/AnIYL5ju4
X-Received: by 2002:a17:906:a08b:b0:6cf:65bc:e7de with SMTP id
 q11-20020a170906a08b00b006cf65bce7demr19077973ejy.220.1645536521800; 
 Tue, 22 Feb 2022 05:28:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUTH4XEfwD3KKh1b8myIZr/sth4y54qNnWupnWL+QunNk7jf61nPg0M2zH6cCPLQ41ESwuWQ==
X-Received: by 2002:a17:906:a08b:b0:6cf:65bc:e7de with SMTP id
 q11-20020a170906a08b00b006cf65bce7demr19077951ejy.220.1645536521622; 
 Tue, 22 Feb 2022 05:28:41 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id c5sm10029875edk.43.2022.02.22.05.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 05:28:41 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Abel Vesa <abel.vesa@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [RFT PATCH 1/3] clk: imx: scu: fix kfree() of const memory on setting
 driver_override
Date: Tue, 22 Feb 2022 14:27:05 +0100
Message-Id: <20220222132707.266883-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222132707.266883-1-krzysztof.kozlowski@canonical.com>
References: <20220222132707.266883-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: stable@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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

The driver_override field from platform driver should not be initialized
from const memory because the core later kfree() it, for example when
driver_override is set via sysfs.

Fixes: 77d8f3068c63 ("clk: imx: scu: add two cells binding support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/clk/imx/clk-scu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 083da31dc3ea..78ed40a0e3e2 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -683,7 +683,11 @@ struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
 		return ERR_PTR(ret);
 	}
 
-	pdev->driver_override = "imx-scu-clk";
+	pdev->driver_override = kstrdup("imx-scu-clk", GFP_KERNEL);
+	if (!pdev->driver_override) {
+		platform_device_put(pdev);
+		return ERR_PTR(-ENOMEM);
+	}
 
 	ret = imx_clk_scu_attach_pd(&pdev->dev, rsrc_id);
 	if (ret)
-- 
2.32.0

