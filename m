Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8020267C365
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 04:18:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1011884B;
	Thu, 26 Jan 2023 04:17:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1011884B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674703121;
	bh=QUh1sFl92SS6gOcan7wQ/TUi02sTMiF1RqMUKxK9Llk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sfI2/qBaEGXEUP2sMLnhtCkPUhevFCTue7uSC3utACrcvfbU23x83gF4Zn/Xj4pxe
	 FgnoSgbuuPJIx/OVgYs8CYhtQpFVdxNKan/SoMlIALvwwGlIH2lCKGjuseX5OqVJtB
	 GKZr//hyGSwY5C8c3ip8kf8iVyTOUkZcFQuNkkG4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 569ECF80508;
	Thu, 26 Jan 2023 04:15:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FD12F805B5; Thu, 26 Jan 2023 04:15:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
 version=3.4.6
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FD26F8053D
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 04:14:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FD26F8053D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=bwsahz5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1674702888; x=1706238888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=hfiPgKvzjZwkMX/Yp7b1WkmuzfwbKyPbUhif802Ho3w=;
 b=bwsahz5Ey4I7KIAWZWf7nvp+ge0JvA5zvqzCCOJOV+Vc636Y8OgztbR9
 +4ZDX4OtszHZVNNoLKWoE52h9ol9if6kAfBNZV5Y0S9+ee73Vmk1u9SJ1
 u0gYvbtKYsv9/Y5cTY8UY6+h5MPBEGL7MOdBi2QvvxTKcXO0zTgD/+DhG k=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 25 Jan 2023 19:14:41 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.45.79.139])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 19:14:41 -0800
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 25 Jan 2023 19:14:40 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
 <perex@perex.cz>, <lgirdwood@gmail.com>, <andersson@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
 <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>, <bgoswami@quicinc.com>,
 <tiwai@suse.com>, <robh+dt@kernel.org>, <agross@kernel.org>
Subject: [RFC PATCH v2 04/22] xhci: Add support to allocate several
 interrupters
Date: Wed, 25 Jan 2023 19:14:06 -0800
Message-ID: <20230126031424.14582-5-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230126031424.14582-1-quic_wcheng@quicinc.com>
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mathias Nyman <mathias.nyman@linux.intel.com>, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_jackp@quicinc.com, quic_plai@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Mathias Nyman <mathias.nyman@linux.intel.com>

Introduce xHCI APIs to allow for clients to allocate and free
interrupters.  This allocates an array of interrupters, which is based on
the max_interrupters parameter.  The primary interrupter is set as the
first entry in the array, and secondary interrupters following after.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-debugfs.c |  2 +-
 drivers/usb/host/xhci-mem.c     | 97 +++++++++++++++++++++++++++++++--
 drivers/usb/host/xhci-ring.c    |  2 +-
 drivers/usb/host/xhci.c         | 55 ++++++++++++-------
 drivers/usb/host/xhci.h         |  2 +-
 include/linux/usb/xhci-intr.h   |  4 ++
 6 files changed, 134 insertions(+), 28 deletions(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index 0bc7fe11f749..06a42b68446f 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -692,7 +692,7 @@ void xhci_debugfs_init(struct xhci_hcd *xhci)
 				     "command-ring",
 				     xhci->debugfs_root);
 
-	xhci_debugfs_create_ring_dir(xhci, &xhci->interrupter->event_ring,
+	xhci_debugfs_create_ring_dir(xhci, &xhci->interrupters[0]->event_ring,
 				     "event-ring",
 				     xhci->debugfs_root);
 
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 2acd41a18190..45ac77a5d8e4 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1854,6 +1854,30 @@ xhci_free_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 	kfree(ir);
 }
 
