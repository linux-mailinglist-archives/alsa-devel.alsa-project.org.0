Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE8979D665
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 18:35:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62522DF6;
	Tue, 12 Sep 2023 18:34:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62522DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694536507;
	bh=bP9CoYlsZ1PJPB39SBHdJeu7jbNnBsg7za84Eianutw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S3WN5gi1+5YP5Z80nK80gO4vMnn16t3RBbzh4doHIbAXekNikTJQFjBQyF4wO7Ie5
	 CWhLfZUwI0X0Ueu4CMjr+hZjE9JwbYznoVVbA2wnS3rLw7KpcQwaeynvklYsD16RfR
	 WtzmVZVzpPzw4AJnY66vm2F2vjuZg8cr6te6JdX4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2513EF80570; Tue, 12 Sep 2023 18:34:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BA1FF8055B;
	Tue, 12 Sep 2023 18:34:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAB6BF80212; Tue, 12 Sep 2023 18:34:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8676F8047D
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 18:32:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8676F8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=mOg3F+2q
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38CFSmvB002448;
	Tue, 12 Sep 2023 11:32:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=zuTD6xUOqe5ttLHRaL7ledsFp6jAZIFBIzNeGgXzKvE=; b=
	mOg3F+2qsNELUfeanFVa1JWQI/QI5yLIsitAFFHbQq305NxzzHM0O1gmS9m0sCph
	6bBYKrWXMhOuVn3WOwQVUXDGUMGeOBYyeUHogp0GWauI1PkRO4i3vatt/JGvyleA
	eRZfOP6QNciZTgOsrbkXQJnQL20Xajv52GeHWQZTmw8q3IHZ+QOtw/B/APLMr6Ee
	CQ/2wyGqCS6UyB0u3CPb8nf6HZR+93gt8y3DsG1MBduRCwKDyIfT7rpXfzbHnCVg
	yGyeQt8k3ukSpPrNHoNhD/dzSy7Ae4DjDR0eIzdWZXXKAmiApskWeNc9Xq93kVpI
	IxdA15J465rIjgg3/mcFIA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3t0p3xkxdb-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 11:32:12 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 12 Sep
 2023 17:32:08 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Tue, 12 Sep 2023 17:32:08 +0100
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.125])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1CAD9357E;
	Tue, 12 Sep 2023 16:32:08 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <yung-chuan.liao@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
        <peter.ujfalusi@linux.intel.com>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 4/4] ASoC: cs35l56: Use PCI SSID as the firmware UID
Date: Tue, 12 Sep 2023 17:32:07 +0100
Message-ID: <20230912163207.3498161-5-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230912163207.3498161-1-rf@opensource.cirrus.com>
References: <20230912163207.3498161-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 7hYpPUTJ90bkPvCtkdDOjw6LX3fN5cDL
X-Proofpoint-GUID: 7hYpPUTJ90bkPvCtkdDOjw6LX3fN5cDL
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: P4HKSY2APKTIMKREYLG3Q63HFBQ2TWQL
X-Message-ID-Hash: P4HKSY2APKTIMKREYLG3Q63HFBQ2TWQL
X-MailFrom: prvs=4619193f72=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P4HKSY2APKTIMKREYLG3Q63HFBQ2TWQL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If the driver properties do not define a cirrus,firmware-uid try to get the
PCI SSID as the UID.

On PCI-based systems the PCI SSID is used to uniquely identify the specific
sound hardware. This is the standard mechanism for x86 systems and is the
way to get a unique system identifier for systems that use the CS35L56 on
SoundWire.

For non-SoundWire systems there is no Windows equivalent of the ASoC driver
in I2C/SPI mode. These would be:

1. HDA systems, which are handled by the HDA subsystem.
2. Linux-specific systems.
3. Composite devices where the cs35l56 is not present in ACPI and is
   configured using software nodes.

Case 2 can use the firmware-uid property, though the PCI SSID is supported
as an alternative, as it is the standard PCI mechanism.

Case 3 is a SoundWire system where some other codec is the SoundWire bridge
device and CS35L56 is not listed in ACPI. As these are SoundWire systems
they will normally use the PCI SSID.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index f2e7c6d0be46..e6e366333a47 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -772,9 +772,20 @@ static int cs35l56_component_probe(struct snd_soc_component *component)
 {
 	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
 	struct dentry *debugfs_root = component->debugfs_root;
+	unsigned short vendor, device;
 
 	BUILD_BUG_ON(ARRAY_SIZE(cs35l56_tx_input_texts) != ARRAY_SIZE(cs35l56_tx_input_values));
 
+	if (!cs35l56->dsp.system_name &&
+	    (snd_soc_card_get_pci_ssid(component->card, &vendor, &device) == 0)) {
+		cs35l56->dsp.system_name = devm_kasprintf(cs35l56->base.dev,
+							  GFP_KERNEL,
+							  "%04x%04x",
+							  vendor, device);
+		if (!cs35l56->dsp.system_name)
+			return -ENOMEM;
+	}
+
 	if (!wait_for_completion_timeout(&cs35l56->init_completion,
 					 msecs_to_jiffies(5000))) {
 		dev_err(cs35l56->base.dev, "%s: init_completion timed out\n", __func__);
-- 
2.30.2

