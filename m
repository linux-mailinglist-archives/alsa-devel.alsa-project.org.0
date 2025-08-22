Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FE3B3205C
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Aug 2025 18:21:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1243860250;
	Fri, 22 Aug 2025 18:21:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1243860250
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1755879693;
	bh=7lxvSp3xknP0ncWDrIdidiF2KXik5mdLOiRveqS4JAE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jL5pjk7MLm2kgpyPW4FPY2r2DM+LFfDaLiDeCHL/m2WbGwIwNAX+P0NZEtz9yR/po
	 IomubjOY25xNS53LDhISt50+s9JQui4rQ6jUTAl4Yh4PgKBMendApsjm9L5ZcHMYZW
	 SONNVAsFrUBL0DlWwGNOCaJ7FPidARsFG+ZoXKpk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C97C8F805C8; Fri, 22 Aug 2025 18:20:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A153EF805C6;
	Fri, 22 Aug 2025 18:20:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB6CBF804FF; Fri, 22 Aug 2025 18:20:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4AD4F80246
	for <alsa-devel@alsa-project.org>; Fri, 22 Aug 2025 18:20:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4AD4F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=v8wr2uZ3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=vtO1+coR;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=R0gYAF1/;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=4D5vr7xD
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 385BA21CAA;
	Fri, 22 Aug 2025 16:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1755879650;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rzZrkrYEVebL5JcnI8zpZya0TGeLqT8CkJ3Q10kaPSE=;
	b=v8wr2uZ35uij08cattSd/1weCQzS0+MwisyyYnKZvm8YFb75DnonS/t4vDcBz2ARsQfuom
	iT5zhb89mUuUyO4orMi6rNYoKtr1t3sUxDbVl43d/6wGQALp9nBiXp3/UJv1pZQ+sN+nkV
	jfslCDoYLnN8Umz6w68HAIyJLME614I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755879650;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rzZrkrYEVebL5JcnI8zpZya0TGeLqT8CkJ3Q10kaPSE=;
	b=vtO1+coRg0G1oKmwJxDpO6Qb9IlWDQGwSbs2oxTjy716za0eLWyw5HIHEQHmI2+mD78LWK
	bOyxOYgn2u9/qZBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="R0gYAF1/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4D5vr7xD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1755879649;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rzZrkrYEVebL5JcnI8zpZya0TGeLqT8CkJ3Q10kaPSE=;
	b=R0gYAF1/Z2duBxOH2w3SjrPP4CXTMhzdNYNgl2E7d1t+eS2Pq9L9FPwN04pkwESlPfYbIF
	gcYLJUqNvk98HiV5qWXLo5sWVw9k+sazymMaYJ6ZFA+boZkLX+EyxINa9EXBqLV+Ub3Pd5
	LXM/LjITpF3Pvm8c1YixqWBHcOAxn9M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755879649;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rzZrkrYEVebL5JcnI8zpZya0TGeLqT8CkJ3Q10kaPSE=;
	b=4D5vr7xDrO2b82waOhxpTdfCXwj56x8QpJWpLORDoN5B6KzQ1hkdGBWpUIJLQejVint0fG
	qf1P/cxQkx2MZPCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EFC4613931;
	Fri, 22 Aug 2025 16:20:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TA8KOeCYqGjHKgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 22 Aug 2025 16:20:48 +0000
Date: Fri, 22 Aug 2025 18:20:48 +0200
Message-ID: <878qjb49b3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Brady Norander <bradynorander@gmail.com>
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	amadeuszx.slawinski@linux.intel.com,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	pierre-louis.bossart@linux.intel.com
Subject: Re: [PATCH] ALSA: hda: intel-dsp-config: Select SOF driver on MTL
 Chromebooks
In-Reply-To: <20250821014730.8843-1-bradynorander@gmail.com>
References: <20250821014730.8843-1-bradynorander@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 385BA21CAA
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.98%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
Message-ID-Hash: 2ECCZX4CBHTGEOTXWMMVZRS5J3L7USF2
X-Message-ID-Hash: 2ECCZX4CBHTGEOTXWMMVZRS5J3L7USF2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2ECCZX4CBHTGEOTXWMMVZRS5J3L7USF2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 21 Aug 2025 03:47:30 +0200,
Brady Norander wrote:
> 
> The SOF driver is required for functional audio on MTL Chromebooks
> 
> Signed-off-by: Brady Norander <bradynorander@gmail.com>

Thanks, applied now.


Takashi
