Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 025E728A6BD
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Oct 2020 11:55:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E4DB166F;
	Sun, 11 Oct 2020 11:54:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E4DB166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602410142;
	bh=Mj3d0xuSQYaI0eiKW2dQLHw7FD/MV6yfalIIf1UTxZw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=thouqJN9KO38WhaAqohb7tWN8M3vNEWc7q041LiywIvG1wRVjoNPTCP/EA3Z1SFFK
	 VolofbAdZnwoQ5DKBuiZv5GN0b2eAmwYL5RXrRLoT2FHtSfXjnrUulfydrdJyVH08w
	 RTRV2MbykZn1K8KVF3GQf6PQKMcv9+ZGl2/Bq80E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8EC7F80148;
	Sun, 11 Oct 2020 11:54:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64875F8016F; Sun, 11 Oct 2020 11:53:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAB64F8013C
 for <alsa-devel@alsa-project.org>; Sun, 11 Oct 2020 11:53:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAB64F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="JB7itDDf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602410033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sOoB8jQSuO5gsKqZlfRKNwrr8qIfAQKIDWz24NkuNS4=;
 b=JB7itDDfNGvCxuW7q1jv/gB0bfuxto8IF3UiM5yVfCp6N7zryi1X8sS/2hofda47VFwDF9
 vO7gUflj5G1Z92y96uSQtaHfK0y+TzVUuYak8mKnpLurVptZoQI6/aPdCpZV3yvUMEywyf
 ME8fHssgKgNtkdGEPwVzMO7m2mIaV3g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-hy4KnR0mMiKBKjpo6wv0zw-1; Sun, 11 Oct 2020 05:53:51 -0400
X-MC-Unique: hy4KnR0mMiKBKjpo6wv0zw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2C3D107ACF5;
 Sun, 11 Oct 2020 09:53:49 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-15.ams2.redhat.com [10.36.112.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B897075261;
 Sun, 11 Oct 2020 09:53:47 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: Intel: Do not load legacy SST driver on BYT when
 SND_SOC_SOF_BAYTRAIL is enabled
Date: Sun, 11 Oct 2020 11:53:46 +0200
Message-Id: <20201011095346.49589-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
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

The legacy 80860F28 / sst_acpi_baytrail_desc match in sst_acpi_match
is already conditional on the the newer SND_SST_IPC_ACPI driver not
being enabled.

But now that we have an even newer driver in the form of SOF support
for BYT devices, we also need to take this into account, so we also
must not include the sst_acpi_baytrail_desc match when
SND_SOC_SOF_BAYTRAIL is enabled.

This fixes snd-soc-sst-acpi binding to the 80860F28 platform device,
blocking snd-sof-acpi from binding, which breaks audio support.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/common/sst-acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/common/sst-acpi.c b/sound/soc/intel/common/sst-acpi.c
index 5854868650b9..b4b2e1e0e845 100644
--- a/sound/soc/intel/common/sst-acpi.c
+++ b/sound/soc/intel/common/sst-acpi.c
@@ -198,7 +198,7 @@ static struct sst_acpi_desc sst_acpi_broadwell_desc = {
 	.dma_size = SST_LPT_DSP_DMA_SIZE,
 };
 
-#if !IS_ENABLED(CONFIG_SND_SST_IPC_ACPI)
+#if !IS_ENABLED(CONFIG_SND_SST_IPC_ACPI) && !IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
 static struct sst_acpi_desc sst_acpi_baytrail_desc = {
 	.drv_name = "baytrail-pcm-audio",
 	.machines = snd_soc_acpi_intel_baytrail_legacy_machines,
@@ -214,7 +214,7 @@ static struct sst_acpi_desc sst_acpi_baytrail_desc = {
 static const struct acpi_device_id sst_acpi_match[] = {
 	{ "INT33C8", (unsigned long)&sst_acpi_haswell_desc },
 	{ "INT3438", (unsigned long)&sst_acpi_broadwell_desc },
-#if !IS_ENABLED(CONFIG_SND_SST_IPC_ACPI)
+#if !IS_ENABLED(CONFIG_SND_SST_IPC_ACPI) && !IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
 	{ "80860F28", (unsigned long)&sst_acpi_baytrail_desc },
 #endif
 	{ }
-- 
2.28.0

