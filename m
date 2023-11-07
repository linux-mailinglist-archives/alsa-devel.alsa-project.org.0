Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6BD7E4432
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Nov 2023 16:50:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 536CF84A;
	Tue,  7 Nov 2023 16:50:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 536CF84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699372253;
	bh=S9VN7vROyg1KWjNiEzHcQPYk/11RBEqo3DAyho01LOo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MfpZXwOqla8/dyyKy0fgDFSkX4tMYcpk4HozzgWqW0Fd2KSvrqQVe4C9lIDu2GPOv
	 pDBK/KJxih3FfFdkAxi0k0knuJTv0Y1sq5IkT5YYPunnehdC7WsG5EwmB/F1Y0FlWR
	 E28uStGTS3kB00ZmKigOr9AjZKUK72fG/L3Q7BMw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1507AF80558; Tue,  7 Nov 2023 16:50:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C71F3F80169;
	Tue,  7 Nov 2023 16:50:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75BF5F8016D; Tue,  7 Nov 2023 16:50:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2EF0F800ED
	for <alsa-devel@alsa-project.org>; Tue,  7 Nov 2023 16:49:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2EF0F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cBJskdSp
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A6F361171;
	Tue,  7 Nov 2023 15:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66BADC433C9;
	Tue,  7 Nov 2023 15:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699372197;
	bh=S9VN7vROyg1KWjNiEzHcQPYk/11RBEqo3DAyho01LOo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cBJskdSp1tsQYA5qKgtua71+UE4amF7z44c2qwDvmMVfQ7MHsVTuIs06lewU0k8KN
	 05VDbzSYGBGb4rvufR25tyVgtRJyHXhKeSX/dLbMxJ88pwYOIOwF9txA4JSKzzrbmi
	 KSsJeXO9wEx2JuoEIMQ0E/muoBlqjlnsQlTljByunNt1cqm601mMP8R0fedzo/OOaW
	 lL80+k1UsKZW6irErvHs6BUtha4KuyI79ZenFoGLkNsF8v10z52C4AjTAG7B18CPaw
	 Il87fLEmu9vTh77+Chw47/R7eYYjwtLkHJpzeyTbqu28Q3zlbTEcbtqdG4xeJZyumb
	 54cjyri0tEMuw==
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
Subject: [PATCH AUTOSEL 6.5 30/34] ASoC: Intel: soc-acpi-cht: Add Lenovo Yoga
 Tab 3 Pro YT3-X90 quirk
Date: Tue,  7 Nov 2023 10:48:10 -0500
Message-ID: <20231107154846.3766119-30-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107154846.3766119-1-sashal@kernel.org>
References: <20231107154846.3766119-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.10
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5ZJ3S4VUK3SU3DQW7RBG3VMTW3TYHJV2
X-Message-ID-Hash: 5ZJ3S4VUK3SU3DQW7RBG3VMTW3TYHJV2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ZJ3S4VUK3SU3DQW7RBG3VMTW3TYHJV2/>
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

