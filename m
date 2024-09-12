Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9798B976E55
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Sep 2024 18:01:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82D53852;
	Thu, 12 Sep 2024 18:01:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82D53852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726156887;
	bh=gG42ozVvV6+BbGtVKFqhowCSWwptcDdxjLkJvWrSKbI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=imji5OCZ7UogvGWNfNrwdVzI9sYcKIa3yWoLcY8pY2iVYStcjOunYr8I/65mav9nB
	 eG2rOo81Z/kzZP4EQP1H/1IUO9IIrmT+qfGNdvFqxXl5V1AfbqdXPhethBkLVN5+fH
	 LBxCEl5Hpne6YZQtaAlXbODWActZKDxAVz3RMb+U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9497F805A1; Thu, 12 Sep 2024 18:00:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CAF7F805B1;
	Thu, 12 Sep 2024 18:00:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B17A7F801F5; Thu, 12 Sep 2024 18:00:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7CD1F80107
	for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2024 18:00:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7CD1F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=D0TFyp6E;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=heHxXiK1;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=D0TFyp6E;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=heHxXiK1
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8B46F21B13;
	Thu, 12 Sep 2024 16:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1726156848;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VH1CvNjzwRlNSKpwAd7M4y39jAuCuA7jnUxQokgxr7g=;
	b=D0TFyp6EW2F/UxiNht6DbbO88VmaVEUqQ+wevWeOh5Sd6sUDi/byXIesAeCOKK60H2ZCM1
	gGeIs8ikD0CdndsyUvFTBWfw1MiIqheDFUOWVHPWPHkjjn9jGxvwCO9qG/EC6kl83KCgpO
	tdWM3OpaNdRdcYy13E2aFxxjCn9U54k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726156848;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VH1CvNjzwRlNSKpwAd7M4y39jAuCuA7jnUxQokgxr7g=;
	b=heHxXiK1AYGqiawPVHwbuCawvfK42Cxuc3J9Rsa+lZKSBrbZxPVVGNUg+1uOuxsA792jb7
	aIBeZ4wllmHA03Dw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=D0TFyp6E;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=heHxXiK1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1726156848;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VH1CvNjzwRlNSKpwAd7M4y39jAuCuA7jnUxQokgxr7g=;
	b=D0TFyp6EW2F/UxiNht6DbbO88VmaVEUqQ+wevWeOh5Sd6sUDi/byXIesAeCOKK60H2ZCM1
	gGeIs8ikD0CdndsyUvFTBWfw1MiIqheDFUOWVHPWPHkjjn9jGxvwCO9qG/EC6kl83KCgpO
	tdWM3OpaNdRdcYy13E2aFxxjCn9U54k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726156848;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VH1CvNjzwRlNSKpwAd7M4y39jAuCuA7jnUxQokgxr7g=;
	b=heHxXiK1AYGqiawPVHwbuCawvfK42Cxuc3J9Rsa+lZKSBrbZxPVVGNUg+1uOuxsA792jb7
	aIBeZ4wllmHA03Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3FF9B13A73;
	Thu, 12 Sep 2024 16:00:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UyWxDTAQ42Y0IgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 12 Sep 2024 16:00:48 +0000
Date: Thu, 12 Sep 2024 18:01:37 +0200
Message-ID: <877cbgg8ta.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Joshua Pius <joshuapius@chromium.org>
Cc: alsa-devel@alsa-project.org,
	Joshua Pius <joshuapius@google.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Karol Kosik <k.kosik@outlook.com>,
	"Steven 'Steve' Kendall" <skend@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add logitech Audio profile quirk
In-Reply-To: <20240912152635.1859737-1-joshuapius@google.com>
References: <20240912152635.1859737-1-joshuapius@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 8B46F21B13
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[outlook.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[alsa-project.org,google.com,perex.cz,suse.com,outlook.com,chromium.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: QC5WWYL3CQQRYHANMKFDYF6GTHAYQXXP
X-Message-ID-Hash: QC5WWYL3CQQRYHANMKFDYF6GTHAYQXXP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QC5WWYL3CQQRYHANMKFDYF6GTHAYQXXP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 12 Sep 2024 17:26:28 +0200,
Joshua Pius wrote:
> 
> Specify shortnames for the following Logitech Devices: Rally bar, Rally
> bar mini, Tap, MeetUp and Huddle.
> 
> Signed-off-by: Joshua Pius <joshuapius@chromium.org>

Thanks, applied.


Takashi
