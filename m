Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE93282EB59
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jan 2024 10:16:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DB6420E;
	Tue, 16 Jan 2024 10:16:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DB6420E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705396610;
	bh=wG97pgc+4MrJiqCyvdw1J4L/zhJsCjX/Ig4TCLl+1Mo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NNISVxHawOYTcsuTK4XalDPtEETWnvPf0DyDJp281v/+O8RAmNB040Lr3hV/bjfwL
	 1vTre3LbtaBp10WRNt4W22Apq0Dmph1cJUXFFGmPs5xtiMU78Sf1Jb1Yi7kVhUNJKZ
	 Q2DJH65wOi/CFHnZuDFBykkuiiy//ivg+F2ab52c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2269CF80563; Tue, 16 Jan 2024 10:16:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CCD53F8057D;
	Tue, 16 Jan 2024 10:16:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 076B9F801F5; Tue, 16 Jan 2024 10:15:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD55FF800F5
	for <alsa-devel@alsa-project.org>; Tue, 16 Jan 2024 10:15:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD55FF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=1yblC7tX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ogVjHOhL;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=1yblC7tX;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ogVjHOhL
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 76C7F220EE;
	Tue, 16 Jan 2024 09:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1705396500;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/q28bq2IPwljKWkNpRnhO3yGpDnEFg1mwIdnMakniJ4=;
	b=1yblC7tXeVIvm71Uh2szz++K+EO3vId6IfrXldwvR68+ZXmDcgQpKCOzOugviJZs5sTKSo
	/9CKDAgYPgXD9ZQAN23RJEoa6evIAHE5nSGvBLPX2kDcQi3YHfXEW73rdFzggpxjvt+LDG
	MbCCCka51y0K8eewYXeaDbhsARp0b14=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1705396500;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/q28bq2IPwljKWkNpRnhO3yGpDnEFg1mwIdnMakniJ4=;
	b=ogVjHOhLIzeEURRkhN4euSLbIDrSSQwG1UEqFHPI9sVJTFP6RrF/fQ9O/mhrhEd9wPpN/e
	wqe65bEZSvHHfWCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1705396500;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/q28bq2IPwljKWkNpRnhO3yGpDnEFg1mwIdnMakniJ4=;
	b=1yblC7tXeVIvm71Uh2szz++K+EO3vId6IfrXldwvR68+ZXmDcgQpKCOzOugviJZs5sTKSo
	/9CKDAgYPgXD9ZQAN23RJEoa6evIAHE5nSGvBLPX2kDcQi3YHfXEW73rdFzggpxjvt+LDG
	MbCCCka51y0K8eewYXeaDbhsARp0b14=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1705396500;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/q28bq2IPwljKWkNpRnhO3yGpDnEFg1mwIdnMakniJ4=;
	b=ogVjHOhLIzeEURRkhN4euSLbIDrSSQwG1UEqFHPI9sVJTFP6RrF/fQ9O/mhrhEd9wPpN/e
	wqe65bEZSvHHfWCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1D49D132FA;
	Tue, 16 Jan 2024 09:15:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4x2qBRRJpmXDDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 16 Jan 2024 09:15:00 +0000
Date: Tue, 16 Jan 2024 10:14:59 +0100
Message-ID: <874jfdwsfg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kenzo Gomez <kenzo.sgomez@gmail.com>
Cc: sbinding@opensource.cirrus.com,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda: cs35l41: Support additional ASUS Zenbook
 UX3402VA
In-Reply-To: <20240112182113.70650-1-kenzo.sgomez@gmail.com>
References: <20240112163239.59743-1-kenzo.sgomez@gmail.com>
	<20240112182113.70650-1-kenzo.sgomez@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1yblC7tX;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ogVjHOhL
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.01 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[11];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Rspamd-Queue-Id: 76C7F220EE
Message-ID-Hash: RVS7XFNLHUKDBI6TLGC7ZRWXSLL5GEHR
X-Message-ID-Hash: RVS7XFNLHUKDBI6TLGC7ZRWXSLL5GEHR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RVS7XFNLHUKDBI6TLGC7ZRWXSLL5GEHR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 12 Jan 2024 19:20:34 +0100,
Kenzo Gomez wrote:
> 
> Add new model entry into configuration table.
> 
> Signed-off-by: Kenzo Gomez <kenzo.sgomez@gmail.com>

This isn't applied cleanly to the latest code, as there were code
changes to drop some fields.

Please rebase on top of for-linus branch of sound.git tree (or the
latest Linus tree) and resubmit.


thanks,

Takashi

> ---
>  sound/pci/hda/cs35l41_hda_property.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
> index c1afb721b4c6..9ec5773e580e 100644
> --- a/sound/pci/hda/cs35l41_hda_property.c
> +++ b/sound/pci/hda/cs35l41_hda_property.c
> @@ -54,6 +54,7 @@ static const struct cs35l41_config cs35l41_config_table[] = {
>  	{ "10431533", I2C, 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
>  	{ "10431573", SPI, 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
>  	{ "10431663", SPI, 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, -1, 0, 1000, 4500, 24 },
> +	{ "104316A3", SPI, 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 0, 0, 0 },
>  	{ "104316D3", SPI, 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 0, 0, 0 },
>  	{ "104316F3", SPI, 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 0, 0, 0 },
>  	{ "104317F3", I2C, 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
> @@ -358,6 +359,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
>  	{ "CSC3551", "10431533", generic_dsd_config },
>  	{ "CSC3551", "10431573", generic_dsd_config },
>  	{ "CSC3551", "10431663", generic_dsd_config },
> +	{ "CSC3551", "104316A3", generic_dsd_config },
>  	{ "CSC3551", "104316D3", generic_dsd_config },
>  	{ "CSC3551", "104316F3", generic_dsd_config },
>  	{ "CSC3551", "104317F3", generic_dsd_config },
> -- 
> 2.43.0
> 
