Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F2D6906B6
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 12:19:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03D02DF3;
	Thu,  9 Feb 2023 12:19:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03D02DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675941596;
	bh=oePXfbpF/+zX1IsYlzhJ0N2jEXssdJojoV7L75QJXMQ=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ExcRHXZ18LVN/iL0Ut4J7ljkm5Wy2VREvi1KTGwQShg54qnpEPUlcqrsIkb+zr2d2
	 5ULjdv+14jG5zwsSoqN2nKlDbwtjHCzpBnMFr7rXseiVH9/JzW0PQO2DfZ++nDbIB+
	 w5G1kT09nsqs8cYBcuBywU0F3/XxJKxN8qyarTxg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E08AF80549;
	Thu,  9 Feb 2023 12:17:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41B13F80553; Thu,  9 Feb 2023 12:17:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E45B5F80544
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 12:17:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E45B5F80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WhpbqDuM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2F7A9B820F2;
	Thu,  9 Feb 2023 11:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF5FC433EF;
	Thu,  9 Feb 2023 11:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675941466;
	bh=oePXfbpF/+zX1IsYlzhJ0N2jEXssdJojoV7L75QJXMQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WhpbqDuMwZPCDyMbBFa2EcZrCxpaPPhCH5GnYPnxqwXuePfs9H8iwkECcJyeXMKy3
	 l7U0dVP2CvpEtMBwYz00m7d0M5dhkPOnjGyViNhrMMoTvbOBjPhpbv3zNCDVY86vDs
	 SUoOcpVSh/3+qZ4z96i1m6o6wzPV2MJQv34/tuanx2wztsPdYtJVW5yVg26twX+DgD
	 N6cgsqzmvnVBQWa27/QZ221I3Zgkxb1pLkg3JkOSFKAlnp7cFDH5KKHCl1w8cXt/DH
	 /qBlqyy+MT2acPF/9fDfQ0HURhjXIm5HqYAGl6jbWpC0JvvKKz2LiLvHiUP8W1sywE
	 H9bm0bIucN4/A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 04/17] ALSA: hda: Do not unset preset when
 cleaning up codec
Date: Thu,  9 Feb 2023 06:17:16 -0500
Message-Id: <20230209111731.1892569-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230209111731.1892569-1-sashal@kernel.org>
References: <20230209111731.1892569-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YENPPRVWREJZ5OC5UHCILTJB6IQBFG5B
X-Message-ID-Hash: YENPPRVWREJZ5OC5UHCILTJB6IQBFG5B
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Cezary Rojewski <cezary.rojewski@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Takashi Iwai <tiwai@suse.de>,
 Sasha Levin <sashal@kernel.org>, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, mkumard@nvidia.com,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YENPPRVWREJZ5OC5UHCILTJB6IQBFG5B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Cezary Rojewski <cezary.rojewski@intel.com>

[ Upstream commit 87978e6ad45a16835cc58234451111091be3c59a ]

Several functions that take part in codec's initialization and removal
are re-used by ASoC codec drivers implementations. Drivers mimic the
behavior of hda_codec_driver_probe/remove() found in
sound/pci/hda/hda_bind.c with their component->probe/remove() instead.

One of the reasons for that is the expectation of
snd_hda_codec_device_new() to receive a valid pointer to an instance of
struct snd_card. This expectation can be met only once sound card
components probing commences.

As ASoC sound card may be unbound without codec device being actually
removed from the system, unsetting ->preset in
snd_hda_codec_cleanup_for_unbind() interferes with module unload -> load
scenario causing null-ptr-deref. Preset is assigned only once, during
device/driver matching whereas ASoC codec driver's module reloading may
occur several times throughout the lifetime of an audio stack.

Suggested-by: Takashi Iwai <tiwai@suse.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Link: https://lore.kernel.org/r/20230119143235.1159814-1-cezary.rojewski@intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/hda_bind.c  | 2 ++
 sound/pci/hda/hda_codec.c | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_bind.c b/sound/pci/hda/hda_bind.c
index 7af2515735957..8e35009ec25cb 100644
--- a/sound/pci/hda/hda_bind.c
+++ b/sound/pci/hda/hda_bind.c
@@ -144,6 +144,7 @@ static int hda_codec_driver_probe(struct device *dev)
 
  error:
 	snd_hda_codec_cleanup_for_unbind(codec);
+	codec->preset = NULL;
 	return err;
 }
 
@@ -166,6 +167,7 @@ static int hda_codec_driver_remove(struct device *dev)
 	if (codec->patch_ops.free)
 		codec->patch_ops.free(codec);
 	snd_hda_codec_cleanup_for_unbind(codec);
+	codec->preset = NULL;
 	module_put(dev->driver->owner);
 	return 0;
 }
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index f552785d301e0..19be60bb57810 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -791,7 +791,6 @@ void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec)
 	snd_array_free(&codec->cvt_setups);
 	snd_array_free(&codec->spdif_out);
 	snd_array_free(&codec->verbs);
-	codec->preset = NULL;
 	codec->follower_dig_outs = NULL;
 	codec->spdif_status_reset = 0;
 	snd_array_free(&codec->mixers);
-- 
2.39.0

