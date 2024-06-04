Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4523D8FACA8
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 09:55:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB19E828;
	Tue,  4 Jun 2024 09:55:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB19E828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717487748;
	bh=b3E/UIPslsT8I86wbPoMlWOJhjF5vCXYbMseh+Nd3tk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BGYZrTBt6y/KjnOWLViwwHIMN5j/FW/pevAHrPU9ct6s5VPk6DIMlvghZU+lMI16k
	 patPPofggUycUWvfvC7Ao4OlgLUDbdqUiJVLNpSoN+sJIzwisC8CW3HasZ25dV08eV
	 SvuHarggfy8ZofD9GwlW+WfjgZxdqFHUNuH6uW9s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D576BF805A8; Tue,  4 Jun 2024 09:55:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41EEAF80587;
	Tue,  4 Jun 2024 09:55:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32D17F80496; Tue,  4 Jun 2024 09:53:03 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3741FF802DB
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 09:52:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3741FF802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tjDXtJ2B
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D4D3ACE0CEA;
	Tue,  4 Jun 2024 07:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17191C2BBFC;
	Tue,  4 Jun 2024 07:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717487555;
	bh=b3E/UIPslsT8I86wbPoMlWOJhjF5vCXYbMseh+Nd3tk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tjDXtJ2Bnfn07g6X0XM+j297fga5v438KKDbcNVYwW2D+xQhMkkweVBBOq3AS1gnX
	 LAT0S0hHXiRAbW0abuhjIBsb7zRZd9Vov9GSssIzB5IvYRfy0nEstMHIRPPAskPjwZ
	 KPCRv+C8IrQHxklAXbga205F0kcrlnBKjckpEDIv6XiTukWD1DeFIjNuDugks8XN2e
	 +NAcE3ybEZRC3RsKxXDrnGMEICl+VqRqArskLYTKbqPdtGalr7LhEMxDRIXFolzZ/z
	 GvzdKSHVxQ/eknLuUFdKt8ZRyfKtv+2m3GlZTu3mNahck1+jtV4OGGQI18symujISv
	 W1td3s2pCk3Mg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sEOy9-000000005QR-3RBp;
	Tue, 04 Jun 2024 09:52:33 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 3/4] soundwire: bus: clean up probe warnings
Date: Tue,  4 Jun 2024 09:52:12 +0200
Message-ID: <20240604075213.20815-4-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240604075213.20815-1-johan+linaro@kernel.org>
References: <20240604075213.20815-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LIA6UYSDDZ5ODE6RAKYDSD65A6OZYVFV
X-Message-ID-Hash: LIA6UYSDDZ5ODE6RAKYDSD65A6OZYVFV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LIA6UYSDDZ5ODE6RAKYDSD65A6OZYVFV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Clean up the probe warning messages by using a common succinct format
(e.g. without __func__ and with a space after ':').

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/soundwire/bus_type.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 3979be0f8b65..43e732ca73c0 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -123,7 +123,7 @@ static int sdw_drv_probe(struct device *dev)
 	/* init the dynamic sysfs attributes we need */
 	ret = sdw_slave_sysfs_dpn_init(slave);
 	if (ret < 0)
-		dev_warn(dev, "Slave sysfs init failed:%d\n", ret);
+		dev_warn(dev, "failed to initialise sysfs: %d\n", ret);
 
 	/*
 	 * Check for valid clk_stop_timeout, use DisCo worst case value of
@@ -147,7 +147,7 @@ static int sdw_drv_probe(struct device *dev)
 	if (drv->ops && drv->ops->update_status) {
 		ret = drv->ops->update_status(slave, slave->status);
 		if (ret < 0)
-			dev_warn(dev, "%s: update_status failed with status %d\n", __func__, ret);
+			dev_warn(dev, "failed to update status: %d\n", ret);
 	}
 
 	mutex_unlock(&slave->sdw_dev_lock);
-- 
2.44.1

