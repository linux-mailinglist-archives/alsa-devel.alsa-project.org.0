Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B678929BD
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Mar 2024 09:44:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E32012C15;
	Sat, 30 Mar 2024 09:44:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E32012C15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711788288;
	bh=qv4hyVsIvmt5Bq6NA2R6FwrpbOOVexFZzPalmbJNY0E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZuV8ZetLxzCZv3IKGhEA/TXDBXZeAD3DuJwiDH0quUDmLjh4G5UehnHizPLNSGO4E
	 lRynTB/SngVtj4U2ePYpcAFqe2iNz5BNUZ5+1RofRP8AywLtVY7cMLCaAPZjz0YEF6
	 ELMEymi5H+SkQpOq32XYqZM5BSduUsp7xY7ZTd9Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8341F8057D; Sat, 30 Mar 2024 09:44:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3D27F80564;
	Sat, 30 Mar 2024 09:44:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C56BDF8025F; Sat, 30 Mar 2024 09:37:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8DE38F80093
	for <alsa-devel@alsa-project.org>; Sat, 30 Mar 2024 09:37:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DE38F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=H6MV2wRl;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=LDvizGuC
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 66FDC5D2D4;
	Sat, 30 Mar 2024 08:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1711787831;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R0U17UcQkJPXOJuESkycL6rC9ilcoFaU7jMNRPVmuYE=;
	b=H6MV2wRlVelbTNLqOQu0pQydoWQ/o+Wh/PwMZhSWF1zBdJ4v1l61K7Tb+mLolkyWEzrOm0
	XsuXvilH5p+EX6LRD66aKBi1isJBCnlli3FxbTNb3spXj3Ta9WAtz32hO/b01AmWZjMSYd
	KqRIoquxSKtFz1k9s4hvz30MK/9O6yA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711787831;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R0U17UcQkJPXOJuESkycL6rC9ilcoFaU7jMNRPVmuYE=;
	b=LDvizGuCuyIraCn6HRQuYHzcNTPLdQtkmUOwjKUI7iph47c3uWv5wvrrlZkNe0zTphDlXv
	Z3LLnfg3+oDqNMAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 20C2E13A90;
	Sat, 30 Mar 2024 08:37:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id p3VzBjfPB2Y5bgAAn2gu4w
	(envelope-from <tiwai@suse.de>); Sat, 30 Mar 2024 08:37:11 +0000
Date: Sat, 30 Mar 2024 09:37:13 +0100
Message-ID: <87plvcnmiu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirks for ASUS Laptops using
 CS35L56
In-Reply-To: <20240329112803.23897-1-simont@opensource.cirrus.com>
References: <20240329112803.23897-1-simont@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Bar: +++++
X-Spamd-Result: default: False [5.50 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-0.996];
	 MID_CONTAINS_FROM(1.00)[];
	 NEURAL_SPAM_LONG(2.80)[0.800];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.19)[70.96%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 66FDC5D2D4
Message-ID-Hash: OVFTEXGTXAAYQPBRRJCLBPFNXNNNSSMS
X-Message-ID-Hash: OVFTEXGTXAAYQPBRRJCLBPFNXNNNSSMS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OVFTEXGTXAAYQPBRRJCLBPFNXNNNSSMS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 29 Mar 2024 12:28:03 +0100,
Simon Trimmer wrote:
> 
> These ASUS laptops use the Realtek HDA codec combined with a number of
> CS35L56 amplifiers.
> 
> The SSID of the GA403U matches a previous ASUS laptop - we can tell them
> apart because they use different codecs.
> 
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>

Thanks, applied now.


Takashi
