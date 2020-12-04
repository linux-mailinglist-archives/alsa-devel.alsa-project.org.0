Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFFD2CED52
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Dec 2020 12:43:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB5B91876;
	Fri,  4 Dec 2020 12:42:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB5B91876
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607082214;
	bh=58EdiEWizU8rH/sFj3qecOi3Uqqil5hYN2rXS0Wrdmo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=avGSumrrkT857AbhIJPkIUNXyYqTxd9nGby9BK95rvc6IBBd0FWK4R+jXR/xiBmGH
	 bJgtUV4Km8eTYEJOH8GbZudr7mN/0prQeBXXZOkHZg68481xejCjvvNWvb+S1WGtT/
	 c0IawJRNLjdhDGDoDW2fhvCuAnZorBrLjkIJ3HM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41429F804AA;
	Fri,  4 Dec 2020 12:42:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D89FF804A9; Fri,  4 Dec 2020 12:42:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10311F8012A
 for <alsa-devel@alsa-project.org>; Fri,  4 Dec 2020 12:42:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10311F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="msxL+hB8"
Date: Fri, 4 Dec 2020 12:43:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1607082151;
 bh=58EdiEWizU8rH/sFj3qecOi3Uqqil5hYN2rXS0Wrdmo=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=msxL+hB8ICggWRcC3ig1n4i7dx32RAjr2jNo98zH44dUwEQUrHs86mw3yfrySErr7
 2EFBqT3GXBWbebagU9L2ntEDva+cIO5npNSKEG4DEOU7rGP6CRnLVFZlcN+SQgxPb3
 vQYRI71PBAeTkUSnmbVI6JXykMLib6pPDcYsjIi4=
From: Greg KH <gregkh@linuxfoundation.org>
To: Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH 1/3] driver core: auxiliary bus: move slab.h from include file
Message-ID: <X8og8xi3WkoYXet9@kroah.com>
References: <160695681289.505290.8978295443574440604.stgit@dwillia2-desk3.amr.corp.intel.com>
 <X8ogtmrm7tOzZo+N@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X8ogtmrm7tOzZo+N@kroah.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Kiran Patil <kiran.patil@intel.com>,
 linux-rdma@vger.kernel.org, Shiraz Saleem <shiraz.saleem@intel.com>,
 Martin Habets <mhabets@solarflare.com>, lgirdwood@gmail.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, broonie@kernel.org, jgg@nvidia.com,
 Dave Ertman <david.m.ertman@intel.com>, kuba@kernel.org,
 netdev@vger.kernel.org, Leon Romanovsky <leonro@nvidia.com>,
 davem@davemloft.net, linux-kernel@vger.kernel.org,
 Parav Pandit <parav@mellanox.com>
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

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

No need to include slab.h in include/linux/auxiliary_bus.h, as it is not
needed there.  Move it to drivers/base/auxiliary.c instead.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/base/auxiliary.c      | 1 +
 include/linux/auxiliary_bus.h | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
index ef2af417438b..eca36d6284d0 100644
--- a/drivers/base/auxiliary.c
+++ b/drivers/base/auxiliary.c
@@ -9,6 +9,7 @@
 
 #include <linux/device.h>
 #include <linux/init.h>
+#include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
diff --git a/include/linux/auxiliary_bus.h b/include/linux/auxiliary_bus.h
index 282fbf7bf9af..3580743d0e8d 100644
--- a/include/linux/auxiliary_bus.h
+++ b/include/linux/auxiliary_bus.h
@@ -10,7 +10,6 @@
 
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
-#include <linux/slab.h>
 
 struct auxiliary_device {
 	struct device dev;
-- 
2.29.2

