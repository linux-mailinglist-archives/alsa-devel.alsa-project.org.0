Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C0C84F354
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Feb 2024 11:24:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 452F3857;
	Fri,  9 Feb 2024 11:24:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 452F3857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707474297;
	bh=rhUKBC3ZoFw6TKeK6W2g9pnGOQCUeKxm4CcsWITxwJ0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TUWvONWJac/3O654ptFhHoPZZIyJkwbD+HNO+M3CkeYIavwAyK4b091CUuBa+F+Yr
	 JYMcpReTCk8ubtAdKrcVwoyxs7ibBdGBGrEOmbtInq/0CkJx5dCXPFfCI9B11m4WhY
	 qTmisKZ4/H025j6WhT8WmdMn3Ma034lUNv/9UqBc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEE7AF8057A; Fri,  9 Feb 2024 11:24:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCF60F801EB;
	Fri,  9 Feb 2024 11:24:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26D6CF801EB; Fri,  9 Feb 2024 11:24:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9CA6F801D5
	for <alsa-devel@alsa-project.org>; Fri,  9 Feb 2024 11:24:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9CA6F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=lWpwKFI1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=MJbzWaRe;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=lWpwKFI1;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=MJbzWaRe
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 170FF1F7F9;
	Fri,  9 Feb 2024 10:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707474253;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HJGoREx3oNd9iQNrnxhvNgyZufx3AbDH02QXNG6LokA=;
	b=lWpwKFI1NmwJF2JydkOvFclhtSA/7TvhJru09cQCD2YNfnso7pjk6i1kCyvf8KxcBCz0RZ
	Ws3vmjN5jo0AztshOub7VGED5xbPjzZDALFDNwzzMg3FwxmKmLYsLLpOzaoYHIo16K0TAT
	TV5xLw86KU1Dv0O/Seqtb7SKJSiECaE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707474253;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HJGoREx3oNd9iQNrnxhvNgyZufx3AbDH02QXNG6LokA=;
	b=MJbzWaReHr1RAl3UEXustT2VYWed+pvFUwXvyOkERdNysJ9dYpVBtuoij0bXzAQtSAH1Hw
	yG163bABQMFiDBAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707474253;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HJGoREx3oNd9iQNrnxhvNgyZufx3AbDH02QXNG6LokA=;
	b=lWpwKFI1NmwJF2JydkOvFclhtSA/7TvhJru09cQCD2YNfnso7pjk6i1kCyvf8KxcBCz0RZ
	Ws3vmjN5jo0AztshOub7VGED5xbPjzZDALFDNwzzMg3FwxmKmLYsLLpOzaoYHIo16K0TAT
	TV5xLw86KU1Dv0O/Seqtb7SKJSiECaE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707474253;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HJGoREx3oNd9iQNrnxhvNgyZufx3AbDH02QXNG6LokA=;
	b=MJbzWaReHr1RAl3UEXustT2VYWed+pvFUwXvyOkERdNysJ9dYpVBtuoij0bXzAQtSAH1Hw
	yG163bABQMFiDBAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D2F091326D;
	Fri,  9 Feb 2024 10:24:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id D3TdMUz9xWWIIwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 09 Feb 2024 10:24:12 +0000
Date: Fri, 09 Feb 2024 11:24:12 +0100
Message-ID: <871q9m2awj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org,	alsa-devel@alsa-project.org,
	broonie@kernel.org,	"Sayed, Karimuddin" <karimuddin.sayed@intel.com>,
	=?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add "Intel Reference board" SSID in
 the ALC256.
In-Reply-To: <20240208163904.92977-1-pierre-louis.bossart@linux.intel.com>
References: <20240208163904.92977-1-pierre-louis.bossart@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lWpwKFI1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MJbzWaRe
X-Spamd-Result: default: False [-1.72 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.41)[97.30%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 170FF1F7F9
Message-ID-Hash: XFN6QOD7HCRDFSEPRRMQWW7STG6UDX2B
X-Message-ID-Hash: XFN6QOD7HCRDFSEPRRMQWW7STG6UDX2B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XFN6QOD7HCRDFSEPRRMQWW7STG6UDX2B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 08 Feb 2024 17:39:04 +0100,
Pierre-Louis Bossart wrote:
> 
> From: "Sayed, Karimuddin" <karimuddin.sayed@intel.com>
> 
> Add "Intel Reference board" SSID in the alc256.
> Enable "power saving mode" and Enable "headset jack mode".
> 
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Signed-off-by: Sayed, Karimuddin <karimuddin.sayed@intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks, applied.


Takashi
