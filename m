Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C228A9385
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 08:49:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDE47EDB;
	Thu, 18 Apr 2024 08:49:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDE47EDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713422986;
	bh=GvMDsc5qT3Bc3RdbKLz9a4lp3vOD/saZfJ7m/naK73E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YQy5o/Cx/Xiva+VToLtro+9dY4gcXXvp0II7yA4p4OfFvhLNOyctK0KSCUgcZK9r5
	 GJvXiuwj86CAgp04pPZkm/MHc6rg5vUlW2NUIq5BbdOV6y71lt+etQ5ozvYQ0lIJLg
	 PgRM8OL7+4q6dYoda7dAnK0DWSE+bjgbKHH8RlU4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB43FF80587; Thu, 18 Apr 2024 08:49:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19A65F8057A;
	Thu, 18 Apr 2024 08:49:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38520F8025A; Thu, 18 Apr 2024 08:49:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22112F80124
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 08:49:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22112F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=rYomSldS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=VxkEdgg5;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=rYomSldS;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=VxkEdgg5
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 33AF25C53E;
	Thu, 18 Apr 2024 06:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1713422947;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BrLYOlP5vYHrPTmGOXSY+Gf5C9IRw6nNSjXk0H/RY3A=;
	b=rYomSldSkIRYQc6fOMCiZC8b+Z6sAC8DyTThV7sGgDjCxVlAm00PAtKJ4gKexQ7qVcaEfE
	q8VOUW9XuUAul7+1y2lK2v70dzL9kmo4iGZIqjqG3g9s5890UEq5JHxJdNH+cye1L7I2hM
	QNvqY+TXhG3g13LcI3MngkKaMdDIAC0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713422947;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BrLYOlP5vYHrPTmGOXSY+Gf5C9IRw6nNSjXk0H/RY3A=;
	b=VxkEdgg5cuEuIhDgO6HYqHf5kBsNC5RPr1zrIm5DHVgpyseTsZE96ycafpYlEasyOl/QH1
	Pb3e49zw705SmMAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rYomSldS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VxkEdgg5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1713422947;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BrLYOlP5vYHrPTmGOXSY+Gf5C9IRw6nNSjXk0H/RY3A=;
	b=rYomSldSkIRYQc6fOMCiZC8b+Z6sAC8DyTThV7sGgDjCxVlAm00PAtKJ4gKexQ7qVcaEfE
	q8VOUW9XuUAul7+1y2lK2v70dzL9kmo4iGZIqjqG3g9s5890UEq5JHxJdNH+cye1L7I2hM
	QNvqY+TXhG3g13LcI3MngkKaMdDIAC0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713422947;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BrLYOlP5vYHrPTmGOXSY+Gf5C9IRw6nNSjXk0H/RY3A=;
	b=VxkEdgg5cuEuIhDgO6HYqHf5kBsNC5RPr1zrIm5DHVgpyseTsZE96ycafpYlEasyOl/QH1
	Pb3e49zw705SmMAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E07B61384C;
	Thu, 18 Apr 2024 06:49:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 92x0NWLCIGYUegAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 18 Apr 2024 06:49:06 +0000
Date: Thu, 18 Apr 2024 08:49:15 +0200
Message-ID: <87edb3xj10.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: zhanghuayu1233@qq.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	sbinding@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	zhanghuayu.dev@gmail.com
Subject: Re: [PATCH] Fix volumn control of ThinkBook 16P Gen4
In-Reply-To: <tencent_37EB880C5E5BD99D21C16B288115C4545F06@qq.com>
References: <tencent_37EB880C5E5BD99D21C16B288115C4545F06@qq.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.53 / 50.00];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	BAYES_HAM(-0.52)[80.30%];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[qq.com];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,qq.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_NONE(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,opensource.cirrus.com,alsa-project.org,vger.kernel.org,gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]
X-Rspamd-Queue-Id: 33AF25C53E
X-Spamd-Bar: /
Message-ID-Hash: LHUW5GZNKGEP7YIT5TVNAEJGSUIT2VU2
X-Message-ID-Hash: LHUW5GZNKGEP7YIT5TVNAEJGSUIT2VU2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LHUW5GZNKGEP7YIT5TVNAEJGSUIT2VU2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 13 Apr 2024 13:41:22 +0200,
zhanghuayu1233@qq.com wrote:
> 
> From: Huayu Zhang <zhanghuayu1233@qq.com>
> 
> change HDA & AMP configuration from ALC287_FIXUP_CS35L41_I2C_2 to
> ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD for ThinkBook 16P Gen4 models to fix volumn
> control issue (cannot fully mute).
> 
> Signed-off-by: Huayu Zhang <zhanghuayu1233@qq.com>

Thanks, applied now.


Takashi
