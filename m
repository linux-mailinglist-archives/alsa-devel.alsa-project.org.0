Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CDF77DA84
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 08:36:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EFBA204;
	Wed, 16 Aug 2023 08:35:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EFBA204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692167793;
	bh=B1XhsXeOf1KLuzzoE7Hj+Wd1xXbt2MCXFeUH7y8hK7s=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DXJNXRsKq8wOw0EBXxw0HLjN8LIrSPvWf8dDg9aBn9uHU5H/lrOJoONofIeZfG56w
	 jNSs9BrJC35/Gb3i6ZbjNOAbYmybgUfgT2Uezvcz/kDEnPy7UTApzgz474+34cp/wg
	 gQF24wXvVqnLw0ii+FsArykGuptALbvZT0FrQwAQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B634EF80254; Wed, 16 Aug 2023 08:35:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C6EAF8016A;
	Wed, 16 Aug 2023 08:35:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5929BF8016D; Wed, 16 Aug 2023 08:35:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D1B8F80074
	for <alsa-devel@alsa-project.org>; Wed, 16 Aug 2023 08:35:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D1B8F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=CPY88hhh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=wMrxSW41
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3C1762195A;
	Wed, 16 Aug 2023 06:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692167730;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=CZw//hx3nZChmTaRkEMviDhO/KS2uaA7nPuJ0Ct7itc=;
	b=CPY88hhheJJvb5tlK2nWWysxdPqwjJmrBsIFklg9FGXPv7LvwbuhP+1yjcWYJPRPvZyYgK
	yxyb+zKVgnPxWkoIamPWrcg1eBrFE8DhTeX8Tuf9I53HHpzkNGNvB5daeL0mIJdZKJlGdX
	tBc28x9C5noNWGWEH4phXkvrSZkDWfk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692167730;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=CZw//hx3nZChmTaRkEMviDhO/KS2uaA7nPuJ0Ct7itc=;
	b=wMrxSW41HZGnZoUgvVTGnUOFtO6Y33KfJiDl1pqDkexEur2xWKODUBOo6w1sMaQ3CA8n1V
	7okHtFkm+YLV5VDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1A59C133F2;
	Wed, 16 Aug 2023 06:35:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4y6IBTJu3GQ8dQAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 16 Aug 2023 06:35:30 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH] ALSA: hda: cs35l41: Fix the loop check in
 cs35l41_add_dsd_properties
Date: Wed, 16 Aug 2023 08:35:25 +0200
Message-Id: <20230816063525.23009-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6RCUULH3A5KD27KOY3FOG2HOBVP4G2UK
X-Message-ID-Hash: 6RCUULH3A5KD27KOY3FOG2HOBVP4G2UK
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6RCUULH3A5KD27KOY3FOG2HOBVP4G2UK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

model->hid is a pointer, and should be rather NULL-checked in the loop
of cs35l41_prop_model_table.

Fixes: ef4ba63f12b0 ("ALSA: hda: cs35l41: Support systems with missing _DSD properties")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308160506.8lCEeFDG-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/cs35l41_hda_property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index 673f23257a09..48dcc3f1ef88 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -61,7 +61,7 @@ int cs35l41_add_dsd_properties(struct cs35l41_hda *cs35l41, struct device *physd
 {
 	const struct cs35l41_prop_model *model;
 
-	for (model = cs35l41_prop_model_table; model->hid > 0; model++) {
+	for (model = cs35l41_prop_model_table; model->hid; model++) {
 		if (!strcmp(model->hid, hid) &&
 		    (!model->ssid ||
 		     (cs35l41->acpi_subsystem_id &&
-- 
2.35.3

