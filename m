Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A389A4B858
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Mar 2025 08:29:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 924DE6022C;
	Mon,  3 Mar 2025 08:29:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 924DE6022C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740986997;
	bh=ifQitQfYPIxHyihvUfz4cXgUS8nWbtwaQ1czwUqSQfs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t4W0n4DYCJZJoovtQBoQPCR4h3VuJVQCTNba1j4FKC57J80UWbLzib4eEPtd6i2IV
	 shhG7eSBkLK019gRXSJw1i0lpkYqqQbK3NHZiayeK9W4jPu8vluHvqjn+9C9uXIBaS
	 F342TPXHOJPmjq5we/GogKoICCaJtVCBjlGHIp2g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4D68F805C3; Mon,  3 Mar 2025 08:29:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9590BF805B3;
	Mon,  3 Mar 2025 08:29:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E8C6F8010B; Mon,  3 Mar 2025 08:29:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A7C6F801F7
	for <alsa-devel@alsa-project.org>; Mon,  3 Mar 2025 08:29:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A7C6F801F7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=eyiEAb+D;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=oXL/9EKB;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=eyiEAb+D;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=oXL/9EKB
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D5D7021162;
	Mon,  3 Mar 2025 07:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1740986945;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s+Tg8Kc3HwpobKiOSpBQYwmDAUi4WIX4ns9msoFJxmk=;
	b=eyiEAb+D4iglhNX1W2qidimrUsTzicwGQpI6yJaLvtTkTMuoPvI4D/KRAEOVjLQr7O1dEe
	zHV7wbnQ7ChvOqLpunvU/FR6Aa8Nhhe9i/l6V1XCzHvFIHIIp1nGbi3b1FZrSxa/P/XivV
	kxAIuqX/q6jh1DIT0knfYF3ECV5UntA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740986945;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s+Tg8Kc3HwpobKiOSpBQYwmDAUi4WIX4ns9msoFJxmk=;
	b=oXL/9EKB0kafog3WSKkTKWfFhHXZDVA8TxPZe+EJMKdCnvja+HxpZC13ZihF2lFZv/2a0B
	XAMgg06ndH8aFkBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1740986945;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s+Tg8Kc3HwpobKiOSpBQYwmDAUi4WIX4ns9msoFJxmk=;
	b=eyiEAb+D4iglhNX1W2qidimrUsTzicwGQpI6yJaLvtTkTMuoPvI4D/KRAEOVjLQr7O1dEe
	zHV7wbnQ7ChvOqLpunvU/FR6Aa8Nhhe9i/l6V1XCzHvFIHIIp1nGbi3b1FZrSxa/P/XivV
	kxAIuqX/q6jh1DIT0knfYF3ECV5UntA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740986945;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s+Tg8Kc3HwpobKiOSpBQYwmDAUi4WIX4ns9msoFJxmk=;
	b=oXL/9EKB0kafog3WSKkTKWfFhHXZDVA8TxPZe+EJMKdCnvja+HxpZC13ZihF2lFZv/2a0B
	XAMgg06ndH8aFkBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 69B5513A23;
	Mon,  3 Mar 2025 07:29:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id l/90F0FaxWceVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 03 Mar 2025 07:29:05 +0000
Date: Mon, 03 Mar 2025 08:29:04 +0100
Message-ID: <87v7sq8tdr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Turn on LED function
In-Reply-To: <c211a2702f1f411e86bd7420d7eebc03@realtek.com>
References: <c211a2702f1f411e86bd7420d7eebc03@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
Message-ID-Hash: 67YQRDA6AWWZMWUECPCQZRJSGJLXXVXT
X-Message-ID-Hash: 67YQRDA6AWWZMWUECPCQZRJSGJLXXVXT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/67YQRDA6AWWZMWUECPCQZRJSGJLXXVXT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 03 Mar 2025 08:07:30 +0100,
Kailang wrote:
> 
> Hi Takashi,
> 
> Support Mic Mute LED for Lenovo ThinkCentre M series.

Thanks, applied now.


Takashi
