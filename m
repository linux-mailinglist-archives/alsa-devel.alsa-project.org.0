Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C01067C35D
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 04:17:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C393832;
	Thu, 26 Jan 2023 04:16:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C393832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674703021;
	bh=DTNbY1ExuCiI5UkuDzSg73TZC7vMevRGlGtC76NdKbc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BbO5IeyF2j1KNH0sUTx00+iITc+pYfpdOAEq9ZM4j5u9MpTmXruWm1c3Y+9uf3x+F
	 JqftvkS3auuKY394WpB5CS4T/gCCqpd16TiZgcHzbNBeO738Uhu0evRjQXh0R9u/fE
	 8WbOiP/1aMSNONSnkURW6A2ID20wlXKy7Bs7bVus=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B60CF8057A;
	Thu, 26 Jan 2023 04:15:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BC2EF800AE; Thu, 26 Jan 2023 04:14:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
 version=3.4.6
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0CF4F800AE
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 04:14:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0CF4F800AE
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=uYTQ6yww
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1674702886; x=1706238886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=YnjTkVHuxQtGQzjc/gDmzlIOB8H4c7tQDGmebubRFf4=;
 b=uYTQ6ywwAOCC/Wqz4Ym+QL9OjSufIOeLKIoaO9sqBWVQ3lxh/UsbGnOL
 rHky8vyrofthHUO2S9E5vlnR/y+bkC6CjOneh1URzisEcCYwtUugAn1Km
 p/YiTxxIIz/A+QVFoikJsMjTU09tNHUMCwJpvZAv54HgpIIV+MvJLQz2t U=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 25 Jan 2023 19:14:39 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.45.79.139])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 19:14:39 -0800
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 25 Jan 2023 19:14:38 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
 <perex@perex.cz>, <lgirdwood@gmail.com>, <andersson@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
 <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>, <bgoswami@quicinc.com>,
 <tiwai@suse.com>, <robh+dt@kernel.org>, <agross@kernel.org>
Subject: [RFC PATCH v2 02/22] xhci: remove xhci_test_trb_in_td_math early
 development check
Date: Wed, 25 Jan 2023 19:14:04 -0800
Message-ID: <20230126031424.14582-3-quic_wcheng@quicinc.com>
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

Time to remove this test trb in td math check that was added
in early stage of xhci driver deveopment.

It verified that the size, alignment and boundaries of the event and
command rings the driver itself allocated are correct.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 160 ------------------------------------
 1 file changed, 160 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 679befa97c7a..bf9bb29f924b 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1929,164 +1929,6 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	xhci->usb3_rhub.bus_state.bus_suspended = 0;
 }
 
