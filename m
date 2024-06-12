Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB64904BE4
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 08:48:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE017E82;
	Wed, 12 Jun 2024 08:48:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE017E82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718174933;
	bh=kMKRUMZi3LwsLYnKnwrFIcZsrJQPpEX0yid2nCNeb9c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lcub3aCP2uety98AedxzHEZmFpdNNJr2yN0VbgxVJzJbYKj3o1dQqDB5qpr8mj22l
	 /4vvU3XLPpbUR5cVUKmSZTA4gZb5A9U/cvfa61MaUQEmOrUk0981c3q8PsazTaVgcf
	 0cDwUgGOQA2w2NW8DTCCgAMvHBHUsWeNbyRlbBFo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D1DBF805BF; Wed, 12 Jun 2024 08:48:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B4EDF8058C;
	Wed, 12 Jun 2024 08:48:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3601F80588; Wed, 12 Jun 2024 08:48:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A61CCF80578
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 08:47:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A61CCF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XA6g3G0k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718174879; x=1749710879;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kMKRUMZi3LwsLYnKnwrFIcZsrJQPpEX0yid2nCNeb9c=;
  b=XA6g3G0kdmw7MorqwttZ59bvaLGXuPGiDKBtvkOPVmmU4QfRdorSHj5y
   AYP7ClWlAyIb/JTfdMcc0JlwT0bFDYI6nyml2ssa+aHuK/ipskEXu+F3Z
   YOxAMqYt32LiqmdNXheBJSPexxWhJT5WQ1pmesiuDkKJONGqcVjGHjxu1
   19YJmmIIuNPrQJ21cCoUZjTRjXpFT+y9wJXH2Q4S2Qz/MJUFpWO3xpc70
   8zUwYETNJ6hL2UAs0C/rehv7TCmbtA0aMmjfktSf/zE6diDRuKYC9uExJ
   gwmDkdlPsZriv69LMteazXN0jtFrR00fY7qFGh2err5lNH30C+uO27yu4
   g==;
X-CSE-ConnectionGUID: Zc/+35X/SCKPIFYqqc7vsw==
X-CSE-MsgGUID: 90kjWN9iTBaLcuL8CN232w==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15145893"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000";
   d="scan'208";a="15145893"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 23:47:39 -0700
X-CSE-ConnectionGUID: g5eXDeh/QVGCnIy6nEcnYg==
X-CSE-MsgGUID: bD8F6WK6Tv+6Ka3TOlGgRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000";
   d="scan'208";a="39751209"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.245.246.56])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 23:47:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 1/3] PCI: pci_ids: add INTEL_HDA_PTL
Date: Wed, 12 Jun 2024 08:47:07 +0200
Message-ID: <20240612064709.51141-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240612064709.51141-1-pierre-louis.bossart@linux.intel.com>
References: <20240612064709.51141-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7O2J7JWAB5DFDJU7GEO4ZP4HIEKIW7YP
X-Message-ID-Hash: 7O2J7JWAB5DFDJU7GEO4ZP4HIEKIW7YP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7O2J7JWAB5DFDJU7GEO4ZP4HIEKIW7YP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

More PCI ids for Intel audio.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/linux/pci_ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 942a587bb97e..0168c6a60148 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -3112,6 +3112,7 @@
 #define PCI_DEVICE_ID_INTEL_HDA_LNL_P	0xa828
 #define PCI_DEVICE_ID_INTEL_S21152BB	0xb152
 #define PCI_DEVICE_ID_INTEL_HDA_BMG	0xe2f7
+#define PCI_DEVICE_ID_INTEL_HDA_PTL	0xe428
 #define PCI_DEVICE_ID_INTEL_HDA_CML_R	0xf0c8
 #define PCI_DEVICE_ID_INTEL_HDA_RKL_S	0xf1c8
 
-- 
2.43.0

