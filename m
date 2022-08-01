Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE38586F14
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 18:57:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 645BA886;
	Mon,  1 Aug 2022 18:56:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 645BA886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659373066;
	bh=wop0Z3RRD1c82qJpdEiyWFgl5ZoFiXjk6kMbqlhxgnk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DEJRXEsRiGQ+SWLPk3qm8kNW6s4VMCIWrQ5Q9/laJnfg63fcsLrE6H4tEjCr3Cfm1
	 hO3yXsTim3SG4p0331DbM6FDhWNno0m/oSrnsSg+J+4WLCp3ILT87v5SX9/3TxuUkl
	 nzlZPy7kFpBeMCdV8h9Ri+LTseftsWyN7Of+8eJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED206F804FA;
	Mon,  1 Aug 2022 18:56:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09DFBF804FF; Mon,  1 Aug 2022 18:56:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AD97F80246
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 18:56:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AD97F80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="PQP4IGU0"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="+a7BjUo/"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D0FD820539;
 Mon,  1 Aug 2022 16:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659373002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ovhgxr1ApFJXH9LbFiK1bb/hnw+jJ/+jjORILyeWn4=;
 b=PQP4IGU0kNuhN72RBjrzUNi3Ym5xvKUxSpZYkNH0JPs/kWqQDuMKZ1IH6Kcn5ZPou39tUn
 o1kSZhukInWS5ySsO3U2KVuKgKbeg718b4M6F8xFE4vetfGt1slbIx8nd7/qxDM9XlEpWg
 8es8DPw6O8+LfWPn52Qww/eq6oD3iuc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659373002;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ovhgxr1ApFJXH9LbFiK1bb/hnw+jJ/+jjORILyeWn4=;
 b=+a7BjUo/TIv9bMu/1lDfjDH/0hHVSGsDczkACwfyAnpBSrApjs0Z5pTXLCGm8OjjJkXLIq
 LYZkA+JdX6QgnVBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF1E913ADF;
 Mon,  1 Aug 2022 16:56:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WP0CKsoF6GLXGgAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 01 Aug 2022 16:56:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/7] ALSA: ac97: Replace sprintf() with sysfs_emit()
Date: Mon,  1 Aug 2022 18:56:33 +0200
Message-Id: <20220801165639.26030-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220801165639.26030-1-tiwai@suse.de>
References: <20220801165639.26030-1-tiwai@suse.de>
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

For sysfs outputs, it's safer to use a new helper, sysfs_emit(),
instead of the raw sprintf() & co.  This patch replaces the open code
straightforwardly with a new helper.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/ac97/bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/ac97/bus.c b/sound/ac97/bus.c
index 0d31a6d71468..045330883a96 100644
--- a/sound/ac97/bus.c
+++ b/sound/ac97/bus.c
@@ -460,7 +460,7 @@ static ssize_t vendor_id_show(struct device *dev,
 {
 	struct ac97_codec_device *codec = to_ac97_device(dev);
 
-	return sprintf(buf, "%08x", codec->vendor_id);
+	return sysfs_emit(buf, "%08x", codec->vendor_id);
 }
 DEVICE_ATTR_RO(vendor_id);
 
-- 
2.35.3

