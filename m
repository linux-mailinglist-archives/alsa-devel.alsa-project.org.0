Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCD3AC8DF2
	for <lists+alsa-devel@lfdr.de>; Fri, 30 May 2025 14:42:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 531566022F;
	Fri, 30 May 2025 14:41:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 531566022F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1748608924;
	bh=NCUICTrC8+gqXYnUCqs7UKPOFce2Teg+APrv6Pq+XjQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Vn7h2V9nvCXNSNjJK9xLAttQG8ZpGJC6Z3ZTapmIjT+O9dtFne3TLRfZz3FKJnwwv
	 UEnNVzg7XijY4acgpEg+aZVGlsOMsYCA0nV7ipZGVRpEDEX5TPtbJQe2zX7wCKwXfw
	 bm1w+0dnqsonfhomPdDGCjIFsktr8c9WGpO3TTHo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1BD4F805D7; Fri, 30 May 2025 14:39:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A01F8F805E0;
	Fri, 30 May 2025 14:39:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2213F805CB; Fri, 30 May 2025 14:39:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org
 [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE39FF805C6
	for <alsa-devel@alsa-project.org>; Fri, 30 May 2025 14:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE39FF805C6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RqqxPgNU
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 11BB3443C5;
	Fri, 30 May 2025 12:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C50CAC4CEEA;
	Fri, 30 May 2025 12:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748608788;
	bh=NCUICTrC8+gqXYnUCqs7UKPOFce2Teg+APrv6Pq+XjQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RqqxPgNUgQcihsqG3lv1lTHXZFmZ/rt85Inni152vJGIl0PjIV1RdeYsrJiuVFxsP
	 vLt58Xmh7ajj4hJG7V9Ot7Ldm4/H7ht2Fdl+ZTUF+WpsoGdJlAEeyz3ahs53S2M7j6
	 vL61bwHdAmJexujPJROhvfOeDIN8TgBsM7Ibw9gxMzuCcBy8jntaGHn7FZJpNdtJKt
	 ytUYI0jJHpjRYfKYpUTWcAPYJHgzoSCOHeOU6wGFtoFI7RKhIUyBSj1d0LFoUkMv5W
	 2muWoXwaW35O9bcxMlUtjomCJmHKtMRkO1sYvk6hmOchy9Ud4YY25LMqgxXlMUwKtx
	 aGO1HqyhSdm5A==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Hector Martin <marcan@marcan.st>,
	Neal Gompa <neal@gompa.dev>,
	James Calligeros <jcalligeros99@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 11/28] ASoC: tas2770: Power cycle amp on
 ISENSE/VSENSE change
Date: Fri, 30 May 2025 08:39:17 -0400
Message-Id: <20250530123934.2574748-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250530123934.2574748-1-sashal@kernel.org>
References: <20250530123934.2574748-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.9
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2OAFQXVCHA4MPOLVQN2HM5IFYZQQ5TT3
X-Message-ID-Hash: 2OAFQXVCHA4MPOLVQN2HM5IFYZQQ5TT3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2OAFQXVCHA4MPOLVQN2HM5IFYZQQ5TT3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Hector Martin <marcan@marcan.st>

[ Upstream commit f529c91be8a34ac12e7599bf87c65b6f4a2c9f5c ]

The ISENSE/VSENSE blocks are only powered up when the amplifier
transitions from shutdown to active. This means that if those controls
are flipped on while the amplifier is already playing back audio, they
will have no effect.

