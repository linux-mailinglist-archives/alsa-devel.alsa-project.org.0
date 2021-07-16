Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE22B3CB5FD
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 12:24:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44B421695;
	Fri, 16 Jul 2021 12:24:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44B421695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626431097;
	bh=pKXBkdbUeVSarutX28w7pKmDiH9qplJt0HAHjvlym/w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZNMXn7wYyTjzlAYoOq8+8jBq1Qz2qPEzDkpsZjksY2fqkJC9CxHMiZeirwWvvujnL
	 7l1WZ+6TOWClDHwdiBd7hXYTcqVgMLzKjNClxqyVoeKXbm45zKcZStCxytR0DFj8li
	 0R09x1Y3rjNwqTWkQf508gIAJ7ZzWTwgKQy2+u00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05480F804E1;
	Fri, 16 Jul 2021 12:22:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47A48F802E7; Fri, 16 Jul 2021 12:22:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A37EF8013C
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 12:22:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A37EF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="F0ZYk8ZG"
Received: by mail-wr1-x42b.google.com with SMTP id v5so11503778wrt.3
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 03:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LjxLxmgZBDZkyIZTSdcwCO6eZCtubh4Qr/3hT9cegm0=;
 b=F0ZYk8ZGiCL5U+lH8QEtTnltPQiNIQnjz0z/c579UaUs+5wyoSP6EgvAQFOmjGinFe
 NAXuffXbmgEmrG89uz7iJd/A6IUZQQHGRq6pSrqW8h/pKNcIPs8nLZZxLSCnYkvPNt35
 GZqU7gm+Bm21IJqEBxlN8/7VXSSYakxIsr7/ekfMikyCi0juwf7+zjP87eLzK+OZPVv/
 CSC2iaeL/cSlC8OuBtprye/h6zYLEtSCnZyHenOf2yVccW6f5bStJe9tfQOfaoonhZgS
 zZxTqchQttzbX2LSxeJTv0S+riT0tMdFcjBXEHYW7cjJc9o1sNymDKhQtoxviN4PO0RP
 Cx6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LjxLxmgZBDZkyIZTSdcwCO6eZCtubh4Qr/3hT9cegm0=;
 b=IsATi12I3f/EdENNphND+zzHBpPOOQN/YRv5g9RA/jQXzsZ0l64+laQ3yNwHgSpaQR
 X9w7f3+AKkCqnxVf1GSJBel/mdWK7ehrjJQklE6HYzitrJ8/G0/9USApWLTkvkTM+ET6
 kB2ueUsxHWNcqZLgidHHHYdoXJit6XDKDbjeFHq+/Mvl0//d7/Vvkpe+rqQTO99cZu9m
 aD0CgVCkLtvQBFENAKW4wkzWKn4W4gZLj7bqDlasVF8GFJuZC3tt3AeeKB+yO9vH/dZF
 ShmcOrGMaX7LLgkoOcDfSS9ne3yrPp8Kr60/5E38z9WhVbLB7bocLllCFYQ4pCBSSBYM
 2sgg==
X-Gm-Message-State: AOAM5310VgOAUnqp6PENowPvFjQ0XXTu1Q88+aRxFFR/OfVPaq3orQ3l
 1tkkA1V+zEXU5WVaHmJMnSbWEQ==
X-Google-Smtp-Source: ABdhPJw/ypVuRpbiqTH/2yAp3WpRaCk+U4+ybol9ZhHDa803+5l610ecL9x5ZvNZgj0CtbSXVePB4A==
X-Received: by 2002:a5d:4b42:: with SMTP id w2mr11210193wrs.47.1626430957487; 
 Fri, 16 Jul 2021 03:22:37 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id g15sm7421796wmh.44.2021.07.16.03.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 03:22:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: srini@kernel.org
Subject: [PATCH 2/4] slimbus: messaging: check for valid transaction id
Date: Fri, 16 Jul 2021 11:21:21 +0100
Message-Id: <20210716102123.26861-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210716102123.26861-1-srinivas.kandagatla@linaro.org>
References: <20210716102123.26861-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

In some usecases transaction ids are dynamically allocated inside
the controller driver after sending the messages which have generic
acknowledge responses. So check for this before refcounting pm_runtime.

Without this we would end up imbalancing runtime pm count by
doing pm_runtime_put() in both slim_do_transfer() and slim_msg_response()
for a single  pm_runtime_get() in slim_do_transfer()

Fixes: d3062a210930 ("slimbus: messaging: add slim_alloc/free_txn_tid()")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/slimbus/messaging.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/messaging.c b/drivers/slimbus/messaging.c
index 6097ddc43a35..e5ae26227bdb 100644
--- a/drivers/slimbus/messaging.c
+++ b/drivers/slimbus/messaging.c
@@ -131,7 +131,8 @@ int slim_do_transfer(struct slim_controller *ctrl, struct slim_msg_txn *txn)
 			goto slim_xfer_err;
 		}
 	}
-
+	/* Initialize tid to invalid value */
+	txn->tid = 0;
 	need_tid = slim_tid_txn(txn->mt, txn->mc);
 
 	if (need_tid) {
@@ -163,7 +164,7 @@ int slim_do_transfer(struct slim_controller *ctrl, struct slim_msg_txn *txn)
 			txn->mt, txn->mc, txn->la, ret);
 
 slim_xfer_err:
-	if (!clk_pause_msg && (!need_tid  || ret == -ETIMEDOUT)) {
+	if (!clk_pause_msg && (txn->tid == 0  || ret == -ETIMEDOUT)) {
 		/*
 		 * remove runtime-pm vote if this was TX only, or
 		 * if there was error during this transaction
-- 
2.21.0

