Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A2D848C2E
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Feb 2024 09:31:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 320D4F55;
	Sun,  4 Feb 2024 09:31:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 320D4F55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707035519;
	bh=9N/yJ7y8H6y1WqEagbxcNeH/yIVeDjm6wuvCcT+jqJs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jbp60Q9WqWcUC5EQeXdq/hCJBaNGV/3Aua8s5l5lO85lb8iD/XAzJT/KM3L8c78Fm
	 Ux+nipfYCyJsxTe75XYUxj3QfxQxewy7knoTExNt3Y+rpZiMNn7zgaoJXWhKYPi8Fr
	 tmGuQqQ4h/YynK74/hKdBiZxf0hIrrkFM6s5Mfu4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 900CDF805AD; Sun,  4 Feb 2024 09:31:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A45C0F805A8;
	Sun,  4 Feb 2024 09:31:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6858CF801EB; Sun,  4 Feb 2024 09:30:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 799B9F80153
	for <alsa-devel@alsa-project.org>; Sun,  4 Feb 2024 09:30:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 799B9F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ERpNI16O;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=VMFGa6vv;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=ERpNI16O;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=VMFGa6vv
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A653B21E24;
	Sun,  4 Feb 2024 08:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707035419;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SUWpvVlbtmQV6vlPcjlI3MUn/yKN5SBWzWr1t051fJw=;
	b=ERpNI16O1j4T8rc4JVXOORjMTM0KzR35yqytDPmmUBXdkDnEK8j4j4pqqNODEXXHT1UO+v
	95qlFDXY6hG6TcgYVkn3O4J6WCEkDFh1vr+iDFfvNaqx9nCkikMP27V/u+oFQlJcyC6EnL
	G21hMyWdecNKSFfdvIAXoDJ4nL2qK9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707035419;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SUWpvVlbtmQV6vlPcjlI3MUn/yKN5SBWzWr1t051fJw=;
	b=VMFGa6vvVpxApVvrlxsVnHQLy/lursItxcFDLW3iHijaPyBaXpjSau0BPzPuSvaAUdTomv
	t4B3Rpvq20oRQoBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707035419;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SUWpvVlbtmQV6vlPcjlI3MUn/yKN5SBWzWr1t051fJw=;
	b=ERpNI16O1j4T8rc4JVXOORjMTM0KzR35yqytDPmmUBXdkDnEK8j4j4pqqNODEXXHT1UO+v
	95qlFDXY6hG6TcgYVkn3O4J6WCEkDFh1vr+iDFfvNaqx9nCkikMP27V/u+oFQlJcyC6EnL
	G21hMyWdecNKSFfdvIAXoDJ4nL2qK9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707035419;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SUWpvVlbtmQV6vlPcjlI3MUn/yKN5SBWzWr1t051fJw=;
	b=VMFGa6vvVpxApVvrlxsVnHQLy/lursItxcFDLW3iHijaPyBaXpjSau0BPzPuSvaAUdTomv
	t4B3Rpvq20oRQoBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 68EFC132DD;
	Sun,  4 Feb 2024 08:30:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mx76FxtLv2UpeAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 04 Feb 2024 08:30:19 +0000
Date: Sun, 04 Feb 2024 09:30:19 +0100
Message-ID: <87h6iobpic.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v2] ALSA: hda/realtek: Remove two HP Laptops using CS35L41
In-Reply-To: <20240202170842.321818-1-sbinding@opensource.cirrus.com>
References: <20240202170842.321818-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [0.47 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.43)[78.54%]
Message-ID-Hash: CMUB7W76J3DMFS6UZWUHLHW3Q4ZVZ7BA
X-Message-ID-Hash: CMUB7W76J3DMFS6UZWUHLHW3Q4ZVZ7BA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CMUB7W76J3DMFS6UZWUHLHW3Q4ZVZ7BA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 02 Feb 2024 18:08:42 +0100,
Stefan Binding wrote:
> 
> The SKUs, and associated SSIDs, are no longer going to include the
> CS35L41. They may come back, but will need a different quirk.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

Thanks, applied with Fixes tag now.


Takashi
