Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F92780C21
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 14:50:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7410CE0F;
	Fri, 18 Aug 2023 14:49:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7410CE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692363003;
	bh=h8D8prpzFVb8pmoROCBC14TQAB6C6aLdWCdLdOp8XIg=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mXoo9o73N/UbrzXixUlQAVRtzHRnKRsFzY9RTh+bH+7P+iI18Ar0yqVkIfWZIuXet
	 OfVSKiYflZxnLRFSB6ghc3QkFJaYkwxD4WothMxlo8jjYi6kiDWAn1Ev0rQihtr2vt
	 QYtBO63i6rvRssxk/jaSUZEEjDxIcuysBCat9ATI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA784F801EB; Fri, 18 Aug 2023 14:49:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AB8EF8016D;
	Fri, 18 Aug 2023 14:49:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09B80F801EB; Fri, 18 Aug 2023 14:49:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 908E4F800EE
	for <alsa-devel@alsa-project.org>; Fri, 18 Aug 2023 14:49:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 908E4F800EE
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RS1qV39wGz1GDV1;
	Fri, 18 Aug 2023 20:47:34 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 18 Aug
 2023 20:48:57 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <yuehaibing@huawei.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] ALSA: asihpi: Remove unused declarations
Date: Fri, 18 Aug 2023 20:48:52 +0800
Message-ID: <20230818124852.51468-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
Message-ID-Hash: 2ZUHJZHGGNGWJRPXZY6U5FLRFNRV47MV
X-Message-ID-Hash: 2ZUHJZHGGNGWJRPXZY6U5FLRFNRV47MV
X-MailFrom: yuehaibing@huawei.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2ZUHJZHGGNGWJRPXZY6U5FLRFNRV47MV/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These are not implemented, so can remove them.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 sound/pci/asihpi/hpi.h          | 16 ----------------
 sound/pci/asihpi/hpi_internal.h |  5 -----
 2 files changed, 21 deletions(-)

diff --git a/sound/pci/asihpi/hpi.h b/sound/pci/asihpi/hpi.h
index 3aebec763fb8..04a5cf6572cd 100644
--- a/sound/pci/asihpi/hpi.h
+++ b/sound/pci/asihpi/hpi.h
@@ -1191,19 +1191,6 @@ u16 hpi_adapter_set_mode_ex(u16 adapter_index, u32 adapter_mode,
 
 u16 hpi_adapter_get_mode(u16 adapter_index, u32 *padapter_mode);
 
-u16 hpi_adapter_get_assert2(u16 adapter_index, u16 *p_assert_count,
-	char *psz_assert, u32 *p_param1, u32 *p_param2,
-	u32 *p_dsp_string_addr, u16 *p_processor_id);
-
-u16 hpi_adapter_test_assert(u16 adapter_index, u16 assert_id);
-
-u16 hpi_adapter_enable_capability(u16 adapter_index, u16 capability, u32 key);
-
-u16 hpi_adapter_self_test(u16 adapter_index);
-
-u16 hpi_adapter_debug_read(u16 adapter_index, u32 dsp_address, char *p_bytes,
-	int *count_bytes);
-
 u16 hpi_adapter_set_property(u16 adapter_index, u16 property, u16 paramter1,
 	u16 paramter2);
 
@@ -1488,9 +1475,6 @@ u16 hpi_pad_get_program_type(u32 h_control, u32 *ppTY);
 
 u16 hpi_pad_get_rdsPI(u32 h_control, u32 *ppI);
 
-u16 hpi_pad_get_program_type_string(u32 h_control, const u32 data_type,
-	const u32 pTY, char *psz_string, const u32 string_length);
-
 /****************************/
 /* AES/EBU Receiver control */
 /****************************/
diff --git a/sound/pci/asihpi/hpi_internal.h b/sound/pci/asihpi/hpi_internal.h
index 6859d51389f5..e569e3b33b8e 100644
--- a/sound/pci/asihpi/hpi_internal.h
+++ b/sound/pci/asihpi/hpi_internal.h
@@ -1394,17 +1394,12 @@ u32 hpi_indexes_to_handle(const char c_object, const u16 adapter_index,
 void hpi_send_recv(struct hpi_message *phm, struct hpi_response *phr);
 
 /* used in PnP OS/driver */
-u16 hpi_subsys_create_adapter(const struct hpi_resource *p_resource,
-	u16 *pw_adapter_index);
-
 u16 hpi_outstream_host_buffer_get_info(u32 h_outstream, u8 **pp_buffer,
 	struct hpi_hostbuffer_status **pp_status);
 
 u16 hpi_instream_host_buffer_get_info(u32 h_instream, u8 **pp_buffer,
 	struct hpi_hostbuffer_status **pp_status);
 
-u16 hpi_adapter_restart(u16 adapter_index);
-
 /*
 The following 3 functions were last declared in header files for
 driver 3.10. HPI_ControlQuery() used to be the recommended way
-- 
2.34.1

