Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E8891D52E
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 02:18:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B470D2356;
	Mon,  1 Jul 2024 02:18:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B470D2356
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719793113;
	bh=VSZj8vRMujLB5UOFE2+NyN8F5a9YuB+XhvEijdmZaUA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nQejvczaq+lw+xOPDAq/lOeWxd6D190g4rQoEf+Clv2UjfqXCyhTZyBbQfp7I0Fvl
	 AD6h2p+eCIbtlS80oIu+sPeO7N0NzwARH7vLjMq1RAWeyYnIcYijYnKl76JBpw2M0g
	 zqAQDUhStGMuMuxYIgs49fSvXUQOoWtQ4rZo45aI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43939F8059F; Mon,  1 Jul 2024 02:18:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A7E1F8013D;
	Mon,  1 Jul 2024 02:18:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09716F8045D; Mon,  1 Jul 2024 02:12:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06E82F800E4
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 02:12:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06E82F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZUUxROcL
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0AA816108D;
	Mon,  1 Jul 2024 00:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C1D3C2BD10;
	Mon,  1 Jul 2024 00:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719792732;
	bh=VSZj8vRMujLB5UOFE2+NyN8F5a9YuB+XhvEijdmZaUA=;
	h=From:To:Cc:Subject:Date:From;
	b=ZUUxROcLlUabgTprCn6rXEdHV8l5OIwL8OsV0kXyeyGsbMiWshwwi9w7HJ7dT0xoN
	 hxmK+EilVS6/Mca8ltbhu8/7igeCDL/K4+//Q+HUl3Vn1jeAhCMJuMeNv1SB+R04nq
	 9kAv4Nszxuh//Z+VPcO+1abQrXrYSrsuZyOZ0TVm2qRPD5NjlaMN6Iu5Si8t0lZzwX
	 fyCPXX7eiRwuozZWHr0EOGwk40DDfKl6FuWxPEnxLAj13c0fG3lEv8DwbZ+S+eW464
	 o2prpmwTfPA7w/GP8AeyT4FtcMWxi1U2rN5LVExgFA2TtqUFws9BpN6fiala03YfVP
	 RBeeFdWdnmAuA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Simon Trimmer <simont@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.9 01/20] ALSA: hda: cs35l56: Fix lifecycle of codec
 pointer
Date: Sun, 30 Jun 2024 20:11:06 -0400
Message-ID: <20240701001209.2920293-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.7
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FHUH3U7FLKU5B6TH7WFVN72F4ALV7R2L
X-Message-ID-Hash: FHUH3U7FLKU5B6TH7WFVN72F4ALV7R2L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FHUH3U7FLKU5B6TH7WFVN72F4ALV7R2L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

[ Upstream commit d339131bf02d4ed918415574082caf5e8af6e664 ]

The codec should be cleared when the amp driver is unbound and when
resuming it should be tested to prevent loading firmware into the device
and ALSA in a partially configured system state.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20240531112716.25323-1-simont@opensource.cirrus.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/cs35l56_hda.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 11b0570ff56d4..0923e2589f5f7 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -735,6 +735,8 @@ static void cs35l56_hda_unbind(struct device *dev, struct device *master, void *
 	if (comps[cs35l56->index].dev == dev)
 		memset(&comps[cs35l56->index], 0, sizeof(*comps));
 
+	cs35l56->codec = NULL;
+
 	dev_dbg(cs35l56->base.dev, "Unbound\n");
 }
 
@@ -840,6 +842,9 @@ static int cs35l56_hda_system_resume(struct device *dev)
 
 	cs35l56->suspended = false;
 
+	if (!cs35l56->codec)
+		return 0;
+
 	ret = cs35l56_is_fw_reload_needed(&cs35l56->base);
 	dev_dbg(cs35l56->base.dev, "fw_reload_needed: %d\n", ret);
 	if (ret > 0) {
-- 
2.43.0

