Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76881CD8A3E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Dec 2025 10:50:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F287860183;
	Tue, 23 Dec 2025 10:50:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F287860183
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1766483418;
	bh=Ga76KVgerH7N+RudTz2jDPqQo8hXnNQHfwC0GNacKSU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QWvGxD+G4c4fuu0I1pYWdgQjlaokkzlpXQnvq4wyGoY608nuxt0x5quulE16KN58I
	 t2rnJnlg9ew/2ScHgxYheqhL/qi0PxcOzZyV44rP92sC3FaY/iylUT6Z7O2dZXkbxD
	 +zW+9CAKncZcFKZRX+VX2Wx6YMGiYGn3Mmn/AF+I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5454F805D5; Tue, 23 Dec 2025 10:49:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D16FF805CA;
	Tue, 23 Dec 2025 10:49:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C357F80134; Tue, 23 Dec 2025 10:49:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18D2AF80093
	for <alsa-devel@alsa-project.org>; Tue, 23 Dec 2025 10:49:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18D2AF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=xKRgSOkq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9XcGUXRJ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=T/EBsI9Q;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=L/AJWZIZ
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D6F8E336A0;
	Tue, 23 Dec 2025 09:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1766483368;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1X29ty62scZ8p6FeRrl9HbbCQYJ5o5mL8wxvJx6F2EY=;
	b=xKRgSOkqZr4FyY2HZ/U05qB4yU8x+86dHPr+612+gdn/vnt4kt4k9Ox+hALKBWKHuuMiPo
	vjKSLhwD9QToTngpdmoR91ol3+dtcWUtQ0SSx9cumb/kLw0Arb+oN1F/t2h7QRFTqC1niv
	bz/EBPGzCgMTv15odE+Pf0XjMrKLTt0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1766483368;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1X29ty62scZ8p6FeRrl9HbbCQYJ5o5mL8wxvJx6F2EY=;
	b=9XcGUXRJfIfL1XAVtV3NRNT5+h87H4XICbPqegTMltcw7pEihIfgZ6+FJ5UhNwziQDKMyD
	VufRdrKQjrElpWAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="T/EBsI9Q";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="L/AJWZIZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1766483366;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1X29ty62scZ8p6FeRrl9HbbCQYJ5o5mL8wxvJx6F2EY=;
	b=T/EBsI9QNwkwJJt2wLORx/EpixnpZrYpjLnQVBu9m1qlsGXWVQDL0oIctaek9ittAzGoun
	0hgrnaUki+ySziIulPlGTCNc92bAiIf59Cums5g4rnGPUrKvBQrHFHI3dwgVxLXQP+EBfE
	JVFv92pjEkMg0WEXYW+a6s1fjYPy4Lw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1766483366;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1X29ty62scZ8p6FeRrl9HbbCQYJ5o5mL8wxvJx6F2EY=;
	b=L/AJWZIZSTusyqvXgfhSIF30Xxcp0Bc8RY6djgPFDvlh+iFENOBlwjdIsSTj1TuBYK1icS
	JdL2R/nl6BxlQqCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 411F03EA63;
	Tue, 23 Dec 2025 09:49:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9Fb3C6ZlSmlqPAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 23 Dec 2025 09:49:26 +0000
Date: Tue, 23 Dec 2025 10:49:25 +0100
Message-ID: <87pl85il3u.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Enable Mute LED for Lenovo platform
In-Reply-To: <8a99edffee044e13b6e348d1b69c2b57@realtek.com>
References: <8a99edffee044e13b6e348d1b69c2b57@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: D6F8E336A0
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: 2N2N6OIM36OBVGIOJI3DKGHM5GXV2VY4
X-Message-ID-Hash: 2N2N6OIM36OBVGIOJI3DKGHM5GXV2VY4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2N2N6OIM36OBVGIOJI3DKGHM5GXV2VY4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 22 Dec 2025 10:33:44 +0100,
Kailang wrote:
> 
> Hi Takashi,
> 
> Attach patch was for enable mute led functions of the Lenovo platform.
> Many Thanks.

Applied now to for-next branch.


thanks,

Takashi
