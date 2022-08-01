Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1B7586F0B
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 18:55:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59C77868;
	Mon,  1 Aug 2022 18:54:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59C77868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659372932;
	bh=cyXU1qa/JDxmyPowWBIHYoIAd3HMNLS68YmuWkdq65c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wb0W6c5FFgRCCxBb6yRuTSZUlfRcVIX6I0lpcGM01e/7+L6VAc6BoygfCbn8rHy0p
	 7k3LbWVGvH1fRih+z0mR6LSeuXAruy91h1fKP0qPP4sjEQQGBRfddxGuGKisYo3z8Q
	 rOxuWT1OqMWVjjE3viuyvSRKoUmGrhM1weRgKJbc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB737F80246;
	Mon,  1 Aug 2022 18:54:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7F7EF802DB; Mon,  1 Aug 2022 18:54:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29ECEF8014B
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 18:54:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29ECEF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="M/CiXfOK"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="xWVi1TLv"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EED932034C;
 Mon,  1 Aug 2022 16:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659372863; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zSL+Ket4nCf261eCLXckqrhusqE/+ZShSkDd9Zclxr0=;
 b=M/CiXfOK6O5F70As58FsbVC32NciKyGGgY/owrDNa9PQl4Tkam1egEoBUCq9pOff384h9W
 IodJBYsCEhpEbFp8BvpZyVL/6sHZ3v4q0uDdQlDZeUXSKjKUwTw4fpFRtATRLgOoQ+Fcl/
 yrOJqxMzOU5q1Dd+5U/GA5zzER6n8i0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659372863;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zSL+Ket4nCf261eCLXckqrhusqE/+ZShSkDd9Zclxr0=;
 b=xWVi1TLvk4nejd/vBMTivzJ5UUpC0vIvaiHu6Zk6TiL9z47oJoMvTa0B9+oZYsJ57kRde8
 p+HMPyhhq5ZVq0Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C6AD313ADF;
 Mon,  1 Aug 2022 16:54:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OHKALz8F6GL9GQAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 01 Aug 2022 16:54:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/3] ASoC: Intel: avs: Fix potential buffer overflow by
 snprintf()
Date: Mon,  1 Aug 2022 18:54:18 +0200
Message-Id: <20220801165420.25978-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220801165420.25978-1-tiwai@suse.de>
References: <20220801165420.25978-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

snprintf() returns the would-be-filled size when the string overflows
the given buffer size, hence using this value may result in a buffer
overflow (although it's unrealistic).

This patch replaces it with a safer version, scnprintf() for papering
over such a potential issue.

Fixes: f1b3b320bd65 ("ASoC: Intel: avs: Generic soc component driver")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/avs/pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index f21b0cdd3206..8fe5917b1e26 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -636,8 +636,8 @@ static ssize_t topology_name_read(struct file *file, char __user *user_buf, size
 	char buf[64];
 	size_t len;
 
-	len = snprintf(buf, sizeof(buf), "%s/%s\n", component->driver->topology_name_prefix,
-		       mach->tplg_filename);
+	len = scnprintf(buf, sizeof(buf), "%s/%s\n", component->driver->topology_name_prefix,
+			mach->tplg_filename);
 
 	return simple_read_from_buffer(user_buf, count, ppos, buf, len);
 }
-- 
2.35.3

