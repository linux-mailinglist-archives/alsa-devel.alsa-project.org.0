Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4008E801CD5
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Dec 2023 14:02:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A69C1BC0;
	Sat,  2 Dec 2023 14:02:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A69C1BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701522171;
	bh=IzAmw7ByeQBPmjKir6Y9my0R8HkadJ5rQEIAL0I7xAk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qP0iQJX9k7r7fVkkp0oT707UpJivYljlybgYmqRis0ZzUE61opAu9o1j+HpPfD7/V
	 XQC9D+FCTQVc97hyo9pfbrHde6VjZtAXuP2kV9V9bAToNIqYXMQ9KBSPtYrsKoLfHj
	 joMJFubi0qQksY+wlxRAesjV7KU07EK0uJ56HNag=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 357D4F80104; Sat,  2 Dec 2023 14:02:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BC3BF805DF;
	Sat,  2 Dec 2023 14:02:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C116F80236; Sat,  2 Dec 2023 13:46:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F0A7F80114
	for <alsa-devel@alsa-project.org>; Sat,  2 Dec 2023 13:40:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F0A7F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=evl8T+RO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701520807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UuryzTpYCyKF4wo7I6h15GkRHvHQfOgeKWCyZkCPqkI=;
	b=evl8T+ROGJRXcGXvSKXrcAVutByELd/++vxVUqEXqOs2/uk+sR0BzmJqeYuwJ24FnlCaH4
	1q49IzfRkGQHX4+sPyqV1XTU8v8CwQ/0P3fgtSnfLmp8PyaGx83aX2TtYPPJ3pra1OPbMB
	wXN7ABXTmaKniaIPuGLB7yvDKi3FU0g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-xxkyDGR-P-afGQ-MyciRkg-1; Sat, 02 Dec 2023 07:40:02 -0500
X-MC-Unique: xxkyDGR-P-afGQ-MyciRkg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9499C101A53B;
	Sat,  2 Dec 2023 12:40:01 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 58EEC2026D4C;
	Sat,  2 Dec 2023 12:40:00 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	David Yang <yangxiaohua@everest-semi.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 2/4] ASoC: Intel: bytcht_es8316: Dump basic _DSM
 information
Date: Sat,  2 Dec 2023 13:39:44 +0100
Message-ID: <20231202123946.54347-3-hdegoede@redhat.com>
In-Reply-To: <20231202123946.54347-1-hdegoede@redhat.com>
References: <20231202123946.54347-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: SJDUMYSB6BDJKPLR7BEDJKZ2DLOUHBSK
X-Message-ID-Hash: SJDUMYSB6BDJKPLR7BEDJKZ2DLOUHBSK
X-MailFrom: hdegoede@redhat.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SJDUMYSB6BDJKPLR7BEDJKZ2DLOUHBSK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Instead of adding DMI quirks for each new tablet model which uses
the ESS8316 codec, the plan is to switch to querying the same ACPI
Device-Specific-Method (DSM) as Windows uses to determine things
like speaker and mic routing.

Call the new es83xx_dsm_dump() helper which logs various basic settings
which can be queried through the ACPI DSM method on the codec ACPI device,
this is intended to help with developing a DSM based solution to replace
most DMI quirks.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
[hdegoede@redhat.com: improve commit message]
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/Kconfig         | 1 +
 sound/soc/intel/boards/bytcht_es8316.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 9e427f00deac..7368628e7781 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -229,6 +229,7 @@ config SND_SOC_INTEL_BYT_CHT_ES8316_MACH
 	depends on GPIOLIB || COMPILE_TEST
 	select SND_SOC_ACPI
 	select SND_SOC_ES8316
+	select SND_SOC_ES83XX_DSM_COMMON
 	help
 	  This adds support for ASoC machine driver for Intel(R) Baytrail &
 	  Cherrytrail platforms with ES8316 audio codec.
diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 8a0b0e864fbb..e6ab1ee6ab29 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -27,6 +27,7 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
+#include "../../codecs/es83xx-dsm-common.h"
 #include "../atom/sst-atom-controls.h"
 #include "../common/soc-intel-quirks.h"
 
@@ -520,6 +521,8 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	es83xx_dsm_dump(priv->codec_dev);
+
 	/* Check for BYTCR or other platform and setup quirks */
 	dmi_id = dmi_first_match(byt_cht_es8316_quirk_table);
 	if (dmi_id) {
-- 
2.41.0

