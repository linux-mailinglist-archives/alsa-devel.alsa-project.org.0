Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD294799031
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Sep 2023 21:37:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BDD5E73;
	Fri,  8 Sep 2023 21:36:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BDD5E73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694201858;
	bh=T907AVMcBxC9wUoVYSZsme7a/qh6K+dQP8ytjAQs58k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B4j2h/FQ1Dvek1L5ZOtUxiSErahX3dE9KBo+RGEMO/TFF1cXIJGOPk+7EpDNGXRp0
	 DNlivOwIqgcxP7yNW7idcIWXLooisH02KfcpMSKPLYTSOvFD1pU1ujQ+/8l9mF6ZNZ
	 E+iil4OVnl5zYDWNtgsAJqaP8JXZw1QczTg01PVI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB0EAF8056F; Fri,  8 Sep 2023 21:36:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E551F80571;
	Fri,  8 Sep 2023 21:36:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56BDDF8057B; Fri,  8 Sep 2023 21:36:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6169F80579
	for <alsa-devel@alsa-project.org>; Fri,  8 Sep 2023 21:36:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6169F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Q0hR+oXl
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id A129FCE1C4E;
	Fri,  8 Sep 2023 19:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C8AC116B1;
	Fri,  8 Sep 2023 19:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694201789;
	bh=T907AVMcBxC9wUoVYSZsme7a/qh6K+dQP8ytjAQs58k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q0hR+oXlRPqfTTuTWQW207pEdP9GxE0RC1tW/0w7fYb/kZRwwhqeSbfm61c/UwmWn
	 xvQnb0Vl1qVNIpsoTSqbY9D787vbt2/v8ucgIccZrvq2y+8Vs4eHdPpL3qCoC26VL7
	 MKL0sYRiA7JIeDchlxTcNYboURBIrL6rLKwEKjTdoiqmr2wn2jflE1dCcLtAjiN0AI
	 JBl3+eY4tj/JWolK0SXf0hyvt7SJrettryMCzef+d4mwWRGZqdoQt5n59ZeL20sXB6
	 x/kS4HhSljQE7zFgePD/v018yhU7rgE5WClWXi/TxvcFYXcMTRcWSDxxVvsi2fhqEH
	 ZYVG+keV+aM9g==
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
Subject: [PATCH AUTOSEL 5.10 4/9] ALSA: hda: intel-dsp-cfg: use common include
 for MeteorLake
Date: Fri,  8 Sep 2023 15:36:05 -0400
Message-Id: <20230908193611.3463821-4-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908193611.3463821-1-sashal@kernel.org>
References: <20230908193611.3463821-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.194
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OOE7Y6MSXKKL43K2HP5L5CAP5DIOMFPC
X-Message-ID-Hash: OOE7Y6MSXKKL43K2HP5L5CAP5DIOMFPC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OOE7Y6MSXKKL43K2HP5L5CAP5DIOMFPC/>
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
index f96e70c85f84a..ae785d9588fee 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -364,7 +364,7 @@ static const struct config_entry config_table[] = {
 	/* Meteorlake-P */
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
-		.device = 0x7e28,
+		.device = PCI_DEVICE_ID_INTEL_HDA_MTL,
 	},
 #endif
 
-- 
2.40.1

