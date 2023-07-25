Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEB376057F
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 04:36:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F168C83B;
	Tue, 25 Jul 2023 04:35:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F168C83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690252576;
	bh=lK6jrcQ52S/pEGdG42iy9sHbDwwkz+tQ2BoKI8vxQks=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qgt6cTry3QuKUXmlTl531YI48AZhLbZREM8YwPyB0kzbIo1qjQUl5Q431YDsWNDSc
	 45Y4jP4KfEvTrqeVeKRbOm6yWkwHn2xYOJxMBTE3z5S0xbGqETMo13Z9OY4cfIQTCF
	 ROGvh64JPwVnPF9rTlrYw1/Wd9IIOXdH4gOtx3jg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E361EF801F5; Tue, 25 Jul 2023 04:34:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79FF8F8057C;
	Tue, 25 Jul 2023 04:34:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E252F80571; Tue, 25 Jul 2023 04:34:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 566E6F80149
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 04:34:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 566E6F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=V1y7jFx6
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36P2McYn010627;
	Tue, 25 Jul 2023 02:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=gUJb9HeB5zlA0fqkHLSGTxvRzCdQ5UPJR7W6sUUQ3PY=;
 b=V1y7jFx66Feactv9uIUw6xxWl6qktgXxCrBcGXZe6eCGTJT1H7I9foa/a8+g6CPzzMaX
 iha7TnA0l3jlrNeRZVQ1dWWv1M4ovmrmI2VBrxf79CC29EaMtB3gHsN/NXdiAAkDPBge
 VVvw5xFJFp+IeO1zxpJG1bkxn87IkvdXoQ78N4IJkdclaWVtkQKdWFN/LwDvGGRYI9hR
 r8L499BEo0GpTuxDBwYnMCDutOZetxfo7pxUK/+5uvtpFfPqlKgokAbjjoI1QAHr943j
 COTPs2g/r44gulqias0amL8RO/039PM3iKl2fd88k32gtOI00Rissyz/JPzCRblKGeLK 5g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s1qa3suau-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 02:34:31 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 36P2YUfr012391
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 02:34:30 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 24 Jul 2023 19:34:29 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <agross@kernel.org>, <andersson@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <srinivas.kandagatla@linaro.org>,
        <bgoswami@quicinc.com>, <Thinh.Nguyen@synopsys.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <quic_jackp@quicinc.com>, <pierre-louis.bossart@linux.intel.com>,
        <oneukum@suse.com>, <albertccwang@google.com>,
        <o-takashi@sakamocchi.jp>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v4 01/32] xhci: add support to allocate several interrupters
Date: Mon, 24 Jul 2023 19:33:45 -0700
Message-ID: <20230725023416.11205-2-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230725023416.11205-1-quic_wcheng@quicinc.com>
References: <20230725023416.11205-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: LwpikAG-ifQKMI5ish-l33HjriXUeuA-
X-Proofpoint-GUID: LwpikAG-ifQKMI5ish-l33HjriXUeuA-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_18,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1011 mlxlogscore=699
 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307250020
Message-ID-Hash: WEKWE7ALOC7QL3JEKWGR2BRRIOBBCQY3
X-Message-ID-Hash: WEKWE7ALOC7QL3JEKWGR2BRRIOBBCQY3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WEKWE7ALOC7QL3JEKWGR2BRRIOBBCQY3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Mathias Nyman <mathias.nyman@linux.intel.com>

Modify the XHCI drivers to accommodate for handling multiple event rings in
case there are multiple interrupters.  Add the required APIs so clients are
able to allocate/request for an interrupter ring, and pass this information
back to the client driver.  This allows for users to handle the resource
accordingly, such as passing the event ring base address to an audio DSP.
There is no actual support for multiple MSI/MSI-X vectors.

