Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F9D8BF0C3
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 01:11:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65C3DDF6;
	Wed,  8 May 2024 01:11:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65C3DDF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715123491;
	bh=R4A3Jb9aZLMRVk1H1aorfEqnyalruYt56W9sJFqjOhg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QeyiwNoDmidqfjvabv/6mz8HIhVyVdomr5B+yXH1ESHa2hIgtGyAL1LpjYpzpwlUF
	 DSJOHTuRDc41zJQaij5RIqxrr8mvejuYJ9XZtoafY+mQ5A2Y+gBljc87FiPJN6OAHM
	 46PzIRJaRLsut93PaCYjGTUXivBeim1CiMFhh76I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47C35F805D6; Wed,  8 May 2024 01:10:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 617C0F805CB;
	Wed,  8 May 2024 01:10:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5525EF80423; Wed,  8 May 2024 01:10:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 089F0F8003A
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 01:10:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 089F0F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=j0KHw/2L
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7275261A21;
	Tue,  7 May 2024 23:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 046D4C4DDE5;
	Tue,  7 May 2024 23:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715123439;
	bh=R4A3Jb9aZLMRVk1H1aorfEqnyalruYt56W9sJFqjOhg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j0KHw/2LVbdoNLEHXA4KYd7f7hnIRbeVueZ7T+AjfGhs1TdaIv4DdjCo96Hwnwnjr
	 jg8XctyWzcEGH4UxuoKLbk8GypEHAySq25J8/4OezBaAO3alBsh1gENfRScFlr5Qmc
	 +3GsHk+1rodkxrtrVCXolz5fUsYKKw4Fx2VPDqAMA1mKDTfyloxmnLtS2zWyIafo8o
	 OSUfWhMyhL/mJQ4j7ec8B04wEG5sb5HDsCRDFUz5cOUu+72QxWCGTDdRlyVRpJ3073
	 4fv1RGEkBJI1valR2jHmEpYsyswBjizNLo+qYtCqg+fBwUBnlKfx6R2ydggj3FXjap
	 SRHGUWV37r+Bw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	james.schulman@cirrus.com,
	david.rhodes@cirrus.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 03/43] ALSA: hda: cs35l56: Exit cache-only after
 cs35l56_wait_for_firmware_boot()
Date: Tue,  7 May 2024 19:09:24 -0400
Message-ID: <20240507231033.393285-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507231033.393285-1-sashal@kernel.org>
References: <20240507231033.393285-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.30
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RV46U2TBV2U6LSQPYVU257G3MEURSJFJ
X-Message-ID-Hash: RV46U2TBV2U6LSQPYVU257G3MEURSJFJ
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Richard Fitzgerald <rf@opensource.cirrus.com>

[ Upstream commit 73580ec607dfe125b140ed30c7c0a074db78c558 ]

Adds calls to disable regmap cache-only after a successful return from
cs35l56_wait_for_firmware_boot().

This is to prepare for a change in the shared ASoC module that will
leave regmap in cache-only mode after cs35l56_system_reset(). This is
to prevent register accesses going to the hardware while it is
rebooting.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Link: https://msgid.link/r/20240408101803.43183-3-rf@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/cs35l56_hda.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 27848d6469636..05b1412868fc0 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -603,6 +603,8 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 		ret = cs35l56_wait_for_firmware_boot(&cs35l56->base);
 		if (ret)
 			goto err_powered_up;
+
+		regcache_cache_only(cs35l56->base.regmap, false);
 	}
 
 	/* Disable auto-hibernate so that runtime_pm has control */
@@ -942,6 +944,8 @@ int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int id)
 	if (ret)
 		goto err;
 
+	regcache_cache_only(cs35l56->base.regmap, false);
+
 	ret = cs35l56_set_patch(&cs35l56->base);
 	if (ret)
 		goto err;
-- 
2.43.0

