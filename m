Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EF0916E0B
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2024 18:25:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F05D86E;
	Tue, 25 Jun 2024 18:25:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F05D86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719332758;
	bh=sUIvPr5TwhY0q7QPahwTBtOYZADYoIVdqXPCUaN45QE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FUmnMrWqCIBRd1nixLtIL+AHY4NIozcJ68miJ2/4BpYymETTsncqS7nCppXVwtvr5
	 1V+GCu1biXgs1r8Q1Sy4LwwPVgUXwkrVyhS2Hac22iWo8xzP3sc7J9VyB8lvdKwSw+
	 2kxPhtqbOJ39rYqr303I1oO8o9YT06EabYwDMXiQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 698F5F800ED; Tue, 25 Jun 2024 18:25:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CFA07F805C5;
	Tue, 25 Jun 2024 18:25:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7269F80495; Tue, 25 Jun 2024 17:54:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,TIME_LIMIT_EXCEEDED,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1718F8013D
	for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2024 17:49:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1718F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=kVtp96ts;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=kItZ26Ub;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=kVtp96ts;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=kItZ26Ub
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5CE9A219C5;
	Tue, 25 Jun 2024 15:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1719330573;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kw99qVZz3ZF+3mnj5cm4S1a48bOPXeIsywDzO8R5Pas=;
	b=kVtp96tsZGU0H/gj4nJScyjfusw1eAFBtepiuKAQayde5rtPevqAfIpxrbDtslEAjLAAuW
	cQ5n9EvZCl72jUwlicwKEQW01UrmWCHaRU6ianbeGw247IfapbradyZthcYmhVFduZpCYY
	iSB8KyWO1ike0KhjOId2OKmVFzOp1fU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719330573;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kw99qVZz3ZF+3mnj5cm4S1a48bOPXeIsywDzO8R5Pas=;
	b=kItZ26Ub03uK5X6n1TRXpfeacTeUPOdu7DdUjhfzLGoM7m+7aFelGgAQzYNnXVK5FqbhtA
	kndDr4irkG01XoAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1719330573;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kw99qVZz3ZF+3mnj5cm4S1a48bOPXeIsywDzO8R5Pas=;
	b=kVtp96tsZGU0H/gj4nJScyjfusw1eAFBtepiuKAQayde5rtPevqAfIpxrbDtslEAjLAAuW
	cQ5n9EvZCl72jUwlicwKEQW01UrmWCHaRU6ianbeGw247IfapbradyZthcYmhVFduZpCYY
	iSB8KyWO1ike0KhjOId2OKmVFzOp1fU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719330573;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kw99qVZz3ZF+3mnj5cm4S1a48bOPXeIsywDzO8R5Pas=;
	b=kItZ26Ub03uK5X6n1TRXpfeacTeUPOdu7DdUjhfzLGoM7m+7aFelGgAQzYNnXVK5FqbhtA
	kndDr4irkG01XoAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E205513A9A;
	Tue, 25 Jun 2024 15:49:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Gh3kNQznemboRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Jun 2024 15:49:32 +0000
Date: Tue, 25 Jun 2024 17:50:00 +0200
Message-ID: <87ikxxkonr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rauty <rautyrauty@gmail.com>
Cc: wzhd@ustc.edu,
	Gergo Koteles <soyer@irl.hu>,
	alsa-devel@alsa-project.org,
	tiwai@suse.com,
	perex@perex.cz,
	kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	luke@ljones.dev,
	shenghao-ding@ti.com,
	simont@opensource.cirrus.com,
	foss@athaariq.my.id,
	rf@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Enable headset mic on IdeaPad
 330-17IKB 81DM
In-Reply-To: 
 <CAGpJQTHajQnOr7Tr8cmMyjBqGw1sg_-SwSuAhnz-yFHZdPukGw@mail.gmail.com>
References: <20240615125457.167844-1-rauty@altlinux.org>
	<2c9ba341bc95d4b9010bf5f8794c0d14b1c57dc9.camel@irl.hu>
	<CAGpJQTHoBAixmxta2WuZfjHjiK9GXF=hkfPyV7PBD5rt9Z_0WA@mail.gmail.com>
	<CAGpJQTGqxEkfp003QLsp-syUgzDFCmHSmNaoOaem0ZMVf7_=bg@mail.gmail.com>
	<c0a9e15e7926e098bdea97a7d31c32427e0910c9.camel@irl.hu>
	<871q4lm9dp.wl-tiwai@suse.de>
	<CAGpJQTFF=gKN2h105dGhBOEhN0Q1Tpj5hJWpSdQ_-nCoUTzj5A@mail.gmail.com>
	<87tthhktdz.wl-tiwai@suse.de>
	<87sex1kt6t.wl-tiwai@suse.de>
	<CAGpJQTGR5WKuHUFGFUC286TUkOXYgcqigZRDb4K5deyE9uuz8w@mail.gmail.com>
	<87msn9ksj6.wl-tiwai@suse.de>
	<CAGpJQTHajQnOr7Tr8cmMyjBqGw1sg_-SwSuAhnz-yFHZdPukGw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
Message-ID-Hash: YMNMFQRL7Q4SH555YJVDLQC335HI4FLE
X-Message-ID-Hash: YMNMFQRL7Q4SH555YJVDLQC335HI4FLE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YMNMFQRL7Q4SH555YJVDLQC335HI4FLE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 25 Jun 2024 16:47:34 +0200,
Rauty wrote:
> 
> On Tue, 25 Jun 2024 at 17:25, Takashi Iwai <tiwai@suse.de> wrote:
> > Great.  Could you also give the one for IdeaPad 330?
> 
> http://alsa-project.org/db/?f=cb04b699a8aaa07e0bd992dfc92accb993dc0a97

Thanks.  I'll cook a fix patch and submit.


Takashi
