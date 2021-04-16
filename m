Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8050D36286C
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 21:13:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D77916F0;
	Fri, 16 Apr 2021 21:13:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D77916F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618600432;
	bh=SbDgKC5C14LcVPEjHyiLDr2jDAen6ULn36r04kNxyjg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mLbp1MG2KPFpiB7XJKnnRK1A4crpJIVX0bNSDWYY6H5ZFmgd3h4rPRVEN5hXnCq/7
	 a/uqNEpu0eQaVYDnDaNWbW4q8lMnPyMbFvfniyh2c5WHV4tx1XacoJojTNpw9+jwkV
	 Fppn+8X1TRINTLE0999BCfnlqj/TtOAzLn/p0WTg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF8A9F800FF;
	Fri, 16 Apr 2021 21:12:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65F23F8032D; Fri, 16 Apr 2021 21:12:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 317A5F80128
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 21:11:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 317A5F80128
IronPort-SDR: StE/aQ4TQ9pSB2WAIOhF8/CpidXqqHf0KgKthl3ZHn3AoFLSb+BqXqj2k5GhTp96mGPZ4q6j0b
 7zJGdKNp1dew==
X-IronPort-AV: E=McAfee;i="6200,9189,9956"; a="256407096"
X-IronPort-AV: E=Sophos;i="5.82,228,1613462400"; d="scan'208";a="256407096"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 12:11:57 -0700
IronPort-SDR: NXtFHQOr9B+Qxy4nJmHyj6DJ6cEs3JNJqPP9/3EuS+3IiS2fNi2sPl0KSgSB8gRXAZvqayPZhn
 Ivx6dUDV+JDQ==
X-IronPort-AV: E=Sophos;i="5.82,228,1613462400"; d="scan'208";a="612838739"
Received: from paulsoum-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.66.118])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 12:11:56 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/5] ASoC: soc-acpi: remove useless initialization
Date: Fri, 16 Apr 2021 14:11:40 -0500
Message-Id: <20210416191144.27006-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416191144.27006-1-pierre-louis.bossart@linux.intel.com>
References: <20210416191144.27006-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

cppcheck warning:

sound/soc/soc-acpi.c:37:21: style: Variable 'status' is assigned a
value that is never used. [unreadVariable]
 acpi_status status = AE_OK;
                    ^
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/soc-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-acpi.c b/sound/soc/soc-acpi.c
index 444ce0602f76..395229bf5c51 100644
--- a/sound/soc/soc-acpi.c
+++ b/sound/soc/soc-acpi.c
@@ -34,7 +34,7 @@ static acpi_status snd_soc_acpi_find_package(acpi_handle handle, u32 level,
 					     void *context, void **ret)
 {
 	struct acpi_device *adev;
-	acpi_status status = AE_OK;
+	acpi_status status;
 	struct snd_soc_acpi_package_context *pkg_ctx = context;
 
 	pkg_ctx->data_valid = false;
-- 
2.25.1

