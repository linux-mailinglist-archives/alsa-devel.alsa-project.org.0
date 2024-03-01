Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E10E286DF94
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Mar 2024 11:47:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CB82E0F;
	Fri,  1 Mar 2024 11:46:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CB82E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709290028;
	bh=CAC3I3fAi9ptAN1aS/gnP7+FiP1XNIfE6rpVrhrcbFU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JYPFg+/fhnxgrKXm/8YkLvKAuOCGJWWCgY0ItVKRVsSbhRRf2sCVqr/dY3PsGN3ln
	 Xwtsk0SZdMm0BB0moScaElNvsksvJdJn/440A2b7TLpIHV4kRx9OLA2XsvZKyahd7/
	 VbE+t0L1T9P3Yqz7z+WzZXcetfTvgQtoajJCLEtc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB05AF805B2; Fri,  1 Mar 2024 11:46:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BA3EF805B3;
	Fri,  1 Mar 2024 11:46:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37E1BF805AE; Fri,  1 Mar 2024 11:46:18 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C863F8058C
	for <alsa-devel@alsa-project.org>; Fri,  1 Mar 2024 11:46:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C863F8058C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=YLjtC1w/;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=94Awtazs;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=YLjtC1w/;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=94Awtazs
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 054D033741;
	Fri,  1 Mar 2024 10:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1709289974;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OZOyRNgt6kBFk+tbkOPcsBof/upR1qztIofUAvr63qQ=;
	b=YLjtC1w/71vIDEv+qFTo/0/ZtVYn9jEZdqODUi+v8/Kd3RDz0+O8Xb4uWNUOxiidRs2xQO
	djugr0jy9iimYIdTeOjYbTFRf1f7pQsURcOQ2bVpcp2pjFJXcQdcebbC175M1bxK5UbXVN
	hjAySjw8N0hthk1hHiQTe6XP7hmNsFk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709289974;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OZOyRNgt6kBFk+tbkOPcsBof/upR1qztIofUAvr63qQ=;
	b=94AwtazsCOv5gNk7TE9cYJhBO9Lt1vPtwvf4cKqxoXPSqcWJA7UiDtpd2o8M6Of211xKMV
	U1j3cR6EPNJBDfCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1709289974;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OZOyRNgt6kBFk+tbkOPcsBof/upR1qztIofUAvr63qQ=;
	b=YLjtC1w/71vIDEv+qFTo/0/ZtVYn9jEZdqODUi+v8/Kd3RDz0+O8Xb4uWNUOxiidRs2xQO
	djugr0jy9iimYIdTeOjYbTFRf1f7pQsURcOQ2bVpcp2pjFJXcQdcebbC175M1bxK5UbXVN
	hjAySjw8N0hthk1hHiQTe6XP7hmNsFk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709289974;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OZOyRNgt6kBFk+tbkOPcsBof/upR1qztIofUAvr63qQ=;
	b=94AwtazsCOv5gNk7TE9cYJhBO9Lt1vPtwvf4cKqxoXPSqcWJA7UiDtpd2o8M6Of211xKMV
	U1j3cR6EPNJBDfCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D6EB013A59;
	Fri,  1 Mar 2024 10:46:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GkX8MvWx4WVjMwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 01 Mar 2024 10:46:13 +0000
Date: Fri, 01 Mar 2024 11:46:13 +0100
Message-ID: <87bk7y5ix6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Re: Enable Headset Mic for Acer NB platform
In-Reply-To: <521cc46507f54cd0ae460fb2e0cf90f8@realtek.com>
References: <521cc46507f54cd0ae460fb2e0cf90f8@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="YLjtC1w/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=94Awtazs
X-Spamd-Result: default: False [-4.28 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 RCPT_COUNT_TWO(0.00)[2];
	 TO_DN_ALL(0.00)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 MX_GOOD(-0.01)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.97)[99.85%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 054D033741
Message-ID-Hash: KXU27QPA4W76Q5J4M6HC2MQCVADHP5IW
X-Message-ID-Hash: KXU27QPA4W76Q5J4M6HC2MQCVADHP5IW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KXU27QPA4W76Q5J4M6HC2MQCVADHP5IW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 01 Mar 2024 09:21:26 +0100,
Kailang wrote:
> 
> Hi Takashi,
> 
> This patch will enable headset Mic for Acer NB platform.

Is the patch missing?


thanks,

Takashi
