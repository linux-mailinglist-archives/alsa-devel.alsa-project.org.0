Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C80CBA7B2
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Dec 2025 10:35:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CEC360210;
	Sat, 13 Dec 2025 10:35:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CEC360210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765618513;
	bh=98vrEczsInEah0GMZTj0hvtpl0gKVRAm1q+iCJweoTA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D3kP1pGmJIWIaOPFaQHnY2hizTtxj3XN6gdfL2UVlOqJ9gV8HChOHmfY+03vuncwr
	 uV488qyn+xeGa/xJfnTBafAybzQRXymPwzoQZKtWvZpOigtJi75+o4xgqDUJmn9B6F
	 NagEb6kCUC1ODufyhuO+SKjF34ZijB1ta/oMJqdk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 525B3F805E1; Sat, 13 Dec 2025 10:34:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB61AF805CA;
	Sat, 13 Dec 2025 10:34:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE821F80518; Sat, 13 Dec 2025 10:33:45 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D3F0FF80095
	for <alsa-devel@alsa-project.org>; Sat, 13 Dec 2025 10:33:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3F0FF80095
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=bFJD+0O/;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=pnAinUhu;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=HGlD2sFs;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=SY5L+EgN
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0724E336FC;
	Sat, 13 Dec 2025 09:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1765618423;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4BMeBKhUoPgtUJwh3ul6HFLrPyfQ2XRn8HqL/hj2hhI=;
	b=bFJD+0O/QztCQhsGTjjMBxB92AURUpuV0GgBzOoAgqR2bngsEZfIi/jkCRN3BYse6eYB38
	LX9oqEt/oOPe2rr5gW3VILgPE9MGinHwmF6H6wW5rZeemWmn8c4tRdC6o/wfOqlpp80dRb
	kdZLoIDzfgiUyNYOr+NAOEueNeXrjSo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765618423;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4BMeBKhUoPgtUJwh3ul6HFLrPyfQ2XRn8HqL/hj2hhI=;
	b=pnAinUhu9rmv3ZUGtK48m/y5eTgJzszdEClO2YLYCCTElXnIMBQApf7Uabl/VQVmsS1Uk9
	0CLoAq7B4gp1KKBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HGlD2sFs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SY5L+EgN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1765618422;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4BMeBKhUoPgtUJwh3ul6HFLrPyfQ2XRn8HqL/hj2hhI=;
	b=HGlD2sFsok/JcjsSUQTZMvOPlf3DRJCS8WjAAEPh7yUG0+SXgU360IWtcmjR5XadEW0IMw
	gVYvTuoD5mJzydaImwfcn4jHPAyTawdB6HWV6LxAgPIB/8spKp5idHmLvy8H2JmJ29yfoW
	lLid+l3A5LJvGOJswUx/QZc0MpIpfIw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765618422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4BMeBKhUoPgtUJwh3ul6HFLrPyfQ2XRn8HqL/hj2hhI=;
	b=SY5L+EgNSsEchYLk3w8HNhLvLUQQDMQun2/tp9N4MdJBasYC3Ghdu0/0fa1/DMgyv1Et6W
	jhQt/ULlOKekrPCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D5BF83EA63;
	Sat, 13 Dec 2025 09:33:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id peWUMvUyPWlgKQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 13 Dec 2025 09:33:41 +0000
Date: Sat, 13 Dec 2025 10:33:41 +0100
Message-ID: <87pl8i9156.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jussi Laako <jussi@sonarnerd.net>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/3] ALSA: usb-audio: Update for native DSD support quirks
In-Reply-To: <20251211152224.1780782-1-jussi@sonarnerd.net>
References: <20251211152224.1780782-1-jussi@sonarnerd.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sonarnerd.net:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 0724E336FC
Message-ID-Hash: SQTBWYYXW2JBPBK55AYUQBESHMLBNKVV
X-Message-ID-Hash: SQTBWYYXW2JBPBK55AYUQBESHMLBNKVV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SQTBWYYXW2JBPBK55AYUQBESHMLBNKVV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 11 Dec 2025 16:22:21 +0100,
Jussi Laako wrote:
> 
> Maintenance patch for native DSD support.
> 
> Add set of missing device and vendor quirks; TEAC, Esoteric, Luxman and
> Musical Fidelity.
> 
> Signed-off-by: Jussi Laako <jussi@sonarnerd.net>

Applied all three patches now.  Thanks.


Takashi
