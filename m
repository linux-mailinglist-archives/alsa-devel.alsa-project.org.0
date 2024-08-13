Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C7894FE29
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 08:59:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF94A22A6;
	Tue, 13 Aug 2024 08:59:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF94A22A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723532381;
	bh=ERnCb7GNxRzZmUj1NsQxVVH1zhVfW4u5qmEkAr0fYZg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ow6RipLhVXRdVKtmxuHan/LayD1qtmaMSVwqtIYgb17INk6oXknokfIJSwcoar54j
	 FnRZolc8zEDWy7Dy+MrTyFRByS9Oydyd61yXJBKDx2qVdLTY5UH12RLAoFtiNN3XL7
	 Ttk9Aw8r9LehSD6ZGb6qEz4TnrH/BNqf+nFs0IDc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AC4AF805AC; Tue, 13 Aug 2024 08:59:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E86AF805AE;
	Tue, 13 Aug 2024 08:59:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86361F8047C; Tue, 13 Aug 2024 08:59:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D459F8016E
	for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2024 08:58:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D459F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=G1fiGImM;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=vhslKYMn;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=G1fiGImM;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=vhslKYMn
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C8C3622725;
	Tue, 13 Aug 2024 06:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1723532331;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rYv3HXyrUd9oqACj2L8eRTsJyUQpj3b67JE2bftMn28=;
	b=G1fiGImM9scQXcwgIoi1bPsCRVwMqIVqnpo1pMAnELagGHvcjR7TRt0Xw79pCPQOW9y+n0
	P9f7JqKUVLo7gJr+etHqCCZVXTr8m3nIFgxAXBh+Xu1MX4fIv48j/wK+/QwJwRNcWSrb5Q
	qRci2IFugbkFcDn0dyY3sWmYVUdofEo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723532331;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rYv3HXyrUd9oqACj2L8eRTsJyUQpj3b67JE2bftMn28=;
	b=vhslKYMnWH/XoTFRVabBsX/dDSZ5L4xZsGXLafNfzJ/GvAdCUxZPn3o7mmBNWxmDFOWD9d
	4+tnFC7MiNyY1YBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=G1fiGImM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vhslKYMn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1723532331;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rYv3HXyrUd9oqACj2L8eRTsJyUQpj3b67JE2bftMn28=;
	b=G1fiGImM9scQXcwgIoi1bPsCRVwMqIVqnpo1pMAnELagGHvcjR7TRt0Xw79pCPQOW9y+n0
	P9f7JqKUVLo7gJr+etHqCCZVXTr8m3nIFgxAXBh+Xu1MX4fIv48j/wK+/QwJwRNcWSrb5Q
	qRci2IFugbkFcDn0dyY3sWmYVUdofEo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723532331;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rYv3HXyrUd9oqACj2L8eRTsJyUQpj3b67JE2bftMn28=;
	b=vhslKYMnWH/XoTFRVabBsX/dDSZ5L4xZsGXLafNfzJ/GvAdCUxZPn3o7mmBNWxmDFOWD9d
	4+tnFC7MiNyY1YBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 60F7313983;
	Tue, 13 Aug 2024 06:58:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3KjtFCsEu2YaGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Aug 2024 06:58:51 +0000
Date: Tue, 13 Aug 2024 08:59:31 +0200
Message-ID: <87bk1wdi24.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<lgirdwood@gmail.com>,
	<perex@perex.cz>,
	<pierre-louis.bossart@linux.intel.com>,
	<13564923607@139.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<liam.r.girdwood@intel.com>,
	<cameron.berkenpas@gmail.com>,
	<baojun.xu@ti.com>,
	<soyer@irl.hu>,
	<Baojun.Xu@fpt.com>,
	<robinchen@ti.com>
Subject: Re: [PATCH v2] ALSA: ASoC/tas2781: fix wrong calibrated data order
In-Reply-To: <20240813043749.108-1-shenghao-ding@ti.com>
References: <20240813043749.108-1-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: C8C3622725
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,gmail.com,perex.cz,139.com,alsa-project.org,vger.kernel.org,intel.com,ti.com,irl.hu,fpt.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
Message-ID-Hash: CIH2SREGGIPUJJ7EEX2MXFH2ZXM54B7H
X-Message-ID-Hash: CIH2SREGGIPUJJ7EEX2MXFH2ZXM54B7H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CIH2SREGGIPUJJ7EEX2MXFH2ZXM54B7H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Aug 2024 06:37:48 +0200,
Shenghao Ding wrote:
> 
> From: Baojun Xu <baojun.xu@ti.com>
> 
> Wrong calibration data order cause sound too low in some device.
> Fix wrong calibrated data order, add calibration data converssion
> by get_unaligned_be32() after reading from UEFI.
> 
> Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>

Applied to for-linus branch now.
I corrected the subject prefix, as this is clearly no ASoC change.


thanks,

Takashi
