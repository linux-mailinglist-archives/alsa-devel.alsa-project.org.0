Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56166ADA844
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jun 2025 08:31:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08992601E7;
	Mon, 16 Jun 2025 08:31:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08992601E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750055518;
	bh=Z3Dhen/NIhRUrb2lRopKSmga+Bncrc0GJH/fiyjtzdk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ncXvoi9aSYNxg6Lz8WlEanwQeeZLmOSZEy+RWY4htFHsz8XY9RMo0SWZ0PyUPq8vi
	 UZAQXHwOAR44GAoSrc6WtQPD1bZlZXu1GnHiJwEnVPhPQBqYjDGOsJR+GrPoTSrnLi
	 WgGSoziBRzeeYgPOA9At01YATE1mD6FVp0NToNu0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C16FEF805D4; Mon, 16 Jun 2025 08:31:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CFC1F805C6;
	Mon, 16 Jun 2025 08:31:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8D17F80124; Mon, 16 Jun 2025 08:31:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F979F800E4
	for <alsa-devel@alsa-project.org>; Mon, 16 Jun 2025 08:31:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F979F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=W7UZT+DR;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=YarI5pGg;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=11JZj6M8;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jr5LLV0P
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E2E83211FE;
	Mon, 16 Jun 2025 06:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1750055478;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e76VJmfpP2Yor4xtdesgaAQgCirhh2iFdOwvdjWCaUs=;
	b=W7UZT+DR84iwZYYpmKkbdtVF15N80oTV8W5kyTypX2S8MW9Q0x7CZ+ZtewDrzueHRWaoZU
	bCekQeak9ZqwribcMYnN/bK2R84efjHOYmx5bac0HclTnQCY2wERYceZ6e17AFMh8CaYe5
	YC008p6YaIMayGW2IffiHruiiCNnOA4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750055478;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e76VJmfpP2Yor4xtdesgaAQgCirhh2iFdOwvdjWCaUs=;
	b=YarI5pGg/zNpctUjy8aFQL/fhieWyPOwSqtCPoFXGoeoRuxMTrVbJx50+EfhQhOdkeMrIl
	uRdreMUzGy0I6zBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=11JZj6M8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jr5LLV0P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1750055477;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e76VJmfpP2Yor4xtdesgaAQgCirhh2iFdOwvdjWCaUs=;
	b=11JZj6M8Exqvd2NV3iCmKcMT1S8xMOiqWIG+h8NqXsg9LD+iSoYyjsAWT27CfSggO0OXaO
	rqYIqLN+58ut2nvJtAWwTHOI9Cgv+srVNRqYnBR/wYOf1pdHAt9gD3MoxWSs0wSHwuzMtp
	/ervomuAaar11PiRCIEScKZwjElZU3c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750055477;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e76VJmfpP2Yor4xtdesgaAQgCirhh2iFdOwvdjWCaUs=;
	b=jr5LLV0P94CMoGYS1cnD6b4RXzP3AdyYIwakUo2lEVnige5BqntQZlCSFHQ1XyMzgckfoZ
	yo3/mhHEzToAX+Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 91247139E2;
	Mon, 16 Jun 2025 06:31:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4VEYIjW6T2g2FAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Jun 2025 06:31:17 +0000
Date: Mon, 16 Jun 2025 08:31:17 +0200
Message-ID: <87msa8p58q.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Baojun Xu <baojun.xu@ti.com>
Cc: <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<alsa-devel@alsa-project.org>,
	<shenghao-ding@ti.com>,
	<navada@ti.com>,
	<13916275206@139.com>,
	<v-hampiholi@ti.com>,
	<v-po@ti.com>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Add compatible for hardware id
 TIAS2781 and TXNW2781
In-Reply-To: <20250616035607.2569-1-baojun.xu@ti.com>
References: <20250616035607.2569-1-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,alsa-project.org,ti.com,139.com,vger.kernel.org];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,ti.com:email]
X-Rspamd-Queue-Id: E2E83211FE
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: E6FHPVUQADJTC2IDTFBQIERT5Q5TPZW6
X-Message-ID-Hash: E6FHPVUQADJTC2IDTFBQIERT5Q5TPZW6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E6FHPVUQADJTC2IDTFBQIERT5Q5TPZW6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 16 Jun 2025 05:56:07 +0200,
Baojun Xu wrote:
> 
> TIAS2781 is unofficial hardware id in ACPI for tas2781 in HDA,
> has been used for several projects. TXNW is the official hardware
> id for TI, will be used in new projects, including device on SPI bus,
> which was enumerated by drivers/acpi/scan.c, and probed by smi_probe()
> in drivers/platform/x86/serial-multi-instantiate.c.
> This patch will support both TIAS2781 and TXNW2781 in ACPI with
> tas2781 under HDA.
> As our I2C driver will handle all of slaver devices, so we probe
> first device only: "TXNW2781:00-tas2781-hda.0"
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>

Thanks, applied now.


Takashi
