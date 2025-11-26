Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55368C88844
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Nov 2025 08:54:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C9B4601B3;
	Wed, 26 Nov 2025 08:54:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C9B4601B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764143680;
	bh=9ptEpbDwGp4JEnRoCTxW7v27lj7VGVBywGJUGoQVcf4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o3T3VG4mU2TR5EhUyff/xGxeqSv3UMNpJJ0VeIbeS3U9pyZyVkGktyOpkPQgD5ukW
	 YDQR6twYohYIpqBvlLrByvifBxN2067kRNj906Xxbp18p6Ie83iDu540XrdcTweUb1
	 UrA2hD7hyAZ2DoFxvTIbHA2S3QcBjh5UEYV8cEgI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F2A5F805D6; Wed, 26 Nov 2025 08:54:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80692F805C7;
	Wed, 26 Nov 2025 08:54:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7C66F8047D; Wed, 26 Nov 2025 08:53:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B17BF800AE
	for <alsa-devel@alsa-project.org>; Wed, 26 Nov 2025 08:53:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B17BF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=t+tztZrS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=z16xvWk9;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=t+tztZrS;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=z16xvWk9
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 664B722C94;
	Wed, 26 Nov 2025 07:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1764143610;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fHv5zIufOQb/6f0wW77owTuggEDwsY4q7diOAajEiCI=;
	b=t+tztZrSULWZwIAl+JiVg5WahlYjJJ8Z7oB4pylvjq0RIb55xhACcsS3/W6gcqTOg0EGiB
	kQsGd4WEZGxwjzUQvGenL0KCOgLnNfJoAXfHpDinrY8TGakrSTmqdBIYw3q40Jjz3FC0sa
	tD37b+tHzBdSbWzRl4MfRo9F7DdoITM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764143610;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fHv5zIufOQb/6f0wW77owTuggEDwsY4q7diOAajEiCI=;
	b=z16xvWk9eHzsOVqgb3fMWmJyo6x3c8pvE6fQX5tcxAKkUju1rsS6RCc5WY1b019gX+HjuR
	d6UdSZXLecmyrMDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=t+tztZrS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=z16xvWk9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1764143610;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fHv5zIufOQb/6f0wW77owTuggEDwsY4q7diOAajEiCI=;
	b=t+tztZrSULWZwIAl+JiVg5WahlYjJJ8Z7oB4pylvjq0RIb55xhACcsS3/W6gcqTOg0EGiB
	kQsGd4WEZGxwjzUQvGenL0KCOgLnNfJoAXfHpDinrY8TGakrSTmqdBIYw3q40Jjz3FC0sa
	tD37b+tHzBdSbWzRl4MfRo9F7DdoITM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764143610;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fHv5zIufOQb/6f0wW77owTuggEDwsY4q7diOAajEiCI=;
	b=z16xvWk9eHzsOVqgb3fMWmJyo6x3c8pvE6fQX5tcxAKkUju1rsS6RCc5WY1b019gX+HjuR
	d6UdSZXLecmyrMDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3800E3EA63;
	Wed, 26 Nov 2025 07:53:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iKP8C/qxJmkrNwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 26 Nov 2025 07:53:30 +0000
Date: Wed, 26 Nov 2025 08:53:29 +0100
Message-ID: <871pllcjra.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Enable Mute LED for HP platform
In-Reply-To: <ab5d4498f7454b25b245a3bad8fb95b3@realtek.com>
References: <ab5d4498f7454b25b245a3bad8fb95b3@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 664B722C94
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
Message-ID-Hash: YSANO2X2IKAQTHYQAFCVGEX3IKXEA6YA
X-Message-ID-Hash: YSANO2X2IKAQTHYQAFCVGEX3IKXEA6YA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YSANO2X2IKAQTHYQAFCVGEX3IKXEA6YA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 26 Nov 2025 06:50:09 +0100,
Kailang wrote:
> 
> Hi Takashi,
> 
> Attach patch was enable mute led functions.

Applied to for-next branch now.


thanks,

Takashi