Fix this by forcing a power cycle around transitions in those controls.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
Link: https://patch.msgid.link/20250406-apple-codec-changes-v5-1-50a00ec850a3@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees based on
my analysis of both the commit message and code changes. Here's my
extensive explanation: ## Bug Fix Analysis This commit addresses a
specific functional bug in the tas2770 audio codec driver where
ISENSE/VSENSE controls don't work properly when changed during active
playback. The commit message clearly states: "if those controls are
flipped on while the amplifier is already playing back audio, they will
have no effect." ## Code Changes Analysis The fix is contained and
minimal, involving three key changes to `sound/soc/codecs/tas2770.c`: 1.
**Addition of `sense_event` function (lines +21 to +43)**: This function
implements a power cycling mechanism that forces the amplifier through a
shutdown state when ISENSE/VSENSE controls are changed. This ensures the
changes take effect regardless of playback state. 2. **Modified DAPM
widget definitions (lines +45 to +48)**: The ISENSE and VSENSE switches
are changed from simple `SND_SOC_DAPM_SWITCH` to `SND_SOC_DAPM_SWITCH_E`
with event handling, connecting them to the new `sense_event` function.
3. **Event triggers**: The widgets respond to `SND_SOC_DAPM_PRE_REG` and
`SND_SOC_DAPM_POST_REG` events to perform the power cycling around
register changes. ## Why This Should Be Backported 1. **User-Affecting
Bug**: This fixes a real functional issue where audio controls don't
work as expected during playback, which directly impacts user
experience. 2. **Small and Contained**: The fix is confined to a single
driver file (`tas2770.c`) and doesn't affect other subsystems. The
changes are surgical and targeted. 3. **Low Risk**: The fix follows
established ASoC patterns using standard DAPM event handling. Similar
power cycling approaches are used throughout the ASoC subsystem. 4. **No
New Features**: This purely fixes existing functionality rather than
adding new features. 5. **Comparison with Similar Commits**: Looking at
the provided examples, this commit is very similar to "Similar Commit
#2" and "Similar Commit #5" which were both marked as backportable
(YES). Like commit #2, it fixes incorrect hardware behavior with a small
register/control change. Like commit #5, it addresses power state
management issues in audio hardware. 6. **Hardware-Specific Fix**: The
commit addresses a hardware limitation specific to the tas2770 chip
where ISENSE/VSENSE blocks are only powered up during shutdown-to-active
transitions. This is documented in the commit message and is a
legitimate hardware workaround. The fix ensures that software speaker
protection functionality works correctly by guaranteeing that IVSENSE
controls are functional, which is critical for protecting audio hardware
from damage.

 sound/soc/codecs/tas2770.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 863c3f672ba98..0931b6109755f 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -156,11 +156,37 @@ static const struct snd_kcontrol_new isense_switch =
 static const struct snd_kcontrol_new vsense_switch =
 	SOC_DAPM_SINGLE("Switch", TAS2770_PWR_CTRL, 2, 1, 1);
 
+static int sense_event(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct tas2770_priv *tas2770 = snd_soc_component_get_drvdata(component);
+
+	/*
+	 * Powering up ISENSE/VSENSE requires a trip through the shutdown state.
+	 * Do that here to ensure that our changes are applied properly, otherwise
+	 * we might end up with non-functional IVSENSE if playback started earlier,
+	 * which would break software speaker protection.
+	 */
+	switch (event) {
+	case SND_SOC_DAPM_PRE_REG:
+		return snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
+						    TAS2770_PWR_CTRL_MASK,
+						    TAS2770_PWR_CTRL_SHUTDOWN);
+	case SND_SOC_DAPM_POST_REG:
+		return tas2770_update_pwr_ctrl(tas2770);
+	default:
+		return 0;
+	}
+}
+
 static const struct snd_soc_dapm_widget tas2770_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_IN("ASI1", "ASI1 Playback", 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_MUX("ASI1 Sel", SND_SOC_NOPM, 0, 0, &tas2770_asi1_mux),
-	SND_SOC_DAPM_SWITCH("ISENSE", TAS2770_PWR_CTRL, 3, 1, &isense_switch),
-	SND_SOC_DAPM_SWITCH("VSENSE", TAS2770_PWR_CTRL, 2, 1, &vsense_switch),
+	SND_SOC_DAPM_SWITCH_E("ISENSE", TAS2770_PWR_CTRL, 3, 1, &isense_switch,
+		sense_event, SND_SOC_DAPM_PRE_REG | SND_SOC_DAPM_POST_REG),
+	SND_SOC_DAPM_SWITCH_E("VSENSE", TAS2770_PWR_CTRL, 2, 1, &vsense_switch,
+		sense_event, SND_SOC_DAPM_PRE_REG | SND_SOC_DAPM_POST_REG),
 	SND_SOC_DAPM_DAC_E("DAC", NULL, SND_SOC_NOPM, 0, 0, tas2770_dac_event,
 			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
 	SND_SOC_DAPM_OUTPUT("OUT"),
-- 
2.39.5

