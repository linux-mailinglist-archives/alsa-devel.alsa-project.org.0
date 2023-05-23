Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8BB70D678
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 10:00:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75595E11;
	Tue, 23 May 2023 09:59:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75595E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684828829;
	bh=cbsQtu9Tvyr05xCdatBybi/dBSSfkibUyGXPL+P4V3Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N5Wwt9y7Q/lbw9sUqryrTXOYGyikW11eQ2XxPmTh3kDjoVDvl4jjkETAqOGDyI/vH
	 To1hRAfIbeZEPenEuaDpseFsSZZoAftfQqMej1ogP1wZw/AlTE3U86QKoMJUeI069I
	 rzILY8e9+o4JFmNHXLlY8+/MIIH5Cxn9rYGO5D/Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74E2FF80688; Tue, 23 May 2023 09:55:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DBECFF80678;
	Tue, 23 May 2023 09:55:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC1D4F8063E; Tue, 23 May 2023 09:55:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 979FCF8056F
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 09:54:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 979FCF8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=AA5gc7cz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=163DO29d
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 71D79219FA;
	Tue, 23 May 2023 07:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684828449;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oMJMbFQgcCvHbmJa9OEy6qWd09vQvN9bjPxXemze1cA=;
	b=AA5gc7cz0DvWTCGBMgX9haf4b2gLcvLjK4uWNrBGUIM1NXDEcLl01m5PZLHVebQ2rpYMX9
	ZFhzMFq4N/ZNMf0IIzQH1X4VEkFsIY65xh/nTspoK8/cuLJpNJ9vXZcg+tbHbaMQL6cU8v
	AmlghIcYjTq0nZ0Ak4Vt6L5z25npRmw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684828449;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oMJMbFQgcCvHbmJa9OEy6qWd09vQvN9bjPxXemze1cA=;
	b=163DO29dg01bIQwP/HiNTgA9Z4aTnAageXRIpoW8BX4Goze2FFZRLP7y8q/FzDbKSKPqoQ
	ECaKfmzQLGctV8CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2EC2A13A1A;
	Tue, 23 May 2023 07:54:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id oMt1CiFxbGT4KgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 23 May 2023 07:54:09 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 23/37] ALSA: seq: Prohibit creating ports with special
 numbers
Date: Tue, 23 May 2023 09:53:44 +0200
Message-Id: <20230523075358.9672-24-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230523075358.9672-1-tiwai@suse.de>
References: <20230523075358.9672-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LY2VTIGPG7GD57AVMCZED4RN5QLV46XO
X-Message-ID-Hash: LY2VTIGPG7GD57AVMCZED4RN5QLV46XO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LY2VTIGPG7GD57AVMCZED4RN5QLV46XO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some port numbers are special, such as 254 for subscribers and 255 for
broadcast.  Return error if application tries to create such a port.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 2dac8c3355fd..0f26f20596d7 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -1206,6 +1206,8 @@ static int snd_seq_ioctl_create_port(struct snd_seq_client *client, void *arg)
 		port_idx = info->addr.port;
 	else
 		port_idx = -1;
+	if (port_idx >= SNDRV_SEQ_ADDRESS_UNKNOWN)
+		return -EINVAL;
 	err = snd_seq_create_port(client, port_idx, &port);
 	if (err < 0)
 		return err;
-- 
2.35.3

