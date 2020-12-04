Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBFF2CED6C
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Dec 2020 12:49:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D12C31881;
	Fri,  4 Dec 2020 12:48:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D12C31881
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607082552;
	bh=8riUQT9bCbW54dDW4SqSDmsIYyllOic9IBnpv2jP8RY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qXJYAs6UGLDZ8ZMVHe4pN+XQO2d3VFGCzQOOle+6Xul9rnG8f7+i5FnQjUQgMbnnW
	 VIBHiRHezSB04pnzJdxh5U+fp73TH7+8uKab3JPWi6NLRCfyrPfR+rMdbHuzDTlFG5
	 6L/o7jX9sTaTOpuURAgekWiIx7znAJ8Ty5HXXR2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 375E0F804AA;
	Fri,  4 Dec 2020 12:48:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF56DF804AA; Fri,  4 Dec 2020 12:48:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9529F80273
 for <alsa-devel@alsa-project.org>; Fri,  4 Dec 2020 12:48:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9529F80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="A46brJwj"
Date: Fri, 4 Dec 2020 12:49:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1607082492;
 bh=8riUQT9bCbW54dDW4SqSDmsIYyllOic9IBnpv2jP8RY=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=A46brJwjdIa872dTM+2vM7n7K9F806vWyhU5xH27mw1GwGZ5jCWn615wnRuCk0ifP
 aQ3U7L5uYHJDQ36n16uxjcx5LSjr50uszqUtlt8YBWaxj1oAUopkNCgdr3I3mQZTPu
 q0LaHDbMkjd5a4WnQiS1tSIRdE4kyw7f8vikc8Ck=
From: Greg KH <gregkh@linuxfoundation.org>
To: Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH v2 3/3] driver core: auxiliary bus: minor coding style tweaks
Message-ID: <X8oiSFTpYHw1xE/o@kroah.com>
References: <160695681289.505290.8978295443574440604.stgit@dwillia2-desk3.amr.corp.intel.com>
 <X8ogtmrm7tOzZo+N@kroah.com> <X8og8xi3WkoYXet9@kroah.com>
 <X8ohB1ks1NK7kPop@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X8ohB1ks1NK7kPop@kroah.com>
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

For some reason, the original aux bus patch had some really long lines
in a few places, probably due to it being a very long-lived patch in
development by many different people.  Fix that up so that the two files
all have the same length lines and function formatting styles.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2: include the right files in the patch...

 drivers/base/auxiliary.c      | 58 +++++++++++++++++++----------------
 include/linux/auxiliary_bus.h |  6 ++--
 2 files changed, 35 insertions(+), 29 deletions(-)

diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
index c44e85802b43..f303daadf843 100644
--- a/drivers/base/auxiliary.c
+++ b/drivers/base/auxiliary.c
@@ -50,8 +50,8 @@ static int auxiliary_uevent(struct device *dev, struct kobj_uevent_env *env)
 	name = dev_name(dev);
 	p = strrchr(name, '.');
 