+/*
+ * Free a secondary interrupter slot.  This will allow for other users to request for
+ * the secondary interrupter in the future.
+ */
+void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrupter *ir)
+{
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	unsigned int intr_num;
+	unsigned long flags;
+
+	if (!ir || !ir->intr_num || ir->intr_num > xhci->max_interrupters) {
+		xhci_dbg(xhci, "Invalid secondary interrupter, can't remove\n");
+		return;
+	}
+
+	/* fixme, shuld we check xhci->interrupter[intr_num] == ir */
+	intr_num = ir->intr_num;
+	xhci_free_interrupter(xhci, ir);
+	spin_lock_irqsave(&xhci->lock, flags);
+	xhci->interrupters[intr_num] = NULL;
+	spin_unlock_irqrestore(&xhci->lock, flags);
+}
+EXPORT_SYMBOL_GPL(xhci_remove_secondary_interrupter);
+
 void xhci_mem_cleanup(struct xhci_hcd *xhci)
 {
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
@@ -1861,8 +1885,15 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 
 	cancel_delayed_work_sync(&xhci->cmd_timer);
 
-	xhci_free_interrupter(xhci, xhci->interrupter);
-	xhci->interrupter = NULL;
+	for (i = 1; i < xhci->max_interrupters; i++) {
+		if (xhci->interrupters[i])
+			xhci_remove_secondary_interrupter(xhci_to_hcd(xhci),
+							  xhci->interrupters[i]);
+	}
+
+	/* free the primary interrupter, interrupter number 0 */
+	xhci_free_interrupter(xhci, xhci->interrupters[0]);
+	xhci->interrupters[0] = NULL;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Freed primary event ring");
 
 	if (xhci->cmd_ring)
@@ -1933,6 +1964,7 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	for (i = 0; i < xhci->num_port_caps; i++)
 		kfree(xhci->port_caps[i].psi);
 	kfree(xhci->port_caps);
+	kfree(xhci->interrupters);
 	xhci->num_port_caps = 0;
 
 	xhci->usb2_rhub.ports = NULL;
@@ -1941,6 +1973,7 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	xhci->rh_bw = NULL;
 	xhci->ext_caps = NULL;
 	xhci->port_caps = NULL;
+	xhci->interrupters = NULL;
 
 	xhci->page_size = 0;
 	xhci->page_shift = 0;
@@ -2251,7 +2284,7 @@ xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int intr_num, gfp_t flags
 		return NULL;
 	}
 
-	if (xhci->interrupter) {
+	if (xhci->interrupters[intr_num]) {
 		xhci_warn(xhci, "Can't allocate already set up interrupter %d\n", intr_num);
 		return NULL;
 	}
@@ -2298,6 +2331,56 @@ xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int intr_num, gfp_t flags
 	return NULL;
 }
 
+/*
+ * Allocate a XHCI secondary interrupter slot.  If the user requests a specific intr
+ * number, then check if the slot is available.  Otherwise, fetch the first available
+ * entry within the interrupter array.
+ */
+struct xhci_interrupter *
+xhci_create_secondary_interrupter(struct usb_hcd *hcd, int intr_num)
+{
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	struct xhci_interrupter *ir;
+	unsigned int i;
+	unsigned int idx = 0;
+	unsigned long flags;
+
+	if (!xhci->interrupters || intr_num > xhci->max_interrupters)
+		return NULL;
+
+	spin_lock_irqsave(&xhci->lock, flags);
+	/* find available secondary interrupter, interrupter 0 is reserved for primary */
+	if (intr_num > 0) {
+		idx = intr_num;
+	} else {
+		for (i = 1; i < xhci->max_interrupters; i++) {
+			if (xhci->interrupters[i] == NULL) {
+				idx = i;
+				break;
+			}
+		}
+	}
+
+	if (idx > 0) {
+		ir = xhci_alloc_interrupter(xhci, idx, GFP_KERNEL);
+		if (!ir) {
+			spin_unlock_irqrestore(&xhci->lock, flags);
+			return NULL;
+		}
+		ir->intr_num = idx;
+		xhci->interrupters[idx] = ir;
+		spin_unlock_irqrestore(&xhci->lock, flags);
+
+		return ir;
+	}
+	spin_unlock_irqrestore(&xhci->lock, flags);
+	xhci_warn(xhci, "Can't add new secondary interrupter, max interrupters %d\n",
+		  xhci->max_interrupters);
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(xhci_create_secondary_interrupter);
+
 int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 {
 	dma_addr_t	dma;
@@ -2422,8 +2505,12 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	/* allocate and set up primary interrupter with an event ring. */
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 		       "Allocating primary event ring");
-	xhci->interrupter = xhci_alloc_interrupter(xhci, 0, flags);
-	if (!xhci->interrupter)
+
+	xhci->interrupters = kcalloc_node(xhci->max_interrupters, sizeof(*xhci->interrupters),
+					  flags, dev_to_node(dev));
+
+	xhci->interrupters[0] = xhci_alloc_interrupter(xhci, 0, flags);
+	if (!xhci->interrupters[0])
 		goto fail;
 
 	xhci->isoc_bei_interval = AVOID_BEI_INTERVAL_MAX;
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 993c2dc2cd1a..2c20ccdc95bc 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3055,7 +3055,7 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 	writel(status, &xhci->op_regs->status);
 
 	/* This is the handler of the primary interrupter */
-	ir = xhci->interrupter;
+	ir = xhci->interrupters[0];
 	if (!hcd->msi_enabled) {
 		u32 irq_pending;
 		irq_pending = readl(&ir->ir_set->irq_pending);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 8b19c6ea3d16..003c6cc2fb55 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -613,7 +613,7 @@ static int xhci_init(struct usb_hcd *hcd)
 
 static int xhci_run_finished(struct xhci_hcd *xhci)
 {
-	struct xhci_interrupter *ir = xhci->interrupter;
+	struct xhci_interrupter *ir = xhci->interrupters[0];
 	unsigned long	flags;
 	u32		temp;
 
@@ -666,7 +666,7 @@ int xhci_run(struct usb_hcd *hcd)
 	u64 temp_64;
 	int ret;
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
-	struct xhci_interrupter *ir = xhci->interrupter;
+	struct xhci_interrupter *ir = xhci->interrupters[0];
 	/* Start the xHCI host controller running only after the USB 2.0 roothub
 	 * is setup.
 	 */
@@ -770,8 +770,8 @@ static void xhci_stop(struct usb_hcd *hcd)
 			"// Disabling event ring interrupts");
 	temp = readl(&xhci->op_regs->status);
 	writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
-	temp = readl(&xhci->interrupter->ir_set->irq_pending);
-	writel(ER_IRQ_DISABLE(temp), &xhci->interrupter->ir_set->irq_pending);
+	temp = readl(&xhci->interrupters[0]->ir_set->irq_pending);
+	writel(ER_IRQ_DISABLE(temp), &xhci->interrupters[0]->ir_set->irq_pending);
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "cleaning up memory");
 	xhci_mem_cleanup(xhci);
@@ -833,36 +833,51 @@ EXPORT_SYMBOL_GPL(xhci_shutdown);
 #ifdef CONFIG_PM
 static void xhci_save_registers(struct xhci_hcd *xhci)
 {
-	struct xhci_interrupter *ir = xhci->interrupter;
+	struct xhci_interrupter *ir;
+	unsigned int i;
 
 	xhci->s3.command = readl(&xhci->op_regs->command);
 	xhci->s3.dev_nt = readl(&xhci->op_regs->dev_notification);
 	xhci->s3.dcbaa_ptr = xhci_read_64(xhci, &xhci->op_regs->dcbaa_ptr);
 	xhci->s3.config_reg = readl(&xhci->op_regs->config_reg);
 
-	if (!ir)
-		return;
+	/* save both primary and all secondary interrupters */
+	/* fixme, shold we lock  to prevent race with remove secondary interrupter? */
+	for (i = 0; i < xhci->max_interrupters; i++) {
+		ir = xhci->interrupters[i];
+		if (!ir)
+			continue;
 
-	ir->s3_erst_size = readl(&ir->ir_set->erst_size);
-	ir->s3_erst_base = xhci_read_64(xhci, &ir->ir_set->erst_base);
-	ir->s3_erst_dequeue = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
-	ir->s3_irq_pending = readl(&ir->ir_set->irq_pending);
-	ir->s3_irq_control = readl(&ir->ir_set->irq_control);
+		ir->s3_erst_size = readl(&ir->ir_set->erst_size);
+		ir->s3_erst_base = xhci_read_64(xhci, &ir->ir_set->erst_base);
+		ir->s3_erst_dequeue = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
+		ir->s3_irq_pending = readl(&ir->ir_set->irq_pending);
+		ir->s3_irq_control = readl(&ir->ir_set->irq_control);
+	}
 }
 
 static void xhci_restore_registers(struct xhci_hcd *xhci)
 {
-	struct xhci_interrupter *ir = xhci->interrupter;
+	struct xhci_interrupter *ir;
+	unsigned int i;
 
 	writel(xhci->s3.command, &xhci->op_regs->command);
 	writel(xhci->s3.dev_nt, &xhci->op_regs->dev_notification);
 	xhci_write_64(xhci, xhci->s3.dcbaa_ptr, &xhci->op_regs->dcbaa_ptr);
 	writel(xhci->s3.config_reg, &xhci->op_regs->config_reg);
-	writel(ir->s3_erst_size, &ir->ir_set->erst_size);
-	xhci_write_64(xhci, ir->s3_erst_base, &ir->ir_set->erst_base);
-	xhci_write_64(xhci, ir->s3_erst_dequeue, &ir->ir_set->erst_dequeue);
-	writel(ir->s3_irq_pending, &ir->ir_set->irq_pending);
-	writel(ir->s3_irq_control, &ir->ir_set->irq_control);
+
+	/* FIXME should we lock to protect against freeing of interrupters */
+	for (i = 0; i < xhci->max_interrupters; i++) {
+		ir = xhci->interrupters[i];
+		if (!ir)
+			continue;
+
+		writel(ir->s3_erst_size, &ir->ir_set->erst_size);
+		xhci_write_64(xhci, ir->s3_erst_base, &ir->ir_set->erst_base);
+		xhci_write_64(xhci, ir->s3_erst_dequeue, &ir->ir_set->erst_dequeue);
+		writel(ir->s3_irq_pending, &ir->ir_set->irq_pending);
+		writel(ir->s3_irq_control, &ir->ir_set->irq_control);
+	}
 }
 
 static void xhci_set_cmd_ring_deq(struct xhci_hcd *xhci)
@@ -1227,8 +1242,8 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 		xhci_dbg(xhci, "// Disabling event ring interrupts\n");
 		temp = readl(&xhci->op_regs->status);
 		writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
-		temp = readl(&xhci->interrupter->ir_set->irq_pending);
-		writel(ER_IRQ_DISABLE(temp), &xhci->interrupter->ir_set->irq_pending);
+		temp = readl(&xhci->interrupters[0]->ir_set->irq_pending);
+		writel(ER_IRQ_DISABLE(temp), &xhci->interrupters[0]->ir_set->irq_pending);
 
 		xhci_dbg(xhci, "cleaning up memory\n");
 		xhci_mem_cleanup(xhci);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index af356cc3b50b..f45cbfb79cea 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1726,7 +1726,7 @@ struct xhci_hcd {
 	struct reset_control *reset;
 	/* data structures */
 	struct xhci_device_context_array *dcbaa;
-	struct xhci_interrupter *interrupter;
+	struct xhci_interrupter **interrupters;
 	struct xhci_ring	*cmd_ring;
 	unsigned int            cmd_ring_state;
 #define CMD_RING_STATE_RUNNING         (1 << 0)
diff --git a/include/linux/usb/xhci-intr.h b/include/linux/usb/xhci-intr.h
index 9b3fcc9a1842..738b0f0481a6 100644
--- a/include/linux/usb/xhci-intr.h
+++ b/include/linux/usb/xhci-intr.h
@@ -79,4 +79,8 @@ struct xhci_interrupter {
 	u64	s3_erst_base;
 	u64	s3_erst_dequeue;
 };
+
+struct xhci_interrupter *
+xhci_create_secondary_interrupter(struct usb_hcd *hcd, int intr_num);
+void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrupter *ir);
 #endif
