Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B6E7093C7
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 11:39:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F3B0886;
	Fri, 19 May 2023 11:38:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F3B0886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684489151;
	bh=udRAB3fr5M17Vf1nqST+oKj0yBsiwq+HTr3SHy+5wtI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WQzoogZJuN9fthI4BSTmWA5Z1VUwQjUtyXFa+1c4f2/wA3AxjPynY1M6KtFyT14aW
	 aq+9eUNHYYDPC74RlznRtzpbcTg+X+MO9+oOMzQN1GRWS/ccHrKViKFgK6O1BvnxMl
	 L8pmSkPz+bdflqDoyUk4hg5Ur9EXWU3ytMusBu2o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FDE7F8069F; Fri, 19 May 2023 11:33:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE37EF8069D;
	Fri, 19 May 2023 11:33:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85284F80612; Fri, 19 May 2023 11:32:23 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 59EFBF8057B
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 11:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59EFBF8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=W3C6C6OG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=sMn72hTd
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 22B0722245;
	Fri, 19 May 2023 09:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684488703;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XcYWfCebI4c2wHjl2VTt/v++678oQs8qU/FjGxpuSm4=;
	b=W3C6C6OG5DriJnuaTCyomVC3SHuvO6pJhZua9PXCvkf9TCrwUghZsas80WNInQ/UdWZ6gZ
	Dl0WY5bcDa7/iJN6IwCxDAUVRS5rZd6PB5L6/b6M3XaRTDB65NL3TQv/XWHUzHdrcj3SaL
	fF1kQOMWSWMhN1i3lOFnUi+K10wUU5M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684488703;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XcYWfCebI4c2wHjl2VTt/v++678oQs8qU/FjGxpuSm4=;
	b=sMn72hTdvb7ZFG7r7IREHwUPk5KvgFKSUYeWzHEmUKmRu+DsIrAmZ40TLfzuXYSxDKQvua
	y19tf5JNmqYvhMAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ECF3413A12;
	Fri, 19 May 2023 09:31:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id gIEBOf5BZ2RXJAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 19 May 2023 09:31:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 22/36] ALSA: seq: Prohibit creating ports with special numbers
Date: Fri, 19 May 2023 11:31:00 +0200
Message-Id: <20230519093114.28813-23-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230519093114.28813-1-tiwai@suse.de>
References: <20230519093114.28813-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TXFFGCQ2YDAMSAHQ7TC6OMW4ZSD7PQY2
X-Message-ID-Hash: TXFFGCQ2YDAMSAHQ7TC6OMW4ZSD7PQY2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TXFFGCQ2YDAMSAHQ7TC6OMW4ZSD7PQY2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some port numbers are special, such as 254 for subscribers and 255 for
broadcast.  Return error if application tries to create such a port.

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

