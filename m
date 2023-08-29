Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A839378CE9C
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 23:12:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37A1EE74;
	Tue, 29 Aug 2023 23:12:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37A1EE74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693343578;
	bh=p13kY0KQ6OS3VxAIfpk8mxVwnhTEHCZGnQJROsTvDBk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bZuchqHjnRNvmIakNthkd474sqCj+E8P2swaWeUa4+JKj2K0lPc+6UzvZOyU97Cxr
	 ju6LimerOFuqjzsO9x/pFHrrUT/sIulsdZnUfuvCL22c81OJ35jvpSGq8ZLVuvc3Kr
	 Cw0C6KGBAmIUGOJz8h2sZ5cF+TgaByssOzEgWMpM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C61D9F805BA; Tue, 29 Aug 2023 23:08:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD1E3F805B5;
	Tue, 29 Aug 2023 23:08:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72D6DF8060D; Tue, 29 Aug 2023 23:08:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B47D5F8055B
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 23:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B47D5F8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=nJLMkOqb
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37TJLkGd026624;
	Tue, 29 Aug 2023 21:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=eZIaIKYDkX93uc12FFvrk5rH+DwbW37vpDohQM+C1Zs=;
 b=nJLMkOqbaag5y58u21Lu3V2+62MtxTm0OP6dRHIVLPsL8IkyfWSkIu1cuWcVvGg4uFpm
 qTxs8ojnw3yhaGNMpzC24w83PDPXG6yGNqMhB3BnbIW4P3xAgFPs0t5AdQDoMju29S+Q
 8P0QZplQLuTtkXyCa9fqO4rgFdZh6F9DyUdvPavdqiQT4lIjSwmOTJ+MDjJGRbdddIfz
 pqZ0qwjkoqtdkr+nZ7wCjUj1wFRH9YeHEpw0rQIBUCMb0QNlOHrZM6VLGlBG2q3yHlUF
 RhlEBYE/Vcs0g/4dFQx2o/A07z2q4HROZUh1YYzNzhG1JxEaooTpCua88HSO+P2RfKv1 jg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3srybqbe66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 21:07:09 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 37TL78NH016157
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 21:07:08 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 29 Aug 2023 14:07:08 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
        <agross@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <quic_jackp@quicinc.com>,
        <quic_plai@quicinc.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v5 03/32] xhci: sideband: add initial api to register a
 sideband entity
Date: Tue, 29 Aug 2023 14:06:28 -0700
Message-ID: <20230829210657.9904-4-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230829210657.9904-1-quic_wcheng@quicinc.com>
References: <20230829210657.9904-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: QAWAoMvS8ylUcqfp47duW5PkU-dvjNOD
X-Proofpoint-GUID: QAWAoMvS8ylUcqfp47duW5PkU-dvjNOD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_15,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308290182
Message-ID-Hash: 56Q4W3RDFLZLP4NU4APEXP3JC2LEOLMQ
X-Message-ID-Hash: 56Q4W3RDFLZLP4NU4APEXP3JC2LEOLMQ
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/56Q4W3RDFLZLP4NU4APEXP3JC2LEOLMQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Mathias Nyman <mathias.nyman@linux.intel.com>

Introduce XHCI sideband, which manages the USB endpoints being requested by
a client driver.  This is used for when client drivers are attempting to
offload USB endpoints to another entity for handling USB transfers.  XHCI
sideband will allow for drivers to fetch the required information about the
transfer ring, so the user can submit transfers independently.  Expose the
required APIs for drivers to register and request for a USB endpoint.

Multiple ring segment page linking and proper endpoint clean up added by
Wesley Cheng to complete original concept code by Mathias Nyman.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Co-developed-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/Kconfig          |   9 ++
 drivers/usb/host/Makefile         |   4 +
 drivers/usb/host/xhci-sideband.c  | 195 ++++++++++++++++++++++++++++++
 drivers/usb/host/xhci.h           |  23 +---
 include/linux/usb/xhci-sideband.h |  57 +++++++++
 5 files changed, 270 insertions(+), 18 deletions(-)
 create mode 100644 drivers/usb/host/xhci-sideband.c
 create mode 100644 include/linux/usb/xhci-sideband.h

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 4448d0ab06f0..83be56c27d64 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -104,6 +104,15 @@ config USB_XHCI_RZV2M
 	  Say 'Y' to enable the support for the xHCI host controller
 	  found in Renesas RZ/V2M SoC.
 
