Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FE08BC84B
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2024 09:26:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AC97206;
	Mon,  6 May 2024 09:26:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AC97206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714980375;
	bh=BeoP6cPveagaoustsA84EikaXCQoAYiEM8sJNR0xdNs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fVuSgBYUm0FXfXU4xNK4ppTtENybfH6nmayLLvUi2ZTG+QATsqdGFyUxFvgLvD+iq
	 tYaAr+DPPz12BU2GxwoD7VRXu/fEdAsLxqb+xsYTVq2TjZ4eTaOM/73+frJMtTnOCs
	 jOFrYaGy3QF1vuv3wqNj+CSaQGKTls0F/dU36k6g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69D48F804F2; Mon,  6 May 2024 09:25:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C6F6F805A1;
	Mon,  6 May 2024 09:25:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E3C2F8049C; Mon,  6 May 2024 09:25:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 435ECF800E2
	for <alsa-devel@alsa-project.org>; Mon,  6 May 2024 09:25:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 435ECF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=AxGjnWa1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=6om13bzZ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=I3yBv45p;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=vjpmLrWU
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E3E285F925;
	Mon,  6 May 2024 07:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714980319;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qI+7ThWbmt+MbXPaz6EPEZiaVpPoOIN5FnohX1xjFUo=;
	b=AxGjnWa1pgXf7OzllUuioIil7jQ/kYY6NG4xhbS6GZq0JWOQOX5F/qVEQImhBSx42KGGyF
	bUzxk+8DEmLfx3Of2V6wQmcFwEI4OGjl0THkJ0TZI2gmO4P6CLSD18VkMSXQZAWJM7scmM
	YsCGl2SHPQs4i0rPlUGJxivKuYsizMc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714980319;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qI+7ThWbmt+MbXPaz6EPEZiaVpPoOIN5FnohX1xjFUo=;
	b=6om13bzZA1o4j+uEw408ddPsk662Mgy5ULe8XF/5g600Lm9ZdL1y7k/WxuqTd7KY7h3wuA
	u9HQZo4Tb2i+whAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=I3yBv45p;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vjpmLrWU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714980318;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qI+7ThWbmt+MbXPaz6EPEZiaVpPoOIN5FnohX1xjFUo=;
	b=I3yBv45pxJ6fOu7J5/PQQE7bu9cszltps4pK0NWy74QeFG3D5IPl1zIFctQIFQDc8rSxN0
	bxZ1ZcYGQclvhWbuejnCSuCVM2ytMIqnPkx0RpguBtsNgu5ycWVlCLpT9S0L3DN6xtrCtj
	1fZwMDGt3e+39U6wJcuvPARxgS7p5Cc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714980318;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qI+7ThWbmt+MbXPaz6EPEZiaVpPoOIN5FnohX1xjFUo=;
	b=vjpmLrWUKgGismFfpDLwURdHJ4bPYhQohchpCAugHRzFenM/wwzWwmCTbn21dU1EiABdnd
	9Ju9Vi85Oo7zRcAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B58E413A25;
	Mon,  6 May 2024 07:25:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gS++Kt6FOGYwWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 06 May 2024 07:25:18 +0000
Date: Mon, 06 May 2024 09:25:33 +0200
Message-ID: <874jbbieqa.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	uma.shankar@intel.com
Subject: Re: [PATCH] ALSA: hda: Add Intel BMG PCI ID and HDMI codec vid
In-Reply-To: <20240506052531.1150062-1-chaitanya.kumar.borah@intel.com>
References: <20240506052531.1150062-1-chaitanya.kumar.borah@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.48 / 50.00];
	BAYES_HAM(-2.97)[99.86%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,intel.com:email,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: E3E285F925
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: RJAJMGEBT7YXKMMKTH7SS7KQRJNPKSXA
X-Message-ID-Hash: RJAJMGEBT7YXKMMKTH7SS7KQRJNPKSXA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RJAJMGEBT7YXKMMKTH7SS7KQRJNPKSXA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 06 May 2024 07:25:31 +0200,
Chaitanya Kumar Borah wrote:
> 
> Add HD Audio PCI ID and HDMI codec vendor ID for Intel Battlemage.
> 
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Applied now.  Thanks.


Takashi
