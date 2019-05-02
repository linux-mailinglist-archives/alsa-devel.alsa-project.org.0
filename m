Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6CA117F3
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 13:06:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FA02173B;
	Thu,  2 May 2019 13:06:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FA02173B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556795210;
	bh=B+pXMDNywHIHkwUl+blhsm46UDrj4x/UoZ0Q7y4u2FY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YHiEBgiU6ZBkZIEUZz4/7dBlP5ScGFytBd9pmOQN65laGiueP6J5IhNsDx7RLIh3p
	 ytRT3ZS7Q+lNxw1bF+h99LbumU7wSxImo/RagH6oVqX9DmAje37757BWVikS47X6r4
	 tMjgZPc8OpbJUKjs/UnWoF9BX3ANKnKijcSj+uVE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3A70F8973A;
	Thu,  2 May 2019 13:00:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E041DF8972F; Thu,  2 May 2019 13:00:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCE84F8972A
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 13:00:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCE84F8972A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RpngdUn4"
Received: from localhost.localdomain (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B3B302089E;
 Thu,  2 May 2019 11:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556794829;
 bh=K+1jriQ1cRmGcNIXvnl+HNNm2c34ANpldEWbqely3S4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RpngdUn42TI7gEEjzLOl7SYaFm4sZFz+3RwM9P4DvPMJbodlwdKlxSbsqiQ3uolSn
 Kn6zywyhLhzzkj1KOwlJnA3QhBCp2CX5g950X/pMwh1Pjxxixsbyn0RZeNXO6gSpQs
 paWn8uLdCy13EKy7M+wOgRPcJu7nbSDdV2EtnSto=
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Date: Thu,  2 May 2019 16:29:23 +0530
Message-Id: <20190502105930.9889-8-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502105930.9889-1-vkoul@kernel.org>
References: <20190502105930.9889-1-vkoul@kernel.org>
MIME-Version: 1.0
Cc: Greg KH <gregkh@linuxfoundation.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Vinod Koul <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Shreyas NC <shreyas.nc@intel.com>
Subject: [alsa-devel] [PATCH 07/14] soundwire: add argument to function
	definition
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Checkpatch warns that function definition of __sdw_register_driver
misses argument, so add it

WARNING: function definition argument 'struct module *' should also have
an identifier name

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 include/linux/soundwire/sdw_type.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/soundwire/sdw_type.h b/include/linux/soundwire/sdw_type.h
index b7e198a035c9..9c756b5a0dfe 100644
--- a/include/linux/soundwire/sdw_type.h
+++ b/include/linux/soundwire/sdw_type.h
@@ -11,7 +11,7 @@ extern struct bus_type sdw_bus_type;
 #define sdw_register_driver(drv) \
 	__sdw_register_driver(drv, THIS_MODULE)
 
-int __sdw_register_driver(struct sdw_driver *drv, struct module *);
+int __sdw_register_driver(struct sdw_driver *drv, struct module *owner);
 void sdw_unregister_driver(struct sdw_driver *drv);
 
 int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
