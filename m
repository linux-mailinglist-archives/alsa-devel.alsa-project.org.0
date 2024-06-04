Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E728FACAC
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 09:56:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16629850;
	Tue,  4 Jun 2024 09:56:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16629850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717487770;
	bh=hi7PWtwphuTNKYoU1XS9MRhf81ClVkiQ1xJd4IkXUsg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iKUDzj33tEkgo8juehuIaqxFvJwBmJT6cZSwljyXvNolBxSQBiv95bHtFW81dFR/h
	 xKQSrJyq+etu5mgMHk97BOsH1kReWWr1UkpmfbrJbhaAXG4+FUxKHxjYC7VUC3315+
	 XW8ffMNQXpUU4dStKSMmMyhuC1Rjys2clfY8TAMQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DF78F805E1; Tue,  4 Jun 2024 09:55:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A42EEF805AC;
	Tue,  4 Jun 2024 09:55:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E97AF80496; Tue,  4 Jun 2024 09:53:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 233B8F80088
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 09:53:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 233B8F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=E+XYvvT5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DEA22CE100C;
	Tue,  4 Jun 2024 07:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C508C4AF08;
	Tue,  4 Jun 2024 07:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717487555;
	bh=hi7PWtwphuTNKYoU1XS9MRhf81ClVkiQ1xJd4IkXUsg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E+XYvvT5XpJaP1NvyduzcIpGyiIREifzDW8WqTsMx0GDH02HpxMjUk3CSQeKZdFKd
	 t6M3E9lDRO2KpOhZnl5YykJXmipfY+cUhmbRUZ3ODgSdU+KlyUJWU5cEsGSUQh3x1t
	 9f2dZyUNLuVAi51/X6yolNV9BNrJwC3filbeBTn3uZqeJQe4I/W2pEwB1inZIc6CDK
	 bR6VclVvYeys2vfTgdnwxf+4lbhXORPWyzBQY1rUvy4G8pUeYnSG8JbjFxkpMg6Cwh
	 fr4htXNh5ciBZybh02rmJB23kcbTzmgQkanCtTOJTyKt4pqlSvvLN9w7IInp2WNuWJ
	 x1LPpQnfVpmYQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sEOy9-000000005QT-3oXW;
	Tue, 04 Jun 2024 09:52:33 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 4/4] soundwire: bus: drop redundant probe debug message
Date: Tue,  4 Jun 2024 09:52:13 +0200
Message-ID: <20240604075213.20815-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240604075213.20815-1-johan+linaro@kernel.org>
References: <20240604075213.20815-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5G6W2LNXOKDYODHBPJL3AZ5Z3ONLHR7T
X-Message-ID-Hash: 5G6W2LNXOKDYODHBPJL3AZ5Z3ONLHR7T
X-MailFrom: johan+linaro@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5G6W2LNXOKDYODHBPJL3AZ5Z3ONLHR7T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Drop the redundant probe debug message which is already provided by
driver core. Whether probe succeeded can also be determined through
sysfs.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/soundwire/bus_type.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 43e732ca73c0..5b9b129badff 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -152,8 +152,6 @@ static int sdw_drv_probe(struct device *dev)
 
 	mutex_unlock(&slave->sdw_dev_lock);
 
-	dev_dbg(dev, "probe complete\n");
-
 	return 0;
 }
 
-- 
2.44.1