Factoring out XHCI interrupter APIs and structures done by Wesley Cheng, in
order to allow for USB class drivers to utilze them.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Co-developed-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi.rej | 14 ++++
 arch/arm64/configs/defconfig.rej         | 24 ++++++
 drivers/usb/host/xhci-debugfs.c          |  2 +-
 drivers/usb/host/xhci-mem.c              | 93 ++++++++++++++++++++++--
 drivers/usb/host/xhci-ring.c             |  2 +-
 drivers/usb/host/xhci.c                  | 49 ++++++++-----
 drivers/usb/host/xhci.h                  | 77 +-------------------
 include/linux/usb/xhci-intr.h            | 86 ++++++++++++++++++++++
 8 files changed, 245 insertions(+), 102 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8350.dtsi.rej
 create mode 100644 arch/arm64/configs/defconfig.rej
 create mode 100644 include/linux/usb/xhci-intr.h

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi.rej b/arch/arm64/boot/dts/qcom/sm8350.dtsi.rej
new file mode 100644
index 000000000000..e96ef1120160
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi.rej
@@ -0,0 +1,14 @@
+--- arch/arm64/boot/dts/qcom/sm8350.dtsi
++++ arch/arm64/boot/dts/qcom/sm8350.dtsi
+@@ -2254,9 +2254,9 @@
+ 				iommus = <&apps_smmu 0x0 0x0>;
+ 				snps,dis_u2_susphy_quirk;
+ 				snps,dis_enblslpm_quirk;
+-				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
++				phys = <&usb_1_hsphy>, <&usb_1_qmpphy>;
+ 				phy-names = "usb2-phy", "usb3-phy";
+-
++				dr_mode = "host";
+ 				ports {
+ 					#address-cells = <1>;
+ 					#size-cells = <0>;
diff --git a/arch/arm64/configs/defconfig.rej b/arch/arm64/configs/defconfig.rej
new file mode 100644
index 000000000000..c98a9b0e8290
--- /dev/null
+++ b/arch/arm64/configs/defconfig.rej
@@ -0,0 +1,24 @@
+--- arch/arm64/configs/defconfig
++++ arch/arm64/configs/defconfig
+@@ -241,7 +210,7 @@ CONFIG_BLK_DEV_NBD=m
+ CONFIG_VIRTIO_BLK=y
+ CONFIG_BLK_DEV_NVME=m
+ CONFIG_QCOM_COINCELL=m
+-CONFIG_QCOM_FASTRPC=m
++CONFIG_QCOM_FASTRPC=y
+ CONFIG_SRAM=y
+ CONFIG_PCI_ENDPOINT_TEST=m
+ CONFIG_EEPROM_AT24=m
+@@ -1254,10 +1204,10 @@ CONFIG_PHY_MVEBU_CP110_COMPHY=y
+ CONFIG_PHY_MTK_TPHY=y
+ CONFIG_PHY_QCOM_EDP=m
+ CONFIG_PHY_QCOM_PCIE2=m
+-CONFIG_PHY_QCOM_QMP=m
++CONFIG_PHY_QCOM_QMP=y
+ CONFIG_PHY_QCOM_QUSB2=m
+ CONFIG_PHY_QCOM_USB_HS=m
+-CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
++CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=y
+ CONFIG_PHY_QCOM_USB_HS_28NM=m
+ CONFIG_PHY_QCOM_USB_SS=m
+ CONFIG_PHY_R8A779F0_ETHERNET_SERDES=y
diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index 99baa60ef50f..15a8402ee8a1 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -693,7 +693,7 @@ void xhci_debugfs_init(struct xhci_hcd *xhci)
 				     "command-ring",
 				     xhci->debugfs_root);
 
-	xhci_debugfs_create_ring_dir(xhci, &xhci->interrupter->event_ring,
+	xhci_debugfs_create_ring_dir(xhci, &xhci->interrupters[0]->event_ring,
 				     "event-ring",
 				     xhci->debugfs_root);
 
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 19a402123de0..c51150af22f2 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1840,6 +1840,26 @@ xhci_free_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 	kfree(ir);
 }
 
+void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrupter *ir)
+{
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	unsigned int intr_num;
+
+	/* interrupter 0 is primary interrupter, don't touch it */
+	if (!ir || !ir->intr_num || ir->intr_num >= xhci->max_interrupters) {
+		xhci_dbg(xhci, "Invalid secondary interrupter, can't remove\n");
+		return;
+	}
+
+	/* fixme, should we check xhci->interrupter[intr_num] == ir */
+	spin_lock(&xhci->lock);
+	intr_num = ir->intr_num;
+	xhci_free_interrupter(xhci, ir);
+	xhci->interrupters[intr_num] = NULL;
+	spin_unlock(&xhci->lock);
+}
+EXPORT_SYMBOL_GPL(xhci_remove_secondary_interrupter);
+
 void xhci_mem_cleanup(struct xhci_hcd *xhci)
 {
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
@@ -1847,9 +1867,13 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 
 	cancel_delayed_work_sync(&xhci->cmd_timer);
 
-	xhci_free_interrupter(xhci, xhci->interrupter);
-	xhci->interrupter = NULL;
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Freed primary event ring");
+	for (i = 0; i < xhci->max_interrupters; i++) {
+		if (xhci->interrupters[i]) {
+			xhci_free_interrupter(xhci, xhci->interrupters[i]);
+			xhci->interrupters[i] = NULL;
+		}
+	}
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Freed interrupters");
 
 	if (xhci->cmd_ring)
 		xhci_ring_free(xhci, xhci->cmd_ring);
@@ -1919,6 +1943,7 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	for (i = 0; i < xhci->num_port_caps; i++)
 		kfree(xhci->port_caps[i].psi);
 	kfree(xhci->port_caps);
+	kfree(xhci->interrupters);
 	xhci->num_port_caps = 0;
 
 	xhci->usb2_rhub.ports = NULL;
@@ -1927,6 +1952,7 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	xhci->rh_bw = NULL;
 	xhci->ext_caps = NULL;
 	xhci->port_caps = NULL;
+	xhci->interrupters = NULL;
 
 	xhci->page_size = 0;
 	xhci->page_shift = 0;
@@ -2279,6 +2305,13 @@ xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
 		return -EINVAL;
 	}
 
