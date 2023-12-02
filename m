Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DB2801CE4
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Dec 2023 14:05:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAB69850;
	Sat,  2 Dec 2023 14:05:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAB69850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701522338;
	bh=jjP33ia6jjy5jvr8HZhB8wKNTL96MihG/pYl/DUDXE4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tgJ4i7WH3AgYFcziEt+w/YI5HtIMVURkW2u7L7nyDak4oXVOfUyb6bfRRGKB+MaEl
	 ORf9b1eE9G7STGQRVVczm0jkLtPCGhbTVEHPDP9kMBEvgOUP6nZZZ0D5cViErvbWhf
	 3WHMAaMUpyeE1f2INP/R5xuM9xNPFtr3UWKWcDws=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D8EAF805BF; Sat,  2 Dec 2023 14:04:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A562AF80563;
	Sat,  2 Dec 2023 14:04:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEFDDF801D5; Sat,  2 Dec 2023 13:46:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D17FF8016E
	for <alsa-devel@alsa-project.org>; Sat,  2 Dec 2023 13:40:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D17FF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=H1DBHgGU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701520807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JDCpFfLdsEm148zR6cu7rBXtHBGpX0V9fcZdqpC/P1A=;
	b=H1DBHgGU5z7vmGCfqtZbzxVhHWg4cty4m2CluZTJCJ5yLkDns+o8ynSL50JyP9j7+5pocS
	2jGEuLTHUUJCAMBOHe/MZv/70MmKpnW7MtWY1c3A2wq85zNpQFjchO9p2/Pn0EYjKyOVtU
	i4anBJGM8SlKlKLkNfMO5X0IpH2Ts8g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-d74ZFi7cMNSeYlnwcsbibQ-1; Sat, 02 Dec 2023 07:40:03 -0500
X-MC-Unique: d74ZFi7cMNSeYlnwcsbibQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F117D83FC2D;
	Sat,  2 Dec 2023 12:40:02 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C63652026D4C;
	Sat,  2 Dec 2023 12:40:01 +0000 (UTC)
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
Subject: [PATCH v2 3/4] ASoC: Intel: bytcht_es8316: Add is_bytcr helper
 variable
Date: Sat,  2 Dec 2023 13:39:45 +0100
Message-ID: <20231202123946.54347-4-hdegoede@redhat.com>
In-Reply-To: <20231202123946.54347-1-hdegoede@redhat.com>
References: <20231202123946.54347-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: ZQF6ODXP27RV4HNAOIRPQWDUKS4CJLFO
X-Message-ID-Hash: ZQF6ODXP27RV4HNAOIRPQWDUKS4CJLFO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZQF6ODXP27RV4HNAOIRPQWDUKS4CJLFO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a is_bytcr helper variable to probe().

This is a preparation patch for determining the quirks through querying
the ACPI Device-Specific-Method (DSM) on the codec-device.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcht_es8316.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index e6ab1ee6ab29..0d6574678317 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -471,10 +471,10 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 	struct byt_cht_es8316_private *priv;
 	const struct dmi_system_id *dmi_id;
 	struct fwnode_handle *fwnode;
+	bool sof_parent, is_bytcr;
 	const char *platform_name;
 	struct acpi_device *adev;
 	struct device *codec_dev;
-	bool sof_parent;
 	unsigned int cnt = 0;
 	int dai_index = 0;
 	int i;
@@ -524,11 +524,11 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 	es83xx_dsm_dump(priv->codec_dev);
 
 	/* Check for BYTCR or other platform and setup quirks */
+	is_bytcr = soc_intel_is_byt() && mach->mach_params.acpi_ipc_irq_index == 0;
 	dmi_id = dmi_first_match(byt_cht_es8316_quirk_table);
 	if (dmi_id) {
 		quirk = (unsigned long)dmi_id->driver_data;
-	} else if (soc_intel_is_byt() &&
-		   mach->mach_params.acpi_ipc_irq_index == 0) {
+	} else if (is_bytcr) {
 		/* On BYTCR default to SSP0, internal-mic-in2-map, mono-spk */
 		quirk = BYT_CHT_ES8316_SSP0 | BYT_CHT_ES8316_INTMIC_IN2_MAP |
 			BYT_CHT_ES8316_MONO_SPEAKER;
-- 
2.41.0

