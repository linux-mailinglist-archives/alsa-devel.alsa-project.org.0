Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F232C1F49E6
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jun 2020 01:02:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 743CD166C;
	Wed, 10 Jun 2020 01:01:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 743CD166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591743746;
	bh=T/VAjqx88/ApLBTfcDHKYfxXCqF/BR6JCdHilBa8pYc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZzDZxkBXlJ/RfqkRwQ2uCTuV2axSM2tG1O5iQyc1p6ikbERMn/n/pztiPmgzCSaoq
	 B1fwK3QPo+mX+eLQpzuXMpt5/wKcyP8to1QUdFVeWrJ/yLTsme97JCSy3gIyZWGMYj
	 1YtaE8a1i2KeS6l9xMSw0nt9riVO6PxKn9Q1uQyU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 921F7F8028D;
	Wed, 10 Jun 2020 01:00:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC1D0F8028C; Wed, 10 Jun 2020 01:00:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20507F80124
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 01:00:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20507F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uWX8PhxX"
Received: by mail-lj1-x242.google.com with SMTP id i27so78636ljb.12
 for <alsa-devel@alsa-project.org>; Tue, 09 Jun 2020 16:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s8uiAmqlfKhbNS8zB94at4653DA3vsfFnLuxtD8Ft50=;
 b=uWX8PhxX5ck/fIgnf6AhjoNGa9v1kr5t35QzGp2u2JIVCjZ0+WiYHj4q9+GAG4lrp7
 BVyECS9oPaynGxiySyf0LfbYxB9FMTctWW/NS2cXpcN3mGFgjRLCQaYmRd6Y7QStPRQT
 dI3JV5gwgO8alapw4DfHWnl+jk1s2Wfolr8Ek+/bwobQXHRcjzLabkRyYWAU/tY2lPQ8
 I/M25+6IxYgMvCDSQIRLznO3jJ1QlJGAo07ltgjwKMJYFxsG2oQve6YoEfVWq9wCSRd1
 MuGl7isbbfFue0V2H6NUqHDsMhjZ/R8+ZM9pMy30iALOYfyar/kuf0V4ch6JD04gozaH
 dfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s8uiAmqlfKhbNS8zB94at4653DA3vsfFnLuxtD8Ft50=;
 b=XuN112xrLUZKxZb/g6XNptaa+ACi3xYJdIx3+d+OogPYhQ4mFRZBtk7KtBGt2gBqFi
 z6oKEhlCPovngJLk6kaQ+jdiufBvsJmILU/UJ7iOfThpudfnVwTCFsh1Q6O+NNyjtSpU
 E0qGN33Smy5Ghxj5OyjlEGCgQ3beSIPRTC+Zlf0ps3O2KK84LhVyI7FovCcXE4nb/6CA
 6zPAI8bSide8HlGcwDFPSl9gkOp0pkPTNUe8Or3E31Z8rWo3IwSKWzphRljSbC+ZNKfo
 77ci9fn6n6rw+1R+Jukg7a8N/TcYoC4IQXONlVL5nYipLm8/ksZpAQiEt+GDeNMIhk1r
 K8UA==
X-Gm-Message-State: AOAM531q3uOZ76TbWKydvotVfjO1IsjtUWaVCGh6fvmCPoasHU3K9q9T
 rQJxJjX1q42vrU84gGnebgI=
X-Google-Smtp-Source: ABdhPJwcuwJBEnfuj2h/lT/fcSUcFngGefHGqO+wURSYU5P9LQf6N3Rt2gy0UEdq2la9dxghMEP3gw==
X-Received: by 2002:a2e:95d9:: with SMTP id y25mr264828ljh.167.1591743637017; 
 Tue, 09 Jun 2020 16:00:37 -0700 (PDT)
Received: from localhost.localdomain (h-82-196-111-136.NA.cust.bahnhof.se.
 [82.196.111.136])
 by smtp.gmail.com with ESMTPSA id b15sm5306278lfa.74.2020.06.09.16.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 16:00:36 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: 
Subject: [PATCH] soundwire: qcom: Constify static structs
Date: Wed, 10 Jun 2020 01:00:29 +0200
Message-Id: <20200609230029.69802-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, bjorn.andersson@linaro.org,
 vkoul@kernel.org, agross@kernel.org, sanyog.r.kale@intel.com,
 linux-kernel@vger.kernel.org
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

qcom_swrm_port_ops and qcom_swrm_ops are not modified and can be made
const to allow the compiler to put them in read-only memory.

Before:
   text    data     bss     dec     hex filename
  18266    3056     256   21578    544a drivers/soundwire/qcom.o

After:
   text    data     bss     dec     hex filename
  18426    2896     256   21578    544a drivers/soundwire/qcom.o

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/soundwire/qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index a1c2a44a3b4d..915c2cf0c274 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -406,13 +406,13 @@ static int qcom_swrm_port_enable(struct sdw_bus *bus,
 	return ctrl->reg_write(ctrl, reg, val);
 }
 
-static struct sdw_master_port_ops qcom_swrm_port_ops = {
+static const struct sdw_master_port_ops qcom_swrm_port_ops = {
 	.dpn_set_port_params = qcom_swrm_port_params,
 	.dpn_set_port_transport_params = qcom_swrm_transport_params,
 	.dpn_port_enable_ch = qcom_swrm_port_enable,
 };
 
-static struct sdw_master_ops qcom_swrm_ops = {
+static const struct sdw_master_ops qcom_swrm_ops = {
 	.xfer_msg = qcom_swrm_xfer_msg,
 	.pre_bank_switch = qcom_swrm_pre_bank_switch,
 };
-- 
2.27.0

