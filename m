Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FB575E746
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 03:26:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79274DEF;
	Mon, 24 Jul 2023 03:25:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79274DEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690161992;
	bh=BRcrpuKACwoSLSPjWJNAjkOw7Ruma5i8fAf4A6kxVho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uKYhmR+CzycWKS/p9fQDyNjjKsF14Nuw/2TJP+h0MVJx7R+GGUzGoSpcNX6n5nPgT
	 NMWyNP9dvW6j6Pa4NQJB9lAfOqN03NwT00vggdlL5Gz3zI+4gR96h8Q97I79O9etOb
	 +X5wg080wqD6onymrmLOrPpv2IjldHIdeEMfnLu8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE705F805D9; Mon, 24 Jul 2023 03:24:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AE20F80588;
	Mon, 24 Jul 2023 03:24:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21BA3F805D4; Mon, 24 Jul 2023 03:24:03 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BE9C6F805B1
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 03:24:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE9C6F805B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eMkTPzaT
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B2D2060F54;
	Mon, 24 Jul 2023 01:24:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679DBC433C8;
	Mon, 24 Jul 2023 01:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690161839;
	bh=BRcrpuKACwoSLSPjWJNAjkOw7Ruma5i8fAf4A6kxVho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eMkTPzaTSrTg0MSr64TFEcdzs2rs7hhTWjqJyaKIxpEhIclUHk9/fJ5yd7//oe8dp
	 QuHd8+/NeCzZ9wMj8YGnGYLKUVN3trUCgTKmhj1HYM9jzmEH6Qa+P+UhXB+hlsmSTe
	 tUmkH1lcv1dIWgD2Wv1dggtk2Eh6TvKpdVQvRkkMsJ48x0DqIDwuhPJpYoixfVF9m8
	 wxWPT2bHyDEqtKUY7EaFGk+BHXP/VM6hv/+/r4YPFU8+9dvI7MNJVqmAT1sfmVK63k
	 jkH8Y8sdDDWtu4ShwwM6Z1bX3adbK1AXFXLcbjf9MbFXwKpOhn7FOjq32WZP8li1ZS
	 Py/IDCjVGK/mQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 5.15 10/23] ASoC: SOF: Intel: fix SoundWire/HDaudio
 mutual exclusion
Date: Sun, 23 Jul 2023 21:23:21 -0400
Message-Id: <20230724012334.2317140-10-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724012334.2317140-1-sashal@kernel.org>
References: <20230724012334.2317140-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.121
Content-Transfer-Encoding: 8bit
Message-ID-Hash: H7S4LBDFW3XVL62NHI2FZH2JL6SCMDPO
X-Message-ID-Hash: H7S4LBDFW3XVL62NHI2FZH2JL6SCMDPO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H7S4LBDFW3XVL62NHI2FZH2JL6SCMDPO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit f751b99255cacd9ffe8c4bbf99767ad670cee1f7 ]

The functionality described in Commit 61bef9e68dca ("ASoC: SOF: Intel: hda: enforce exclusion between HDaudio and SoundWire")
does not seem to be properly implemented with two issues that need to
be corrected.

a) The test used is incorrect when DisplayAudio codecs are not supported.

b) Conversely when only Display Audio codecs can be found, we do want
to start the SoundWire links, if any. That will help add the relevant
topologies and machine descriptors, and identify cases where the
SoundWire information in ACPI needs to be modified with a quirk.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/20230606222529.57156-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/intel/hda.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 35cbef171f4a3..038d09f6203aa 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1040,12 +1040,22 @@ static int hda_generic_machine_select(struct snd_sof_dev *sdev)
 			pdata->machine = hda_mach;
 			pdata->tplg_filename = tplg_filename;
 
-			if (codec_num == 2) {
+			if (codec_num == 2 ||
+			    (codec_num == 1 && !HDA_IDISP_CODEC(bus->codec_mask))) {
 				/*
 				 * Prevent SoundWire links from starting when an external
 				 * HDaudio codec is used
 				 */
 				hda_mach->mach_params.link_mask = 0;
+			} else {
+				/*
+				 * Allow SoundWire links to start when no external HDaudio codec
+				 * was detected. This will not create a SoundWire card but
+				 * will help detect if any SoundWire codec reports as ATTACHED.
+				 */
+				struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
+
+				hda_mach->mach_params.link_mask = hdev->info.link_mask;
 			}
 		}
 	}
-- 
2.39.2

