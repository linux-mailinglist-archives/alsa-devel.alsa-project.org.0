Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E78FA25EE6A
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Sep 2020 17:00:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5959D173A;
	Sun,  6 Sep 2020 16:59:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5959D173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599404417;
	bh=1HMiG1sAZtH3NqA99cbxYEoKhmf3G43H/4a34CA0wFg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jjBIHT3qIMJ1IzU36ORaSo60eDBDX/nnjWWNief2yXHq2ecO/z+5mZqezb1geM47X
	 3uDvH2lKe+gJqXmzus6zx7nMctF1cCDb08bGoVkK0V3majZB9v1gkzYi96h518UAn9
	 mZRZuFKOpisdUAhz64oskPtW3VqJOxljNaA1LEsk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A36DF802DB;
	Sun,  6 Sep 2020 16:56:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24F96F80217; Sat,  5 Sep 2020 19:40:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 449A0F8021D
 for <alsa-devel@alsa-project.org>; Sat,  5 Sep 2020 19:40:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 449A0F8021D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com
 header.i=@marek-ca.20150623.gappssmtp.com header.b="PuHiboVv"
Received: by mail-qv1-xf42.google.com with SMTP id z18so1125620qvp.6
 for <alsa-devel@alsa-project.org>; Sat, 05 Sep 2020 10:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RD8l2fQQKOKDdGKnl9LX5y5DxoMGyqywKhbieLOAYr0=;
 b=PuHiboVvZl6Td+/ckTlRqbM9dwWXBWl4PN09T0xtiWJgefJnVhpJXu5vM3U0vAqw6H
 ZjrAAxYAEzRXxJW3vx2JJkznP/wiioILpGd9nSkKf55fGA9rUQQ7/OqWo3dBmT8yDT9I
 cmrWs4iNIE9Dlalqoa4IAnvnmSTHSE/Ea4gc5eeoBCmxN7H5wpekwjsXUcxkXE6h73V2
 SlJrQ0F9LucPIBPU2rqpDUEU/vLDc41HHqaxAVE0SIdsGKpWpRbWUioJ3dgBm4Y/yDAC
 aBnOzrm54i4p7O4NM5WwpOq3/C25gbO9aHDCMlKatvwvdMC4lv4j3d0rnht9jvM5zB1X
 bh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RD8l2fQQKOKDdGKnl9LX5y5DxoMGyqywKhbieLOAYr0=;
 b=bhOAeTaRzTLt0+Wvve5x1V5vVkwESygx/q8pua0faCiaHxU/pi/pAty0SVCnWOhCED
 J2w2LhMCuJ0wmZZ23x9W06SryxunDhL4KER3Nby75lkohc2gsT8x+HFNX2qO27R56uBo
 bITMEKPp26QSMgm/f8qHZIf6zjv11ZgSHDRUUq3E7sHG8I0e8vMINFYvRd/iTB06txq+
 m9Oc+zyP9AT0mvXvo8+sVGkMxZDJboCerdpmTkBtoiKmuG1VTyM9swe2BND7/8N3EMyI
 SaNuXz7RmuED4AIJGHZR7BnDt11PguU4RyI1BJEeJiwykhrLsOAEGARzS0NpGCiEZ6wn
 qpfg==
X-Gm-Message-State: AOAM531Vl5olI5MUqswd9wERqxQrrwz02OIMnBSjdjtxDpCXdQShA8i2
 +j0Sk5Lqng/jyXYj4mT2yWcR2g==
X-Google-Smtp-Source: ABdhPJyuTKQWKjzMrkVdkHqOR6fCSGGE/V7bCG1Lo7qkVruNXgOL6QgxAZm9hgFSj6oY52+0zPPJNA==
X-Received: by 2002:a0c:9ac5:: with SMTP id k5mr13293584qvf.112.1599327609464; 
 Sat, 05 Sep 2020 10:40:09 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id k22sm4612076qkk.13.2020.09.05.10.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 10:40:09 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 4/4] soundwire: qcom: add v1.5.1 compatible
Date: Sat,  5 Sep 2020 13:39:05 -0400
Message-Id: <20200905173905.16541-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200905173905.16541-1-jonathan@marek.ca>
References: <20200905173905.16541-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 06 Sep 2020 16:56:12 +0200
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:SOUNDWIRE SUBSYSTEM" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
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

Add a compatible string for HW version v1.5.1 on sm8250 SoCs.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 Documentation/devicetree/bindings/soundwire/qcom,sdw.txt | 1 +
 drivers/soundwire/qcom.c                                 | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
index 436547f3b155..b104be131235 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
+++ b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
@@ -11,6 +11,7 @@ board specific bus parameters.
 		    Example:
 			"qcom,soundwire-v1.3.0"
 			"qcom,soundwire-v1.5.0"
+			"qcom,soundwire-v1.5.1"
 			"qcom,soundwire-v1.6.0"
 - reg:
 	Usage: required
diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index ff28794868ca..41dda3b85413 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -888,6 +888,7 @@ static int qcom_swrm_remove(struct platform_device *pdev)
 
 static const struct of_device_id qcom_swrm_of_match[] = {
 	{ .compatible = "qcom,soundwire-v1.3.0", },
+	{ .compatible = "qcom,soundwire-v1.5.1", },
 	{/* sentinel */},
 };
 
-- 
2.26.1

