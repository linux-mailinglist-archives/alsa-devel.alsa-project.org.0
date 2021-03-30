Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E33C34EB0F
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Mar 2021 16:51:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBCFF169A;
	Tue, 30 Mar 2021 16:50:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBCFF169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617115898;
	bh=iZ1gzOs47BK/u3qsvuVedZ90F9zQFPFpRoRkj83l7Vw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mw79MOlDqxQ/6d8ojC79blJgB2k3wKbcCpTdTNXyxFdNXpA02F48nDo/pQhGEgza0
	 l2B+P4wy41cK2zH8zW3Ixy5iuvXmXsdV1lWJV5xsbE2MvJvPvMVNK3HSd0Y1vj45/t
	 +1oHNSo+64ZpvLCg+xtkAjRROOyFLpG730b8bQ3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63B7BF804D1;
	Tue, 30 Mar 2021 16:47:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01972F802CA; Tue, 30 Mar 2021 16:47:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C5EAF8042F
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 16:47:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C5EAF8042F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xLCLDpHM"
Received: by mail-ed1-x531.google.com with SMTP id o19so18542396edc.3
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 07:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=44ifFplI0M1D1DckCDMMSyPyGzm+QYpn2WgKJJ6m1Dc=;
 b=xLCLDpHM9R/bUfHs+E17waH6zoZ8VtDejQLi78o+qu4KVyZQ332UT2krsuSGNdexNt
 +ly5XQBwsj77bQCy0TWWDlNTw4A9SAUKu4UNdwyKjLlRWCoCacskUHQpqibGDqy3KPCL
 //OhpwpNB3m7XUr5i1lbSRKKnlyXb6juD3w1YhtFq/4u5XZSXG3aFR1nzbcwObGFhICp
 vf2g2ifUvwA6LfMP8ZqLBR2NhhnKOp4UHson/zsj6OmeycRmU8goEpIzmc0ZoqPEAPJ7
 2j6P2ci+4SfCa1MrSTKg/LOayyMw8DpI7WbbXtNOPkC4FgY8Lo2638XHPOVubTO116Pe
 /iAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=44ifFplI0M1D1DckCDMMSyPyGzm+QYpn2WgKJJ6m1Dc=;
 b=ZCHca5MO2+e2D6TujbMkfciLCGuPisowmzYq4pdnqye1IpjDBrKPA9jk1lTlojVbtr
 4/EwERDJAW460w/aH9Do7s/+o0KW/JYF9pVJG2vkgRVXKFlz2kz44LhHb/P5Sv5a8nO2
 9U1iBxBF5BtaJqURip18YBga0tZFU1OS/etCI5RoCzECARps98jAtGFGe3ftNMv4HREe
 N+SEYw+UEzHxKcOIdtph+qqxWCy/Swlwtpx7mZDHn3lzCr9un6TFOYiakqs6tdfcPJUQ
 nmS+PWy7o9/CNWivlFYESNMXLyOlXUVMHB+6t3vgeFBUNm0+dp22HqsXqDdy72B1OCHJ
 W8KQ==
X-Gm-Message-State: AOAM532KaOulexjo4G6rNqgIv7cMMVJyyq9Uk0v7c8TD5lt9XJTpoZs+
 GZIykQwhl2dbdNQypq+Aou4PqQ==
X-Google-Smtp-Source: ABdhPJydYKTT0xNGpntDhEjCxVY2s37yLs5j3/HkPPrHJHQy4qZkzwKejpF7qzV2B3zYQK95kdtVLA==
X-Received: by 2002:a05:6402:3486:: with SMTP id
 v6mr33926624edc.109.1617115659363; 
 Tue, 30 Mar 2021 07:47:39 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id n16sm11520383edr.42.2021.03.30.07.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 07:47:38 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v6 9/9] soundwire: qcom: wait for enumeration to be complete
 in probe
Date: Tue, 30 Mar 2021 15:47:19 +0100
Message-Id: <20210330144719.13284-10-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210330144719.13284-1-srinivas.kandagatla@linaro.org>
References: <20210330144719.13284-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
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

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/qcom.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index b1dbaf8263e5..b08ecb9b418c 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -123,6 +123,7 @@ struct qcom_swrm_ctrl {
 	struct regmap *regmap;
 	void __iomem *mmio;
 	struct completion broadcast;
+	struct completion enumeration;
 	struct work_struct slave_work;
 	/* Port alloc/free lock */
 	struct mutex port_lock;
@@ -418,6 +419,7 @@ static int qcom_swrm_enumerate(struct sdw_bus *bus)
 		}
 	}
 
+	complete(&ctrl->enumeration);
 	return 0;
 }
 
@@ -1139,6 +1141,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, ctrl);
 	mutex_init(&ctrl->port_lock);
 	init_completion(&ctrl->broadcast);
+	init_completion(&ctrl->enumeration);
 
 	ctrl->bus.ops = &qcom_swrm_ops;
 	ctrl->bus.port_ops = &qcom_swrm_port_ops;
@@ -1185,6 +1188,8 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	}
 
 	qcom_swrm_init(ctrl);
+	wait_for_completion_timeout(&ctrl->enumeration,
+				    msecs_to_jiffies(TIMEOUT_MS));
 	ret = qcom_swrm_register_dais(ctrl);
 	if (ret)
 		goto err_master_add;
-- 
2.21.0

