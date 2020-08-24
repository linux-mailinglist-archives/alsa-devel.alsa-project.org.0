Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 462DA2509DA
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Aug 2020 22:14:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDB3E844;
	Mon, 24 Aug 2020 22:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDB3E844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598300077;
	bh=MaOFNvpfLWKIN/5qsS16SOHx3Z7BDFjuuoRBofu40iw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PlcfLp5dBCsrNSXRY6jLn76fh/L2e7ttJm4gyULqGfzi/IdIMC0l3H7/Tf+UTwIn8
	 mDtFkYpOnWDKyS+Izm9OHx+XnJDkEs2M3htrqVdO/6HiIlwmA8hUkTAW1sNvdB93Nl
	 7vDFauhNruFQWHtg646vvIAxoGayTJt1ShojVpaI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8703F802FD;
	Mon, 24 Aug 2020 22:09:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25C69F802DF; Mon, 24 Aug 2020 22:09:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED569F80257
 for <alsa-devel@alsa-project.org>; Mon, 24 Aug 2020 22:09:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED569F80257
IronPort-SDR: XTrjlWYE+ceCrEEP0FiUPPLqZHEMqMvXcaGmlZ3I3eH1foOvePCetbWhVq6C8NHOn0ErNM5I8/
 il/noaFKFH3Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="157033733"
X-IronPort-AV: E=Sophos;i="5.76,349,1592895600"; d="scan'208";a="157033733"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2020 13:09:26 -0700
IronPort-SDR: GnStyK78wmLDsFn1T341PHbRscfMkoFUhLGlOaWwSPrI24e1GbVvkeVURtYnh6HthjehIF3YmE
 sJ+TVvehfjjQ==
X-IronPort-AV: E=Sophos;i="5.76,349,1592895600"; d="scan'208";a="443351201"
Received: from dentoneb-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.223.13])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2020 13:09:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/8] ASoC: SOF: acpi: add dev_dbg() log for probe completion
Date: Mon, 24 Aug 2020 15:09:10 -0500
Message-Id: <20200824200912.46852-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200824200912.46852-1-pierre-louis.bossart@linux.intel.com>
References: <20200824200912.46852-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

When the probe relies on a workqueue, the completion is not signaled
by a return value. Mirror the log already present for PCI probe, so
that CI checks can test if the probe actually worked by filtering the
console logs.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-acpi-dev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index 8aecc46b3647..a78b76ef37b2 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -106,6 +106,8 @@ static const struct dev_pm_ops sof_acpi_pm = {
 
 static void sof_acpi_probe_complete(struct device *dev)
 {
+	dev_dbg(dev, "Completing SOF ACPI probe");
+
 	if (sof_acpi_debug & SOF_ACPI_DISABLE_PM_RUNTIME)
 		return;
 
-- 
2.25.1

