Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BBF799007
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Sep 2023 21:36:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84623DEC;
	Fri,  8 Sep 2023 21:35:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84623DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694201807;
	bh=1K5r5hiuskro2gNQTiw+I6OgPu9bGerfXTpVUUnHHMs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rb/TbcM6sK0t5NvGqEYyKuU+KWLtReXap1Qq7AuRl5DkIZpal+AgAUOP5HBf/6wqe
	 Wh7O9Gz38oyZ5tVGGCRoG9BNVb6H83DzZCmAbNi6l1C6CdW0fp5oF72DWcY5O29bol
	 p1F2OHmJr58zdthSRf8Os2G+s4PGh2nlRY5mz2WY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49030F80552; Fri,  8 Sep 2023 21:35:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0934F80494;
	Fri,  8 Sep 2023 21:35:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E351F804F3; Fri,  8 Sep 2023 21:35:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28433F800F5
	for <alsa-devel@alsa-project.org>; Fri,  8 Sep 2023 21:35:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28433F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jdzyW3ow
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B5891B821E6;
	Fri,  8 Sep 2023 19:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC2AC4163C;
	Fri,  8 Sep 2023 19:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694201750;
	bh=1K5r5hiuskro2gNQTiw+I6OgPu9bGerfXTpVUUnHHMs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jdzyW3owasykpCt162bCtcaC7/lo8XyCo2OrntGWc91gJJioNsXm4V1/SVQ1BNqt8
	 bqOIbG9PLRZeV9kN9Fhqvcp1dglrmMvbdx8RYE12wH+UhzmGC1/nP8/yXeMgBa7LGz
	 EF5FfJlmAiIFV7rjeHculsSV+hBOx/PQP6iKsRMvYYHZ6yeFLk5Rw4xWBpfQr1QWWu
	 fXibn6VwNf16x5hMaUwWhX1M5CAfBpb3NeQaGu3cPfsk/h2TbRYYSxvm8q1MiS/xaf
	 sQw5n3GpBN4KJujltSmuwQbNfZWUCTPjZnasxg6c+8xTBcz6qC8E+HaAktyrTw8iFW
	 8HJ7fuKI5y7DQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	perex@perex.cz,
	tiwai@suse.com,
	broonie@kernel.org,
	amadeuszx.slawinski@linux.intel.com,
	bradynorander@gmail.com,
	muralidhar.reddy@intel.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 5.15 07/13] ALSA: hda: intel-dsp-cfg: use common
 include for MeteorLake
Date: Fri,  8 Sep 2023 15:35:23 -0400
Message-Id: <20230908193530.3463647-7-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908193530.3463647-1-sashal@kernel.org>
References: <20230908193530.3463647-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.131
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OP4GF2YEMLN3Z4FHIWJIEECI6PJYGU35
X-Message-ID-Hash: OP4GF2YEMLN3Z4FHIWJIEECI6PJYGU35
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OP4GF2YEMLN3Z4FHIWJIEECI6PJYGU35/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 73e6ebf6a21a62429282632eccb8aa4212489b3c ]

This was not updated in Commit 0cd0a7c2c599 ("ALSA: intel-dsp-config: Convert to PCI device IDs defines")

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20230802150105.24604-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/hda/intel-dsp-config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 513eadcc38d90..811d2ebc7d6ec 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -381,7 +381,7 @@ static const struct config_entry config_table[] = {
 	/* Meteorlake-P */
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
-		.device = 0x7e28,
+		.device = PCI_DEVICE_ID_INTEL_HDA_MTL,
 	},
 #endif
 
-- 
2.40.1

