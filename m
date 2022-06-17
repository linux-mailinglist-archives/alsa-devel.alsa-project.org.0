Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B888E54F967
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 16:43:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FEA01F1A;
	Fri, 17 Jun 2022 16:42:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FEA01F1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655477004;
	bh=4AhXHW/qaD+kjYkKNZEckY62iWs2DAVoIzCN0wvH/uA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YLlJOP1OYRuJ2z1VMQxAnTX7gxEtak9TKYwcQvEO1/2+xOIB8GSHFexk0NIefwZ2C
	 bSnZMHnIxI0HQT7JgDBmTzZSIPOidMWgN5qV/kIWwuCj9VltSFltSkNUUF2x4K4l9k
	 Np6YIEkoXZVakodhJWozzI2eP2n5vjNRBZwySQvM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82C1CF80548;
	Fri, 17 Jun 2022 16:41:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE960F8053E; Fri, 17 Jun 2022 16:41:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AED4F80528
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 16:40:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AED4F80528
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="RCJpB9FK"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="UP0RDxJi"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D961121E41;
 Fri, 17 Jun 2022 14:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655476855; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZGkXG1xnzX0VB45f9WjivjukT6cJNqRAE3FdcbJBjEU=;
 b=RCJpB9FKB0G2guvda9tNr6m/UK2nAuuvwKbAymBG//bZ0E37ZdRXyJREygtokXN6TiAtnd
 Zw3CDfTHjcPkHsNdtT6+E7gLa7jbjateooPoi4gfYFGTai7prIScRncgL9V8Jj5+jv3WIE
 WG+7KwAVhjKyGL0IZNC8bHP0W/DJj0w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655476855;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZGkXG1xnzX0VB45f9WjivjukT6cJNqRAE3FdcbJBjEU=;
 b=UP0RDxJiC8RHWJzNVsDSMIR/XOYcWhdVKS32mdTCd1N+Pwn2vfYikOyFEemEcwr7wxiEFr
 wCAjFZMHMN4UHxAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BEA6F1348F;
 Fri, 17 Jun 2022 14:40:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kH+4LXeSrGIYNQAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 17 Jun 2022 14:40:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/5] ALSA: rawmidi: Take open_mutex around parameter changes
Date: Fri, 17 Jun 2022 16:40:49 +0200
Message-Id: <20220617144051.18985-4-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220617144051.18985-1-tiwai@suse.de>
References: <20220617144051.18985-1-tiwai@suse.de>
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

The input/output parameter changes are pretty intrusive, possibly
involving with the buffer resizing operation.  Hence those should be
performed exclusively; otherwise some ugly race could happen.

This patch puts the existing open_mutex for snd_rawmidi_input_params()
and *_output_params() for protecting the concurrent calls.  Since
those are exported, it's also meant for hardening from the external
calls, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/rawmidi.c | 39 +++++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 0a00f37d8c42..7fd6b369d46f 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -712,11 +712,19 @@ static int resize_runtime_buffer(struct snd_rawmidi_substream *substream,
 int snd_rawmidi_output_params(struct snd_rawmidi_substream *substream,
 			      struct snd_rawmidi_params *params)
 {
-	if (substream->append && substream->use_count > 1)
-		return -EBUSY;
+	int err;
+
 	snd_rawmidi_drain_output(substream);
-	substream->active_sensing = !params->no_active_sensing;
-	return resize_runtime_buffer(substream, params, false);
+	mutex_lock(&substream->rmidi->open_mutex);
+	if (substream->append && substream->use_count > 1)
+		err = -EBUSY;
+	else
+		err = resize_runtime_buffer(substream, params, false);
+
+	if (!err)
+		substream->active_sensing = !params->no_active_sensing;
+	mutex_unlock(&substream->rmidi->open_mutex);
+	return err;
 }
 EXPORT_SYMBOL(snd_rawmidi_output_params);
 
@@ -727,19 +735,22 @@ int snd_rawmidi_input_params(struct snd_rawmidi_substream *substream,
 	unsigned int clock_type = params->mode & SNDRV_RAWMIDI_MODE_CLOCK_MASK;
 	int err;
 
+	snd_rawmidi_drain_input(substream);
+	mutex_lock(&substream->rmidi->open_mutex);
 	if (framing == SNDRV_RAWMIDI_MODE_FRAMING_NONE && clock_type != SNDRV_RAWMIDI_MODE_CLOCK_NONE)
-		return -EINVAL;
+		err = -EINVAL;
 	else if (clock_type > SNDRV_RAWMIDI_MODE_CLOCK_MONOTONIC_RAW)
-		return -EINVAL;
-	if (framing > SNDRV_RAWMIDI_MODE_FRAMING_TSTAMP)
-		return -EINVAL;
-	snd_rawmidi_drain_input(substream);
-	err = resize_runtime_buffer(substream, params, true);
-	if (err < 0)
-		return err;
+		err = -EINVAL;
+	else if (framing > SNDRV_RAWMIDI_MODE_FRAMING_TSTAMP)
+		err = -EINVAL;
+	else
+		err = resize_runtime_buffer(substream, params, true);
 
-	substream->framing = framing;
-	substream->clock_type = clock_type;
+	if (!err) {
+		substream->framing = framing;
+		substream->clock_type = clock_type;
+	}
+	mutex_unlock(&substream->rmidi->open_mutex);
 	return 0;
 }
 EXPORT_SYMBOL(snd_rawmidi_input_params);
-- 
2.35.3

