Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D60E87EBD4
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Mar 2024 16:14:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3326321A3;
	Mon, 18 Mar 2024 16:14:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3326321A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710774878;
	bh=sDdbyDMgI6Yt+SmUoJjCSzLFoIKWRQSm4i2UdWKxNB8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MFxpyRSfu/wiYfAV2C9eC6MCLC0UolC10GqPg/4fNWimrIQcWj5N5rm+zuUb85Boj
	 ofBeXlNaAoPHgVRVfgR7olXJCV5fz36J+fips9zcs9Qfy+xcGc20iULonRDwGcZ5AP
	 NYMPL2hj5FwPxw+ecdIGIGlqrkEIvzPypw+J2RqM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E511AF80589; Mon, 18 Mar 2024 16:14:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24509F8059F;
	Mon, 18 Mar 2024 16:14:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1D75F804E7; Mon, 18 Mar 2024 16:14:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E01CFF80093
	for <alsa-devel@alsa-project.org>; Mon, 18 Mar 2024 16:13:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E01CFF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=IuSWcBRt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=EUAGL96H;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=IuSWcBRt;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=EUAGL96H
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3293634BA5;
	Mon, 18 Mar 2024 15:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1710774829;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pK/0BpqFsJuFVuYV1XEW72xv3apJFp72svjvRihn63c=;
	b=IuSWcBRtSySRxAT61jnHx0o+mbH4RwE+YxJjEuYux4VZnafMzqg8dU0S4pPp9SnL3yrL6e
	zYnBwAYlj+NMtuJclP3eGWR9gD2jFL+ZgNfdYgUpxhDQzYFDM/DrB8JnGIdYUfmXhGC4t0
	EnDieF0woZubATPFPmWri2mSu8PJ8a4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710774829;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pK/0BpqFsJuFVuYV1XEW72xv3apJFp72svjvRihn63c=;
	b=EUAGL96HpmXGSj7fuw6TeC3Uhdoh8RhHeHkxo0PaLURo5oDbWSbm+lrg+g1Zl9qxORo+2v
	QsiiR5uMNTbQW9BQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1710774829;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pK/0BpqFsJuFVuYV1XEW72xv3apJFp72svjvRihn63c=;
	b=IuSWcBRtSySRxAT61jnHx0o+mbH4RwE+YxJjEuYux4VZnafMzqg8dU0S4pPp9SnL3yrL6e
	zYnBwAYlj+NMtuJclP3eGWR9gD2jFL+ZgNfdYgUpxhDQzYFDM/DrB8JnGIdYUfmXhGC4t0
	EnDieF0woZubATPFPmWri2mSu8PJ8a4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710774829;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pK/0BpqFsJuFVuYV1XEW72xv3apJFp72svjvRihn63c=;
	b=EUAGL96HpmXGSj7fuw6TeC3Uhdoh8RhHeHkxo0PaLURo5oDbWSbm+lrg+g1Zl9qxORo+2v
	QsiiR5uMNTbQW9BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1539F136A5;
	Mon, 18 Mar 2024 15:13:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id B7y0Ay1a+GVKSwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 18 Mar 2024 15:13:49 +0000
Date: Mon, 18 Mar 2024 16:13:48 +0100
Message-ID: <87h6h37etv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Hui Wang <hui.wang@canonical.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: hda/realtek: fix the hp playback volume issue for
 LG machines
In-Reply-To: <20240318011128.156023-1-hui.wang@canonical.com>
References: <20240318011128.156023-1-hui.wang@canonical.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.70 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-0.75)[-0.747];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-0.999];
	 RCPT_COUNT_TWO(0.00)[2];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.66)[92.83%]
Authentication-Results: smtp-out1.suse.de;
	none
Message-ID-Hash: CGIJZSSHGBPQEOJSSBBPUJ4SGKUZA56Q
X-Message-ID-Hash: CGIJZSSHGBPQEOJSSBBPUJ4SGKUZA56Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CGIJZSSHGBPQEOJSSBBPUJ4SGKUZA56Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 18 Mar 2024 02:11:28 +0100,
Hui Wang wrote:
> 
> Recently we tested the headphone playback on 2 LG machines, if we set
> the volume to the max value or near to the max value, the sound is too
> loud, it could even bring harm to listeners.
> 
> A workaround is to decrease the max volume to a reasonable value for
> the headphone's amplifier, then the users couldn't set the volume
> bigger than that value from the userspace.
> 
> Signed-off-by: Hui Wang <hui.wang@canonical.com>

Applied now.  Thanks.


Takashi
