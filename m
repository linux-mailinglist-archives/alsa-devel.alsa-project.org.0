Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD54099C691
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2024 11:58:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C542184D;
	Mon, 14 Oct 2024 11:58:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C542184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728899926;
	bh=a1C8QOiGSKMALPkwUWCazCMsmtNUhnrxP5wPLkHiByY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hF/Zhtc6KP2yFdTGktlPclby4AE9I2iluW7Oj/ENcCWGeVzfmiB7Z0SsmxwcdRA64
	 o29fhwSFvV1acgC/L4/U4OGnF1U+e0kiuJxo9IZJ5zlwMu1gV7fUBiBCo5xK3i0aIZ
	 wjUZXKFkDh8fv8ZVhIEhYyh7RI7mPE6NSdrlDbGI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85EE5F805AC; Mon, 14 Oct 2024 11:58:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8648F805AA;
	Mon, 14 Oct 2024 11:58:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7036DF80448; Mon, 14 Oct 2024 11:58:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E6B4F8016B
	for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2024 11:58:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E6B4F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=MUn0EyUZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=xZudp+Ay;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=MUn0EyUZ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=xZudp+Ay
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6238121B93;
	Mon, 14 Oct 2024 09:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1728899888;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rm/Wr/2gNPx8+ogxRf3WizmmX1y6Anj9CFEAe9gX36M=;
	b=MUn0EyUZ1eE826yyqz8kwqpyhvK9FN8+iWCnIOzHMBQJHpCrbsf8Oz7oP1fQ8nywyptTTR
	kp6hKQ3J48YvZ9hpSVvPfri7KEtpdgEPixAnzCfMdY9+lQVt6bQlNT51MyTSQEkw12/BYP
	Qwica8JGFXKJRxxQMOc8cSoRSz1Tn/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728899888;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rm/Wr/2gNPx8+ogxRf3WizmmX1y6Anj9CFEAe9gX36M=;
	b=xZudp+AyBeuL+WCvS3dXauY6RQzt1HVaj2Nl6vBcTPJvsc6ISS03Fcu8oZEl2ilWLJEDqL
	W3Ye3T7BQ1fNiJAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MUn0EyUZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xZudp+Ay
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1728899888;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rm/Wr/2gNPx8+ogxRf3WizmmX1y6Anj9CFEAe9gX36M=;
	b=MUn0EyUZ1eE826yyqz8kwqpyhvK9FN8+iWCnIOzHMBQJHpCrbsf8Oz7oP1fQ8nywyptTTR
	kp6hKQ3J48YvZ9hpSVvPfri7KEtpdgEPixAnzCfMdY9+lQVt6bQlNT51MyTSQEkw12/BYP
	Qwica8JGFXKJRxxQMOc8cSoRSz1Tn/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728899888;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rm/Wr/2gNPx8+ogxRf3WizmmX1y6Anj9CFEAe9gX36M=;
	b=xZudp+AyBeuL+WCvS3dXauY6RQzt1HVaj2Nl6vBcTPJvsc6ISS03Fcu8oZEl2ilWLJEDqL
	W3Ye3T7BQ1fNiJAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3AF8413A51;
	Mon, 14 Oct 2024 09:58:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id v2yxDDDrDGfmEQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 14 Oct 2024 09:58:08 +0000
Date: Mon, 14 Oct 2024 11:59:05 +0200
Message-ID: <87h69fj992.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Seth Poulsen <poulsenseth@yahoo.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
Subject: Re: [PATCH] Support for Line 6 TonePort KB37
In-Reply-To: <572241092.1343790.1728854650969@mail.yahoo.com>
References: <572241092.1343790.1728854650969.ref@mail.yahoo.com>
	<572241092.1343790.1728854650969@mail.yahoo.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6238121B93
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[yahoo.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[yahoo.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: 3AYB2S4VSPGTFWMEJYGA5DRVOCF37FFL
X-Message-ID-Hash: 3AYB2S4VSPGTFWMEJYGA5DRVOCF37FFL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3AYB2S4VSPGTFWMEJYGA5DRVOCF37FFL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 13 Oct 2024 23:24:10 +0200,
Seth Poulsen wrote:
> 
> The Line 6 TonePort KB37 is a device with the same ports as the TonePort UX2, but with a MIDI keyboard onboard. 
> It can use the same driver as the UX2, it just needed to be enabled.
> -Seth Poulsen

Please give a proper patch with your Signed-off-by tag.  It's a legal
requirement for upstreaming.  And since recently we expect patches
submitted to linux-sound ML instead of alsa-devel ML.

At best, please resubmit the patch to linux-sound@vger.kernel.org with
Cc to maintainers (me).

Also, better to align the subject line with a prefix (e.g.
"ALSA: line6: Support for Line 6 TonePort KB37").


thanks,

Takashi
