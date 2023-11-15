Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 948347ECAF6
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Nov 2023 20:04:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 927D9820;
	Wed, 15 Nov 2023 20:03:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 927D9820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700075048;
	bh=4UhpOzZWuDpdh0MDayg65mRP3cwQMfYLuZwq2cqDE6U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KLnCAaIJxqpFtZMWkpMGK9KFP3XbTkRCEsD4JrC6L0grFyC8SBNQaPfW27It0/966
	 xYoRMQKsVnBmGfS31qfrBNuUUBNtRsdRQwKLUsm0YtHpyWdyRmKrBLrWSqA+VpezcU
	 V0rWe0SvdipikFY3HhJkNC6/NSoC/qzRjZ4HiOXg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C2EEF80093; Wed, 15 Nov 2023 20:03:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10F38F800ED;
	Wed, 15 Nov 2023 20:03:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65B00F801D5; Wed, 15 Nov 2023 20:03:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 115D9F800ED
	for <alsa-devel@alsa-project.org>; Wed, 15 Nov 2023 20:02:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 115D9F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=MJ2lChUA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Hr9i+MWw
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EA2872195F;
	Wed, 15 Nov 2023 19:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1700074972;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yHUaLQmFnTSZQ33H8+KBUXpDcKdnO/Fy6i/07lPiI/0=;
	b=MJ2lChUAPx4l6ptaLhagaMvw1t/jb4Sz2L+8BfCIHmj5HJgLS67p9TYfig6pZuyAjUejJS
	F0aF/kxZXxmFD5neZC4f4V2g2IJJ08M3NfblpZncf5j/aUeRexQRGpddB4NrpK7ZYxyCaK
	Q/7e1pWjREx61b3to+uXvMvkL/q+y+U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1700074972;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yHUaLQmFnTSZQ33H8+KBUXpDcKdnO/Fy6i/07lPiI/0=;
	b=Hr9i+MWwsHR9q0Jo1vtng3PXg5GBW5nQdPNu9u5jbeLDn9xVyqUdmK2VtsSlCpjjFvnlVk
	KjGu/MXc0Nrke5Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ACD9E13592;
	Wed, 15 Nov 2023 19:02:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id eKZVKdwVVWVjfAAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 15 Nov 2023 19:02:52 +0000
Date: Wed, 15 Nov 2023 20:02:52 +0100
Message-ID: <8734x6q1pf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>,
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH v1 0/2] Add quirks for various HP and ASUS laptops
In-Reply-To: <20231115162116.494968-1-sbinding@opensource.cirrus.com>
References: <20231115162116.494968-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-6.15 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.85)[99.37%]
Message-ID-Hash: DOOJQTLMALKYS3JZXU52E5HJX3VTL5TT
X-Message-ID-Hash: DOOJQTLMALKYS3JZXU52E5HJX3VTL5TT
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DOOJQTLMALKYS3JZXU52E5HJX3VTL5TT/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 15 Nov 2023 17:21:14 +0100,
Stefan Binding wrote:
> 
> Add support for CS35L41 HDA for ASUS Zenbook laptops and HP G11
> laptops.
> 
> Stefan Binding (2):
>   ALSA: hda/realtek: Add quirks for ASUS 2024 Zenbooks
>   ALSA: hda/realtek: Add quirks for HP Laptops

Applied both patches now.  Thanks.


Takashi
