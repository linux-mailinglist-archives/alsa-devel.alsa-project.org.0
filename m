Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB70906E83
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 14:11:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A825E65;
	Thu, 13 Jun 2024 14:11:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A825E65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718280691;
	bh=TEYifB3tq+jSELRSjsUHzPuyB8CHcdPoDhxTb+MmXdU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LBcf6nq/UWj9be27SSgmfZCBp1w8wK8WFxTQiB0QthTf9KqPn2Lvsf2b5MiCpQnZW
	 jHKcXVUKtZQDJGcOYFVCxWk9Iq4hN/Ua8NabGQo9ImRVRVonv/Avbgd0XPUQ9N6nGp
	 EM9d5Ik8cwCxy/ZwKrENyyYS31JZSgRCfV8OWufE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10DADF805B6; Thu, 13 Jun 2024 14:10:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A3EDF80589;
	Thu, 13 Jun 2024 14:10:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BE70F8057A; Thu, 13 Jun 2024 14:10:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DA16F800D0
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 14:10:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DA16F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=qYy3iInl;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=pLa9xefF;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=UlAtUvpS;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=PHNvcT6y
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 56798353B0;
	Thu, 13 Jun 2024 12:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718280650;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UXPGztoHqvtOAlST9kvAr7GTVlL9Rv/zxYc3IGmY6ow=;
	b=qYy3iInlkDkE/0sb8PU4OWxth2XwiASfmXz2GN+IfjOlHxrRVLwse2Nf6Zet/a+V301AVp
	mcZhgePqr0+tPmZE4FwPNZSCFJ+5U33z3dDMpTKzpUaWEIZwLrSdglZhPpz7mkUcX7326Q
	5EnHAI3lB8Z7FS5f8U68UMZZ6gfx48Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718280650;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UXPGztoHqvtOAlST9kvAr7GTVlL9Rv/zxYc3IGmY6ow=;
	b=pLa9xefFj76rLWkQEE1MapLpGspFLFBX7r2Vxt0kbpISSZ7WDteNZ/n/GxvFQw6u1lPtfO
	q7Gg56Ew/+r9afDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UlAtUvpS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PHNvcT6y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718280649;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UXPGztoHqvtOAlST9kvAr7GTVlL9Rv/zxYc3IGmY6ow=;
	b=UlAtUvpSG/TyUpnBu2lKK+slwG/iRUNC0puws6yEiQWk6jltZ9kgMy9/kwNYcrHDsD8KEY
	ijKaZkFvdKFknUUpGE2dyuWYRe9v7IDWgsOYbqwI7lX8DbGfiFe5CorxnfdPzVSEikHbmN
	WeIjV6KHsQdVbtHtE3IhpFC9DUB6shY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718280649;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UXPGztoHqvtOAlST9kvAr7GTVlL9Rv/zxYc3IGmY6ow=;
	b=PHNvcT6yjNpt14PrjpN6wdt28mWxPxAKYpr9oy8LKgbCn/2behrkVOzeNhlf8gZaOUbIzf
	V54kDVQE/4oLXrCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 21E7313A7F;
	Thu, 13 Jun 2024 12:10:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IYAEB8nhamalIgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Jun 2024 12:10:49 +0000
Date: Thu, 13 Jun 2024 14:11:12 +0200
Message-ID: <87frthniu7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v1 0/4] Add support for Lenovo Thinkbooks
In-Reply-To: <20240606130351.333495-1-sbinding@opensource.cirrus.com>
References: <20240606130351.333495-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 56798353B0
X-Spamd-Result: default: False [-2.51 / 50.00];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	BAYES_HAM(-0.00)[29.80%];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: HL2ODNDGLG6PUQR2QRTVOVDDQJDQZ25W
X-Message-ID-Hash: HL2ODNDGLG6PUQR2QRTVOVDDQJDQZ25W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HL2ODNDGLG6PUQR2QRTVOVDDQJDQZ25W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 06 Jun 2024 15:03:47 +0200,
Stefan Binding wrote:
> 
> These laptops do not contain _DSD required to support CS35L41 HDA.
> To workaround this, add support for these laptops into the configuration
> table in cs35l41_hda_property.c.
> Also add the required entries into patch_realtek for this SSID.
> 
> Stefan Binding (4):
>   ALSA: hda: cs35l41: Support Lenovo Thinkbook 16P Gen 5
>   ALSA: hda: cs35l41: Support Lenovo Thinkbook 13x Gen 4
>   ALSA: hda/realtek: Support Lenovo Thinkbook 16P Gen 5
>   ALSA: hda/realtek: Support Lenovo Thinkbook 13x Gen 4

Applied all patches.  I corrected the hex numbers in the patch 3 to
lower cases.


thanks,

Takashi
