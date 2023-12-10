Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 032AF80B9EE
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Dec 2023 10:08:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AB81DEE;
	Sun, 10 Dec 2023 10:08:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AB81DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702199295;
	bh=iPpV/vSsTF6H65CTN2wQyEvC1ncQe0cMeDrcOWR4F8A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HcA//YHStCdG7aNIfNEuy/lih66/RLC1hOjNfqTt/6LTrUTe/1qFS6wiC4J8aPaC1
	 3QqKnvWxg7hBknTuW7Cz3xZT1AD2wahgGEdX1S23dcEYEPKvTSyd1jKPgDfuKL025d
	 tDvybLYE0spMhFwHj//4s0Zs3VpGOF2tJczUCLRg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FAFBF805A8; Sun, 10 Dec 2023 10:07:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 386FDF805C0;
	Sun, 10 Dec 2023 10:07:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38A0DF8020D; Sun, 10 Dec 2023 10:06:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC2B8F800D2
	for <alsa-devel@alsa-project.org>; Sun, 10 Dec 2023 10:05:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC2B8F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Xfwv4pt3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=o6ptGst3;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Xfwv4pt3;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=o6ptGst3
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0B6D81F828;
	Sun, 10 Dec 2023 09:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1702199156;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zecWaqvJU3HJaoi2JonOXtvtLGQbtQbC3bHreuCAJLk=;
	b=Xfwv4pt3E0i2vn8dqFstQr2f9Ixh3nlF4rpsxZHC5jrPGmxmI0dPKTgAV4uxg/U+SFjgFg
	+YXBShPXmEJWWoq/Oi2MqKMrtEnkjXkz2VltGkTLE8L3ItzZPxLtTYZOBzKXE1LUpkwmVn
	9rlERX49bmHiW8oIKLA7PhZWDnfn82Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702199156;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zecWaqvJU3HJaoi2JonOXtvtLGQbtQbC3bHreuCAJLk=;
	b=o6ptGst3OfycQo2rIwHXBvHu+pt3tM6vC0DXY518xN5nuN+v4JM8NurjXaa3/RaQSfNmaq
	Zv91O7aBqoVouDDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1702199156;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zecWaqvJU3HJaoi2JonOXtvtLGQbtQbC3bHreuCAJLk=;
	b=Xfwv4pt3E0i2vn8dqFstQr2f9Ixh3nlF4rpsxZHC5jrPGmxmI0dPKTgAV4uxg/U+SFjgFg
	+YXBShPXmEJWWoq/Oi2MqKMrtEnkjXkz2VltGkTLE8L3ItzZPxLtTYZOBzKXE1LUpkwmVn
	9rlERX49bmHiW8oIKLA7PhZWDnfn82Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702199156;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zecWaqvJU3HJaoi2JonOXtvtLGQbtQbC3bHreuCAJLk=;
	b=o6ptGst3OfycQo2rIwHXBvHu+pt3tM6vC0DXY518xN5nuN+v4JM8NurjXaa3/RaQSfNmaq
	Zv91O7aBqoVouDDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CDCA8137D2;
	Sun, 10 Dec 2023 09:05:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Iyg+MHN/dWXmVAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 10 Dec 2023 09:05:55 +0000
Date: Sun, 10 Dec 2023 10:05:55 +0100
Message-ID: <87h6kq5swc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Hartmut Knaack <knaack.h@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Luka Guzenko <l.guzenko@web.de>
Subject: Re: [PATCH] ALSA: hda/realtek: Apply mute LED quirk for HP15-db
In-Reply-To: <e61815d0-f1c7-b164-e49d-6ca84771476a@gmx.de>
References: <e61815d0-f1c7-b164-e49d-6ca84771476a@gmx.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-10.59 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_SPF_SOFTFAIL(0.00)[~all:c];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 DMARC_POLICY_ALLOW(0.00)[suse.de,none];
	 MX_GOOD(-0.01)[];
	 DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	 FREEMAIL_TO(0.00)[gmx.de];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.19)[-0.968];
	 BAYES_HAM(-1.59)[92.36%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 FREEMAIL_ENVRCPT(0.00)[gmx.de,web.de];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 WHITELIST_DMARC(-7.00)[suse.de:D:+];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[alsa-project.org,web.de];
	 RCVD_TLS_ALL(0.00)[]
X-Rspamd-Server: rspamd1
X-Rspamd-Queue-Id: 0B6D81F828
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Xfwv4pt3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=o6ptGst3;
	spf=softfail (smtp-out2.suse.de: 2a07:de40:b281:104:10:150:64:97 is neither
 permitted nor denied by domain of tiwai@suse.de) smtp.mailfrom=tiwai@suse.de;
	dmarc=pass (policy=none) header.from=suse.de
Message-ID-Hash: 7ZM3B4DZDMVNTTBKWNEKG7X7EVH4TE3D
X-Message-ID-Hash: 7ZM3B4DZDMVNTTBKWNEKG7X7EVH4TE3D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7ZM3B4DZDMVNTTBKWNEKG7X7EVH4TE3D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 09 Dec 2023 15:47:07 +0100,
Hartmut Knaack wrote:
> 
> The HP laptop 15-db0403ng uses the ALC236 codec and controls the mute
> LED using COEF 0x07 index 1.
> Sound card subsystem: Hewlett-Packard Company Device [103c:84ae]
> 
> Use the existing quirk for this model.
> 
> Signed-off-by: Hartmut Knaack <knaack.h@gmx.de>

Thanks, applied now.


Takashi