-static int xhci_test_trb_in_td(struct xhci_hcd *xhci,
-		struct xhci_segment *input_seg,
-		union xhci_trb *start_trb,
-		union xhci_trb *end_trb,
-		dma_addr_t input_dma,
-		struct xhci_segment *result_seg,
-		char *test_name, int test_number)
-{
-	unsigned long long start_dma;
-	unsigned long long end_dma;
-	struct xhci_segment *seg;
-
-	start_dma = xhci_trb_virt_to_dma(input_seg, start_trb);
-	end_dma = xhci_trb_virt_to_dma(input_seg, end_trb);
-
-	seg = trb_in_td(xhci, input_seg, start_trb, end_trb, input_dma, false);
-	if (seg != result_seg) {
-		xhci_warn(xhci, "WARN: %s TRB math test %d failed!\n",
-				test_name, test_number);
-		xhci_warn(xhci, "Tested TRB math w/ seg %p and "
-				"input DMA 0x%llx\n",
-				input_seg,
-				(unsigned long long) input_dma);
-		xhci_warn(xhci, "starting TRB %p (0x%llx DMA), "
-				"ending TRB %p (0x%llx DMA)\n",
-				start_trb, start_dma,
-				end_trb, end_dma);
-		xhci_warn(xhci, "Expected seg %p, got seg %p\n",
-				result_seg, seg);
-		trb_in_td(xhci, input_seg, start_trb, end_trb, input_dma,
-			  true);
-		return -1;
-	}
-	return 0;
-}
-
-/* TRB math checks for xhci_trb_in_td(), using the command and event rings. */
-static int xhci_check_trb_in_td_math(struct xhci_hcd *xhci)
-{
-	struct {
-		dma_addr_t		input_dma;
-		struct xhci_segment	*result_seg;
-	} simple_test_vector [] = {
-		/* A zeroed DMA field should fail */
-		{ 0, NULL },
-		/* One TRB before the ring start should fail */
-		{ xhci->event_ring->first_seg->dma - 16, NULL },
-		/* One byte before the ring start should fail */
-		{ xhci->event_ring->first_seg->dma - 1, NULL },
-		/* Starting TRB should succeed */
-		{ xhci->event_ring->first_seg->dma, xhci->event_ring->first_seg },
-		/* Ending TRB should succeed */
-		{ xhci->event_ring->first_seg->dma + (TRBS_PER_SEGMENT - 1)*16,
-			xhci->event_ring->first_seg },
-		/* One byte after the ring end should fail */
-		{ xhci->event_ring->first_seg->dma + (TRBS_PER_SEGMENT - 1)*16 + 1, NULL },
-		/* One TRB after the ring end should fail */
-		{ xhci->event_ring->first_seg->dma + (TRBS_PER_SEGMENT)*16, NULL },
-		/* An address of all ones should fail */
-		{ (dma_addr_t) (~0), NULL },
-	};
-	struct {
-		struct xhci_segment	*input_seg;
-		union xhci_trb		*start_trb;
-		union xhci_trb		*end_trb;
-		dma_addr_t		input_dma;
-		struct xhci_segment	*result_seg;
-	} complex_test_vector [] = {
-		/* Test feeding a valid DMA address from a different ring */
-		{	.input_seg = xhci->event_ring->first_seg,
-			.start_trb = xhci->event_ring->first_seg->trbs,
-			.end_trb = &xhci->event_ring->first_seg->trbs[TRBS_PER_SEGMENT - 1],
-			.input_dma = xhci->cmd_ring->first_seg->dma,
-			.result_seg = NULL,
-		},
-		/* Test feeding a valid end TRB from a different ring */
-		{	.input_seg = xhci->event_ring->first_seg,
-			.start_trb = xhci->event_ring->first_seg->trbs,
-			.end_trb = &xhci->cmd_ring->first_seg->trbs[TRBS_PER_SEGMENT - 1],
-			.input_dma = xhci->cmd_ring->first_seg->dma,
-			.result_seg = NULL,
-		},
-		/* Test feeding a valid start and end TRB from a different ring */
-		{	.input_seg = xhci->event_ring->first_seg,
-			.start_trb = xhci->cmd_ring->first_seg->trbs,
-			.end_trb = &xhci->cmd_ring->first_seg->trbs[TRBS_PER_SEGMENT - 1],
-			.input_dma = xhci->cmd_ring->first_seg->dma,
-			.result_seg = NULL,
-		},
-		/* TRB in this ring, but after this TD */
-		{	.input_seg = xhci->event_ring->first_seg,
-			.start_trb = &xhci->event_ring->first_seg->trbs[0],
-			.end_trb = &xhci->event_ring->first_seg->trbs[3],
-			.input_dma = xhci->event_ring->first_seg->dma + 4*16,
-			.result_seg = NULL,
-		},
-		/* TRB in this ring, but before this TD */
-		{	.input_seg = xhci->event_ring->first_seg,
-			.start_trb = &xhci->event_ring->first_seg->trbs[3],
-			.end_trb = &xhci->event_ring->first_seg->trbs[6],
-			.input_dma = xhci->event_ring->first_seg->dma + 2*16,
-			.result_seg = NULL,
-		},
-		/* TRB in this ring, but after this wrapped TD */
-		{	.input_seg = xhci->event_ring->first_seg,
-			.start_trb = &xhci->event_ring->first_seg->trbs[TRBS_PER_SEGMENT - 3],
-			.end_trb = &xhci->event_ring->first_seg->trbs[1],
-			.input_dma = xhci->event_ring->first_seg->dma + 2*16,
-			.result_seg = NULL,
-		},
-		/* TRB in this ring, but before this wrapped TD */
-		{	.input_seg = xhci->event_ring->first_seg,
-			.start_trb = &xhci->event_ring->first_seg->trbs[TRBS_PER_SEGMENT - 3],
-			.end_trb = &xhci->event_ring->first_seg->trbs[1],
-			.input_dma = xhci->event_ring->first_seg->dma + (TRBS_PER_SEGMENT - 4)*16,
-			.result_seg = NULL,
-		},
-		/* TRB not in this ring, and we have a wrapped TD */
-		{	.input_seg = xhci->event_ring->first_seg,
-			.start_trb = &xhci->event_ring->first_seg->trbs[TRBS_PER_SEGMENT - 3],
-			.end_trb = &xhci->event_ring->first_seg->trbs[1],
-			.input_dma = xhci->cmd_ring->first_seg->dma + 2*16,
-			.result_seg = NULL,
-		},
-	};
-
-	unsigned int num_tests;
-	int i, ret;
-
-	num_tests = ARRAY_SIZE(simple_test_vector);
-	for (i = 0; i < num_tests; i++) {
-		ret = xhci_test_trb_in_td(xhci,
-				xhci->event_ring->first_seg,
-				xhci->event_ring->first_seg->trbs,
-				&xhci->event_ring->first_seg->trbs[TRBS_PER_SEGMENT - 1],
-				simple_test_vector[i].input_dma,
-				simple_test_vector[i].result_seg,
-				"Simple", i);
-		if (ret < 0)
-			return ret;
-	}
-
-	num_tests = ARRAY_SIZE(complex_test_vector);
-	for (i = 0; i < num_tests; i++) {
-		ret = xhci_test_trb_in_td(xhci,
-				complex_test_vector[i].input_seg,
-				complex_test_vector[i].start_trb,
-				complex_test_vector[i].end_trb,
-				complex_test_vector[i].input_dma,
-				complex_test_vector[i].result_seg,
-				"Complex", i);
-		if (ret < 0)
-			return ret;
-	}
-	xhci_dbg(xhci, "TRB math tests passed.\n");
-	return 0;
-}
-
 static void xhci_set_hc_event_deq(struct xhci_hcd *xhci)
 {
 	u64 temp;
@@ -2506,8 +2348,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 					0, flags);
 	if (!xhci->event_ring)
 		goto fail;
-	if (xhci_check_trb_in_td_math(xhci) < 0)
-		goto fail;
 
 	ret = xhci_alloc_erst(xhci, xhci->event_ring, &xhci->erst, flags);
 	if (ret)
