Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F662868B1F
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Feb 2024 09:45:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05CB5B70;
	Tue, 27 Feb 2024 09:45:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05CB5B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709023543;
	bh=6KB68rZ3csBQLs8RLWZy23nptC1VTKBN2i0H0hYjdko=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QhqFllg4dz20Mb5Vj4YpDU3PD6Z/buX7lLmVby7RblRqRnD43SLB6OgtPOloqs15h
	 YSyJa0kGFWr8RtzrsAl+NCiW/v0dskRNyXlb7jPxtXrFy84umibeVl++0by544opMG
	 nskS0dYu15sdwk5VTXXoTMz0VF4L+NezqdDU/y8c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B51CF8057E; Tue, 27 Feb 2024 09:45:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49768F805A0;
	Tue, 27 Feb 2024 09:45:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5459F801C0; Tue, 27 Feb 2024 09:44:22 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A9F4BF80104
	for <alsa-devel@alsa-project.org>; Tue, 27 Feb 2024 09:44:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9F4BF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=IhT4rX8s;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=nbIAhgJH;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Yuzy2wpY;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=bcnHL4YP
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D75BB223CC;
	Tue, 27 Feb 2024 08:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1709023451;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ry2MnfEF69DA35gZ52NREPyOp70/HCt7oo+5entcOAU=;
	b=IhT4rX8s48U8BPQklhIRMEb/jnl8HhNAllPl4L2eBAj1mqRJ+XDuQSfB77Y/JQOb1LXzDP
	sLwzl+UEB+lhvMu5UGcEqAZ7ZbP3FwgFnKPoPf2P9N1ajpMOyFn2fla5isT9cWbeFxu9aM
	ztF7B2FgQp7uWfUlrpY51rqwJbZcpBI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023451;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ry2MnfEF69DA35gZ52NREPyOp70/HCt7oo+5entcOAU=;
	b=nbIAhgJHZBVIKhrd/5Kz7V7h3Qc2TZEttYT9A6oJG09qpl2bFehdE0r2Lg3cSfe7kBDZwE
	yihu8obOLT8Gw1DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1709023450;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ry2MnfEF69DA35gZ52NREPyOp70/HCt7oo+5entcOAU=;
	b=Yuzy2wpY67NltrrlfJzXq+SVrglOocwdwMPcFOTU5ft9tS8YuIOmrwv5PVoSnOyIgJPwck
	sIl+5qp3YIIyGIIHK4Yvfr+xgIJ+8BUk2g0WZyW6G4wQDW45Uzddb93HDAm2RDNa+okr9o
	4609yYs5yzv95tSlPp5Ad2BqJeAwJJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023450;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ry2MnfEF69DA35gZ52NREPyOp70/HCt7oo+5entcOAU=;
	b=bcnHL4YPjB2q59H1hj+kv14sPckdnsfQJv8QGoUu9gxgIBt6ZooDTithbKUgU81Gq6CGRe
	TKu/t7b7pq8AAUAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AEFAB13A65;
	Tue, 27 Feb 2024 08:44:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id z0gxKdqg3WVxZwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Feb 2024 08:44:10 +0000
Date: Tue, 27 Feb 2024 09:44:10 +0100
Message-ID: <87v86ai9et.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Re: ALC285 reduce HP pop noise
In-Reply-To: <7493e207919a4fb3a0599324fd010e3e@realtek.com>
References: <7493e207919a4fb3a0599324fd010e3e@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Yuzy2wpY;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bcnHL4YP
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-6.97 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DWL_DNSWL_HI(-3.50)[suse.de:dkim];
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
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.96)[99.84%]
X-Rspamd-Queue-Id: D75BB223CC
Message-ID-Hash: K35PN67D2B5CRIUA7OYT3XMYKRJ256PY
X-Message-ID-Hash: K35PN67D2B5CRIUA7OYT3XMYKRJ256PY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K35PN67D2B5CRIUA7OYT3XMYKRJ256PY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 27 Feb 2024 06:33:02 +0100,
Kailang wrote:
> 
> Hi Takashi,
> 
> Lenovo Thinkpad platform with ALC285 which had pop noise from Headphone port on reboot state.
> Attach patch will reduce it.

Thanks, applied now.


Takashi
