Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1670D90C706
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 12:32:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E90CE67;
	Tue, 18 Jun 2024 12:32:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E90CE67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718706768;
	bh=/ys+bjqqD1jEwnaX5eooAb6vP41QS2L8Ystc6G/3Okc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X5wOE3eK9nVCZFAQ6FErQyafmxqhGm5CNGUGrcyEfhT59CyjUO+WHVWbAOPA4rz9M
	 UVLt2923szcJ0aheriLNSl9iBA4BnILgQFiX+VDjMQExEbMz0oNUiTD+SPnRi+Rx0X
	 wMMBcJiBC0j7kJUMTj8XCiNK/O+Lb7mtBW7y9oTg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EFDFF805DA; Tue, 18 Jun 2024 12:31:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BDAA4F805CB;
	Tue, 18 Jun 2024 12:31:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1664DF8023A; Tue, 18 Jun 2024 11:57:05 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C3ACBF800FA
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 11:57:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3ACBF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=mWzsE0sL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9q142RpF;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=yTlOkA2W;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=kQIDlds9
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D22521F397;
	Tue, 18 Jun 2024 09:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718704620;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9XjegkDcO+7VnhzOVHWcjKauUPMpSmzCKuij49TBWI4=;
	b=mWzsE0sLYIoLpLQQcaZ5wkPYNLt54u6WsLpDBJH6CGciNh/w0xjfK2F0TrELIaoMpRqpRK
	afZpNnkVQGZCl8eDkQ5Ld3rSA/6F7BbMdnHENrx384SE9nnplJWeJICCiwaGtCKynTuOuE
	XC9Q6Y8yHix7Ef/m9OvYSyPTwQ44Dnk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718704620;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9XjegkDcO+7VnhzOVHWcjKauUPMpSmzCKuij49TBWI4=;
	b=9q142RpFGJURyNqrTehQEQpdpPZhXCg6pKxvoqK2sASnJJBU6yMxyxq5G1cvuMav316Gy6
	Ne1+4RLKZRsC2xBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718704619;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9XjegkDcO+7VnhzOVHWcjKauUPMpSmzCKuij49TBWI4=;
	b=yTlOkA2W0qJjhuYUt/wRDLo7yE0dtzqCB4phbIi2DkGSGRxfWfWDjBlSQQqhRlgsSwHI8s
	v4I0FP8RGL7HZkRYfOTKpHevhGujI4+Fe5d+EHEXZNsAE4PBFTGIAwvn459+0K94fsBlXL
	ndEjQGGs2tJOxF6DL8bWJKW40gm1ZAw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718704619;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9XjegkDcO+7VnhzOVHWcjKauUPMpSmzCKuij49TBWI4=;
	b=kQIDlds9FypFRNmjJgrsXsY0XfizLgGfP9urfX2diLzU1IihmQ2B2gdaPLpO7oZVhik2jc
	aazo39Z2Qk5R7WBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B8C3613AA0;
	Tue, 18 Jun 2024 09:56:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wt2NLOtZcWbVIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 18 Jun 2024 09:56:59 +0000
Date: Tue, 18 Jun 2024 11:57:25 +0200
Message-ID: <87iky67euy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Re: Add more codec ID to no shutup list
In-Reply-To: <8d86f61e7d6f4a03b311e4eb4e5caaef@realtek.com>
References: <8d86f61e7d6f4a03b311e4eb4e5caaef@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: 7W4POQTFVZEV4S2I2HO6QOSG7BIZMQ3M
X-Message-ID-Hash: 7W4POQTFVZEV4S2I2HO6QOSG7BIZMQ3M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7W4POQTFVZEV4S2I2HO6QOSG7BIZMQ3M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 18 Jun 2024 09:41:41 +0200,
Kailang wrote:
> 
> Hi Takashi,
> 
> Attach patch will add more codec ID to no shutup list.
> Many Thanks.

Thanks, applied now.


Takashi
