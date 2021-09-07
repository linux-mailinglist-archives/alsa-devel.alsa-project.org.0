Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7624B40276D
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Sep 2021 12:55:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEEB31734;
	Tue,  7 Sep 2021 12:54:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEEB31734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631012132;
	bh=9bZNDt+xq0m0TZA18W2oSo6QOY8ytP+cfTLLFQioNTQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O3mv6yk3L40U3Bvq7nyoTyc1NAVAAtlB/WaiRF8ZSfnhsVEoK24k6cVpCuMqk64Tg
	 4nn3MqROBsEPVaeDT78P+79o+YVphAYplLP0TgFAxnj/H4Snpsk/31W+HaRDfe4jXt
	 WYmk14erffwsHP25eJ3K6QFnvtj5OXn6Xb9uH1Eo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46FB4F80253;
	Tue,  7 Sep 2021 12:54:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37692F80224; Tue,  7 Sep 2021 12:54:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55DBBF800BC
 for <alsa-devel@alsa-project.org>; Tue,  7 Sep 2021 12:54:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55DBBF800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ScQ39B98"
Received: by mail-wm1-x329.google.com with SMTP id s24so898842wmh.4
 for <alsa-devel@alsa-project.org>; Tue, 07 Sep 2021 03:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KjB/qGwGzPv2/i+OhRtAA5IG1o1hCFcMQ634Zy4lY7w=;
 b=ScQ39B9839t6KnTkvG2qSh+r7QqGs/OPNTUnP1nVVcFA3cCoV6/GzhQv2u00FdkQRQ
 Azs2vMwqXo9IbIbd5Btw/pIKCHZpwPtfYdU7fKnx5NrdgAxt3vAoWC/vvRpVeU3Il0QZ
 Y11g0KM4YpyT23E6QfO+D49Uiesb6EMO+QLgnEAd/Dn6HfTF3GUd2etAWdJH/3HEwKLp
 7tPcvVzKsyoqod4a2PWC11zFRRF6uRG+c4fDuEVfPLzhQV/Mpktv6FUYYoDui+1BF81p
 NlfT3KVFZ1lBM48arlyqLmTK3F5nLDdcchC+v7ji10sPqJ3dsRo8rfmu972GUBIzKxY4
 P5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KjB/qGwGzPv2/i+OhRtAA5IG1o1hCFcMQ634Zy4lY7w=;
 b=JMpjVxQS2kbnYmFZK5G3AhMyivomFrCj4t6k1NbS4X+7/u++ZY5lK9bK+lnhGybcsI
 j3xfW8LvRJ5HowWrs42i/88rNQJ/ifU3Yp0OJYE46pdUr1ruHpMnYO9E2Yr0fMccFaxq
 6vR6EhN4qV0Pl9x8t9GKCYFSZLd9xb++A9vc25XlCKt0qm4neU3/BxvWmbr5ZtrlBhqq
 JPeAWiIpqaMvYYDjE5lXnQycWhRVXGgX+pG1B858CCNUB9vNaoerHPmWOs14wfPYMUih
 xOHCdzy/e+rD86qhmhLOE9PyFk8kEtM9rvDFYwh8SAsgOIOsdYMBnbZwAxWAhwL0dTA6
 bGcg==
X-Gm-Message-State: AOAM533h+VPHZ6fHJHwzKabDgMj7r+qQyYFam0Rkie9GJgBpe7hsKSvC
 csAYWuotjem7Yzp7dsm/zdcLwA==
X-Google-Smtp-Source: ABdhPJxIR48oys1SqA4BtNjBnIL4DbC0MXqcnHhqs7sZFTISJuD+xZ247bLqbfBEewUCAn4VDL5IBw==
X-Received: by 2002:a7b:c7cc:: with SMTP id z12mr3324162wmk.108.1631012048617; 
 Tue, 07 Sep 2021 03:54:08 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id f5sm1989982wmb.47.2021.09.07.03.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 03:54:07 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH v2] soundwire: debugfs: use controller id and link_id for
 debugfs
Date: Tue,  7 Sep 2021 11:53:32 +0100
Message-Id: <20210907105332.1257-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: sanyog.r.kale@intel.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

link_id can be zero and if we have multiple controller instances
in a system like Qualcomm debugfs will end-up with duplicate namespace
resulting in incorrect debugfs entries.

Using bus-id and link-id combination should give a unique debugfs directory
entry and should fix below warning too.
"debugfs: Directory 'master-0' with parent 'soundwire' already present!"

Fixes: bf03473d5bcc ("soundwire: add debugfs support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Changes since v1:
	Added Link ID along with bus id.

 drivers/soundwire/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
index b6cad0d59b7b..49900cd207bc 100644
--- a/drivers/soundwire/debugfs.c
+++ b/drivers/soundwire/debugfs.c
@@ -19,7 +19,7 @@ void sdw_bus_debugfs_init(struct sdw_bus *bus)
 		return;
 
 	/* create the debugfs master-N */
-	snprintf(name, sizeof(name), "master-%d", bus->link_id);
+	snprintf(name, sizeof(name), "master-%d-%d", bus->id, bus->link_id);
 	bus->debugfs = debugfs_create_dir(name, sdw_debugfs_root);
 }
 
-- 
2.21.0

