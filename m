Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9759B87CB3F
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Mar 2024 11:17:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB63D22AE;
	Fri, 15 Mar 2024 11:17:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB63D22AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710497844;
	bh=Le34RBxbSQSoZlpWt27Xlzewd/eWX1ig4W7Q73xiS8Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gkih1Qk0GdBFtsig2hUr9ZD7AyNXVW2UG7AnncHrOn3o8T0eDakbhuJp1SiohdbhP
	 abKOtJGRr3ea1rbZ3P7d3hAasUUhMehDXCDKBr7SBWPkscRO8M81Vtuut424HPML03
	 7I02or8ddB19SjRxqNeBQPjdHxkKTN7oDjY1VUmI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68278F805A0; Fri, 15 Mar 2024 11:16:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73477F805AF;
	Fri, 15 Mar 2024 11:16:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37B7DF8028D; Fri, 15 Mar 2024 11:16:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C986F800E4
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 11:16:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C986F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=MgC+FN7J;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Nhucof32;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=RKczVi8e;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ZiOmniBw
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D465A1FB56;
	Fri, 15 Mar 2024 10:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1710497795;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aM7Fh7BB6+u1t/Mp/NSCwDxelG/N9MvjWgGxq738pns=;
	b=MgC+FN7JRKbzLA6MXgT4CQVoV8UCIhnju+lQq2HHvrRNk0Hr19d0pj/UWmMt5etLclgxhd
	RudmXAoWoyGyxsmTk7Bji0Wn/gvWLHRci2hbJ1TKGr85esw43AeKshFLy/Fo4hW18Pwzs5
	GAV/BDhtTpS4Mm23LkS7MN1aRHrLRLk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710497795;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aM7Fh7BB6+u1t/Mp/NSCwDxelG/N9MvjWgGxq738pns=;
	b=Nhucof32grCj4iLqdWKX3ZBWo5fohaMZ+GGdI299h8+wV+ufXWeNQ5ccDWkWs2izBsZVh8
	myHq563Zm8D/+DDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1710497794;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aM7Fh7BB6+u1t/Mp/NSCwDxelG/N9MvjWgGxq738pns=;
	b=RKczVi8eENKCaUMmhTV/k4F+gFZ3Uknqg97SBRHJyku6ADiMOL9T39ESkAnrTvsqdklHyn
	M0IbtRTQWuA9xd6A2Ee+xBFBHuUf9Aq/OCzY7UsJKsRnN2D45xAJlt9mYWXB43VAy18agS
	62fMhEfga0GLGUwltmfOCVM6jPfdDPg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710497794;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aM7Fh7BB6+u1t/Mp/NSCwDxelG/N9MvjWgGxq738pns=;
	b=ZiOmniBwnGvc9hoC9RW4kR1elWTFeZn9VAHrgPWH1YbbK+20CBD26hXiQRfB7tXQHYYwRw
	ODdZN9SV4TJEz2BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AF9C213460;
	Fri, 15 Mar 2024 10:16:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Q2NKKQIg9GUxaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 Mar 2024 10:16:34 +0000
Date: Fri, 15 Mar 2024 11:16:34 +0100
Message-ID: <87ttl7by0t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: i@jichi.ca
Cc: tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Yoga 9 14IMH9
In-Reply-To: <20240315081954.45470-3-i@jichi.ca>
References: <20240315081954.45470-3-i@jichi.ca>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RKczVi8e;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ZiOmniBw
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.81 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_NONE(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-0.998];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-1.30)[90.04%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Rspamd-Queue-Id: D465A1FB56
Message-ID-Hash: QF3PXBV5B3E6OPX2DR2B52JNZZE52SXB
X-Message-ID-Hash: QF3PXBV5B3E6OPX2DR2B52JNZZE52SXB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QF3PXBV5B3E6OPX2DR2B52JNZZE52SXB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 15 Mar 2024 09:19:56 +0100,
i@jichi.ca wrote:
> 
> From: Jichi Zhang <i@jichi.ca>
> 
> The speakers on the Lenovo Yoga 9 14IMH9 are similar to previous generations
> such as the 14IAP7, and the bass speakers can be fixed using similar methods
> with one caveat: 14IMH9 uses CS35L41 amplifiers which need to be activated
> seperately.
> 
> Signed-off-by: Jichi Zhang <i@jichi.ca>

Applied now (with a correction of a typo in the description).


thanks,

Takashi
