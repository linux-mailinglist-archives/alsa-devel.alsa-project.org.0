Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E207E43F9
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Nov 2023 16:49:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1DE8A4B;
	Tue,  7 Nov 2023 16:48:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1DE8A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699372149;
	bh=S9VN7vROyg1KWjNiEzHcQPYk/11RBEqo3DAyho01LOo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d2TJXZ1d+oLVq/TeSEojfYhaIugnxPQtDv8W7VIMCwsMy4n2t+632Qk0ad7AS+Rph
	 JHTamCq3L0PQKkvip+8jdWk0eFoedP2BsK3ks1l5VEA0nxS042igiRckp8pxO/5Bp2
	 +KJddtUItPlIoqDUeKUA7xdjnSshY5fhD25rlo20=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BBAFF8055B; Tue,  7 Nov 2023 16:48:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2EA6F8016D;
	Tue,  7 Nov 2023 16:48:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70211F801F5; Tue,  7 Nov 2023 16:48:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0015CF80169
	for <alsa-devel@alsa-project.org>; Tue,  7 Nov 2023 16:48:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0015CF80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=H4R/Bv1E
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B627D6125E;
	Tue,  7 Nov 2023 15:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2559C433C9;
	Tue,  7 Nov 2023 15:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699372087;
	bh=S9VN7vROyg1KWjNiEzHcQPYk/11RBEqo3DAyho01LOo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H4R/Bv1ExTCV71+t5n9YSMYWoJUxGQqiNwqSzF1roRD4UaGkWFBiqfUmiwrnUCiHK
	 yzc+8VrXHX8Y/0ZT+gMs/YTGvrRWGLRY0S1VtYqeeW6OIJF68ua/KBT3Y958almmMw
	 /iaj4i4gJLPdbjD8npZYDRmbZ9SHnvYP8dlAV+v7nCf1eKI5d80nC8kkj2FpzCYeQ+
	 iCWled6TIG7hM8wck7HnDQ3cvzO261UNsYUZsmbc4E/RZpSbDw5u2crMGQhUITdXSw
	 Y7mibkF22iSSW3uzZACm9zKij2XOaO5B8M8SXBFvij24OSeZtyIGuxG1OP4lqq+Eua
	 O79E7S77UlGLA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	cezary.rojewski@intel.com,
	pierre-louis.bossart@linux.intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 32/36] ASoC: Intel: soc-acpi-cht: Add Lenovo Yoga
 Tab 3 Pro YT3-X90 quirk
Date: Tue,  7 Nov 2023 10:46:14 -0500
Message-ID: <20231107154654.3765336-32-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107154654.3765336-1-sashal@kernel.org>
References: <20231107154654.3765336-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KZTK3ZEH6ORE5LBTUQPKNNDNAPUQBBJV
X-Message-ID-Hash: KZTK3ZEH6ORE5LBTUQPKNNDNAPUQBBJV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KZTK3ZEH6ORE5LBTUQPKNNDNAPUQBBJV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 2cb54788393134d8174ee594002baae3ce52c61e ]

The Lenovo Yoga Tab 3 Pro YT3-X90 x86 tablet, which ships with Android with
a custom kernel as factory OS, does not list the used WM5102 codec inside
its DSDT.

Workaround this with a new snd_soc_acpi_intel_baytrail_machines[] entry
which matches on the SST id instead of the codec id like nocodec does,
combined with using a machine_quirk callback which returns NULL on
other machines to skip the new entry on other machines.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/r/20231021211534.114991-1-hdegoede@redhat.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../intel/common/soc-acpi-intel-cht-match.c   | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
index cdcbf04b8832f..5e2ec60e2954b 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
@@ -75,6 +75,39 @@ static struct snd_soc_acpi_mach *cht_ess8316_quirk(void *arg)
 	return arg;
 }
 
+/*
+ * The Lenovo Yoga Tab 3 Pro YT3-X90, with Android factory OS has a buggy DSDT
+ * with the coded not being listed at all.
+ */
+static const struct dmi_system_id lenovo_yoga_tab3_x90[] = {
+	{
+		/* Lenovo Yoga Tab 3 Pro YT3-X90, codec missing from DSDT */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 PLATFORM"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Blade3-10A-001"),
+		},
+	},
+	{ }
+};
+
+static struct snd_soc_acpi_mach cht_lenovo_yoga_tab3_x90_mach = {
+	.id = "10WM5102",
+	.drv_name = "bytcr_wm5102",
+	.fw_filename = "intel/fw_sst_22a8.bin",
+	.board = "bytcr_wm5102",
+	.sof_tplg_filename = "sof-cht-wm5102.tplg",
+};
+
+static struct snd_soc_acpi_mach *lenovo_yt3_x90_quirk(void *arg)
+{
+	if (dmi_check_system(lenovo_yoga_tab3_x90))
+		return &cht_lenovo_yoga_tab3_x90_mach;
+
+	/* Skip wildcard match snd_soc_acpi_intel_cherrytrail_machines[] entry */
+	return NULL;
+}
+
 static const struct snd_soc_acpi_codecs rt5640_comp_ids = {
 	.num_codecs = 2,
 	.codecs = { "10EC5640", "10EC3276" },
@@ -175,6 +208,16 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
 		.drv_name = "sof_pcm512x",
 		.sof_tplg_filename = "sof-cht-src-50khz-pcm512x.tplg",
 	},
+	/*
+	 * Special case for the Lenovo Yoga Tab 3 Pro YT3-X90 where the DSDT
+	 * misses the codec. Match on the SST id instead, lenovo_yt3_x90_quirk()
+	 * will return a YT3 specific mach or NULL when called on other hw,
+	 * skipping this entry.
+	 */
+	{
+		.id = "808622A8",
+		.machine_quirk = lenovo_yt3_x90_quirk,
+	},
 
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_BYT_CHT_NOCODEC_MACH)
 	/*
-- 
2.42.0