-	return add_uevent_var(env, "MODALIAS=%s%.*s", AUXILIARY_MODULE_PREFIX, (int)(p - name),
-			      name);
+	return add_uevent_var(env, "MODALIAS=%s%.*s", AUXILIARY_MODULE_PREFIX,
+			      (int)(p - name), name);
 }
 
 static const struct dev_pm_ops auxiliary_dev_pm_ops = {
@@ -113,16 +113,18 @@ static struct bus_type auxiliary_bus_type = {
  * auxiliary_device_init - check auxiliary_device and initialize
  * @auxdev: auxiliary device struct
  *
- * This is the first step in the two-step process to register an auxiliary_device.
+ * This is the first step in the two-step process to register an
+ * auxiliary_device.
  *
- * When this function returns an error code, then the device_initialize will *not* have
- * been performed, and the caller will be responsible to free any memory allocated for the
- * auxiliary_device in the error path directly.
+ * When this function returns an error code, then the device_initialize will
+ * *not* have been performed, and the caller will be responsible to free any
+ * memory allocated for the auxiliary_device in the error path directly.
  *
- * It returns 0 on success.  On success, the device_initialize has been performed.  After this
- * point any error unwinding will need to include a call to auxiliary_device_uninit().
- * In this post-initialize error scenario, a call to the device's .release callback will be
- * triggered, and all memory clean-up is expected to be handled there.
+ * It returns 0 on success.  On success, the device_initialize has been
+ * performed.  After this point any error unwinding will need to include a call
+ * to auxiliary_device_uninit().  In this post-initialize error scenario, a call
+ * to the device's .release callback will be triggered, and all memory clean-up
+ * is expected to be handled there.
  */
 int auxiliary_device_init(struct auxiliary_device *auxdev)
 {
@@ -149,16 +151,19 @@ EXPORT_SYMBOL_GPL(auxiliary_device_init);
  * @auxdev: auxiliary bus device to add to the bus
  * @modname: name of the parent device's driver module
  *
- * This is the second step in the two-step process to register an auxiliary_device.
+ * This is the second step in the two-step process to register an
+ * auxiliary_device.
  *
- * This function must be called after a successful call to auxiliary_device_init(), which
- * will perform the device_initialize.  This means that if this returns an error code, then a
- * call to auxiliary_device_uninit() must be performed so that the .release callback will
- * be triggered to free the memory associated with the auxiliary_device.
+ * This function must be called after a successful call to
+ * auxiliary_device_init(), which will perform the device_initialize.  This
+ * means that if this returns an error code, then a call to
+ * auxiliary_device_uninit() must be performed so that the .release callback
+ * will be triggered to free the memory associated with the auxiliary_device.
  *
- * The expectation is that users will call the "auxiliary_device_add" macro so that the caller's
- * KBUILD_MODNAME is automatically inserted for the modname parameter.  Only if a user requires
- * a custom name would this version be called directly.
+ * The expectation is that users will call the "auxiliary_device_add" macro so
+ * that the caller's KBUILD_MODNAME is automatically inserted for the modname
+ * parameter.  Only if a user requires a custom name would this version be
+ * called directly.
  */
 int __auxiliary_device_add(struct auxiliary_device *auxdev, const char *modname)
 {
@@ -166,13 +171,13 @@ int __auxiliary_device_add(struct auxiliary_device *auxdev, const char *modname)
 	int ret;
 
 	if (!modname) {
-		pr_err("auxiliary device modname is NULL\n");
+		dev_err(dev, "auxiliary device modname is NULL\n");
 		return -EINVAL;
 	}
 
 	ret = dev_set_name(dev, "%s.%s.%d", modname, auxdev->name, auxdev->id);
 	if (ret) {
-		pr_err("auxiliary device dev_set_name failed: %d\n", ret);
+		dev_err(dev, "auxiliary device dev_set_name failed: %d\n", ret);
 		return ret;
 	}
 
@@ -197,9 +202,9 @@ EXPORT_SYMBOL_GPL(__auxiliary_device_add);
  * if it does.  If the callback returns non-zero, this function will
  * return to the caller and not iterate over any more devices.
  */
-struct auxiliary_device *
-auxiliary_find_device(struct device *start, const void *data,
-		      int (*match)(struct device *dev, const void *data))
+struct auxiliary_device *auxiliary_find_device(struct device *start,
+					       const void *data,
+					       int (*match)(struct device *dev, const void *data))
 {
 	struct device *dev;
 
@@ -217,14 +222,15 @@ EXPORT_SYMBOL_GPL(auxiliary_find_device);
  * @owner: owning module/driver
  * @modname: KBUILD_MODNAME for parent driver
  */
-int __auxiliary_driver_register(struct auxiliary_driver *auxdrv, struct module *owner,
-				const char *modname)
+int __auxiliary_driver_register(struct auxiliary_driver *auxdrv,
+				struct module *owner, const char *modname)
 {
 	if (WARN_ON(!auxdrv->probe) || WARN_ON(!auxdrv->id_table))
 		return -EINVAL;
 
 	if (auxdrv->name)
-		auxdrv->driver.name = kasprintf(GFP_KERNEL, "%s.%s", modname, auxdrv->name);
+		auxdrv->driver.name = kasprintf(GFP_KERNEL, "%s.%s", modname,
+						auxdrv->name);
 	else
 		auxdrv->driver.name = kasprintf(GFP_KERNEL, "%s", modname);
 	if (!auxdrv->driver.name)
diff --git a/include/linux/auxiliary_bus.h b/include/linux/auxiliary_bus.h
index d67b17606210..fc51d45f106b 100644
--- a/include/linux/auxiliary_bus.h
+++ b/include/linux/auxiliary_bus.h
@@ -70,8 +70,8 @@ void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv);
 #define module_auxiliary_driver(__auxiliary_driver) \
 	module_driver(__auxiliary_driver, auxiliary_driver_register, auxiliary_driver_unregister)
 
-struct auxiliary_device *
-auxiliary_find_device(struct device *start, const void *data,
-		      int (*match)(struct device *dev, const void *data));
+struct auxiliary_device *auxiliary_find_device(struct device *start,
+					       const void *data,
+					       int (*match)(struct device *dev, const void *data));
 
 #endif /* _AUXILIARY_BUS_H_ */
-- 
2.29.2

