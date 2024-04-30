Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8C28B769C
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 15:08:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12806826;
	Tue, 30 Apr 2024 15:08:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12806826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714482522;
	bh=r7FRtwI8zRzPvvCl2KCVkCnQ1HmMBmLozjO1kH0+tzY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e9PYLsoaJZnH/JvD4f70VURgYDvQ/NPPMOJ9Fk5eSiP6hK7LQM+fLqzuIMDXyY2eG
	 in0juycPMcGG43Jey6QALZt4nQI8g8utkHF3zAt/ASUxqZAXqAOaISOb/VFBH21Dj4
	 7/PNxOIeqMkjNe12cVY7ptpUWB4CfMlb+EbQSnlU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0617F805A8; Tue, 30 Apr 2024 15:08:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A1EDF8059F;
	Tue, 30 Apr 2024 15:08:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8BD5F80266; Tue, 30 Apr 2024 15:07:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B23FF8003A
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 15:07:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B23FF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=tFjYY3ik;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9oZ4487R;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=tFjYY3ik;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9oZ4487R
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8A9E43405D;
	Tue, 30 Apr 2024 13:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714482432;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nz8N0tF3ZAzNA0MyZhuy8ig+mc3JPzOBiuWey73KYMw=;
	b=tFjYY3ik4DFWQ/rDjFDfkvcMtsG4+pt+FYsUquNUtBTyk/nfg4rYO7AMonqWsMTz+sQa6O
	09b5Iju0hbTbO8Bi0jUneQqg9lDJWEYO9hc/B3/N30qRsAcdWhqwlzsv43fYEwLxYb/Oj8
	Wx+evBumRboEZGb5S1mNhrC9ihQsrLY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714482432;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nz8N0tF3ZAzNA0MyZhuy8ig+mc3JPzOBiuWey73KYMw=;
	b=9oZ4487RN1jyid4pLMdhXnk/Z496UXr5WcvJeB9l6tDr5ZO0Vgg7swsLQ7auJrYl7xmYSA
	QrRnIFrvX5yEX1Ag==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tFjYY3ik;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9oZ4487R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714482432;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nz8N0tF3ZAzNA0MyZhuy8ig+mc3JPzOBiuWey73KYMw=;
	b=tFjYY3ik4DFWQ/rDjFDfkvcMtsG4+pt+FYsUquNUtBTyk/nfg4rYO7AMonqWsMTz+sQa6O
	09b5Iju0hbTbO8Bi0jUneQqg9lDJWEYO9hc/B3/N30qRsAcdWhqwlzsv43fYEwLxYb/Oj8
	Wx+evBumRboEZGb5S1mNhrC9ihQsrLY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714482432;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nz8N0tF3ZAzNA0MyZhuy8ig+mc3JPzOBiuWey73KYMw=;
	b=9oZ4487RN1jyid4pLMdhXnk/Z496UXr5WcvJeB9l6tDr5ZO0Vgg7swsLQ7auJrYl7xmYSA
	QrRnIFrvX5yEX1Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 562B9136A8;
	Tue, 30 Apr 2024 13:07:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id j+FuFADtMGY7LAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 30 Apr 2024 13:07:12 +0000
Date: Tue, 30 Apr 2024 15:07:24 +0200
Message-ID: <87ikzzm22b.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Baojun Xu <baojun.xu@ti.com>
Cc: <robh+dt@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<lgirdwood@gmail.com>,
	<perex@perex.cz>,
	<pierre-louis.bossart@linux.intel.com>,
	<kevin-lu@ti.com>,
	<shenghao-ding@ti.com>,
	<navada@ti.com>,
	<13916275206@139.com>,
	<v-po@ti.com>,
	<niranjan.hy@ti.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<liam.r.girdwood@intel.com>,
	<yung-chuan.liao@linux.intel.com>,
	<broonie@kernel.org>,
	<soyer@irl.hu>
Subject: Re: [PATCH v4 2/3] ALSA: hda/tas2781: Tas2781 hda driver for SPI
In-Reply-To: <20240430072544.1877-3-baojun.xu@ti.com>
References: <20240430072544.1877-1-baojun.xu@ti.com>
	<20240430072544.1877-3-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 8A9E43405D
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.87 / 50.00];
	BAYES_HAM(-2.86)[99.39%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,gmail.com,perex.cz,ti.com,139.com,alsa-project.org,vger.kernel.org,intel.com,irl.hu];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
Message-ID-Hash: 25YJQRHPCXCYBSQ37W2LTU5LYI5CK53F
X-Message-ID-Hash: 25YJQRHPCXCYBSQ37W2LTU5LYI5CK53F
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 30 Apr 2024 09:25:43 +0200,
Baojun Xu wrote:
> 
> Main source code for tas2781 hda driver for SPI.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>

That's far little description than wished.  You can copy the contents
of your cover letter to here, for example, for more detailed
information.

Second, and most: this patch breaks again the build.
You added the code calling functions that aren't defined yet
(appearing in the patch 3).

Also, some functions seem defined but not really used, e.g.
tasdevice_spi_calbin_remove(), and some are not needed to be global
functions.


thanks,

Takashi
