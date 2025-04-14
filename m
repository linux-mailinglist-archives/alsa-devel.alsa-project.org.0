Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E89EDA887A0
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Apr 2025 17:44:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1767668081;
	Mon, 14 Apr 2025 17:44:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1767668081
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744645484;
	bh=22cGG+mW3wW/wPuLfco+8COI0Tb+hgwDkk/+0fNG3nM=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Wb2ZKIYtj9Qx5HR38dZpptLuJQBPfmp2eIofZaEbdKAFjKttubXqImHE8pnnFGth6
	 KZaxFYGfncmlhyJRmfog0Ns5FttjWRyyW4t8rNCzH+Odqo3xrKXI0+g94Fu4mLf5tZ
	 RfQFjA287OAHzrhdqwKGBzEJBWK1MkiesoYV1Fo4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDAE0F805D4; Mon, 14 Apr 2025 17:44:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7F92F805CA;
	Mon, 14 Apr 2025 17:44:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93A9AF805B3; Mon, 14 Apr 2025 17:44:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70A0EF800B0
	for <alsa-devel@alsa-project.org>; Mon, 14 Apr 2025 17:44:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70A0EF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=CIJ0aBNB;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=0CTN6d3l;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=CIJ0aBNB;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=0CTN6d3l
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E332E1F7A0;
	Mon, 14 Apr 2025 15:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1744645446;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=/PBfYowfTHE3az6RzZjE9BMvNJ/q1p/MBXEu9T289RE=;
	b=CIJ0aBNBx9Kj/6iBKk7UkOlbOTE+B+XFlMjUgtULDqNBcllp374qpzWC6fobIPm8dMrLkl
	bGutJBJc0fTCoYeC6zSU8PJuNRTk+UZHXHMtApw60v/HpJPZ0Ql/bgKkoZVjeVVAE2HvFQ
	bIk7+V+08nvAAjsbWxEtBkeC+8ZdtJ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744645446;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=/PBfYowfTHE3az6RzZjE9BMvNJ/q1p/MBXEu9T289RE=;
	b=0CTN6d3lHYH70evUgsbNYY3Kh8/Bcj9uGdi2KEEZKPWa42bELgHFbIJF3vW1ZAO+t+7dtf
	bwBRyG0HWcGCDqBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1744645446;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=/PBfYowfTHE3az6RzZjE9BMvNJ/q1p/MBXEu9T289RE=;
	b=CIJ0aBNBx9Kj/6iBKk7UkOlbOTE+B+XFlMjUgtULDqNBcllp374qpzWC6fobIPm8dMrLkl
	bGutJBJc0fTCoYeC6zSU8PJuNRTk+UZHXHMtApw60v/HpJPZ0Ql/bgKkoZVjeVVAE2HvFQ
	bIk7+V+08nvAAjsbWxEtBkeC+8ZdtJ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744645446;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=/PBfYowfTHE3az6RzZjE9BMvNJ/q1p/MBXEu9T289RE=;
	b=0CTN6d3lHYH70evUgsbNYY3Kh8/Bcj9uGdi2KEEZKPWa42bELgHFbIJF3vW1ZAO+t+7dtf
	bwBRyG0HWcGCDqBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C7DEF136A7;
	Mon, 14 Apr 2025 15:44:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EBuEL0Yt/WfFKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 14 Apr 2025 15:44:06 +0000
Date: Mon, 14 Apr 2025 17:44:06 +0200
Message-ID: <87friawxx5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: perex@perex.cz
Cc: alsa-devel@alsa-project.org
Subject: recent change in seqmid.c is broken?
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
Message-ID-Hash: ABPNHLB5XQEISBPJROS5MI52SO5R64BS
X-Message-ID-Hash: ABPNHLB5XQEISBPJROS5MI52SO5R64BS
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ABPNHLB5XQEISBPJROS5MI52SO5R64BS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Jaroslav,

I'm afraid that your recent fix for alsa-lib commit a4e47461eca1
doesn't work as expected:

```
@@ -664,15 +663,11 @@ static void update_group_ports(snd_seq_t *seq, snd_ump_endpoint_info_t *ep)
                                break;
                        }
 
-                       if (!*bp->name)
+                       if (bp->name[0] == '\0')
                                continue;
-                       len = strlen(blknames);
-                       if (len)
-                               snprintf(blknames + len, sizeof(blknames) - len,
-                                        ", %s", bp->name);
-                       else
-                               snd_strlcpy(blknames, (const char *)bp->name,
-                                           sizeof(blknames));
+                       if (blknames[0])
+                               snd_strlcpy(blknames, ", ", sizeof(blknames));
+                       snd_strlcpy(blknames, (const char *)bp->name, sizeof(blknames));
                }
 
                if (!*blknames)
```

The original code appended the new bp->name string with the prefix of
", " if blknames is already present, but the new code looks as if it
overwrites onto blknames with strlcpy() from scratch for each
bp->name.

FWIW, the code there used to be with strlcat(), but it was rewritten
in the way above because strlcat() isn't always available in commit
d9694398130c.


thanks,

Takashi
