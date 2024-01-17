Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 276D6830B9E
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jan 2024 18:01:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66BBF7F8;
	Wed, 17 Jan 2024 18:00:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66BBF7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705510866;
	bh=nUhfynRQw0SAmsyL3bUNLuR88CILK5gA+qwvQvFqOPw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u6w6P6m8EC3Y2N259lLfZhPPn4k3isPonXTUTAjJfn0KUW02I/jzZ8kyxMBXul6B5
	 P12SO1rKegCx8rRg8BgEiY4tz0spyPxUCbPo1XR2Z/mI2yrN4PtsgNNgTlTzg3cSRR
	 LXPM4/yEfFeRDU37quXOypSOjgEOtC3ll6mL4VDk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3ECAF8057D; Wed, 17 Jan 2024 18:00:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26674F8057E;
	Wed, 17 Jan 2024 18:00:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2420DF802BE; Wed, 17 Jan 2024 18:00:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2802F8014B
	for <alsa-devel@alsa-project.org>; Wed, 17 Jan 2024 18:00:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2802F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=gDYtEBWS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=+T6MFR+v;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=gDYtEBWS;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=+T6MFR+v
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 696261FCDA;
	Wed, 17 Jan 2024 17:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1705510814;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a9o0+yuyUMrXi9idbGF21yhZkpR86uzPwxcyPrphdms=;
	b=gDYtEBWSr5hcMeDAk8BtFi5Y7MtWKtsVhX8N4KqzuT/bjbygTwtRzu5NlmJTx2ZSEmT/JB
	vz19RzYhkx6jEvXIlmD3PkZmqJ/vyoYekluj86o25MhE5OtJQo/YWo/mZk41KmrP1D/FrO
	H7qnzwQSeKXkrp7yT+LqPwL1IGAzzns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1705510814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a9o0+yuyUMrXi9idbGF21yhZkpR86uzPwxcyPrphdms=;
	b=+T6MFR+vOQW1P0TL07bkfQH4nAlcLzHEYrKXdTZimZXGIphWDADrGmbvA919Y9EBTkh4U6
	ZQNVmQTQukObOMBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1705510814;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a9o0+yuyUMrXi9idbGF21yhZkpR86uzPwxcyPrphdms=;
	b=gDYtEBWSr5hcMeDAk8BtFi5Y7MtWKtsVhX8N4KqzuT/bjbygTwtRzu5NlmJTx2ZSEmT/JB
	vz19RzYhkx6jEvXIlmD3PkZmqJ/vyoYekluj86o25MhE5OtJQo/YWo/mZk41KmrP1D/FrO
	H7qnzwQSeKXkrp7yT+LqPwL1IGAzzns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1705510814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a9o0+yuyUMrXi9idbGF21yhZkpR86uzPwxcyPrphdms=;
	b=+T6MFR+vOQW1P0TL07bkfQH4nAlcLzHEYrKXdTZimZXGIphWDADrGmbvA919Y9EBTkh4U6
	ZQNVmQTQukObOMBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 33EA013800;
	Wed, 17 Jan 2024 17:00:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oL9EC54HqGVVNwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 17 Jan 2024 17:00:14 +0000
Date: Wed, 17 Jan 2024 18:00:13 +0100
Message-ID: <87fryvuc82.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Bin Li <bin.li@canonical.com>
Cc: tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	aaron.ma@canonical.com,
	libin.charles@gmail.com
Subject: Re: [PATCH] ALSA: hda/realtek: Enable headset mic on Lenovo M70 Gen5
In-Reply-To: <20240117154123.21578-1-bin.li@canonical.com>
References: <20240117154123.21578-1-bin.li@canonical.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-1.20 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-2.40)[97.24%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[suse.com,alsa-project.org,vger.kernel.org,canonical.com,gmail.com];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
Message-ID-Hash: CUBSRG4WMWSPMOZU524YEVQOIGYZY4JQ
X-Message-ID-Hash: CUBSRG4WMWSPMOZU524YEVQOIGYZY4JQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CUBSRG4WMWSPMOZU524YEVQOIGYZY4JQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 17 Jan 2024 16:41:23 +0100,
Bin Li wrote:
> 
> Lenovo M70 Gen5 is equipped with ALC623, and it needs
> ALC283_FIXUP_HEADSET_MIC quirk to make its headset mic work.
> 
> Signed-off-by: Bin Li <bin.li@canonical.com>

Thanks, applied now.


Takashi
