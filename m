Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E27D27605E8
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 04:44:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CB97F00;
	Tue, 25 Jul 2023 04:43:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CB97F00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690253056;
	bh=xxmsN0S5sodx367a8ziS6rZ0KUAEQRqfpBwQH5aUmEM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZElxf42VyWOUDCBj27/K93FGlVeWX5Q9x5GOVH8chEIt4E+UwsBuWVNwSTCYvGwe6
	 W6WAwNuzgiS57wTuGuDUZloY5rgjY7Mhq7hTkbhSSkwx8dQJylalh+cSIJw+GfTZz6
	 o9d2jDtzW2qHwk6PMR1HG7Lq4P20Yh99EnEVsiUA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A279F805A1; Tue, 25 Jul 2023 04:36:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71004F806C6;
	Tue, 25 Jul 2023 04:36:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D949F806A7; Tue, 25 Jul 2023 04:36:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B071F80587
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 04:34:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B071F80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=YuzWtmSD
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36P20MTg010539;
	Tue, 25 Jul 2023 02:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=29NLIw+H5LDwCkEEPDf5wgBGQfWcfB2YWb8BBRJILZ4=;
 b=YuzWtmSDgR5mCFdRQ7pHT30JyLvSmOgnrsdHrmmTXWKYC9YeQymldF0PQDpgwHqHKbuF
 0UVm5Lm7hqca2SCwpCkp7kd9elRt04OiZXLCAnnTSVplTBxV+t6/M+fsejY1K9E5oX4d
 6TE1R/CapIfBZMFgrNCznIIqvmaBmQxoLYULxufBs0k+WSYl7mKntb3eAL1kGvanP20Q
 GzMt4ihoYIY0YqebI6ZSvpEslqrymoOSBI2lJvnTEM9xOuOQmlB6aC98LU1B7yaLnWG4
 wO6MXs2hRp9XN6PFuX/lmKKrxkwaCU+LLzame/dVsbRrkX+zD7Qnc1IKg2hbXjZFYAPT Bg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s1rs5hn7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 02:34:57 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 36P2YVgC020001
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 02:34:31 GMT
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
Subject: [PATCH v4 02/32] xhci: add helper to stop endpoint and wait for
 completion
Date: Mon, 24 Jul 2023 19:33:46 -0700
Message-ID: <20230725023416.11205-3-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: 5g7YNjASXvQgmxhJey8uZNu_N53_9zNy
X-Proofpoint-ORIG-GUID: 5g7YNjASXvQgmxhJey8uZNu_N53_9zNy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_18,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 mlxscore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307250021
Message-ID-Hash: G2UJIHWS2H322F3Z4KDTKSYUNZP53MXG
X-Message-ID-Hash: G2UJIHWS2H322F3Z4KDTKSYUNZP53MXG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G2UJIHWS2H322F3Z4KDTKSYUNZP53MXG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Mathias Nyman <mathias.nyman@linux.intel.com>

Expose xhci_stop_endpoint_sync() which is a synchronous variant of
xhci_queue_stop_endpoint().  This is useful for client drivers that are
using the secondary interrupters, and need to stop/clean up the current
session.  The stop endpoint command handler will also take care of cleaning
up the ring.

