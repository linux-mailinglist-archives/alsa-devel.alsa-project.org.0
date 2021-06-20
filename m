Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0873ADD5F
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Jun 2021 09:01:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6016816F8;
	Sun, 20 Jun 2021 09:00:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6016816F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624172494;
	bh=aDF9o1+QiVWKz+9h4YPYoUqq116XE8OWlS/4STBaeWg=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Qre7fk2pi9jLdPGFu+g8Lv6ggY5eZFRv9tjHaMXmUvprJw1Z3HqiNwsklBwk5E9KE
	 keuzhvq1rM4OAz184DnPcfdMt1FlXcOURKmUb8Cy6qAXDElbJTiJ1DwsfJlibOX5LK
	 aKMwh8NYB9tNDnQgA74ANLq1iErc8avXrvPi0hVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D228DF8026A;
	Sun, 20 Jun 2021 09:00:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 304FAF8026A; Sun, 20 Jun 2021 09:00:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 004C5F80137
 for <alsa-devel@alsa-project.org>; Sun, 20 Jun 2021 08:59:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 004C5F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="zAptMlJD"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="qpczjU2M"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 686421FD29
 for <alsa-devel@alsa-project.org>; Sun, 20 Jun 2021 06:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624172394; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kv/Pe1bGRpu+qXfX3Bn1hgXyV4tTsGuiJspXq1wtro0=;
 b=zAptMlJDQ0syOhW8tyTkYFmZf0MqEVRNG4Y0TGPMeJFFMe7PmDk9QXe9eo5hymRp6a+3ka
 smn293kAvoqKZ5xVNzmfquCFHJSQ6Q3QiH16GNItlckqWgBC5bOL7PbnUTS5ZRGE4uh/8y
 A1KCVpDHUgqyZaWRIBOZHJAF6lUu5eI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624172394;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kv/Pe1bGRpu+qXfX3Bn1hgXyV4tTsGuiJspXq1wtro0=;
 b=qpczjU2MmxvRRbdEhrhPR/HruXVxJTXYug8VqVuDP+F6Kkx/7Mfw6IHlSu+KB0n25pzYCA
 J0iGf0gcw11IZxCQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 5838CA3B81;
 Sun, 20 Jun 2021 06:59:54 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Fix bass speaker DAC mapping for Asus
 UM431D
Date: Sun, 20 Jun 2021 08:59:52 +0200
Message-Id: <20210620065952.18948-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Asus Zenbook 14 UM431D has two speaker pins and a headphone pin, and
the auto-parser ends up assigning the bass to the third DAC 0x06.
Although the tone comes out, it's inconvenient because this DAC has no
volume control unlike two other DACs.

For obtaining the volume control for the bass speaker, this patch
enforces the mapping to let both front and bass speaker pins sharing
the same DAC.  It's not ideal but a little bit of improvement.

Since we've already applied the same workaround for another ASUS
machine, we just need to hook the chain to the existing quirk.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=212547
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 07eabcf22b5f..49f4cac8b05e 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7839,6 +7839,8 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ 0x20, AC_VERB_SET_PROC_COEF, 0x4e4b },
 			{ }
 		},
+		.chained = true,
+		.chain_id = ALC289_FIXUP_ASUS_GA401,
 	},
 	[ALC285_FIXUP_HP_GPIO_LED] = {
 		.type = HDA_FIXUP_FUNC,
-- 
2.26.2

