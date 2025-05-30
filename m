Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E42A5AC8DDD
	for <lists+alsa-devel@lfdr.de>; Fri, 30 May 2025 14:40:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 798F760218;
	Fri, 30 May 2025 14:40:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 798F760218
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1748608850;
	bh=0mNPQpbwT1Pfw1ec0QHifRguoEQrfpMBmf9+3fPz8uc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OW/NqBHkCddMUwfh0Pq9amHr71Wp9H9Z0TsaifBCmekjrM7GWglpg7z+QjNhmzHoc
	 GKiGT3GP2naL6I/i6vPp5mKAbz07Yegf2az+HaFv6PAnWP0fh5rmo/b8Fq3jdshOBG
	 pXMZc2BRq5q1eBFBI5QZTTg/9cA5yXDOwLW50mnY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DCE2F8065A; Fri, 30 May 2025 14:39:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82177F8049C;
	Fri, 30 May 2025 14:39:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA9F7F8063D; Fri, 30 May 2025 14:39:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A0E2F8049C
	for <alsa-devel@alsa-project.org>; Fri, 30 May 2025 14:39:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A0E2F8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HRFdJhO+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6FC6943C89;
	Fri, 30 May 2025 12:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 667D2C4CEEB;
	Fri, 30 May 2025 12:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748608757;
	bh=0mNPQpbwT1Pfw1ec0QHifRguoEQrfpMBmf9+3fPz8uc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HRFdJhO+ApuA3Ntz+gPQKQxwg5682IRiBJEf9J11v9jUQoyJLnrcuxJhHlPmBCNNN
	 3BGxmGhjfuQEl1blzGEZiWgihfq/wxtlAYNzf95JPX9WJHIyyBomM8pE2p8SoNyrlC
	 PFYBjmU+I0c+tL/6szYIgeh6b+SNhtiVcPg/CyoP4SEaQgeRQkes0QG31ygGCxqYkY
	 /CI9Md5deDYMEWctHgDbaKM3seVPUxdH2QYSs/zdoaBQmhK6Z/qoV2PfwhVjW1Tph1
	 P/IEvL27MwAmDTDDWeGM2UkOiGHebNjZvZZ6uChRnVtMmps9O+auJtB9RjR0Cx+HpM
	 tmPtB4iFodjXw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Stefan Binding <sbinding@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 18/30] ALSA: hda: cs35l41: Fix swapped l/r audio
 channels for Acer Helios laptops
Date: Fri, 30 May 2025 08:38:40 -0400
Message-Id: <20250530123852.2574030-18-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250530123852.2574030-1-sashal@kernel.org>
References: <20250530123852.2574030-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SP52RYT7FJGACDIN4RQH5DXC5UMFFAIG
X-Message-ID-Hash: SP52RYT7FJGACDIN4RQH5DXC5UMFFAIG
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SP52RYT7FJGACDIN4RQH5DXC5UMFFAIG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Stefan Binding <sbinding@opensource.cirrus.com>

[ Upstream commit e43a93c41982e82c1b703dd7fa9c1d965260fbb3 ]

Fixes audio channel assignment from ACPI using configuration table.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Link: https://patch.msgid.link/20250515162848.405055-3-sbinding@opensource.cirrus.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees.
**Extensive Analysis:** **1. Nature of the Fix:** The commit fixes
swapped left/right audio channels for Acer Helios laptops by adding
three new entries to the `cs35l41_config_table[]`: - `{ "10251826", 2,
EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, -1, -1, 0, 0, 0 }` -
`{ "1025182C", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0,
-1, -1, 0, 0, 0 }` - `{ "10251844", 2, EXTERNAL, { CS35L41_LEFT,
CS35L41_RIGHT, 0, 0 }, 0, -1, -1, 0, 0, 0 }` The corresponding model
table entries are also added to enable these configurations. **2.
Comparison with Historical Similar Commits:** This commit is **very
similar to Similar Commit #1 (Status: YES)** which also fixed swapped
l/r audio channels for Lenovo ThinkBook laptops. Both commits: - Fix the
same fundamental issue: swapped audio channels - Make identical types of
changes: correcting channel assignment in configuration tables - Are
small, contained fixes affecting only audio configuration data - Target
specific laptop models with broken audio channel mapping The primary
difference is that Similar Commit #1 modified existing entries by
swapping `CS35L41_LEFT` and `CS35L41_RIGHT`, while this commit adds new
entries with correct channel assignments. **3. Why This Qualifies for
Backporting:** **✅ Fixes Important User-Affecting Bug:** Swapped audio
channels are a significant usability issue that directly impacts users'
audio experience on affected Acer Helios laptops. **✅ Small and
Contained Change:** The fix only adds static configuration data - three
new entries in a lookup table. No algorithmic changes or complex logic
modifications. **✅ Minimal Risk of Regression:** Adding new entries to a
device-specific configuration table cannot break existing functionality
for other devices. The changes only affect the three specific Acer
laptop models. **✅ No Architectural Changes:** This is purely data-
driven configuration, not structural code changes. **✅ Specific Hardware
Support:** The SSID values (10251826, 1025182C, 10251844) are vendor-
specific identifiers for Acer devices (1025 = Acer vendor ID), ensuring
the fix only applies to the intended hardware. **4. Code Analysis
Verification:** From examining the current kernel tree at
`/home/sasha/linux/sound/pci/hda/cs35l41_hda_property.c`, I confirmed
that: - The file exists and contains the same structure as the commit -
No "1025" entries currently exist in the configuration table - The
pattern matches exactly with other vendor entries (HP: 103C, ASUS: 1043,
Lenovo: 17AA) **5. Risk Assessment:** - **Regression Risk: MINIMAL** -
Adding device-specific entries cannot affect other hardware - **Side
Effects: NONE** - Changes are isolated to specific Acer laptop models -
**Complexity: LOW** - Simple data table additions with no logic changes
**Conclusion:** This commit perfectly fits the stable tree criteria:
it's an important hardware-specific bug fix that affects users, with
minimal risk and no architectural changes. The historical precedent
(Similar Commit #1 with identical nature receiving YES status) strongly
supports backporting this fix.

 sound/pci/hda/cs35l41_hda_property.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index 61d2314834e7b..d8249d997c2a0 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -31,6 +31,9 @@ struct cs35l41_config {
 };
 
 static const struct cs35l41_config cs35l41_config_table[] = {
+	{ "10251826", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, -1, -1, 0, 0, 0 },
+	{ "1025182C", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, -1, -1, 0, 0, 0 },
+	{ "10251844", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, -1, -1, 0, 0, 0 },
 	{ "10280B27", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10280B28", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10280BEB", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, -1, 0, 0, 0, 0 },
@@ -452,6 +455,9 @@ struct cs35l41_prop_model {
 static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CLSA0100", NULL, lenovo_legion_no_acpi },
 	{ "CLSA0101", NULL, lenovo_legion_no_acpi },
+	{ "CSC3551", "10251826", generic_dsd_config },
+	{ "CSC3551", "1025182C", generic_dsd_config },
+	{ "CSC3551", "10251844", generic_dsd_config },
 	{ "CSC3551", "10280B27", generic_dsd_config },
 	{ "CSC3551", "10280B28", generic_dsd_config },
 	{ "CSC3551", "10280BEB", generic_dsd_config },
-- 
2.39.5

