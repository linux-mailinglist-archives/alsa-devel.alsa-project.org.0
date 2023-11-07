Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC3F7E43DD
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Nov 2023 16:48:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE76D844;
	Tue,  7 Nov 2023 16:47:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE76D844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699372112;
	bh=jnHpyki1qSdBdtIxqYK0C0tKCk6ziaG/P36fbiRWSV8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sSpgGq7S1pgGCilHlWQhqKpQ4kQzjSVqA5fyY9GdLUVlZJyQtTFgbiMM/5sPjGapz
	 POXDUgWA75ufhAPgiJaAGXCyNeo8C61K/sbZ1e9JQGqPNiNkDL5OGDghs1zLbfYGT+
	 JsC30HfsO8kgObd9eP6kKjvS1bGJQm/fkObzlnGI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C5A2F80152; Tue,  7 Nov 2023 16:47:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53CD4F80558;
	Tue,  7 Nov 2023 16:47:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6C7CF80557; Tue,  7 Nov 2023 16:47:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1055EF8016D
	for <alsa-devel@alsa-project.org>; Tue,  7 Nov 2023 16:47:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1055EF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jc87pD9i
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 745C2B8165B;
	Tue,  7 Nov 2023 15:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA1EC433CB;
	Tue,  7 Nov 2023 15:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699372027;
	bh=jnHpyki1qSdBdtIxqYK0C0tKCk6ziaG/P36fbiRWSV8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jc87pD9iXMUb/G0feqZwwcf7FM3IRsJV6zqf7MBEDVSlhcCWVXvkGF+F+OkGU7tWE
	 J7KYL1FK4HwwmilSyLangRbPXoL2GOyWhFYnSnnEIolGuv0XLYHtAd5b+4R/5ZjHMu
	 LRi1YarCnUorwjNh16pGnG7L82iRBkJ3GuE5M+MxYPL6e4ss/SZbUEzxwFO5AWjCzT
	 b7Hc11TyshyardGpfcmXR/tBNDOPaWz1A6TXmqkLuPc8a4uCPvEtQLP6d8HicCq9dv
	 8Mk3uxQx8K9dTC9pLJ8IJ2aNfNOhxsyKEyjEwuyU8EJ9lE0Bkq7xScm/vWH9YPQdWp
	 n5PfxF9TxNoaw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	james.schulman@cirrus.com,
	david.rhodes@cirrus.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 05/36] ASoC: cs35l56: Use PCI SSID as the firmware
 UID
Date: Tue,  7 Nov 2023 10:45:47 -0500
Message-ID: <20231107154654.3765336-5-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107154654.3765336-1-sashal@kernel.org>
References: <20231107154654.3765336-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TD7ROIVFSL7DXYDBY4BVI57SAQCTTH6N
X-Message-ID-Hash: TD7ROIVFSL7DXYDBY4BVI57SAQCTTH6N
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TD7ROIVFSL7DXYDBY4BVI57SAQCTTH6N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Richard Fitzgerald <rf@opensource.cirrus.com>

[ Upstream commit 1a1c3d794ef65ef2978c5e65e1aed3fe6f014e90 ]

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
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20230912163207.3498161-5-rf@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/cs35l56.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index f9059780b7a7b..32d4ab2cd6724 100644
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
2.42.0

