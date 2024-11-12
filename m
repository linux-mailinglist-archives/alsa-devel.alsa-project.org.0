Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C189C5AB9
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2024 15:44:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 391A41931;
	Tue, 12 Nov 2024 15:44:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 391A41931
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731422688;
	bh=Q8U6AzTW6gsbpYsNXBUdWBIjmt5aAe9Uhblencmyato=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WiXPtyDhLnIDA0BvCWWLp5rcvz729f1Ejkj0yLmUOhCkkZ6NZtLhTArR4blhzeQrZ
	 6pV0ZlwMUT+5zmVl719M+ykczb2eP3IfWqlRvbYpIKwx8ez+/2k8xDY+/gIBLcDlWc
	 sF/Hx8EzJx44D8jsceq1a+6DUWWAv+bCM5KNYtAs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F0A2F805B3; Tue, 12 Nov 2024 15:44:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04B03F805BB;
	Tue, 12 Nov 2024 15:44:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75D5EF800D2; Tue, 12 Nov 2024 15:44:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8823AF800D2
	for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2024 15:40:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8823AF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=z1MieYI0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=nBAHx1v1;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=z1MieYI0;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=nBAHx1v1
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9AB6B1F451;
	Tue, 12 Nov 2024 14:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1731422429;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8F9aWjdoJY+BbgOIc0iOm+zk+JByjL9c3Ipa5Dh8y0M=;
	b=z1MieYI057vAai228vYeRmtdio3SN2e1SykjlVCys8C6HvS2rmGJeNoKwttrDRy9Yh0+Ff
	X77j+SajSzbQKVymFi5pzOBQnUyYd2A+BFux8dX+fnjyrdJOxjfzBOrd/XEseGo8ScBfJ1
	K2BFFe76cwpnOY93c56qY2tU/zprRqg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731422429;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8F9aWjdoJY+BbgOIc0iOm+zk+JByjL9c3Ipa5Dh8y0M=;
	b=nBAHx1v1pblQGajXx1jQMbPKx4EUnoxg1x9s8got6cGenSszR8Yg3QAXY33BhaFYGnpwMa
	wsdgEGZ576r+0MBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=z1MieYI0;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nBAHx1v1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1731422429;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8F9aWjdoJY+BbgOIc0iOm+zk+JByjL9c3Ipa5Dh8y0M=;
	b=z1MieYI057vAai228vYeRmtdio3SN2e1SykjlVCys8C6HvS2rmGJeNoKwttrDRy9Yh0+Ff
	X77j+SajSzbQKVymFi5pzOBQnUyYd2A+BFux8dX+fnjyrdJOxjfzBOrd/XEseGo8ScBfJ1
	K2BFFe76cwpnOY93c56qY2tU/zprRqg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731422429;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8F9aWjdoJY+BbgOIc0iOm+zk+JByjL9c3Ipa5Dh8y0M=;
	b=nBAHx1v1pblQGajXx1jQMbPKx4EUnoxg1x9s8got6cGenSszR8Yg3QAXY33BhaFYGnpwMa
	wsdgEGZ576r+0MBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7517A13301;
	Tue, 12 Nov 2024 14:40:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SHVwG91oM2elfwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 12 Nov 2024 14:40:29 +0000
Date: Tue, 12 Nov 2024 15:40:29 +0100
Message-ID: <87ed3gtt0i.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Re: Clevo Platfrom with ALC255
In-Reply-To: <b2dcac3e09ef4f82b36d6712194e1ea4@realtek.com>
References: <b2dcac3e09ef4f82b36d6712194e1ea4@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 9AB6B1F451
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: R4ZXQ4NDAC26X6TROTFOMUQIDOSZE7PR
X-Message-ID-Hash: R4ZXQ4NDAC26X6TROTFOMUQIDOSZE7PR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R4ZXQ4NDAC26X6TROTFOMUQIDOSZE7PR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 11 Nov 2024 07:49:54 +0100,
Kailang wrote:
> 
> Hi Takashi,
> 
> Attach was let Clevo platform with ALC255 enable headset Mic.

Thanks, applied now.


Takashi
