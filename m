Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDD997C8C4
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2024 13:52:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73FF6AE8;
	Thu, 19 Sep 2024 13:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73FF6AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726746778;
	bh=9eL39pWNtZV6yqST0+0AgBoGtFhWafKkwSV+APQCnhg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kzlme8Y9nwLxIyOdb/PYz67ywhAo6kTVpIc7/Sk+7YeP9feQD8TMV3oQt6IAWynWi
	 sjkg3AavT2npgCqm4y1r5jeta7mzdbMq0ZYr8xZpqLOa1IugeIhGBSTh7ulb2rCSR5
	 11EznXHKDOYj8RsGvwrlgoraDC/81x5yXlKcS7VY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9EEAF805A8; Thu, 19 Sep 2024 13:52:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F37FF80518;
	Thu, 19 Sep 2024 13:52:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C4FBF8020D; Thu, 19 Sep 2024 13:52:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7495EF80107
	for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2024 13:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7495EF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=xCqOuoFv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Z/1rHCTD;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=xCqOuoFv;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Z/1rHCTD
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 27717338AE;
	Thu, 19 Sep 2024 11:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1726746732;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QUG72A/WvYD5gdJENBZhBjFBGf0eaF04UEVxM/2BrHM=;
	b=xCqOuoFvkQ8q1MSDjQH8UXwTtm03moULVhCwGHqnftCNLCret6y8Ut3aw2tBsduvrCt6Rd
	/KC+TrawDd7Gvn+s3Or4FbwMQJPFnHEtO+W6PRxuPfkm4AupFazizV+V7EU3uzV7N2odSO
	p1FR/eZWhARzRKGDZdBiZcAo5n/W3Nc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726746732;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QUG72A/WvYD5gdJENBZhBjFBGf0eaF04UEVxM/2BrHM=;
	b=Z/1rHCTD4dHLW1ON6f2G8MmL2jUjMytqfrAJL6POMwxQU9FV/l+65fIJeIFly69dNDlNVK
	CWvd2FIlS/JZHKBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xCqOuoFv;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="Z/1rHCTD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1726746732;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QUG72A/WvYD5gdJENBZhBjFBGf0eaF04UEVxM/2BrHM=;
	b=xCqOuoFvkQ8q1MSDjQH8UXwTtm03moULVhCwGHqnftCNLCret6y8Ut3aw2tBsduvrCt6Rd
	/KC+TrawDd7Gvn+s3Or4FbwMQJPFnHEtO+W6PRxuPfkm4AupFazizV+V7EU3uzV7N2odSO
	p1FR/eZWhARzRKGDZdBiZcAo5n/W3Nc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726746732;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QUG72A/WvYD5gdJENBZhBjFBGf0eaF04UEVxM/2BrHM=;
	b=Z/1rHCTD4dHLW1ON6f2G8MmL2jUjMytqfrAJL6POMwxQU9FV/l+65fIJeIFly69dNDlNVK
	CWvd2FIlS/JZHKBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 72B0613A5F;
	Thu, 19 Sep 2024 11:52:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9mfKGmsQ7GajHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 19 Sep 2024 11:52:11 +0000
Date: Thu, 19 Sep 2024 13:53:01 +0200
Message-ID: <87msk3c12a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Baojun Xu <baojun.xu@ti.com>
Cc: <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<lgirdwood@gmail.com>,
	<perex@perex.cz>,
	<pierre-louis.bossart@linux.intel.com>,
	<13916275206@139.com>,
	<zhourui@huaqin.com>,
	<alsa-devel@alsa-project.org>,
	<i-salazar@ti.com>,
	<liam.r.girdwood@intel.com>,
	<jaden-yue@ti.com>,
	<yung-chuan.liao@linux.intel.com>,
	<dipa@ti.com>,
	<yuhsuan@google.com>,
	<henry.lo@ti.com>,
	<Baojun.Xu@fpt.com>,
	<judyhsiao@google.com>,
	<navada@ti.com>,
	<cujomalainey@google.com>,
	<aanya@ti.com>,
	<nayeem.mahmud@ti.com>,
	<savyasanchi.shukla@netradyne.com>,
	<flaviopr@microsoft.com>,
	<jesse-ji@ti.com>,
	<darren.ye@mediatek.com>,
	<antheas.dk@gmail.com>,
	<Jerry2.Huang@lcfuturecenter.com>,
	<jim.shil@goertek.com>
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Add new quirk for Lenovo Y990
 Laptop
In-Reply-To: <20240919075743.259-1-baojun.xu@ti.com>
References: <20240919075743.259-1-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 27717338AE
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[29];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,gmail.com,perex.cz,139.com,huaqin.com,alsa-project.org,ti.com,intel.com,google.com,fpt.com,netradyne.com,microsoft.com,mediatek.com,lcfuturecenter.com,goertek.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	R_RATELIMIT(0.00)[to_ip_from(RLzobujmu8iyhcj93zycigsqsp)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: YAXY6ASX4KMDEPWZVZDNABT26B7UO3ER
X-Message-ID-Hash: YAXY6ASX4KMDEPWZVZDNABT26B7UO3ER
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YAXY6ASX4KMDEPWZVZDNABT26B7UO3ER/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 19 Sep 2024 09:57:43 +0200,
Baojun Xu wrote:
> 
> Add new vendor_id and subsystem_id in quirk for Lenovo Y990 Laptop.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>

Thanks, applied now.


Takashi
