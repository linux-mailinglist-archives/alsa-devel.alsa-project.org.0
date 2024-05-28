Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CE28D24A8
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2024 21:31:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3690DEE;
	Tue, 28 May 2024 21:31:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3690DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716924680;
	bh=Z6OKxgSrUBb60RuBVWuMNXGMh/m2BPwjAQIW4pcCv0w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=no48O+khzWUoXEg881yDKzodx3bXY608bMugUsGeNfJYq1xf064mUGrdixjj77g8j
	 vnm7kdy/ayebbLT5NgH6LR4LsaOivvfp2+Kaf8QtNNhcy/qpGmW3fcuw8x6YASAA1j
	 i3JE3Ql7Frov1czddL7sjV7Kbue2RJbbghzL1KXk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD83EF805F6; Tue, 28 May 2024 21:30:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AFD9F805E5;
	Tue, 28 May 2024 21:30:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E67FBF80149; Tue, 28 May 2024 21:30:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3545BF800AC
	for <alsa-devel@alsa-project.org>; Tue, 28 May 2024 21:29:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3545BF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cKM7mB1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716924601; x=1748460601;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z6OKxgSrUBb60RuBVWuMNXGMh/m2BPwjAQIW4pcCv0w=;
  b=cKM7mB1Aa00i75oO9nYnsPZPHJesdypqGuObu/2YxRe+SRWiwtK3HEck
   RaUiLA2jE4QJOLNH+Twpote0uZyB5bD87upfFa8iCY4CnFfw/bI2LJC9S
   EDBKWYyIJqNmaSS4VY2m/EjBZaQ8ZfCY6JeTFvmq4TaKwCN2mi7MfrEaN
   h0/9m/I0Ei/wkwBELOm1MtMBwvy22KYgaNaQnYwOZTMbSJ58Gn8fFowZB
   lwqUvskfdkNdBLhwo9Pw7bU3JI/g0GKeM99mS1xX4hH10BnhKDGKgHG0R
   jQOpdg/09oGGegNTdx/yYhOafD9sz+q0YG/qlf+l4ytfhMFGsB5dCHTf4
   w==;
X-CSE-ConnectionGUID: zomiYKyLRYivNi/JLvcejw==
X-CSE-MsgGUID: PV1JNpzbRryT5akHVXo9Vw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24711840"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000";
   d="scan'208";a="24711840"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 12:29:53 -0700
X-CSE-ConnectionGUID: inouwosHR8CM4lIsH+BWwQ==
X-CSE-MsgGUID: oU18+uUSQoC3Kmgtkw20Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000";
   d="scan'208";a="35246717"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.237])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 12:29:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	rafael@kernel.org,
	vkoul@kernel.org,
	andriy.shevchenko@linux.intel.com,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org (open list:ACPI),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] ACPI: utils: introduce acpi_get_local_u64_address()
Date: Tue, 28 May 2024 14:29:33 -0500
Message-ID: <20240528192936.16180-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240528192936.16180-1-pierre-louis.bossart@linux.intel.com>
References: <20240528192936.16180-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WCKSNMZWSTL3SV3DTJZ3HBHX5RNDX6N3
X-Message-ID-Hash: WCKSNMZWSTL3SV3DTJZ3HBHX5RNDX6N3
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WCKSNMZWSTL3SV3DTJZ3HBHX5RNDX6N3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The ACPI _ADR is a 64-bit value. We changed the definitions in commit
ca6f998cf9a2 ("ACPI: bus: change _ADR representation to 64 bits") but
some helpers still assume the value is a 32-bit value.

This patch adds a new helper to extract the full 64-bits. The existing
32-bit helper is kept for backwards-compatibility and cases where the
_ADR is known to fit in a 32-bit value.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/acpi/utils.c | 22 ++++++++++++++++------
 include/linux/acpi.h |  1 +
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/acpi/utils.c b/drivers/acpi/utils.c
index 202234ba54bd..ae9384282273 100644
--- a/drivers/acpi/utils.c
+++ b/drivers/acpi/utils.c
@@ -277,15 +277,25 @@ acpi_evaluate_integer(acpi_handle handle,
 
 EXPORT_SYMBOL(acpi_evaluate_integer);
 
+int acpi_get_local_u64_address(acpi_handle handle, u64 *addr)
+{
+	acpi_status status;
+
+	status = acpi_evaluate_integer(handle, METHOD_NAME__ADR, NULL, addr);
+	if (ACPI_FAILURE(status))
+		return -ENODATA;
+	return 0;
+}
+EXPORT_SYMBOL(acpi_get_local_u64_address);
+
 int acpi_get_local_address(acpi_handle handle, u32 *addr)
 {
-	unsigned long long adr;
-	acpi_status status;
-
-	status = acpi_evaluate_integer(handle, METHOD_NAME__ADR, NULL, &adr);
-	if (ACPI_FAILURE(status))
-		return -ENODATA;
+	u64 adr;
+	int ret;
 
+	ret = acpi_get_local_u64_address(handle, &adr);
+	if (ret < 0)
+		return ret;
 	*addr = (u32)adr;
 	return 0;
 }
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 28c3fb2bef0d..65e7177bcb02 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -761,6 +761,7 @@ static inline u64 acpi_arch_get_root_pointer(void)
 }
 #endif
 
+int acpi_get_local_u64_address(acpi_handle handle, u64 *addr);
 int acpi_get_local_address(acpi_handle handle, u32 *addr);
 const char *acpi_get_subsystem_id(acpi_handle handle);
 
-- 
2.43.0

