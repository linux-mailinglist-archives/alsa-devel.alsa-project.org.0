Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A18CF7A0472
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 14:52:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1B5D846;
	Thu, 14 Sep 2023 14:51:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1B5D846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694695943;
	bh=k4H1kCDpxdvBelZv86gyII9rf1L8hcN6IJKE4EGFcSs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SPMrS0iLhezaRJkZilfR4OkBYuRjClzKUHtX1Mi5dw7ju/EBd9r0GMlbJIt3FUxh3
	 vitEzVeEMIsPSjfTVWUJ2mCOexsktt5RG9Q0dEEwVHQxufGhwGZmJPheYFnUXsUScB
	 SxlnGvQylGwwCbbtuz/wVXm2atgMSp4K/OzUBE7Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72BCFF80552; Thu, 14 Sep 2023 14:51:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AADDF80431;
	Thu, 14 Sep 2023 14:51:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C268F80431; Thu, 14 Sep 2023 14:51:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93EE3F80141
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 14:51:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93EE3F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=b5KkS0CL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694695876; x=1726231876;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=k4H1kCDpxdvBelZv86gyII9rf1L8hcN6IJKE4EGFcSs=;
  b=b5KkS0CLKKD2Xjy17WVegh0DA8Za3cK7CsoP6tj9KHDsWc7urh0w+/qZ
   a/q+nbRHM7oPAjk/LvYCgoh/pQqZ1P00P7nBFwVs52Ntpmt7UWPi24Mde
   tEcHjROQr9wZn5l4S+9UZS0gF7mXsTY5QADwOPc8Fj/a/akWij4cus8yM
   bLC4MkTNnN/O14eluHac3qZJEQubj1u26xht8IdvhHpjIpeyiWQVbp8Tm
   W3Z5yhuDJ4Gdr2zHRT0PifG0YBJwrToEEJjlS+FoH3qR1HGaAh5mI/eW0
   7k2I5B6T5xZ4Bnh10j7VUeKf35goWfZ7Ln1uTnC9QfALbZ8EH17s0QALi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="369212284"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000";
   d="scan'208";a="369212284"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 05:51:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="810044354"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000";
   d="scan'208";a="810044354"
Received: from pakurapo-mobl3.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.37.8])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 05:51:10 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc4: Dump the payload also when set_get_data
 fails
Date: Thu, 14 Sep 2023 15:51:15 +0300
Message-ID: <20230914125115.30904-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TLTIC7BPXTECXMOFGBJ7QWMJFDG7ELU4
X-Message-ID-Hash: TLTIC7BPXTECXMOFGBJ7QWMJFDG7ELU4
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TLTIC7BPXTECXMOFGBJ7QWMJFDG7ELU4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move the out label to dump the message payload when the IPC message fails.
The payload contains important information on what might have caused the
error in firmware.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index ab6eddd91bb7..9744627d6978 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -513,10 +513,10 @@ static int sof_ipc4_set_get_data(struct snd_sof_dev *sdev, void *data,
 	if (!set && payload_bytes != offset)
 		ipc4_msg->data_size = offset;
 
+out:
 	if (sof_debug_check_flag(SOF_DBG_DUMP_IPC_MESSAGE_PAYLOAD))
 		sof_ipc4_dump_payload(sdev, ipc4_msg->data_ptr, ipc4_msg->data_size);
 
-out:
 	mutex_unlock(&sdev->ipc->tx_mutex);
 
 	return ret;
-- 
2.42.0

