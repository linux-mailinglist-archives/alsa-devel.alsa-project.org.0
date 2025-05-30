Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F184AC8E08
	for <lists+alsa-devel@lfdr.de>; Fri, 30 May 2025 14:43:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8886960237;
	Fri, 30 May 2025 14:43:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8886960237
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1748609029;
	bh=OPaaY5EGcY8Mnex4SLmbd7K0LViDxsO/aqe9Un5Rzhk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bc42WzA5MmEc4g57rIc8oAtIPhvqBaWeXwYliqjwcWLVzikacLRJghhboOMkjesOT
	 bUvmpJuCrOnot7SB/zLDcLoadQO5auBpJpuVNUpM+yu66kILVyvUBaDzbpkDDNMlsR
	 A7TlXRAION+wE0my8SsNI3jfC4be0mrt88u7M+Zs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8619F807CA; Fri, 30 May 2025 14:40:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78C9AF80804;
	Fri, 30 May 2025 14:40:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 837BFF80616; Fri, 30 May 2025 14:40:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB4F7F80603
	for <alsa-devel@alsa-project.org>; Fri, 30 May 2025 14:40:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB4F7F80603
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LvaoYGrv
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6EDC4A4ECE8;
	Fri, 30 May 2025 12:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B001C4CEF1;
	Fri, 30 May 2025 12:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748608826;
	bh=OPaaY5EGcY8Mnex4SLmbd7K0LViDxsO/aqe9Un5Rzhk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LvaoYGrvVE3t7N0Bh/btVAlZVnIFOJYPELGq8aePw9eFHl5u/i4N0612WtIv5JCcN
	 OVaAWD2lePxOcHgFlNzHMaF9iO281bL3FdLnxPVdA2Ifbec7gmdIyIHbTbd5TvHVW0
	 hbg2QqADQp3SlieWFI7LEdEwuwLCc4PdkbYjGMxQgoBtPIRSdmtZezG+Lw7rdLOG9o
	 jgh+0aYzSTOWCyChhPuiKG3voVZ8Xz05frftiZv92l4GoAABi4wqoKRq7Zc//ffmuX
	 NbHWAyD/LkQnqTf9vmQeri30EhkqwcwsrhTdT4JyRor3nt4kMB/I86/mgtK2ewTDkV
	 CJUKFZgcgp+GQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: I Hsin Cheng <richard120310@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 10/26] ASoC: intel/sdw_utils: Assign initial
 value in asoc_sdw_rt_amp_spk_rtd_init()
Date: Fri, 30 May 2025 08:39:56 -0400
Message-Id: <20250530124012.2575409-10-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250530124012.2575409-1-sashal@kernel.org>
References: <20250530124012.2575409-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.31
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HRLAOQ726ZEN7ZNOU46TUEUM64ULK4LF
X-Message-ID-Hash: HRLAOQ726ZEN7ZNOU46TUEUM64ULK4LF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HRLAOQ726ZEN7ZNOU46TUEUM64ULK4LF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: I Hsin Cheng <richard120310@gmail.com>

[ Upstream commit 5fb3878216aece471af030b33a9fbef3babd8617 ]

Initialize "ret" with "-EINVAL" to handle cases where "strstr()" for
"codec_dai->component->name_prefix" doesn't find "-1" nor "-2". In that
case "name_prefix" is invalid because for current implementation it's
expected to have either "-1" or "-2" in it. (Maybe "-3", "-4" and so on
in the future.)

