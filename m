Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C90CC6C826D
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 17:34:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDBF9E8D;
	Fri, 24 Mar 2023 17:33:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDBF9E8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679675686;
	bh=okel4Jpt9/4OhI7MScxS6ut1U4vgUK6kSVGKhuRylyQ=;
	h=From:Date:Subject:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=enDHzVArlbLg5wg2Vxf59cPWCBAsvnxHxiFC3UDl/VSv8kJZjG2PzUA4qbkLzXIEd
	 F8wd65pOFG8BbtClktz1kS78WUWlveFlTIK0PqcrK+U4bBHEDIe0TYCAjZdaFUklAK
	 ikZrCtgpcIqhpTekWycrF6lsl1hhWE3XC+BlEwrE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48EDDF8027B;
	Fri, 24 Mar 2023 17:33:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF2F3F802E8; Fri, 24 Mar 2023 17:33:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96956F8024E
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 17:33:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96956F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PDPOX/OR
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 856CF62BD4;
	Fri, 24 Mar 2023 16:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DB7DC433EF;
	Fri, 24 Mar 2023 16:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679675618;
	bh=okel4Jpt9/4OhI7MScxS6ut1U4vgUK6kSVGKhuRylyQ=;
	h=From:Date:Subject:To:Cc:From;
	b=PDPOX/OR3NV0DgDtSKQg/Vo0dI+EI31biNcqcNxkSqdOxn8V5XqPiBdcwmimW7W5v
	 d9gDkiWtCr/CMINZUQGMrnPVr7QhG/YNdvi1O+B9a0YSqsiEBUPqBQsDC9WArGCS7Y
	 7vH84t4b/iEOyse+h5dK8EuNGTS2SDCW4JU9hJwxDr8re4RIZBCE2e9S3edcUuPnbt
	 DppTgkkJ2WiXCNBbwuHbI7IgNNJeKTVeSluVwzWmMe6QgvUEyNdcplFgZJlpx+skZi
	 u693Uyu0g3OTNYgoMS//UBZHnGZb3jPwbdnxaTuRAP+HIFMG850vzPlb2lWet7W6zX
	 4r7sO+TLkQfwQ==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 24 Mar 2023 16:33:28 +0000
Subject: [PATCH] ASoC: dapm: Sort speakers after other outputs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230324-asoc-dapm-spk-v1-1-e1f27f766505@kernel.org>
X-B4-Tracking: v=1; b=H4sIANfQHWQC/x2N0QrCMAwAf2Xk2UBtJ6i/Ij6kXeLKsC0JTGHs3
 +18vIPjNjDWzAb3YQPlNVuupcP5NECaqbwY89QZvPPBBT8iWU04UXujtQWDo2uUm8goF+hNJGO
 MSiXNR/Wpuhy6KUv+/jeP577/AEMWpcF2AAAA
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
X-Mailer: b4 0.13-dev-2eb1a
X-Developer-Signature: v=1; a=openpgp-sha256; l=3781; i=broonie@kernel.org;
 h=from:subject:message-id; bh=okel4Jpt9/4OhI7MScxS6ut1U4vgUK6kSVGKhuRylyQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkHdDe/4tG30seqgW7ANCZogMj48JsDTkLdkAFx8g3
 /EcO/sCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZB3Q3gAKCRAk1otyXVSH0AoSB/
 0ezvOzVyyCaDM/yj74puD0aO5rdQtJ2ginLOo3bwhRu5iVglxMlyrqrbiG5MLa5Y/AX9nFdFQsc6lE
 ZB+NJJaItc3DsGXzzrZD/B5DQN0SDalrgqZfnu5xOB70tRDUCEkb4TcmqJlAEzkDTsSL42TvgbWv6+
 /3vswipw7uS5D98pJWdn/878rm50VuiJpSGGUXx7Z4YSjM3Ap5BsFJ6TrWyPmgNmfLWMdypCTel4h6
 74eARyq1HS3VyDU/2F1lfzt37jdqvjgbHuGucBWNXkpdGDACIb/8DdhsO+d4nUyBNlYPvCXQO03M5M
 nnj2VUpMuV9GaJvaaRiltD8r6pOPyv
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: H4J6VUTJKBIQ3WKJJ4UFQGPOSSEYRLHP
X-Message-ID-Hash: H4J6VUTJKBIQ3WKJJ4UFQGPOSSEYRLHP
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H4J6VUTJKBIQ3WKJJ4UFQGPOSSEYRLHP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently we sequence speakers with line and headphone outputs in DAPM.
This works well when speakers are integrate into a CODEC but when there is
an external speaker driver connected to a line or headphone output it can
mean that the speaker driver ends up getting sequenced such that it picks
up pops and clicks from the CODEC. Mask this by moving speakers after the
other outputs in DAPM.