+config USB_XHCI_SIDEBAND
+	bool "xHCI support for sideband"
+	help
+	  Say 'Y' to enable the support for the xHCI sideband capability.
+	  Provide a mechanism for a sideband datapath for payload associated
+	  with audio class endpoints. This allows for an audio DSP to use
+	  xHCI USB endpoints directly, allowing CPU to sleep while playing
+	  audio.
+
 config USB_XHCI_TEGRA
 	tristate "xHCI support for NVIDIA Tegra SoCs"
 	depends on PHY_TEGRA_XUSB
diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
index be4e5245c52f..4df946c05ba0 100644
--- a/drivers/usb/host/Makefile
+++ b/drivers/usb/host/Makefile
@@ -32,6 +32,10 @@ endif
 xhci-rcar-hcd-y				+= xhci-rcar.o
 xhci-rcar-hcd-$(CONFIG_USB_XHCI_RZV2M)	+= xhci-rzv2m.o
 
+ifneq ($(CONFIG_USB_XHCI_SIDEBAND),)
+	xhci-hcd-y		+= xhci-sideband.o
+endif
+
 obj-$(CONFIG_USB_PCI)	+= pci-quirks.o
 
 obj-$(CONFIG_USB_EHCI_HCD)	+= ehci-hcd.o
diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
new file mode 100644
index 000000000000..a077eb8783cc
--- /dev/null
+++ b/drivers/usb/host/xhci-sideband.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * xHCI host controller sideband support
+ *
+ * Copyright (c) 2023, Intel Corporation.
+ *
+ * Author: Mathias Nyman
+ */
+#include <linux/usb.h>
+#include <linux/dma-direct.h>
+
+#include "xhci.h"
+
+static int
+xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring, struct device *dev)
+{
+	struct sg_table	*sgt;
+	struct xhci_segment *seg;
+	struct page **pages;
+	unsigned int n_pages;
+	size_t sz;
+	int i;
+
+	sz = ring->num_segs * TRB_SEGMENT_SIZE;
+	n_pages = PAGE_ALIGN(sz) >> PAGE_SHIFT;
+	pages = kvmalloc_array(n_pages, sizeof(struct page *), GFP_KERNEL);
+	if (!pages)
+		return 0;
+
+	sgt = kzalloc(sizeof(struct sg_table), GFP_KERNEL);
+	if (!sgt) {
+		kvfree(pages);
+		return 0;
+	}
+
+	seg = ring->first_seg;
+
+	/*
+	 * Rings can potentially have multiple segments, create an array that
+	 * carries page references to allocated segments.  Utilize the
+	 * sg_alloc_table_from_pages() to create the sg table, and to ensure
+	 * that page links are created.
+	 */
+	for (i = 0; i < ring->num_segs; i++) {
+		pages[i] = vmalloc_to_page(seg->trbs);
+		seg = seg->next;
+	}
+
+	if (sg_alloc_table_from_pages(sgt, pages, n_pages, 0, sz, GFP_KERNEL)) {
+		kvfree(pages);
+		kfree(sgt);
+
+		return 0;
+	}
+
+	sb->sgt = sgt;
+
+	return 0;
+}
+
+static int __xhci_sideband_remove_endpoint(struct xhci_sideband *sb,
+						int idx)
+{
+	struct xhci_virt_ep *ep = sb->eps[idx];
+
+	/*
+	 * Issue a stop endpoint command when an endpoint is removed.
+	 * The stop ep cmd handler will handle the ring cleanup.
+	 */
+	xhci_stop_endpoint_sync(sb->xhci, ep, 0);
+
+	sg_free_table(sb->sgt);
+	ep->sideband = NULL;
+	sb->eps[idx] = NULL;
+
+	return 0;
+}
+
+/* sidband api functions */
+struct xhci_sideband *
+xhci_sideband_register(struct usb_device *udev)
+{
+	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	struct xhci_virt_device *vdev;
+	struct xhci_sideband *sb;
+
+	/* make sure the usb device is connected to a xhci controller */
+	if (!udev->slot_id)
+		return NULL;
+
+	/* check this device isn't already controller via sideband */
+	vdev = xhci->devs[udev->slot_id];
+
+	if (!vdev || vdev->sideband) {
+		xhci_warn(xhci, "XHCI sideband slot already in use %d\n",
+				udev->slot_id);
+		return NULL;
+	}
+
+	sb = kzalloc_node(sizeof(*sb), GFP_KERNEL, dev_to_node(hcd->self.sysdev));
+	if (!sb)
+		return NULL;
+
+	sb->xhci = xhci;
+	sb->vdev = vdev;
+	vdev->sideband = sb;
+
+	return sb;
+}
+EXPORT_SYMBOL_GPL(xhci_sideband_register);
+
+void
+xhci_sideband_unregister(struct xhci_sideband *sb)
+{
+	int i;
+
+	for (i = 0; i < EP_CTX_PER_DEV; i++)
+		if (sb->eps[i])
+			__xhci_sideband_remove_endpoint(sb, i);
+
+	sb->vdev->sideband = NULL;
+	kfree(sb);
+}
+EXPORT_SYMBOL_GPL(xhci_sideband_unregister);
+
+int
+xhci_sideband_add_endpoint(struct xhci_sideband *sb,
+			   struct usb_host_endpoint *host_ep)
+{
+	struct xhci_hcd *xhci = sb->xhci;
+	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
+	struct xhci_virt_ep *ep;
+	unsigned int ep_index;
+
+	ep_index = xhci_get_endpoint_index(&host_ep->desc);
+	ep = &sb->vdev->eps[ep_index];
+
+	/*
+	 * Note, we don't know the DMA mask of the audio DSP device, if its
+	 * smaller than for xhci it won't be able to access the endpoint ring
+	 * buffer. This could be solved by not allowing the audio class driver
+	 * to add the endpoint the normal way, but instead offload it immediately,
+	 * and let this function add the endpoint and allocate the ring buffer
+	 * with the smallest common DMA mask
+	 */
+	if (sb->eps[ep_index] || ep->sideband)
+		return -EBUSY;
+
+	ep->sideband = sb;
+	sb->eps[ep_index] = ep;
+	sb->ring = ep->ring;
+	xhci_ring_to_sgtable(sb, ep->ring, dev);
+
+	return 0;
+
+}
+EXPORT_SYMBOL_GPL(xhci_sideband_add_endpoint);
+
+int
+xhci_sideband_remove_endpoint(struct xhci_sideband *sb,
+			      struct usb_host_endpoint *host_ep)
+{
+	struct xhci_virt_ep *ep;
+	unsigned int ep_index;
+
+	ep_index = xhci_get_endpoint_index(&host_ep->desc);
+	ep = sb->eps[ep_index];
+
+	if (!ep || !ep->sideband || sb->vdev != ep->sideband->vdev)
+		return -ENODEV;
+
+	__xhci_sideband_remove_endpoint(sb, ep_index);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(xhci_sideband_remove_endpoint);
+
+int
+xhci_sideband_stop_endpoint(struct xhci_sideband *sb,
+			    struct usb_host_endpoint *host_ep)
+{
+	struct xhci_virt_ep *ep;
+	unsigned int ep_index;
+
+	ep_index = xhci_get_endpoint_index(&host_ep->desc);
+	ep = sb->eps[ep_index];
+
+
+	if (!ep || ep->sideband != sb || sb->vdev != ep->sideband->vdev)
+		return -EINVAL;
+
+	return xhci_stop_endpoint_sync(sb->xhci, ep, 0);
+}
+EXPORT_SYMBOL_GPL(xhci_sideband_stop_endpoint);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 898b6434dc27..15ade8ec6b6c 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -18,6 +18,7 @@
 #include <linux/usb/hcd.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/usb/xhci-intr.h>
+#include <linux/usb/xhci-sideband.h>
 
 /* Code sharing between pci-quirks and xhci hcd */
 #include	"xhci-ext-caps.h"
@@ -975,6 +976,8 @@ struct xhci_virt_ep {
 	int			next_frame_id;
 	/* Use new Isoch TRB layout needed for extended TBC support */
 	bool			use_extended_tbc;
+	/* set if this endpoint is controlled via sideband access*/
+	struct xhci_sideband			*sideband;
 };
 
 enum xhci_overhead_type {
@@ -1004,8 +1007,6 @@ struct xhci_interval_bw_table {
 	unsigned int		ss_bw_out;
 };
 
-#define EP_CTX_PER_DEV		31
-
 struct xhci_virt_device {
 	int				slot_id;
 	struct usb_device		*udev;
@@ -1038,6 +1039,8 @@ struct xhci_virt_device {
 	u16				current_mel;
 	/* Used for the debugfs interfaces. */
 	void				*debugfs_private;
+	/* set if this device is registered for sideband access */
+	struct xhci_sideband			*sideband;
 };
 
 /*
@@ -1518,22 +1521,6 @@ static inline const char *xhci_trb_type_string(u8 type)
 #define NEC_FW_MINOR(p)		(((p) >> 0) & 0xff)
 #define NEC_FW_MAJOR(p)		(((p) >> 8) & 0xff)
 
-/*
- * TRBS_PER_SEGMENT must be a multiple of 4,
- * since the command ring is 64-byte aligned.
- * It must also be greater than 16.
- */
-#define TRBS_PER_SEGMENT	256
-/* Allow two commands + a link TRB, along with any reserved command TRBs */
-#define MAX_RSVD_CMD_TRBS	(TRBS_PER_SEGMENT - 3)
-#define TRB_SEGMENT_SIZE	(TRBS_PER_SEGMENT*16)
-#define TRB_SEGMENT_SHIFT	(ilog2(TRB_SEGMENT_SIZE))
-/* TRB buffer pointers can't cross 64KB boundaries */
-#define TRB_MAX_BUFF_SHIFT		16
-#define TRB_MAX_BUFF_SIZE	(1 << TRB_MAX_BUFF_SHIFT)
-/* How much data is left before the 64KB boundary? */
-#define TRB_BUFF_LEN_UP_TO_BOUNDARY(addr)	(TRB_MAX_BUFF_SIZE - \
-					(addr & (TRB_MAX_BUFF_SIZE - 1)))
 #define MAX_SOFT_RETRY		3
 /*
  * Limits of consecutive isoc trbs that can Block Event Interrupt (BEI) if
diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-sideband.h
new file mode 100644
index 000000000000..d6b2cc91666f
--- /dev/null
+++ b/include/linux/usb/xhci-sideband.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * xHCI host controller sideband support
+ *
+ * Copyright (c) 2023, Intel Corporation.
+ *
+ * Author: Mathias Nyman <mathias.nyman@linux.intel.com>
+ */
+
+#ifndef __LINUX_XHCI_SIDEBAND_H  // fixme check ok
+#define __LINUX_XHCI_SIDEBAND_H
+
+#include <linux/dma-mapping.h>
+/*
+ * TRBS_PER_SEGMENT must be a multiple of 4,
+ * since the command ring is 64-byte aligned.
+ * It must also be greater than 16.
+ */
+#define TRBS_PER_SEGMENT	256
+/* Allow two commands + a link TRB, along with any reserved command TRBs */
+#define MAX_RSVD_CMD_TRBS	(TRBS_PER_SEGMENT - 3)
+#define TRB_SEGMENT_SIZE	(TRBS_PER_SEGMENT*16)
+#define TRB_SEGMENT_SHIFT	(ilog2(TRB_SEGMENT_SIZE))
+/* TRB buffer pointers can't cross 64KB boundaries */
+#define TRB_MAX_BUFF_SHIFT		16
+#define TRB_MAX_BUFF_SIZE	(1 << TRB_MAX_BUFF_SHIFT)
+/* How much data is left before the 64KB boundary? */
+#define TRB_BUFF_LEN_UP_TO_BOUNDARY(addr)	(TRB_MAX_BUFF_SIZE - \
+					(addr & (TRB_MAX_BUFF_SIZE - 1)))
+
+#define EP_CTX_PER_DEV		31
+
+struct xhci_sideband {
+	struct xhci_hcd                 *xhci;
+	struct xhci_virt_device         *vdev;
+	struct xhci_virt_ep             *eps[EP_CTX_PER_DEV];
+	struct xhci_interrupter         *ir;
+	struct sg_table			*sgt;
+	struct xhci_ring		*ring;
+	dma_addr_t dma;
+};
+
+struct xhci_sideband *
+xhci_sideband_register(struct usb_device *udev);
+void
+xhci_sideband_unregister(struct xhci_sideband *sb);
+int
+xhci_sideband_add_endpoint(struct xhci_sideband *sb,
+			   struct usb_host_endpoint *host_ep);
+int
+xhci_sideband_remove_endpoint(struct xhci_sideband *sb,
+			      struct usb_host_endpoint *host_ep);
+int
+xhci_sideband_stop_endpoint(struct xhci_sideband *sb,
+			    struct usb_host_endpoint *host_ep);
+#endif /* __LINUX_XHCI_SIDEBAND_H */
+
