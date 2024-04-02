Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 340C9894B21
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 08:06:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1C5723DF;
	Tue,  2 Apr 2024 08:06:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1C5723DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712037972;
	bh=JG+dDfWdMsSkOAxEW28gaNHm1J+qE3FALFRX2W7YFHQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WNMUOIQokS03sdHPt7ZelEPj4r5MfVpZmcoLKn0R7OzN9WC8Z/Te2nMQEY27jh+M+
	 8tTbTpUTnuDT82ekDRrpO62WNcpMFVLVpYonYLiC9Hqf5X35ANomipkRnilHnHVod9
	 XXQ5wCPrfqoL/D46qf7XoHFuXrHHo03QsX/m1XIg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D0C9F805D4; Tue,  2 Apr 2024 08:05:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B0D7F805C2;
	Tue,  2 Apr 2024 08:05:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECFF3F8020D; Tue,  2 Apr 2024 08:04:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D47FF80114
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 08:04:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D47FF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=EToWJ7fO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ClEKrQHX
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 41AF133A1C;
	Tue,  2 Apr 2024 06:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1712037888;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sf+tQgiTkwfj0PNt1vTcBMyjD1Vqj6uJe+lQ/xbBL+o=;
	b=EToWJ7fOgdDCUEu7Y6wX85UQk12t15HYSH6VsIWzzUk9bdyIWfOWfq+Fm0vGoWRJhBLO9W
	UdfYwE0mXBASGRvnqniX/LmUZ3zIRQtSnJnBx1MFcp9VsMgxmZuovGhCZhNVxaxxxq43e6
	H7lgoXhR6x4h+IdNzozfZxbqg0hAKUU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712037888;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sf+tQgiTkwfj0PNt1vTcBMyjD1Vqj6uJe+lQ/xbBL+o=;
	b=ClEKrQHX3VAC6+iWg9XhMRpmcrRaFaHGSKZ/FJx9viUa7tb/Mb9L5KpqnMiDSe6u9w1H2v
	UsAejqbPoeeQeIAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 164AB13A90;
	Tue,  2 Apr 2024 06:04:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id 81ffAwCgC2YlNAAAn2gu4w
	(envelope-from <tiwai@suse.de>); Tue, 02 Apr 2024 06:04:48 +0000
Date: Tue, 02 Apr 2024 08:04:52 +0200
Message-ID: <8734s4ti4b.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: I Gede Agastya Darma Laksana <gedeagas22@gmail.com>
Cc: alsa-devel@alsa-project.org,
	yokota.hgml@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: hda/realtek: Update Panasonic CF-SZ6 quirk to
 support headset with microphone
In-Reply-To: <20240401174602.14133-1-gedeagas22@gmail.com>
References: <20240401174602.14133-1-gedeagas22@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [2.17 / 50.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.02)[53.30%];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[alsa-project.org,gmail.com,suse.com];
	RCVD_COUNT_TWO(0.00)[2];
	R_DKIM_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:rdns,imap2.dmz-prg2.suse.org:helo]
X-Spamd-Bar: ++
X-Rspamd-Queue-Id: 41AF133A1C
Message-ID-Hash: UNN3B427KYWSLFCPEIGMMBDUL6UAJSE7
X-Message-ID-Hash: UNN3B427KYWSLFCPEIGMMBDUL6UAJSE7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UNN3B427KYWSLFCPEIGMMBDUL6UAJSE7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 01 Apr 2024 19:46:02 +0200,
I Gede Agastya Darma Laksana wrote:
> 
> This patch addresses an issue with the Panasonic CF-SZ6's existing quirk,
> specifically its headset microphone functionality. Previously, the quirk
> used ALC269_FIXUP_HEADSET_MODE, which does not support the CF-SZ6's design
> of a single 3.5mm jack for both mic and audio output effectively. The
> device uses pin 0x19 for the headset mic without jack detection.
> 
> Following verification on the CF-SZ6 and discussions with the original
> patch author, i determined that the update to
> ALC269_FIXUP_ASPIRE_HEADSET_MIC is the appropriate solution. This change
> is custom-designed for the CF-SZ6's unique hardware setup, which includes
> a single 3.5mm jack for both mic and audio output, connecting the headset
> microphone to pin 0x19 without the use of jack detection.
> 
> Signed-off-by: I Gede Agastya Darma Laksana <gedeagas22@gmail.com>

Applied now.  Thanks.


Takashi
