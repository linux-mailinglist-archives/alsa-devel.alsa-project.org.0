Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D67092B4A7
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 12:04:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FB1D83B;
	Tue,  9 Jul 2024 12:03:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FB1D83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720519445;
	bh=0L8qZkIRswnVHIoZOL+QpI04Q8AqBRQSC0Xu+OGaZs8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bi5+k0zfCsuhKFhaYVYlg7lK8fZZ+QMDvi4xs446XSjoziW2oR6oxq34lA4XY2E2n
	 +n6IN8yKzRyFLWdB0OnDLMwP2izC/axT8XoSB2XC9LQwk2/4DQW5UCE8y6HPE5WVB6
	 +2eB7Qwco7epqGJwcGQWwzSDt9e73wry4Ix/RmIs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A27BAF80494; Tue,  9 Jul 2024 12:03:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DE09F805AE;
	Tue,  9 Jul 2024 12:03:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99C5EF801F5; Tue,  9 Jul 2024 11:59:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 849F6F8013D
	for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2024 11:59:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 849F6F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=bmqg5BEZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=udF14+mV;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=n6cdigFQ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=dVSUL5VV
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0E55221B9A;
	Tue,  9 Jul 2024 09:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1720519157;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eFGyhwLjwHvqnxzFNZDxqYKqmIP/aQi15p3X3ME9A3o=;
	b=bmqg5BEZ5b48Xex84v8vIqjga9EzKe8xHztDHcnQyLQ4MMUPhEoGvK37VOaDnKVJ3hq7ib
	Hg9iX8u1aZo3u8UPw4YXoQdfE5AVCe5GfCfa+gL0E4h4WIAaD7iTxkoQJ3uB6/jom5SalV
	z9SNnHGlJQPPHLDYkqP6cG4dW8MkGa0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720519157;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eFGyhwLjwHvqnxzFNZDxqYKqmIP/aQi15p3X3ME9A3o=;
	b=udF14+mVf4SnwpCqK7VBfc8N7pyRSORzth19dk9ss3c3jgYttrmeBhritgXd/Hl9lHCSsw
	BMuxaGf0uAKFqKAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=n6cdigFQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dVSUL5VV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1720519156;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eFGyhwLjwHvqnxzFNZDxqYKqmIP/aQi15p3X3ME9A3o=;
	b=n6cdigFQhLcLLZEnHKZ2+8bjmo1bLYgVsne3zCW7t8hGjnwHfxN+QC4OrZY7kKAeBnPbvA
	+ZVaIAaNYGWU/OY9LrZ0nDuUz2JrM+ESc/1X2ZSGdkWaMC5FzH/nHaebC8Ol1bCkaXCo8A
	mjoxNlJQruCz/hR5ZWjnRS66171WkXY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720519156;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eFGyhwLjwHvqnxzFNZDxqYKqmIP/aQi15p3X3ME9A3o=;
	b=dVSUL5VVE2wrfVPGBbq+3qAPxBGTkfblA/rcRQR6iajM1gaR81MuIQEpj6kCiisYdItrqt
	7v474Mh2ESFeUvAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EBD051369A;
	Tue,  9 Jul 2024 09:59:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 24cBOfMJjWY5RQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 09 Jul 2024 09:59:15 +0000
Date: Tue, 09 Jul 2024 11:59:46 +0200
Message-ID: <878qyadgx9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Nazar Bilinskyi <nbilinskyi@gmail.com>
Cc: tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Enable Mute LED on HP 250 G7
In-Reply-To: <20240709080546.18344-1-nbilinskyi@gmail.com>
References: <20240709080546.18344-1-nbilinskyi@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 0E55221B9A
X-Spamd-Result: default: False [-3.50 / 50.00];
	BAYES_HAM(-2.99)[99.97%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: JMJDIXITDYXONC47636K6DJBTAOA4U2P
X-Message-ID-Hash: JMJDIXITDYXONC47636K6DJBTAOA4U2P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JMJDIXITDYXONC47636K6DJBTAOA4U2P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 09 Jul 2024 10:05:46 +0200,
Nazar Bilinskyi wrote:
> 
> HP 250 G7 has a mute LED that can be made to work using quirk
> ALC269_FIXUP_HP_LINE1_MIC1_LED. Enable already existing quirk.
> 
> Signed-off-by: Nazar Bilinskyi <nbilinskyi@gmail.com>

Thanks, applied now.


Takashi
