Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37184906AE4
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 13:21:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 887C2950;
	Thu, 13 Jun 2024 13:21:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 887C2950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718277708;
	bh=cSrSD2ER7FwwdFUISTeTDI7yxU0I5ltiu/NW6nhQdas=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Av6ix/cC52uKRKEasGRhXAEqY8iy04DcSfVVWEz4znC6ubqA8TZv4EiSaSJrRVf35
	 GyJqZtESd/kny/Ixfuk0HsDEnGq3MRBVGIDe0u7m8xtimshZiFXYm+aFC2czKunc3L
	 gR48FmdFIDZQfAbp+N9Fxuxu3d26osk2KE50qwWM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCDBDF800D0; Thu, 13 Jun 2024 13:21:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A26AF80588;
	Thu, 13 Jun 2024 13:21:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2487F8057A; Thu, 13 Jun 2024 13:21:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C115AF800D0
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 13:21:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C115AF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=pm+e2XfI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=kIiZVfAJ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=jVm+BznM;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=rbjbc/uH
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B08F95D23E;
	Thu, 13 Jun 2024 11:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718277666;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l6z7Niu1Um2rHg8D2Xikm+GTxJhA1GYdJOciXNS7YTM=;
	b=pm+e2XfI/GNyH+Cu2Drx0uQMAKBZ4YEtnudB6sNxvzFKemEP8OrM1XR7iqhxkYduS5Ii60
	eHCmefrEP32sieyQRwUGNrtZuyNPQm2/XNVhNUbruhtLBNAZr9x73UADT6S5j+x1tY6G24
	GhsLQmioQwcDmefCHRNyTIYCRVz4Is4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718277666;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l6z7Niu1Um2rHg8D2Xikm+GTxJhA1GYdJOciXNS7YTM=;
	b=kIiZVfAJyhQZulSrl3ogVCpZbaKeD614ASuyy/jN3HOc6KsLLlJlf70esZpZ7pxxXjxX0F
	QIp6xBrHM03+y9Bw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718277665;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l6z7Niu1Um2rHg8D2Xikm+GTxJhA1GYdJOciXNS7YTM=;
	b=jVm+BznM3JvIUSyWX5e21iiotmilsoo4933Hchex4phs166joPlRdZt5VMIH7UHeklYUer
	Pi6hVpBuj5BzANktpfhUVJI0hTziI9XUGCQk8CUW8Fak4ps2HQY9kBlSSYQtNwGGLsMMQV
	NOlwtougOFi0UROFgvjz1L2SlHFUvSo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718277665;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l6z7Niu1Um2rHg8D2Xikm+GTxJhA1GYdJOciXNS7YTM=;
	b=rbjbc/uHBVNfSQlmOHyLp0Fvky9ewPkGZ45q+ucN5iTCvwvtoM98l9v1XomUUIjJksZw3r
	co+WivAIS0d5zbAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8CF7F13A87;
	Thu, 13 Jun 2024 11:21:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TOg5ISHWamb1EgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Jun 2024 11:21:05 +0000
Date: Thu, 13 Jun 2024 13:21:29 +0200
Message-ID: <87le39nl52.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Dustin L. Howett" <dustin@howett.net>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	alsa-devel@alsa-project.org,
	Kieran Levin <ktl@frame.work>
Subject: Re: [PATCH] ALSA: hda/realtek: Remove Framework Laptop 16 from quirks
In-Reply-To: 
 <20240605-alsa-hda-realtek-remove-framework-laptop-16-from-quirks-v1-1-11d47fe8ec4d@howett.net>
References: 
 <20240605-alsa-hda-realtek-remove-framework-laptop-16-from-quirks-v1-1-11d47fe8ec4d@howett.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[howett.net:email,imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: TGHUWT36Y4L24PZPBAGFXKKRB764UA5S
X-Message-ID-Hash: TGHUWT36Y4L24PZPBAGFXKKRB764UA5S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TGHUWT36Y4L24PZPBAGFXKKRB764UA5S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 05 Jun 2024 19:01:32 +0200,
Dustin L. Howett wrote:
> 
> The Framework Laptop 16 does not have a combination headphone/headset
> 3.5mm jack; however, applying the pincfg from the Laptop 13 (nid=0x19)
> erroneously informs hda that the node is present.
> 
> Fixes: 8804fa04a492 ("ALSA: hda/realtek: Add Framework laptop 16 to quirks")
> Signed-off-by: Dustin L. Howett <dustin@howett.net>

Applied now.  Thanks.


Takashi
