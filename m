Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B362B7D9CE2
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 17:26:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0661AE9;
	Fri, 27 Oct 2023 17:25:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0661AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698420403;
	bh=VROuko5K8q97+Xwgq8pAwl1aEf0SQdloFO2Kq63UPCM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IAdPH+YjnTfp6Mggh7+m02Lzfs0q4iYFXNwbRkt90qETzluUfMfMji7UIhurMq3Ta
	 gbKFJxHQmRq6cLHIo8YSW3jf5iY4zh+aRP1ijvNp7ufkSoK6AztyjySw8LBF0D1/oG
	 O5CrmBXS+CpxESsP+AqR+qc01YWj+y9WOylihSa4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02FB4F8028D; Fri, 27 Oct 2023 17:25:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F915F80165;
	Fri, 27 Oct 2023 17:25:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E053DF8019B; Fri, 27 Oct 2023 17:25:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D21BEF8014B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 17:25:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D21BEF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FS1BPOe8
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 9EF68B81CF7;
	Fri, 27 Oct 2023 15:25:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D593C433C8;
	Fri, 27 Oct 2023 15:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698420322;
	bh=VROuko5K8q97+Xwgq8pAwl1aEf0SQdloFO2Kq63UPCM=;
	h=From:To:Cc:Subject:Date:From;
	b=FS1BPOe8kPw9vWm002m0NPlWlCIzQa1WXJIZaqIy2w4KexEWvx+qvn1cN/AcCD72X
	 m/x4GMIiYQFdhqiFVkaTWM8dV+W0SQPvw2BU2N6qiN63Ahf2yK7FpzKvOHqxTfV7pi
	 5VWZkD0yM44aHrzcnQroEPD7HZZBuSYRhomHmLcy1IvicwMuqx5K17D8WVLAwsxioV
	 O9EKb3U5m1MO7rye7UpD+SOQaacVopt5hR/qjwtVcfkeQR/nvc3R7q72d60xlO6EIb
	 hm/zUZBhHLIkWkO0vvaA6I9gZB5fxWwtCMwlE9l0B9z+TSrTXu4OQOx2x/XvJA4fPR
	 m5KEhVIbL6LWQ==
From: Arnd Bergmann <arnd@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Mark Brown <broonie@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda: cs35l41: mark cs35l41_verify_id() static
Date: Fri, 27 Oct 2023 17:25:09 +0200
Message-Id: <20231027152515.482411-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2QMEP7CBOTS5P7ZMKRCQW73YUOCZ4PZH
X-Message-ID-Hash: 2QMEP7CBOTS5P7ZMKRCQW73YUOCZ4PZH
X-MailFrom: arnd@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2QMEP7CBOTS5P7ZMKRCQW73YUOCZ4PZH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

The newly introduced function is global but only called in this one
file and has no extern prototype, so it should probably be static:

sound/pci/hda/cs35l41_hda.c:733:5: error: no previous prototype for 'cs35l41_verify_id' [-Werror=missing-prototypes]
  733 | int cs35l41_verify_id(struct cs35l41_hda *cs35l41, unsigned int *regid, unsigned int *reg_revid)

Fixes: 881b7bce0c25 ("ALSA: hda: cs35l41: Run boot process during resume callbacks")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/pci/hda/cs35l41_hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 496ff6a9d300..98a5123e9f50 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -730,7 +730,7 @@ static int cs35l41_hda_channel_map(struct device *dev, unsigned int tx_num, unsi
 				    rx_slot);
 }
 
-int cs35l41_verify_id(struct cs35l41_hda *cs35l41, unsigned int *regid, unsigned int *reg_revid)
+static int cs35l41_verify_id(struct cs35l41_hda *cs35l41, unsigned int *regid, unsigned int *reg_revid)
 {
 	unsigned int mtl_revid, chipid;
 	int ret;
-- 
2.39.2

