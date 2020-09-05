Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E2E25EE63
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Sep 2020 16:58:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B62616F7;
	Sun,  6 Sep 2020 16:57:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B62616F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599404320;
	bh=v/FDH+c2doE/6yujT3oE4Lns3BucZB9ANJaur8sLrKo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QiE2Ki6qtkUmNBHg3V7pzhHPaYB9LPUQEUovVSjFoIqtgAb2VyymDK4HiFJCQcXw4
	 3K9gw62waIpzQ+sdiykgfNJHYa59xZzz9XWd9n3B+fT9Wgi2w3qk/bRm3OH2rT5BJA
	 chJ18OSsJ7t2kvd5kEFF8NGNvqWTC0dtD4GWDtnQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7A76F8028E;
	Sun,  6 Sep 2020 16:56:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B98DBF8028A; Sat,  5 Sep 2020 19:40:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7019F800B4
 for <alsa-devel@alsa-project.org>; Sat,  5 Sep 2020 19:40:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7019F800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com
 header.i=@marek-ca.20150623.gappssmtp.com header.b="PQI3pEBu"
Received: by mail-qt1-x841.google.com with SMTP id p65so7205053qtd.2
 for <alsa-devel@alsa-project.org>; Sat, 05 Sep 2020 10:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0O2sDN9MRUJx80UJH/oPfzt4dGApmPFTm8Og0trLMlM=;
 b=PQI3pEBu3s9c3wGVmIuNH334mS4Xc4eJzP8j71PrrLcxVfR5EeZBMcR+Auusaw6/Ff
 1Fw+D1h5tmrw410p9aWH+jF5Z6dnxjbIEeE8J+In0S47NcWyOr0vBighN1vBS3/I+N8t
 n9VYeGfCxt7F4CbUBDAUk9DlIoEz+kJfWhdIGY/EY2XPGAsDrKhZQlUhDEf/ez9cb9Z0
 +hIc9YK3pnmY/ms0/Uo1h0c7mEiEpKJx0wPTUtky8whMSvqzRf3vJ0tXk2/adb+V0Xkl
 nyEaTca83iCgVUT5X2KZzNhHyEgCmexoxmyxXY5r6kPXh9lsiSd/W+eN1IAo++f2Wkiy
 iW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0O2sDN9MRUJx80UJH/oPfzt4dGApmPFTm8Og0trLMlM=;
 b=ATEl8oUCHCQR/U4SNr+yLOgRPgw3bfhgH9GJ8CGjd7tk+kS08nAReebPkq7EPzrMRx
 L82fyEps6HzXiqgDjIbW3Y4YdukdTurpAF5qrwaj68AdipC2Pj2VYrz2AagsrZDz4kPB
 1inpEjgetJLMlIbRT0cdICoIIcbE1Xb21JpTLRaxgdcKH7o7dE8bjIvOzv6FNbiQTkPj
 VDqqCBCTsI3XA1BXN7YolI3jHnfe9ktzzfQoY93DS4hqT3CX/5eJ+Ip+7ZbIBBgb5nMr
 QEDpBFGi4HzFoAAK8Q+o+bO1FTI7e3q/Aor22qEykxw5vsk/9sYsd6VXjuYvw1eV1P3m
 KvLg==
X-Gm-Message-State: AOAM5338XKjxlhfE9kMLU65EbJvfqHzavXURRDpj3MOrEZAIDIsxYzT/
 op4703LfeYF79/CMBGFqyag3vGgb677DkhlJM+g=
X-Google-Smtp-Source: ABdhPJxvu7IqOsyVda774F6SOjLfLez3tafKaihOLf6twPF1uFQYTPqcfzR9nDz531vmBmKxjwOt6w==
X-Received: by 2002:aed:2d06:: with SMTP id h6mr14027558qtd.301.1599327605930; 
 Sat, 05 Sep 2020 10:40:05 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id k22sm4612076qkk.13.2020.09.05.10.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 10:40:05 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/4] soundwire: qcom: fix abh/ahb typo
Date: Sat,  5 Sep 2020 13:39:02 -0400
Message-Id: <20200905173905.16541-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200905173905.16541-1-jonathan@marek.ca>
References: <20200905173905.16541-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 06 Sep 2020 16:56:12 +0200
Cc: "moderated list:SOUNDWIRE SUBSYSTEM" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

The function name qcom_swrm_abh_reg_read should say ahb, fix that.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 915c2cf0c274..d1e33ef1afac 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -114,7 +114,7 @@ struct qcom_swrm_ctrl {
 
 #define to_qcom_sdw(b)	container_of(b, struct qcom_swrm_ctrl, bus)
 
-static int qcom_swrm_abh_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
+static int qcom_swrm_ahb_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
 				  u32 *val)
 {
 	struct regmap *wcd_regmap = ctrl->regmap;
@@ -754,7 +754,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	if (dev->parent->bus == &slimbus_bus) {
-		ctrl->reg_read = qcom_swrm_abh_reg_read;
+		ctrl->reg_read = qcom_swrm_ahb_reg_read;
 		ctrl->reg_write = qcom_swrm_ahb_reg_write;
 		ctrl->regmap = dev_get_regmap(dev->parent, NULL);
 		if (!ctrl->regmap)
-- 
2.26.1