Link: https://scan5.scan.coverity.com/#/project-view/36179/10063?selectedIssue=1627120
Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
Link: https://patch.msgid.link/20250505185423.680608-1-richard120310@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my analysis of the commit and the codebase context, I can now
provide a comprehensive assessment: **YES** This commit should be
backported to stable kernel trees. ## Extensive Analysis ### Nature of
the Bug The commit addresses a classic uninitialized variable bug in
`asoc_sdw_rt_amp_spk_rtd_init()` in
`sound/soc/sdw_utils/soc_sdw_rt_amp.c`. The function declares `int ret;`
but only conditionally assigns values to it within a loop: ```c
for_each_rtd_codec_dais(rtd, i, codec_dai) { if
(strstr(codec_dai->component->name_prefix, "-1")) ret =
snd_soc_dapm_add_routes(&card->dapm, rt_amp_map, 2); else if
(strstr(codec_dai->component->name_prefix, "-2")) ret =
snd_soc_dapm_add_routes(&card->dapm, rt_amp_map + 2, 2); } return ret;
``` ### When the Bug Manifests The bug occurs when: 1.
`codec_dai->component->name_prefix` doesn't contain "-1" OR "-2" 2. Both
`strstr()` calls return NULL, causing neither branch to execute 3. The
function returns an uninitialized `ret` value, leading to unpredictable
behavior ### Historical Context From the git blame analysis, this bug
was introduced in commit `84e0a19adb73d` (May 9, 2024) by Bard Liao when
adding a dai parameter to rtd_init callbacks. The commit changed the
variable name from `dai` to `codec_dai` to avoid conflicts, but failed
to initialize `ret` properly for the edge case. ### Code Analysis The
fix is simple and correct: - **Before**: `int ret;` (uninitialized) -
**After**: `int ret = -EINVAL;` (initialized with appropriate error
code) The `-EINVAL` choice is appropriate because: 1. If name_prefix
lacks "-1" or "-2", it indicates an invalid configuration for current
implementation 2. The commit message explicitly states this expectation
3. `-EINVAL` is the standard Linux kernel error for invalid arguments
### Static Analysis Context The commit message references Coverity scan
ID 1627120, indicating this was caught by static analysis tools. This is
a legitimate bug that could cause: - Random return values leading to
unpredictable behavior - Potential system instability in audio subsystem
- Difficult-to-debug intermittent failures ### Backport Suitability
Analysis **✅ Meets Stable Tree Criteria:** 1. **Important Bug Fix**:
Fixes a real bug that can cause unpredictable behavior in the audio
subsystem 2. **Small and Contained**: Single line change, minimal risk
of introducing regressions 3. **No Side Effects**: Only affects the
error path when name_prefix is invalid 4. **No Architectural Changes**:
Pure bug fix with no design changes 5. **Subsystem Confined**: Limited
to ASoC Intel SDW utils subsystem 6. **Clear Benefit**: Prevents
undefined behavior and ensures deterministic error handling **Risk
Assessment**: **VERY LOW** - Single line initialization change - Only
affects error/edge case paths - No functional logic changes - Well-
understood fix pattern **Impact**: **MODERATE** - Affects Intel
SoundWire audio configurations - Could prevent audio system failures on
affected hardware - Improves system reliability and debuggability ###
Comparison with Similar Commits The provided examples show that simple
NULL check additions (Similar Commit #1) and small contained bug fixes
are consistently marked as "YES" for backporting. This commit follows
the same pattern - it's a small, contained fix for a legitimate bug with
minimal risk. This commit exemplifies the ideal stable tree candidate:
it fixes a real bug, is minimal in scope, has no risk of regression, and
improves system reliability.

 sound/soc/sdw_utils/soc_sdw_rt_amp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_rt_amp.c b/sound/soc/sdw_utils/soc_sdw_rt_amp.c
index 6951dfb565263..b3d6ca2499734 100644
--- a/sound/soc/sdw_utils/soc_sdw_rt_amp.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt_amp.c
@@ -190,7 +190,7 @@ int asoc_sdw_rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc
 	const struct snd_soc_dapm_route *rt_amp_map;
 	char codec_name[CODEC_NAME_SIZE];
 	struct snd_soc_dai *codec_dai;
-	int ret;
+	int ret = -EINVAL;
 	int i;
 
 	rt_amp_map = get_codec_name_and_route(dai, codec_name);
-- 
2.39.5

