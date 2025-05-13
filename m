Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D0BAB7FC2
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 10:06:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFF3862C16;
	Thu, 15 May 2025 10:00:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFF3862C16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747296065;
	bh=dCMZsS5yy9vn30pcrolPLTccTn48yh3b6ksDcgXhDO4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sCuxhWjOWBfyAu31BpkV7Rdx7y5r4CidnEW3bnmlH6AOA6+nt4jTB8OM1bz1F/HP3
	 iCBjoxJd7yWRLP/6sVpJphzUSkzxc8SnQF6LBWW/Od9OsX7oGaDB3m9LmP6yB6jDP5
	 xbG4tdfVIyLTUnFwIRwMPIJBgXcLfxP7hiMxk04k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE6F6F89B08; Tue, 13 May 2025 11:02:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7CAAF89B00;
	Tue, 13 May 2025 11:02:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9630BF89AF2; Tue, 13 May 2025 11:02:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3F48F89AF0
	for <alsa-devel@alsa-project.org>; Tue, 13 May 2025 11:02:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3F48F89AF0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Pf0Eee/o;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=kIVzvB0W;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Pf0Eee/o;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=kIVzvB0W
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7F8FF1F6E6;
	Tue, 13 May 2025 09:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1747126938;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nq1d9ovfN++gmheqjN9ni2gogF089hk9pgYlzPAmSJ0=;
	b=Pf0Eee/oPP9gIuBYK9BvB+fbvqKN092PBDUzlU6R3aMfT2LuYWzMYNTwEZvP8aFwgkRcUT
	NOiVJD1CEsLnnPAEBdd4/RKs2j4IhTqgq39b4eI2Kh1slPpjIKb+sD51KY+q64IXqx7fdw
	UWvC6mTltsQHTTJS2lbYAnYUO8uUQG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747126938;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nq1d9ovfN++gmheqjN9ni2gogF089hk9pgYlzPAmSJ0=;
	b=kIVzvB0WZcv7VM+g3+4oX3fvdcg+hut6nkKfsbuEsDIbAOJOAzzDCSgPREcKUQ11Iy1A/J
	cXM1gypxyb/D1BAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Pf0Eee/o";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kIVzvB0W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1747126938;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nq1d9ovfN++gmheqjN9ni2gogF089hk9pgYlzPAmSJ0=;
	b=Pf0Eee/oPP9gIuBYK9BvB+fbvqKN092PBDUzlU6R3aMfT2LuYWzMYNTwEZvP8aFwgkRcUT
	NOiVJD1CEsLnnPAEBdd4/RKs2j4IhTqgq39b4eI2Kh1slPpjIKb+sD51KY+q64IXqx7fdw
	UWvC6mTltsQHTTJS2lbYAnYUO8uUQG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747126938;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nq1d9ovfN++gmheqjN9ni2gogF089hk9pgYlzPAmSJ0=;
	b=kIVzvB0WZcv7VM+g3+4oX3fvdcg+hut6nkKfsbuEsDIbAOJOAzzDCSgPREcKUQ11Iy1A/J
	cXM1gypxyb/D1BAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5D191137E8;
	Tue, 13 May 2025 09:02:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CIcpFpoKI2j6fgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 May 2025 09:02:18 +0000
Date: Tue, 13 May 2025 11:02:10 +0200
Message-ID: <871pssubn1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<13564923607@139.com>,
	<13916275206@139.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<baojun.xu@ti.com>,
	<Baojun.Xu@fpt.com>,
	<jesse-ji@ti.com>,
	kernel test robot
	<lkp@intel.com>
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Fix the symbol was not declare
 warning reported by kernel test robot
In-Reply-To: <20250513071721.1090-1-shenghao-ding@ti.com>
References: <20250513071721.1090-1-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 7F8FF1F6E6
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,139.com,alsa-project.org,vger.kernel.org,ti.com,fpt.com,intel.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REDIRECTOR_URL(0.00)[urldefense.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,urldefense.com:url,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,ti.com:email,intel.com:email]
X-Rspamd-Action: no action
Message-ID-Hash: CYNNGECRICRPNSSZ4AFXFP5RDSVTX4S7
X-Message-ID-Hash: CYNNGECRICRPNSSZ4AFXFP5RDSVTX4S7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CYNNGECRICRPNSSZ4AFXFP5RDSVTX4S7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 May 2025 09:17:21 +0200,
Shenghao Ding wrote:
> 
> After commit 28a09d9e42c5 ("ALSA: hda/tas2781: Create an independent lib
> to save the shared parts for both SPI and I2C driver") created a separated
> lib for both hda-i2c and hda-spi driver, which caused this issue.
> sparse warnings: (new ones prefixed by >>)
> >> sound/pci/hda/tas2781_hda_spi.c:496:25: sparse: sparse: symbol
>    'tas2781_snd_ctls' was not declared. Should it be static?
> >> sound/pci/hda/tas2781_hda_spi.c:505:25: sparse: sparse: symbol
>    'tas2781_prof_ctl' was not declared. Should it be static?
> >> sound/pci/hda/tas2781_hda_spi.c:512:25: sparse: sparse: symbol
>    'tas2781_dsp_ctls' was not declared. Should it be static?
> 
> Fixes: 28a09d9e42c5 ("ALSA: hda/tas2781: Create an independent lib to save the shared parts for both SPI and I2C driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-all/202505130420.vr9yDI3k-lkp@intel.com/__;!!G3vK!URphGMMfZ2erCLfJdETofl0O1mTSydDLLJ6inMIYWYUDUKYef_IuLvI7pnYj3Mx-4LRIi4BJEw$
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

Applied now.  Thanks.


Takashi