+	if (xhci->interrupters[intr_num]) {
+		xhci_warn(xhci, "Interrupter %d\n already set up", intr_num);
+		return -EINVAL;
+	}
+
+	xhci->interrupters[intr_num] = ir;
+	ir->intr_num = intr_num;
 	ir->ir_set = &xhci->run_regs->ir_set[intr_num];
 
 	/* set ERST count with the number of entries in the segment table */
@@ -2298,10 +2331,53 @@ xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
 	return 0;
 }
 
+struct xhci_interrupter *
+xhci_create_secondary_interrupter(struct usb_hcd *hcd)
+{
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	struct xhci_interrupter *ir;
+	unsigned int i;
+	int err = -ENOSPC;
+
+	if (!xhci->interrupters)
+		return NULL;
+
+	ir = xhci_alloc_interrupter(xhci, GFP_KERNEL);
+	if (!ir)
+		return NULL;
+
+	spin_lock_irq(&xhci->lock);
+
+	/* Find available secondary interrupter, interrupter 0 is reserverd for primary */
+	for (i = 1; i < xhci->max_interrupters; i++) {
+		if (xhci->interrupters[i] == NULL) {
+			err = xhci_add_interrupter(xhci, ir, i);
+			break;
+		}
+	}
+
+	spin_unlock_irq(&xhci->lock);
+
+	if (!err) {
+		xhci_dbg(xhci, "Add secondary interrupter %d, max interrupters %d\n",
+			 i, xhci->max_interrupters);
+		return ir;
+	}
+
+	xhci_warn(xhci, "Failed to add secondary interrupter, max interrupters %d\n",
+		  xhci->max_interrupters);
+
+	xhci_free_interrupter(xhci, ir);
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(xhci_create_secondary_interrupter);
+
 int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 {
-	dma_addr_t	dma;
+	struct xhci_interrupter *ir;
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
+	dma_addr_t	dma;
 	unsigned int	val, val2;
 	u64		val_64;
 	u32		page_size, temp;
@@ -2425,11 +2501,14 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	/* Allocate and set up primary interrupter 0 with an event ring. */
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 		       "Allocating primary event ring");
-	xhci->interrupter = xhci_alloc_interrupter(xhci, flags);
-	if (!xhci->interrupter)
+	xhci->interrupters = kcalloc_node(xhci->max_interrupters, sizeof(*xhci->interrupters),
+					  flags, dev_to_node(dev));
+
+	ir = xhci_alloc_interrupter(xhci, flags);
+	if (!ir)
 		goto fail;
 
-	if (xhci_add_interrupter(xhci, xhci->interrupter, 0))
+	if (xhci_add_interrupter(xhci, ir, 0))
 		goto fail;
 
 	xhci->isoc_bei_interval = AVOID_BEI_INTERVAL_MAX;
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 646ff125def5..56f45408dc0c 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3097,7 +3097,7 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 	writel(status, &xhci->op_regs->status);
 
 	/* This is the handler of the primary interrupter */
-	ir = xhci->interrupter;
+	ir = xhci->interrupters[0];
 	if (!hcd->msi_enabled) {
 		u32 irq_pending;
 		irq_pending = readl(&ir->ir_set->irq_pending);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 5b73a7d281ed..58d75b412bad 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -456,7 +456,7 @@ static int xhci_init(struct usb_hcd *hcd)
 
 static int xhci_run_finished(struct xhci_hcd *xhci)
 {
-	struct xhci_interrupter *ir = xhci->interrupter;
+	struct xhci_interrupter *ir = xhci->interrupters[0];
 	unsigned long	flags;
 	u32		temp;
 
@@ -508,7 +508,7 @@ int xhci_run(struct usb_hcd *hcd)
 	u64 temp_64;
 	int ret;
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
-	struct xhci_interrupter *ir = xhci->interrupter;
+	struct xhci_interrupter *ir = xhci->interrupters[0];
 	/* Start the xHCI host controller running only after the USB 2.0 roothub
 	 * is setup.
 	 */
@@ -572,7 +572,7 @@ void xhci_stop(struct usb_hcd *hcd)
 {
 	u32 temp;
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
-	struct xhci_interrupter *ir = xhci->interrupter;
+	struct xhci_interrupter *ir = xhci->interrupters[0];
 
 	mutex_lock(&xhci->mutex);
 
@@ -668,36 +668,49 @@ EXPORT_SYMBOL_GPL(xhci_shutdown);
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
@@ -1058,7 +1071,7 @@ int xhci_resume(struct xhci_hcd *xhci, pm_message_t msg)
 		xhci_dbg(xhci, "// Disabling event ring interrupts\n");
 		temp = readl(&xhci->op_regs->status);
 		writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
-		xhci_disable_interrupter(xhci->interrupter);
+		xhci_disable_interrupter(xhci->interrupters[0]);
 
 		xhci_dbg(xhci, "cleaning up memory\n");
 		xhci_mem_cleanup(xhci);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 7e282b4522c0..d706a27ec0a3 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -17,6 +17,7 @@
 #include <linux/kernel.h>
 #include <linux/usb/hcd.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/usb/xhci-intr.h>
 
 /* Code sharing between pci-quirks and xhci hcd */
 #include	"xhci-ext-caps.h"
@@ -1541,18 +1542,6 @@ static inline const char *xhci_trb_type_string(u8 type)
 #define AVOID_BEI_INTERVAL_MIN	8
 #define AVOID_BEI_INTERVAL_MAX	32
 
-struct xhci_segment {
-	union xhci_trb		*trbs;
-	/* private to HCD */
-	struct xhci_segment	*next;
-	dma_addr_t		dma;
-	/* Max packet sized bounce buffer for td-fragmant alignment */
-	dma_addr_t		bounce_dma;
-	void			*bounce_buf;
-	unsigned int		bounce_offs;
-	unsigned int		bounce_len;
-};
-
 enum xhci_cancelled_td_status {
 	TD_DIRTY = 0,
 	TD_HALTED,
@@ -1585,16 +1574,6 @@ struct xhci_cd {
 	union xhci_trb		*cmd_trb;
 };
 
-enum xhci_ring_type {
-	TYPE_CTRL = 0,
-	TYPE_ISOC,
-	TYPE_BULK,
-	TYPE_INTR,
-	TYPE_STREAM,
-	TYPE_COMMAND,
-	TYPE_EVENT,
-};
-
 static inline const char *xhci_ring_type_string(enum xhci_ring_type type)
 {
 	switch (type) {
@@ -1615,46 +1594,6 @@ static inline const char *xhci_ring_type_string(enum xhci_ring_type type)
 	}
 
 	return "UNKNOWN";
-}
-
-struct xhci_ring {
-	struct xhci_segment	*first_seg;
-	struct xhci_segment	*last_seg;
-	union  xhci_trb		*enqueue;
-	struct xhci_segment	*enq_seg;
-	union  xhci_trb		*dequeue;
-	struct xhci_segment	*deq_seg;
-	struct list_head	td_list;
-	/*
-	 * Write the cycle state into the TRB cycle field to give ownership of
-	 * the TRB to the host controller (if we are the producer), or to check
-	 * if we own the TRB (if we are the consumer).  See section 4.9.1.
-	 */
-	u32			cycle_state;
-	unsigned int		stream_id;
-	unsigned int		num_segs;
-	unsigned int		num_trbs_free; /* used only by xhci DbC */
-	unsigned int		bounce_buf_len;
-	enum xhci_ring_type	type;
-	bool			last_td_was_short;
-	struct radix_tree_root	*trb_address_map;
-};
-
-struct xhci_erst_entry {
-	/* 64-bit event ring segment address */
-	__le64	seg_addr;
-	__le32	seg_size;
-	/* Set to zero */
-	__le32	rsvd;
-};
-
-struct xhci_erst {
-	struct xhci_erst_entry	*entries;
-	unsigned int		num_entries;
-	/* xhci->event_ring keeps track of segment dma addresses */
-	dma_addr_t		erst_dma_addr;
-	/* Num entries the ERST can contain */
-	unsigned int		erst_size;
 };
 
 struct xhci_scratchpad {
@@ -1707,18 +1646,6 @@ struct xhci_bus_state {
 	unsigned long		resuming_ports;
 };
 
-struct xhci_interrupter {
-	struct xhci_ring	*event_ring;
-	struct xhci_erst	erst;
-	struct xhci_intr_reg __iomem *ir_set;
-	unsigned int		intr_num;
-	/* For interrupter registers save and restore over suspend/resume */
-	u32	s3_irq_pending;
-	u32	s3_irq_control;
-	u32	s3_erst_size;
-	u64	s3_erst_base;
-	u64	s3_erst_dequeue;
-};
 /*
  * It can take up to 20 ms to transition from RExit to U0 on the
  * Intel Lynx Point LP xHCI host.
@@ -1799,7 +1726,7 @@ struct xhci_hcd {
 	struct reset_control *reset;
 	/* data structures */
 	struct xhci_device_context_array *dcbaa;
-	struct xhci_interrupter *interrupter;
+	struct xhci_interrupter **interrupters;
 	struct xhci_ring	*cmd_ring;
 	unsigned int            cmd_ring_state;
 #define CMD_RING_STATE_RUNNING         (1 << 0)
diff --git a/include/linux/usb/xhci-intr.h b/include/linux/usb/xhci-intr.h
new file mode 100644
index 000000000000..e0091ee2c73a
--- /dev/null
+++ b/include/linux/usb/xhci-intr.h
@@ -0,0 +1,86 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_XHCI_INTR_H
+#define __LINUX_XHCI_INTR_H
+
+#include <linux/kernel.h>
+
+struct xhci_erst_entry {
+	/* 64-bit event ring segment address */
+	__le64	seg_addr;
+	__le32	seg_size;
+	/* Set to zero */
+	__le32	rsvd;
+};
+
+enum xhci_ring_type {
+	TYPE_CTRL = 0,
+	TYPE_ISOC,
+	TYPE_BULK,
+	TYPE_INTR,
+	TYPE_STREAM,
+	TYPE_COMMAND,
+	TYPE_EVENT,
+};
+
+struct xhci_erst {
+	struct xhci_erst_entry	*entries;
+	unsigned int		num_entries;
+	/* xhci->event_ring keeps track of segment dma addresses */
+	dma_addr_t		erst_dma_addr;
+	/* Num entries the ERST can contain */
+	unsigned int		erst_size;
+};
+
+struct xhci_segment {
+	union xhci_trb		*trbs;
+	/* private to HCD */
+	struct xhci_segment	*next;
+	dma_addr_t		dma;
+	/* Max packet sized bounce buffer for td-fragmant alignment */
+	dma_addr_t		bounce_dma;
+	void			*bounce_buf;
+	unsigned int		bounce_offs;
+	unsigned int		bounce_len;
+};
+
+struct xhci_ring {
+	struct xhci_segment	*first_seg;
+	struct xhci_segment	*last_seg;
+	union  xhci_trb		*enqueue;
+	struct xhci_segment	*enq_seg;
+	union  xhci_trb		*dequeue;
+	struct xhci_segment	*deq_seg;
+	struct list_head	td_list;
+	/*
+	 * Write the cycle state into the TRB cycle field to give ownership of
+	 * the TRB to the host controller (if we are the producer), or to check
+	 * if we own the TRB (if we are the consumer).  See section 4.9.1.
+	 */
+	u32			cycle_state;
+	unsigned int		stream_id;
+	unsigned int		num_segs;
+	unsigned int		num_trbs_free;
+	unsigned int		num_trbs_free_temp;
+	unsigned int		bounce_buf_len;
+	enum xhci_ring_type	type;
+	bool			last_td_was_short;
+	struct radix_tree_root	*trb_address_map;
+};
+
+struct xhci_interrupter {
+	struct xhci_ring	*event_ring;
+	struct xhci_erst	erst;
+	struct xhci_intr_reg __iomem *ir_set;
+	unsigned int		intr_num;
+	/* For interrupter registers save and restore over suspend/resume */
+	u32	s3_irq_pending;
+	u32	s3_irq_control;
+	u32	s3_erst_size;
+	u64	s3_erst_base;
+	u64	s3_erst_dequeue;
+};
+
+struct xhci_interrupter *
+xhci_create_secondary_interrupter(struct usb_hcd *hcd);
+void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrupter *ir);
+#endif
