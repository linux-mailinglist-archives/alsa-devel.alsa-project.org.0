Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3920183FFB8
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 09:10:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4889850;
	Mon, 29 Jan 2024 09:10:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4889850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706515822;
	bh=H35fdW4gVungKlRweV6QGxtbuZchIY35GN2KZum2j/Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LoQiJ2i+X4UfR4QW6YNBZd8cZhmbPrrImRWsnfGhzayaGXh6AV3/e97/LcR4cAE9s
	 f455bKZ0c3iyAaT5j86Ex0Xp9EDMg5aU3tt2mVjZCxqmhkCG0U7XbjG5dkfFCdyY+a
	 dgMSMESE3/FGHl2D9Q8W7auCqKsF2OSMjuWNsxC8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 591DFF8022B; Mon, 29 Jan 2024 09:09:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA849F8057F;
	Mon, 29 Jan 2024 09:09:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 639FAF80310; Mon, 29 Jan 2024 09:07:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4896DF8017A
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 09:07:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4896DF8017A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ELocXG1f;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=JQDQA61D;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=ELocXG1f;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=JQDQA61D
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 15E5E22278;
	Mon, 29 Jan 2024 08:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706515622;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gR9Q6QtUFPxQ5lRGmQh7es6crm7lqvpf2h3nR4Z5S/k=;
	b=ELocXG1fbHxWtJwt1sW55ENrf/EoEygqFD9tdE1ixiMCl8h5KkmBXtRK1BM1P+oMsrUQLB
	dLia7g836dvmRMlvQzuNcIm7G0Qx7S9WwMMJMFhhHWNR3S6dQgffQPc7/ooTz7/UEtkREH
	HhqSg81xKPDk0MIcCW1swMwuFaN5fjo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706515622;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gR9Q6QtUFPxQ5lRGmQh7es6crm7lqvpf2h3nR4Z5S/k=;
	b=JQDQA61DKFDzTwtSQN1Ry6u6uwB2/HnCYn+RR8Ng9zg/zI6q33t5UavZwuAEQRoUw+7JNo
	zPVbE/wtjN/s7HBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706515622;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gR9Q6QtUFPxQ5lRGmQh7es6crm7lqvpf2h3nR4Z5S/k=;
	b=ELocXG1fbHxWtJwt1sW55ENrf/EoEygqFD9tdE1ixiMCl8h5KkmBXtRK1BM1P+oMsrUQLB
	dLia7g836dvmRMlvQzuNcIm7G0Qx7S9WwMMJMFhhHWNR3S6dQgffQPc7/ooTz7/UEtkREH
	HhqSg81xKPDk0MIcCW1swMwuFaN5fjo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706515622;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gR9Q6QtUFPxQ5lRGmQh7es6crm7lqvpf2h3nR4Z5S/k=;
	b=JQDQA61DKFDzTwtSQN1Ry6u6uwB2/HnCYn+RR8Ng9zg/zI6q33t5UavZwuAEQRoUw+7JNo
	zPVbE/wtjN/s7HBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DA1C712FF7;
	Mon, 29 Jan 2024 08:07:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6mPuM6Vct2XeWwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 29 Jan 2024 08:07:01 +0000
Date: Mon, 29 Jan 2024 09:07:01 +0100
Message-ID: <87o7d4mul6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Luka Guzenko <l.guzenko@web.de>
Cc: tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Enable Mute LED on HP Laptop 14-fq0xxx
In-Reply-To: <20240128155704.2333812-1-l.guzenko@web.de>
References: <20240128155704.2333812-1-l.guzenko@web.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ELocXG1f;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JQDQA61D
X-Spamd-Result: default: False [-1.92 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 FREEMAIL_ENVRCPT(0.00)[web.de];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FREEMAIL_TO(0.00)[web.de];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.61)[98.26%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 15E5E22278
Message-ID-Hash: 6PWUVSZI4VVNCY3BP5KL5GKNBOHM5TM7
X-Message-ID-Hash: 6PWUVSZI4VVNCY3BP5KL5GKNBOHM5TM7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6PWUVSZI4VVNCY3BP5KL5GKNBOHM5TM7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 28 Jan 2024 16:57:04 +0100,
Luka Guzenko wrote:
> 
> This HP Laptop uses ALC236 codec with COEF 0x07 controlling the
> mute LED. Enable existing quirk for this device.
> 
> Signed-off-by: Luka Guzenko <l.guzenko@web.de>

Thanks, applied now.


Takashi
