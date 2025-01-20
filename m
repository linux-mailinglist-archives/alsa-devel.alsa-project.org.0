Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BB7A17309
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 20:12:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE7476028E;
	Mon, 20 Jan 2025 20:12:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE7476028E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737400363;
	bh=AyTcWmpx4xsw2k5nkqRxpQty+whC3MgttgNHjZtZQq0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DpHp5j43e7+jp538RAHYWEZq9vyJ5iFYR0h7Psku/XbRvF6vU2Ib2YjsQbRLGkiPK
	 6/4NqF+3RbjWBcr2XUDndRTANj7sSoGBIWjgojSH0EBG1elQu4jbbqYYiu9qnCq/dI
	 F9hTWInR4QC0/kd+RUTIwMsN7MkfmLUbv5lctr0c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DED4F805BB; Mon, 20 Jan 2025 20:12:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FD74F805B1;
	Mon, 20 Jan 2025 20:12:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7BB6F80482; Mon, 20 Jan 2025 20:12:05 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 728DAF800E4
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 20:12:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 728DAF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=jxh7pSUI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=dwyN5uKI;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=jxh7pSUI;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=dwyN5uKI
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9B94B1F7C5;
	Mon, 20 Jan 2025 19:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1737400319;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cm/Q1MQWxp8zu1pfHuIGXl0UIGknIUo/g1fkH4pq9hk=;
	b=jxh7pSUI8SrWs0pwB1sroMU/4NrAzOVym5HP8JUDDeF7dCEYnGHtck7UmqSRm/Yq07eF5j
	G6j8YXdNrLvxHsSudomAxnIt+cxGG5VLALMp+J34vOqKTRJ4VWqpVrTGmqlMzyO9IFbGeu
	YnaWYL4Pgt1XfrVpNfb42k9ZwBmXGB0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737400319;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cm/Q1MQWxp8zu1pfHuIGXl0UIGknIUo/g1fkH4pq9hk=;
	b=dwyN5uKIQNUu91GXBiB/jw+M2D8lWLRNDQaIjQXb5SpPuiSXhB8Xxz6S+eNeNNlIdDA7P0
	LVej/H8EuuSC4mDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jxh7pSUI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dwyN5uKI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1737400319;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cm/Q1MQWxp8zu1pfHuIGXl0UIGknIUo/g1fkH4pq9hk=;
	b=jxh7pSUI8SrWs0pwB1sroMU/4NrAzOVym5HP8JUDDeF7dCEYnGHtck7UmqSRm/Yq07eF5j
	G6j8YXdNrLvxHsSudomAxnIt+cxGG5VLALMp+J34vOqKTRJ4VWqpVrTGmqlMzyO9IFbGeu
	YnaWYL4Pgt1XfrVpNfb42k9ZwBmXGB0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737400319;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cm/Q1MQWxp8zu1pfHuIGXl0UIGknIUo/g1fkH4pq9hk=;
	b=dwyN5uKIQNUu91GXBiB/jw+M2D8lWLRNDQaIjQXb5SpPuiSXhB8Xxz6S+eNeNNlIdDA7P0
	LVej/H8EuuSC4mDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 68AC7139CB;
	Mon, 20 Jan 2025 19:11:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mBdcGP+fjmc1GQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 20 Jan 2025 19:11:59 +0000
Date: Mon, 20 Jan 2025 20:11:58 +0100
Message-ID: <87tt9t9u69.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sebastian Wiese-Wagner <seb@fastmail.to>
Cc: tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Enable Mute LED on HP Laptop
 14s-fq1xxx
In-Reply-To: <20250120181240.13106-1-seb@fastmail.to>
References: <20250120181240.13106-1-seb@fastmail.to>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 9B94B1F7C5
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[fastmail.to];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[fastmail.to];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: M6QS42KTW3PPXDGUVJGW5DT5GAUZUGFD
X-Message-ID-Hash: M6QS42KTW3PPXDGUVJGW5DT5GAUZUGFD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M6QS42KTW3PPXDGUVJGW5DT5GAUZUGFD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 20 Jan 2025 19:12:40 +0100,
Sebastian Wiese-Wagner wrote:
> 
> This HP Laptop uses ALC236 codec with COEF 0x07 controlling the mute LED. Enable existing quirk for this device.
> 
> Signed-off-by: Sebastian Wiese-Wagner <seb@fastmail.to>

Thanks, applied now.


Takashi
