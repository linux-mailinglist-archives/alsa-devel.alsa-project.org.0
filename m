Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0B52CED5F
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Dec 2020 12:44:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 167F4187D;
	Fri,  4 Dec 2020 12:43:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 167F4187D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607082256;
	bh=CQGde8dYRlqueEwvc7knY4CB9w4yHC8OY/IAzf3YxK8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gRlewCYdTyS2mAZxSADV+iKqBtmr2b8UO96M9v9D6bw/Lh2779ciLOXyHC1nFXLb+
	 pdZPX7AguItaTC+baoND9YN6oZBNy5RY2BNW2uQvOmGOxOCIM01mX4if646tyKvhxz
	 gGSFrpvI+tAQPqfwPN6+jDnoSsmLOhhT8IMAfC9c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7755F804B2;
	Fri,  4 Dec 2020 12:42:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B043F80273; Fri,  4 Dec 2020 12:42:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A0DCF80273
 for <alsa-devel@alsa-project.org>; Fri,  4 Dec 2020 12:42:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A0DCF80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="tSQHZ4Oy"
Date: Fri, 4 Dec 2020 12:44:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1607082170;
 bh=CQGde8dYRlqueEwvc7knY4CB9w4yHC8OY/IAzf3YxK8=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=tSQHZ4Oy383lMi/uHhG6/0wGOQXxLiB3LUfuHensu29AD+wOBN1igyRMiqJHGya9c
 XU6K5R+KCB8TR74Yiiw5rFfDPj7Nlbyzp9X7DxcgmK143cGPnHF9aLcndZrdw9YC7k
 mgVm7a/Z68vtSqNa1f6Z3BNBK1pegmV/pM40/CoE=
From: Greg KH <gregkh@linuxfoundation.org>
To: Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH 2/3] driver core: auxiliary bus: make remove function return
 void
Message-ID: <X8ohB1ks1NK7kPop@kroah.com>
References: <160695681289.505290.8978295443574440604.stgit@dwillia2-desk3.amr.corp.intel.com>
 <X8ogtmrm7tOzZo+N@kroah.com> <X8og8xi3WkoYXet9@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X8og8xi3WkoYXet9@kroah.com>
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

There's an effort to move the remove() callback in the driver core to
not return an int, as nothing can be done if this function fails.  To
make that effort easier, make the aux bus remove function void to start
with so that no users have to be changed sometime in the future.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 Documentation/driver-api/auxiliary_bus.rst | 2 +-
 drivers/base/auxiliary.c                   | 5 ++---
 include/linux/auxiliary_bus.h              | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/driver-api/auxiliary_bus.rst b/Documentation/driver-api/auxiliary_bus.rst
index 5dd7804631ef..2312506b0674 100644
--- a/Documentation/driver-api/auxiliary_bus.rst
+++ b/Documentation/driver-api/auxiliary_bus.rst
@@ -150,7 +150,7 @@ and shutdown notifications using the standard conventions.
 	struct auxiliary_driver {
 		int (*probe)(struct auxiliary_device *,
                              const struct auxiliary_device_id *id);
-		int (*remove)(struct auxiliary_device *);
+		void (*remove)(struct auxiliary_device *);
 		void (*shutdown)(struct auxiliary_device *);
 		int (*suspend)(struct auxiliary_device *, pm_message_t);
 		int (*resume)(struct auxiliary_device *);
diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
index eca36d6284d0..c44e85802b43 100644
--- a/drivers/base/auxiliary.c
+++ b/drivers/base/auxiliary.c
@@ -82,13 +82,12 @@ static int auxiliary_bus_remove(struct device *dev)
 {
 	struct auxiliary_driver *auxdrv = to_auxiliary_drv(dev->driver);
 	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
-	int ret = 0;
 
 	if (auxdrv->remove)
-		ret = auxdrv->remove(auxdev);
+		auxdrv->remove(auxdev);
 	dev_pm_domain_detach(dev, true);
 
-	return ret;
+	return 0;
 }
 
 static void auxiliary_bus_shutdown(struct device *dev)
diff --git a/include/linux/auxiliary_bus.h b/include/linux/auxiliary_bus.h
index 3580743d0e8d..d67b17606210 100644
--- a/include/linux/auxiliary_bus.h
+++ b/include/linux/auxiliary_bus.h
@@ -19,7 +19,7 @@ struct auxiliary_device {
 
 struct auxiliary_driver {
 	int (*probe)(struct auxiliary_device *auxdev, const struct auxiliary_device_id *id);
-	int (*remove)(struct auxiliary_device *auxdev);
+	void (*remove)(struct auxiliary_device *auxdev);
 	void (*shutdown)(struct auxiliary_device *auxdev);
 	int (*suspend)(struct auxiliary_device *auxdev, pm_message_t state);
 	int (*resume)(struct auxiliary_device *auxdev);
-- 
2.29.2