We may want to consider doing this for headphones too but separate drivers
are less common there and headphone drivers often also function as line
outputs so the situation is less clear.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-dapm.c | 74 ++++++++++++++++++++++++++--------------------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 5d9a671e50f1..34fdcb7ee079 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -99,52 +99,52 @@ static int dapm_up_seq[] = {
 	[snd_soc_dapm_adc] = 11,
 	[snd_soc_dapm_out_drv] = 12,
 	[snd_soc_dapm_hp] = 12,
-	[snd_soc_dapm_spk] = 12,
 	[snd_soc_dapm_line] = 12,
 	[snd_soc_dapm_sink] = 12,
-	[snd_soc_dapm_kcontrol] = 13,
-	[snd_soc_dapm_post] = 14,
+	[snd_soc_dapm_spk] = 13,
+	[snd_soc_dapm_kcontrol] = 14,
+	[snd_soc_dapm_post] = 15,
 };
 
 static int dapm_down_seq[] = {
 	[snd_soc_dapm_pre] = 1,
 	[snd_soc_dapm_kcontrol] = 2,
 	[snd_soc_dapm_adc] = 3,
-	[snd_soc_dapm_hp] = 4,
 	[snd_soc_dapm_spk] = 4,
-	[snd_soc_dapm_line] = 4,
-	[snd_soc_dapm_out_drv] = 4,
-	[snd_soc_dapm_sink] = 4,
-	[snd_soc_dapm_pga] = 5,
-	[snd_soc_dapm_buffer] = 5,
-	[snd_soc_dapm_scheduler] = 5,
-	[snd_soc_dapm_effect] = 5,
-	[snd_soc_dapm_src] = 5,
-	[snd_soc_dapm_asrc] = 5,
-	[snd_soc_dapm_encoder] = 5,
-	[snd_soc_dapm_decoder] = 5,
-	[snd_soc_dapm_switch] = 6,
-	[snd_soc_dapm_mixer_named_ctl] = 6,
-	[snd_soc_dapm_mixer] = 6,
-	[snd_soc_dapm_dac] = 7,
-	[snd_soc_dapm_mic] = 8,
-	[snd_soc_dapm_siggen] = 8,
-	[snd_soc_dapm_input] = 8,
-	[snd_soc_dapm_output] = 8,
-	[snd_soc_dapm_micbias] = 9,
-	[snd_soc_dapm_vmid] = 9,
-	[snd_soc_dapm_mux] = 10,
-	[snd_soc_dapm_demux] = 10,
-	[snd_soc_dapm_aif_in] = 11,
-	[snd_soc_dapm_aif_out] = 11,
-	[snd_soc_dapm_dai_in] = 11,
-	[snd_soc_dapm_dai_out] = 11,
-	[snd_soc_dapm_dai_link] = 12,
-	[snd_soc_dapm_supply] = 13,
-	[snd_soc_dapm_clock_supply] = 14,
-	[snd_soc_dapm_pinctrl] = 14,
-	[snd_soc_dapm_regulator_supply] = 14,
-	[snd_soc_dapm_post] = 15,
+	[snd_soc_dapm_hp] = 5,
+	[snd_soc_dapm_line] = 5,
+	[snd_soc_dapm_out_drv] = 5,
+	[snd_soc_dapm_sink] = 6,
+	[snd_soc_dapm_pga] = 6,
+	[snd_soc_dapm_buffer] = 6,
+	[snd_soc_dapm_scheduler] = 6,
+	[snd_soc_dapm_effect] = 6,
+	[snd_soc_dapm_src] = 6,
+	[snd_soc_dapm_asrc] = 6,
+	[snd_soc_dapm_encoder] = 6,
+	[snd_soc_dapm_decoder] = 6,
+	[snd_soc_dapm_switch] = 7,
+	[snd_soc_dapm_mixer_named_ctl] = 7,
+	[snd_soc_dapm_mixer] = 7,
+	[snd_soc_dapm_dac] = 8,
+	[snd_soc_dapm_mic] = 9,
+	[snd_soc_dapm_siggen] = 9,
+	[snd_soc_dapm_input] = 9,
+	[snd_soc_dapm_output] = 9,
+	[snd_soc_dapm_micbias] = 10,
+	[snd_soc_dapm_vmid] = 10,
+	[snd_soc_dapm_mux] = 11,
+	[snd_soc_dapm_demux] = 11,
+	[snd_soc_dapm_aif_in] = 12,
+	[snd_soc_dapm_aif_out] = 12,
+	[snd_soc_dapm_dai_in] = 12,
+	[snd_soc_dapm_dai_out] = 12,
+	[snd_soc_dapm_dai_link] = 13,
+	[snd_soc_dapm_supply] = 14,
+	[snd_soc_dapm_clock_supply] = 15,
+	[snd_soc_dapm_pinctrl] = 15,
+	[snd_soc_dapm_regulator_supply] = 15,
+	[snd_soc_dapm_post] = 16,
 };
 
 static void dapm_assert_locked(struct snd_soc_dapm_context *dapm)

---
base-commit: e8d018dd0257f744ca50a729e3d042cf2ec9da65
change-id: 20230324-asoc-dapm-spk-30a8bf9ff4f5

Best regards,
-- 
Mark Brown <broonie@kernel.org>

