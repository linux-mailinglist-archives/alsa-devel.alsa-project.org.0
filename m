Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC621AC8DCC
	for <lists+alsa-devel@lfdr.de>; Fri, 30 May 2025 14:39:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4A1B601F6;
	Fri, 30 May 2025 14:39:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4A1B601F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1748608779;
	bh=4QKsNMi+GXQlpetVe9R0wo8FXMgIicrAGhk2pEQx7Gg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c0upXgS0p1A6YNK4zHJR/Ct4I7prk9tjpkM8P2HrbKrj1cMR0GhSrIyaKnofI+oBa
	 KcxiuZ38s3l9KlkMh1y/5rl24CXzT+WI71D7SA0SynKQLQUpXBHoMHOOAvKBCyBEP5
	 beoXXgGaXbt+ZYefL/5aT2z8/yxu5SlpnVB8AXPw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89F9AF805C1; Fri, 30 May 2025 14:39:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 662D4F805A8;
	Fri, 30 May 2025 14:39:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AB5FF8049C; Fri, 30 May 2025 14:39:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org
 [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67823F80075
	for <alsa-devel@alsa-project.org>; Fri, 30 May 2025 14:38:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67823F80075
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HT46LTI9
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A86B1629EF;
	Fri, 30 May 2025 12:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80833C4CEEB;
	Fri, 30 May 2025 12:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748608736;
	bh=4QKsNMi+GXQlpetVe9R0wo8FXMgIicrAGhk2pEQx7Gg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HT46LTI9/Bwv8gWz38hF0H1VI4/4bQwu4StpF7xojG0HKiJukh6AL3S6V/9AEr6Se
	 kTBTk1JHvwHuzi0FAIKaIGC9CyK3um1hsA7GUfZfUqbYHOK3xyjNMLOiQmC6icVK7O
	 So4EVb0fk6G/AYNkS/aXQYfCaz/Fzi5wulZGz/+aY2TPXrIsQIVUj4Lt0v6jqQco8a
	 ZF7FVh3m8D0MvSGDMqUOVV2cF+RYAOxhxjJv4+TGbRAPIz3VhrDmwdZHP6QAOW4nxZ
	 m3H8jPd7z8+GIwPCeVh/TuaC4z1hUPeJ65Nidi56/mdguRw8zAtIJRIB1r6ED/JVm3
	 6c0zW15btlkxA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Talhah Peerbhai <talhah.peerbhai@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 02/30] ASoC: amd: yc: Add quirk for Lenovo Yoga
 Pro 7 14ASP9
Date: Fri, 30 May 2025 08:38:24 -0400
Message-Id: <20250530123852.2574030-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250530123852.2574030-1-sashal@kernel.org>
References: <20250530123852.2574030-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LBQPDRXEO2MRDZDFLFWD2M66KXRG3ECK
X-Message-ID-Hash: LBQPDRXEO2MRDZDFLFWD2M66KXRG3ECK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LBQPDRXEO2MRDZDFLFWD2M66KXRG3ECK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Talhah Peerbhai <talhah.peerbhai@gmail.com>

[ Upstream commit a28206060dc5848a1a2a15b7f6ac6223d869084d ]

Similar to many other Lenovo models with AMD chips, the Lenovo
Yoga Pro 7 14ASP9 (product name 83HN) requires a specific quirk
to ensure internal mic detection. This patch adds a quirk fixing this.

Signed-off-by: Talhah Peerbhai <talhah.peerbhai@gmail.com>
Link: https://patch.msgid.link/20250515222741.144616-1-talhah.peerbhai@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my analysis of this commit, I can provide a comprehensive
assessment for backporting. **YES** This commit should be backported to
stable kernel trees for the following reasons: **1. Identical Pattern to
Previously Backported Commits:** All five similar commits provided in
the historical context (commits for Lenovo models 82UU, 82, 82YM, 83AS,
and 21M1) have "Backport Status: YES" and follow the exact same pattern
as this commit. This establishes a clear precedent for backporting such
changes. **2. Hardware Enablement Bug Fix:** The commit fixes a clear
user-affecting bug where the internal microphone on the Lenovo Yoga Pro
7 14ASP9 (product name 83HN) is non-functional. This is a hardware
compatibility issue that directly impacts users' ability to use their
device's built-in microphone. **3. Minimal and Contained Change:** The
code change is extremely small and safe: - Adds only a single 7-line
quirk table entry to `sound/soc/amd/yc/acp6x-mach.c` - The change is
purely additive - no existing code is modified - The quirk entry follows
the exact same pattern as dozens of other entries in the same table -
Zero risk of regression to existing functionality **4. Critical
Subsystem with Safe Pattern:** While this touches audio (a critical
subsystem), the change follows a well-established, safe pattern used
extensively in this driver. The quirk table approach is designed
specifically for adding device-specific compatibility without affecting
other hardware. **5. Clear User Benefit:** Users with this specific
Lenovo model will have their internal microphone functionality restored,
which is essential for video calls, voice recording, and other audio
input tasks. **6. Code Quality Improvement:** The commit also includes a
minor whitespace fix (changing spaces to tab at line 350), improving
code formatting consistency. **7. Follows Stable Tree Rules:** -
Important bugfix: ✓ (enables hardware functionality) - Minimal risk: ✓
(purely additive quirk entry) - Small and contained: ✓ (7 lines added) -
No architectural changes: ✓ - Confined to subsystem: ✓ (AMD YC audio
driver) The commit message clearly explains the issue and solution, and
the change is identical in nature to numerous other successfully
backported commits for similar Lenovo audio quirks. This represents a
textbook example of a stable-appropriate hardware enablement fix.

 sound/soc/amd/yc/acp6x-mach.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index e632f16c91025..3d9da93d22ee8 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -311,6 +311,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "83AS"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83HN"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
@@ -360,7 +367,7 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "M5402RA"),
 		}
 	},
-        {
+	{
 		.driver_data = &acp6x_card,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
-- 
2.39.5