Modifications to repurpose the new API into existing stop endpoint
sequences was implemented by Wesley Cheng.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Co-developed-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-hub.c | 29 +++---------------
 drivers/usb/host/xhci.c     | 60 +++++++++++++++++++++++++++----------
 drivers/usb/host/xhci.h     |  2 ++
 3 files changed, 50 insertions(+), 41 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 0054d02239e2..2f7309bdc922 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -489,7 +489,6 @@ EXPORT_SYMBOL_GPL(xhci_find_slot_id_by_port);
 static int xhci_stop_device(struct xhci_hcd *xhci, int slot_id, int suspend)
 {
 	struct xhci_virt_device *virt_dev;
-	struct xhci_command *cmd;
 	unsigned long flags;
 	int ret;
 	int i;
@@ -501,10 +500,6 @@ static int xhci_stop_device(struct xhci_hcd *xhci, int slot_id, int suspend)
 
 	trace_xhci_stop_device(virt_dev);
 
-	cmd = xhci_alloc_command(xhci, true, GFP_NOIO);
-	if (!cmd)
-		return -ENOMEM;
-
 	spin_lock_irqsave(&xhci->lock, flags);
 	for (i = LAST_EP_INDEX; i > 0; i--) {
 		if (virt_dev->eps[i].ring && virt_dev->eps[i].ring->dequeue) {
@@ -521,7 +516,7 @@ static int xhci_stop_device(struct xhci_hcd *xhci, int slot_id, int suspend)
 			if (!command) {
 				spin_unlock_irqrestore(&xhci->lock, flags);
 				ret = -ENOMEM;
-				goto cmd_cleanup;
+				goto out;
 			}
 
 			ret = xhci_queue_stop_endpoint(xhci, command, slot_id,
@@ -529,30 +524,14 @@ static int xhci_stop_device(struct xhci_hcd *xhci, int slot_id, int suspend)
 			if (ret) {
 				spin_unlock_irqrestore(&xhci->lock, flags);
 				xhci_free_command(xhci, command);
-				goto cmd_cleanup;
+				goto out;
 			}
 		}
 	}
-	ret = xhci_queue_stop_endpoint(xhci, cmd, slot_id, 0, suspend);
-	if (ret) {
-		spin_unlock_irqrestore(&xhci->lock, flags);
-		goto cmd_cleanup;
-	}
-
-	xhci_ring_cmd_db(xhci);
 	spin_unlock_irqrestore(&xhci->lock, flags);
+	ret = xhci_stop_endpoint_sync(xhci, &virt_dev->eps[0], suspend);
 
-	/* Wait for last stop endpoint command to finish */
-	wait_for_completion(cmd->completion);
-
-	if (cmd->status == COMP_COMMAND_ABORTED ||
-	    cmd->status == COMP_COMMAND_RING_STOPPED) {
-		xhci_warn(xhci, "Timeout while waiting for stop endpoint command\n");
-		ret = -ETIME;
-	}
-
-cmd_cleanup:
-	xhci_free_command(xhci, cmd);
+out:
 	return ret;
 }
 
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 58d75b412bad..21413721f278 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -2764,6 +2764,46 @@ static int xhci_reserve_bandwidth(struct xhci_hcd *xhci,
 	return -ENOMEM;
 }
 
+/*
+ * Synchronous XHCI stop endpoint helper.  Issues the stop endpoint command and
+ * waits for the command completion before returning.
+ */
+int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep, int suspend)
+{
+	struct xhci_command *command;
+	unsigned long flags;
+	int ret;
+
+	command = xhci_alloc_command(xhci, true, GFP_KERNEL);
+	if (!command)
+		return -ENOMEM;
+
+	spin_lock_irqsave(&xhci->lock, flags);
+	ret = xhci_queue_stop_endpoint(xhci, command, ep->vdev->slot_id,
+				       ep->ep_index, suspend);
+	if (ret < 0) {
+		spin_unlock_irqrestore(&xhci->lock, flags);
+		goto out;
+	}
+
+	xhci_ring_cmd_db(xhci);
+	spin_unlock_irqrestore(&xhci->lock, flags);
+
+	ret = wait_for_completion_timeout(command->completion, msecs_to_jiffies(3000));
+	if (!ret)
+		xhci_warn(xhci, "%s: Unable to stop endpoint.\n",
+				__func__);
+
+	if (command->status == COMP_COMMAND_ABORTED ||
+	    command->status == COMP_COMMAND_RING_STOPPED) {
+		xhci_warn(xhci, "Timeout while waiting for stop endpoint command\n");
+		ret = -ETIME;
+	}
+out:
+	xhci_free_command(xhci, command);
+
+	return ret;
+}
 
 /* Issue a configure endpoint command or evaluate context command
  * and wait for it to finish.
@@ -3084,7 +3124,7 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
 	struct xhci_virt_device *vdev;
 	struct xhci_virt_ep *ep;
 	struct xhci_input_control_ctx *ctrl_ctx;
-	struct xhci_command *stop_cmd, *cfg_cmd;
+	struct xhci_command *cfg_cmd;
 	unsigned int ep_index;
 	unsigned long flags;
 	u32 ep_flag;
@@ -3124,10 +3164,6 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
 	if (ep_flag == SLOT_FLAG || ep_flag == EP0_FLAG)
 		return;
 
-	stop_cmd = xhci_alloc_command(xhci, true, GFP_NOWAIT);
-	if (!stop_cmd)
-		return;
-
 	cfg_cmd = xhci_alloc_command_with_ctx(xhci, true, GFP_NOWAIT);
 	if (!cfg_cmd)
 		goto cleanup;
@@ -3150,23 +3186,16 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
 		goto cleanup;
 	}
 
-	err = xhci_queue_stop_endpoint(xhci, stop_cmd, udev->slot_id,
-					ep_index, 0);
+	spin_unlock_irqrestore(&xhci->lock, flags);
+
+	err = xhci_stop_endpoint_sync(xhci, ep, 0);
 	if (err < 0) {
-		spin_unlock_irqrestore(&xhci->lock, flags);
-		xhci_free_command(xhci, cfg_cmd);
 		xhci_dbg(xhci, "%s: Failed to queue stop ep command, %d ",
 				__func__, err);
 		goto cleanup;
 	}
 
-	xhci_ring_cmd_db(xhci);
-	spin_unlock_irqrestore(&xhci->lock, flags);
-
-	wait_for_completion(stop_cmd->completion);
-
 	spin_lock_irqsave(&xhci->lock, flags);
-
 	/* config ep command clears toggle if add and drop ep flags are set */
 	ctrl_ctx = xhci_get_input_control_ctx(cfg_cmd->in_ctx);
 	if (!ctrl_ctx) {
@@ -3198,7 +3227,6 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
 
 	xhci_free_command(xhci, cfg_cmd);
 cleanup:
-	xhci_free_command(xhci, stop_cmd);
 	spin_lock_irqsave(&xhci->lock, flags);
 	if (ep->ep_state & EP_SOFT_CLEAR_TOGGLE)
 		ep->ep_state &= ~EP_SOFT_CLEAR_TOGGLE;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index d706a27ec0a3..898b6434dc27 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2125,6 +2125,8 @@ void xhci_ring_doorbell_for_active_rings(struct xhci_hcd *xhci,
 void xhci_cleanup_command_queue(struct xhci_hcd *xhci);
 void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring);
 unsigned int count_trbs(u64 addr, u64 len);
+int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
+			    int suspend);
 
 /* xHCI roothub code */
 void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
