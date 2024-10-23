Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7F69ACA03
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2024 14:25:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9973D86F;
	Wed, 23 Oct 2024 14:25:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9973D86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729686310;
	bh=dffuzfG3bofV28JRaCVALdzj/srGLQ0KA8lBvENZk3Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J4gZ3g2JOLF9pHf8vbMXERcLsN6eXqArToQWGhxer+L74Lct075IS3Q5sP41Hlg7t
	 nIfbodGoYy4pnyIcde7ok5QqBU2dES6Fb2WugXlv5+BB8abAr4Fd+80nTNIACLcSwp
	 4U6+evWx21cVoBzaoq5nejiJxZCW7fwS8rJzSMF8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DB2FF805AB; Wed, 23 Oct 2024 14:24:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70D26F805A1;
	Wed, 23 Oct 2024 14:24:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EA50F8016C; Wed, 23 Oct 2024 14:24:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B82BF80104
	for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2024 14:24:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B82BF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=1MdLxQVF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=VKFSogt/;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=1MdLxQVF;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=VKFSogt/
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5B03F21C0D;
	Wed, 23 Oct 2024 12:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1729686271;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hGRwK4bi7EpaXvd97dFHCw5BOuekSasgeaxlGoZ/hFY=;
	b=1MdLxQVFTSqLfjwO5iuZbajTZu5DDJoUxTs8rCvfMks6k1GMKOH7DoDx0RZbRlyVhJpLFh
	FxmMBtU8io9JASP6lfl4WxpkEKcv2WR1KLjH2L6AvKPINPHX1L4zYIVosGp7fYv9ra6aua
	c9QXj1kUikvr8YzcIhH4NeESQvD4I7o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729686271;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hGRwK4bi7EpaXvd97dFHCw5BOuekSasgeaxlGoZ/hFY=;
	b=VKFSogt/5Lm8b55efYi0IntEWeL0J8dyZMEhAbP2AvWECv51oZOIH4BwhBq5RQJqh7qsIq
	1a5wVhgmlOSLYLCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1MdLxQVF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="VKFSogt/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1729686271;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hGRwK4bi7EpaXvd97dFHCw5BOuekSasgeaxlGoZ/hFY=;
	b=1MdLxQVFTSqLfjwO5iuZbajTZu5DDJoUxTs8rCvfMks6k1GMKOH7DoDx0RZbRlyVhJpLFh
	FxmMBtU8io9JASP6lfl4WxpkEKcv2WR1KLjH2L6AvKPINPHX1L4zYIVosGp7fYv9ra6aua
	c9QXj1kUikvr8YzcIhH4NeESQvD4I7o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729686271;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hGRwK4bi7EpaXvd97dFHCw5BOuekSasgeaxlGoZ/hFY=;
	b=VKFSogt/5Lm8b55efYi0IntEWeL0J8dyZMEhAbP2AvWECv51oZOIH4BwhBq5RQJqh7qsIq
	1a5wVhgmlOSLYLCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 323C713AD3;
	Wed, 23 Oct 2024 12:24:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cR6ECv/qGGfvZwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 23 Oct 2024 12:24:31 +0000
Date: Wed, 23 Oct 2024 14:25:32 +0200
Message-ID: <871q072egz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Re: Update default depop procedure
In-Reply-To: <17b717a0a0b04a77aea4a8ec820cba13@realtek.com>
References: <17b717a0a0b04a77aea4a8ec820cba13@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 5B03F21C0D
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
Message-ID-Hash: JL4U4E75QWQ2GMXPROXPD5ZKGRCZKQKD
X-Message-ID-Hash: JL4U4E75QWQ2GMXPROXPD5ZKGRCZKQKD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JL4U4E75QWQ2GMXPROXPD5ZKGRCZKQKD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 23 Oct 2024 10:32:37 +0200,
Kailang wrote:
> 
> Hi Takashi,
> 
> Attach patch will solve issue which Headphone has a chance no sound.
> Many Thanks.

Applied now (with a proper Fixes tag).


thanks,

Takashi
