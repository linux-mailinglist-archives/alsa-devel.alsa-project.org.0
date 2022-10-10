Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E825F9E59
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 14:07:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E8C62999;
	Mon, 10 Oct 2022 14:06:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E8C62999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665403643;
	bh=xN+Dl4IyK8wO1+W3xgwz+tpP2k/nEyWk0uXkXJasap8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EC2ksqwOvjVu7gLvkh+VvKzXBsxMRZlzoFX537M4CcFq8zrw5TQ5g8AJKiH6WgDbk
	 aFG/vQcJ6uZOvJmHan39oHN6CFE1+PauDpLFYxtBMDj8Mrbw4feSbTZJnc47qJ4BXf
	 /vjtsDNr2SHQ9+icuveNniNnghTOkbBQYPINBsCw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71000F80589;
	Mon, 10 Oct 2022 14:04:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B13A1F80568; Mon, 10 Oct 2022 14:04:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 253F7F8055C
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 14:04:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 253F7F8055C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="oERwoxu1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665403446; x=1696939446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xN+Dl4IyK8wO1+W3xgwz+tpP2k/nEyWk0uXkXJasap8=;
 b=oERwoxu1nrhhRDcqkLm8eX7Cjzbc+w3225uYwnV1dkp9+X3QcflPibUw
 UKYXiB8RhNsy50TV66Y5nigs4cbNn1U2/FcUxrJPLw+TcwBOlnbEjXThr
 fKKZSBlQN5bY1hOswKzbVhYn6KFTeloQWyvwMt4Qgf2WkhKLzYGc7Plsg
 N5RTDb/H72arLMQHpVaMZqveK0LWgcrcEHoXJJhHCUXB5N7KOMWX6e4eN
 xMFMa+B6Zkd2IxZrEuCWGF9FxD3FcQAqw/Cr7gcTNCCOYBOo9rglo4e6h
 bcnCpd53jdt6q6Qsxa+EvVm2dhBTF2a61tSSPBvp+0ytYUIMzqNu9N+rk w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="368346093"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="368346093"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 05:04:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="871078921"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="871078921"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 10 Oct 2022 05:04:02 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 08/15] ASoC: Intel: avs: Simplify d0ix disabling routine
Date: Mon, 10 Oct 2022 14:19:48 +0200
Message-Id: <20221010121955.718168-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010121955.718168-1-cezary.rojewski@intel.com>
References: <20221010121955.718168-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

No need to atomic_add_return(1) when there is atomic_inc_return()
available.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/ipc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index 77da206f7dbb..152f8d0bdf8e 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -74,7 +74,7 @@ int avs_dsp_disable_d0ix(struct avs_dev *adev)
 	struct avs_ipc *ipc = adev->ipc;
 
 	/* Prevent PG only on the first disable. */
-	if (atomic_add_return(1, &ipc->d0ix_disable_depth) == 1) {
+	if (atomic_inc_return(&ipc->d0ix_disable_depth) == 1) {
 		cancel_delayed_work_sync(&ipc->d0ix_work);
 		return avs_dsp_set_d0ix(adev, false);
 	}
-- 
2.25.1

