Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 073B17F17FA
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 16:58:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F26E2850;
	Mon, 20 Nov 2023 16:57:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F26E2850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700495890;
	bh=s0UiQxWIxM5lhZVOwYVf/nk6rknPjJKXTITqwxtE3r8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nh7u5KA2x7ZSuS32rz8c7U4kExwXU2vTbIdzXQqiu2c/G2lmE7R2DxcYlnGUYZ0Fs
	 F08MhdLXOGm30nlAMoJgH7jthryz2bw6a8SL4iyrwJNVJhrQ9KGm0sG9c+5+FDB9wh
	 JJQSuTIZL0R+nlSbjaUEGT7tLm7DTdaHf0NMBf+k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87EA9F8047D; Mon, 20 Nov 2023 16:57:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F2E0F80249;
	Mon, 20 Nov 2023 16:57:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37036F80254; Mon, 20 Nov 2023 16:57:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 944C6F80114
	for <alsa-devel@alsa-project.org>; Mon, 20 Nov 2023 16:57:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 944C6F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=w587o13F;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=T0YT1AJB
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B65E721910;
	Mon, 20 Nov 2023 15:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1700495830;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F7PHDpnVy2lTG03bseJP/V2+jncktgxQQFaSuIPkBLk=;
	b=w587o13FK81/QgJpA3yBbGce9j7RBg0tucqm7mquwIwtcAZKcXRZsRTx+xfohbeXVQMjol
	5rRx1mMOTTrdhQxw2cqFJvSV6na1ofukBnpgBDH/R6mnLLAmUi/ZBwaCsPedCdz96Z9fJ4
	N+K2sO2TnX3T00B7UzkiVdDSvhX+yAg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1700495830;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F7PHDpnVy2lTG03bseJP/V2+jncktgxQQFaSuIPkBLk=;
	b=T0YT1AJBtw9kX1YM4GoSpd7lH71ue+bwhpIBHLhaseE00YMdulNbNahoIZAeNDv5JIFSuJ
	eqXrUidF0/NL8sDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 518D4134AD;
	Mon, 20 Nov 2023 15:57:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id bR32EtaBW2XmWQAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 20 Nov 2023 15:57:10 +0000
Date: Mon, 20 Nov 2023 16:57:09 +0100
Message-ID: <877cmcpgdm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Daniel Mack <zonque@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kees Cook <keescook@chromium.org>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Jan Kara <jack@suse.cz>,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Matthew Wilcox <willy@infradead.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>,
	Alexey Klimov <klimov.linux@gmail.com>
Subject: Re: [PATCH 30/34] ALSA: use atomic find_bit() functions where
 applicable
In-Reply-To: <20231118155105.25678-31-yury.norov@gmail.com>
References: <20231118155105.25678-1-yury.norov@gmail.com>
	<20231118155105.25678-31-yury.norov@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [1.20 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 RCVD_TLS_ALL(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 BAYES_HAM(-0.00)[21.87%];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_TWELVE(0.00)[17];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[vger.kernel.org,perex.cz,suse.com,gmail.com,intel.com,linux.intel.com,chromium.org,alsa-project.org,suse.cz,alu.unizg.hr,infradead.org,rasmusvillemoes.dk,linaro.org];
	 RCVD_COUNT_TWO(0.00)[2];
	 SUSPICIOUS_RECIPS(1.50)[]
Message-ID-Hash: RJ6QL4CRAQSBIEF6RONR2TLNDPKJTB4E
X-Message-ID-Hash: RJ6QL4CRAQSBIEF6RONR2TLNDPKJTB4E
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RJ6QL4CRAQSBIEF6RONR2TLNDPKJTB4E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 18 Nov 2023 16:51:01 +0100,
Yury Norov wrote:
> 
> ALSA code tests each bit in bitmaps in a for() loop. Switch it to
> dedicated atomic find_bit() API.
> 
> Signed-off-by: Yury Norov <yury.norov@gmail.com>

Through a quick glance, both changes look OK.
Feel free to take my ack

Acked-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi
