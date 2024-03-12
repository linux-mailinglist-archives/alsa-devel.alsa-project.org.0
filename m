Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44595879C00
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Mar 2024 20:00:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50290EDB;
	Tue, 12 Mar 2024 19:59:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50290EDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710270008;
	bh=1EqSReACOkb4X0JwerF6ekitRgvzEegA8Gsys4SPN/4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RdnkjWsuB0V+Yv+Fl8P1ITE7nWR0fzpQApK+J13gcgxyB72MND3njONV+poiypkPN
	 +Py/Clk8NONU6z0ECNGElwztaEJuY0mZvljC7LG5KgN9AFcKp/c/GJafl80B/K1AFU
	 2CRqlN00HYDbl9mZoz/UlYhPtgjTJFxZbevoVlPk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BF0AF80588; Tue, 12 Mar 2024 19:59:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7797CF805A0;
	Tue, 12 Mar 2024 19:59:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7F00F8028D; Tue, 12 Mar 2024 19:59:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73063F80088
	for <alsa-devel@alsa-project.org>; Tue, 12 Mar 2024 19:59:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73063F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=1rubmYXx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=CtqnRhPS;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=X2+3Tv8m;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=kVYppCAC
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EAC7B21BF2;
	Tue, 12 Mar 2024 18:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1710269962;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l7kf9PDLBhziNCVN23ZKmMbmG5jExsrqeSeMuIn4Ygw=;
	b=1rubmYXxi+R0fSaP28xZM0Aj66uyFh/IYQRNvy5FzS/ZL7S2BB6NxICaa363utfSUtSckP
	QoCz/GuqoKcGheQKd4R+20R+fB4a8GD5gwGAa4X26reEqhAK3IID0sL3mhpeV3OXZW3841
	9yB3503O7gOfs4tQsS7+ylluzOlg/SA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710269962;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l7kf9PDLBhziNCVN23ZKmMbmG5jExsrqeSeMuIn4Ygw=;
	b=CtqnRhPSzB/+7gg8G2z8ILJ/rXOc0+MgjzUYpckhBhrhNArW2KgAzUiVGQBXRuhNmihjcP
	7iAUdnQgT2EO6TCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1710269959;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l7kf9PDLBhziNCVN23ZKmMbmG5jExsrqeSeMuIn4Ygw=;
	b=X2+3Tv8mV9S90lh//urYA97SO0msxJ2D9T2Sgcu2XkEpDLyf6VevNCS1gLFBXa871ABe7q
	uX8PTsLnbf/A5N/OqZwSOm9rIeKeGApxti2mqDtrlLMvz1Lscd8uETVNbWx5Wp8fG9aTug
	Wp74J2UTWkysX05wTn8Ccsh/YFkZNSg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710269959;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l7kf9PDLBhziNCVN23ZKmMbmG5jExsrqeSeMuIn4Ygw=;
	b=kVYppCACeKsxxkCLE1PyJGGG2gltt7PAwRjXCUBiImJk6HCN6IOepbmsRsr5a8R/9RbSgl
	oLIEpxx1wNZfUcCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C150613795;
	Tue, 12 Mar 2024 18:59:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KaXaLQem8GV6ewAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 12 Mar 2024 18:59:19 +0000
Date: Tue, 12 Mar 2024 19:59:19 +0100
Message-ID: <87msr3p988.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Gergo Koteles <soyer@irl.hu>,
	Shenghao Ding <shenghao-ding@ti.com>
Subject: Re: [PATCH] ALSA: hda/tas2781: remove unnecessary runtime_pm calls
In-Reply-To: <20240312161217.79510-1-pierre-louis.bossart@linux.intel.com>
References: <20240312161217.79510-1-pierre-louis.bossart@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=X2+3Tv8m;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kVYppCAC
X-Spamd-Result: default: False [-5.63 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 URIBL_BLOCKED(0.00)[suse.de:dkim,intel.com:email];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DWL_DNSWL_HI(-3.50)[suse.de:dkim];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.82)[99.22%];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Queue-Id: EAC7B21BF2
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: UF37FNKBCG4YERCUCR3G3Q3KYEKNVKCM
X-Message-ID-Hash: UF37FNKBCG4YERCUCR3G3Q3KYEKNVKCM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UF37FNKBCG4YERCUCR3G3Q3KYEKNVKCM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 12 Mar 2024 17:12:17 +0100,
Pierre-Louis Bossart wrote:
> 
> The runtime_pm handling seems to have been loosely inspired by the
> cs32l41 driver, but in this case the get_noresume/put sequence is not
> required.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks, applied.


Takashi
