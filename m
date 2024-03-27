Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFE988DA95
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 10:55:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8019F2C00;
	Wed, 27 Mar 2024 10:54:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8019F2C00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711533301;
	bh=/RSGL1gNTTk+E2Qxud2oSKiTaC1ct0/6iam11UaSoM4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K2p+etak+ZSCt3Vb/aHFTCXEOwY9zReZVM4+vxSwMKnMWI1zpo3cpo1ut6pX7B5NH
	 z/zFEIJYi4ZIbwkBm6uwV5jd2TosVCpLNGc2Y4W8qaS3jiO5HmQTOnCDituUAFAqmD
	 FCE1mXKt07HKbhVTaruHUOgWF3Ez4Bx2BCe114Qc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B24BF805AF; Wed, 27 Mar 2024 10:54:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EB0AF805A1;
	Wed, 27 Mar 2024 10:54:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E593DF8025F; Wed, 27 Mar 2024 10:54:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86E25F80074
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 10:54:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86E25F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=qZ2Pkttu;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=gG1XQHzO;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=qZ2Pkttu;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=gG1XQHzO
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B9078601E9;
	Wed, 27 Mar 2024 09:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1711533250;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nYySJVDEu2ItYGQHILPTW390eiYeDpkVRciD4RPI5YM=;
	b=qZ2PkttutCx3A9rM55tb41fQ0opeVQtVnXNICDaifyiWQ2jrBk7Wpkf56XZi7MUiFBjYig
	dOS+pMYWboQDTEzoLFbq5MN90hcCMqZLpYhnqTIui3L0e4/6UQg2PTEPOSCB1R5Y0cD5bt
	Pj3Ty139KnGos/+Nj8TZEfWymm0VRZU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711533250;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nYySJVDEu2ItYGQHILPTW390eiYeDpkVRciD4RPI5YM=;
	b=gG1XQHzOzWGD2lMQFjyWo+j5As2FUbTuYo9fqU3Z/I+zh8rd88Fsp0okf2pfVfGczHGrVx
	YFRmfQaFYu8O8BAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1711533250;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nYySJVDEu2ItYGQHILPTW390eiYeDpkVRciD4RPI5YM=;
	b=qZ2PkttutCx3A9rM55tb41fQ0opeVQtVnXNICDaifyiWQ2jrBk7Wpkf56XZi7MUiFBjYig
	dOS+pMYWboQDTEzoLFbq5MN90hcCMqZLpYhnqTIui3L0e4/6UQg2PTEPOSCB1R5Y0cD5bt
	Pj3Ty139KnGos/+Nj8TZEfWymm0VRZU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711533250;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nYySJVDEu2ItYGQHILPTW390eiYeDpkVRciD4RPI5YM=;
	b=gG1XQHzOzWGD2lMQFjyWo+j5As2FUbTuYo9fqU3Z/I+zh8rd88Fsp0okf2pfVfGczHGrVx
	YFRmfQaFYu8O8BAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4E1411369F;
	Wed, 27 Mar 2024 09:54:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bs/bEcLsA2ZFHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Mar 2024 09:54:10 +0000
Date: Wed, 27 Mar 2024 10:54:12 +0100
Message-ID: <87il1880fv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: llvm@lists.linux.dev,
	Johannes Berg <johannes@sipsolutions.net>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Dawei Li <set_pte_at@outlook.com>,
	linuxppc-dev@lists.ozlabs.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/9] ALSA: aoa: avoid false-positive format truncation
 warning
In-Reply-To: <20240326223825.4084412-9-arnd@kernel.org>
References: <20240326223825.4084412-1-arnd@kernel.org>
	<20240326223825.4084412-9-arnd@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-1.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[outlook.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_TWELVE(0.00)[17];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[lists.linux.dev,sipsolutions.net,perex.cz,suse.com,kernel.org,arndb.de,google.com,outlook.com,lists.ozlabs.org,alsa-project.org,vger.kernel.org];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.80)[84.71%]
Message-ID-Hash: DDU34DNGAHECMEIXE3IAUWXG2BJABA4I
X-Message-ID-Hash: DDU34DNGAHECMEIXE3IAUWXG2BJABA4I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DDU34DNGAHECMEIXE3IAUWXG2BJABA4I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 26 Mar 2024 23:38:07 +0100,
Arnd Bergmann wrote:
> 
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang warns about what it interprets as a truncated snprintf:
> 
> sound/aoa/soundbus/i2sbus/core.c:171:6: error: 'snprintf' will always be truncated; specified size is 6, but format string expands to at least 7 [-Werror,-Wformat-truncation-non-kprintf]
> 
> The actual problem here is that it does not understand the special
> %pOFn format string and assumes that it is a pointer followed by
> the string "OFn", which would indeed not fit.
> 
> Slightly increasing the size of the buffer to its natural alignment
> avoids the warning, as it is now long enough for the correct and
> the incorrect interprations.
> 
> Fixes: b917d58dcfaa ("ALSA: aoa: Convert to using %pOFn instead of device_node.name")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied this one now to sound.git tree.  Thanks.


Takashi
