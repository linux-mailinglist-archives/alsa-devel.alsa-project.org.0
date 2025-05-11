Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4EFAB7FF0
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 10:12:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DA72666ED;
	Thu, 15 May 2025 10:12:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DA72666ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747296763;
	bh=28yuyJ/c5ffm4kewLOktGsIa4JjTFd9cIqibkQ978Z4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qNdtlVmAluLkjJqvEjsQh2Cn2l7eHlt+HZ27h4p1RtBK4LNrwAoWeGUFLenu3EEyC
	 d2KeF8AUSRRmWZi6v9nGI11cAYc2jjOA82H+n1Q3hJWcACdfbNcDaBbpHvwOmNc/Qx
	 toL2Ew2eNM/BUByIlhQyRdXsXqDVT/3xaJdkPoSk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F13B3F80750; Sun, 11 May 2025 16:16:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE562F807D2;
	Sun, 11 May 2025 16:16:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A628F8074E; Sun, 11 May 2025 16:16:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2B6FF800AE
	for <alsa-devel@alsa-project.org>; Sun, 11 May 2025 16:16:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2B6FF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ZvGzEGzU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=PwRV1I/m;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=ZvGzEGzU;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=PwRV1I/m
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 604C821170;
	Sun, 11 May 2025 14:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1746973000;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E9Wop+jKaM+sxtb0rhQc1wKk0oE8+FGpe6U4S7nOkL4=;
	b=ZvGzEGzUoLw/pJrZ4PZE65DHwJxQ/6aB31XU3E+i+mWald5zdljph7L1xrR1G+EkUpayR8
	0tXk/DWy4Qbpi0eI1vxB780PuFARhNG5dqIdXEHKc8mTpdGz8sz8YK008jDcwWtXOcYq1Y
	3b222+V4lR/gu5HtyBM5KffxE2DO8v8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746973000;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E9Wop+jKaM+sxtb0rhQc1wKk0oE8+FGpe6U4S7nOkL4=;
	b=PwRV1I/mI/gaPq6OyBiOTgOhF3DsSJpArkseYILZ+vwgoI2AKdgloseOVVCCkTOXR54Vy5
	YuGQohB13xpCZVCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZvGzEGzU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="PwRV1I/m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1746973000;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E9Wop+jKaM+sxtb0rhQc1wKk0oE8+FGpe6U4S7nOkL4=;
	b=ZvGzEGzUoLw/pJrZ4PZE65DHwJxQ/6aB31XU3E+i+mWald5zdljph7L1xrR1G+EkUpayR8
	0tXk/DWy4Qbpi0eI1vxB780PuFARhNG5dqIdXEHKc8mTpdGz8sz8YK008jDcwWtXOcYq1Y
	3b222+V4lR/gu5HtyBM5KffxE2DO8v8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746973000;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E9Wop+jKaM+sxtb0rhQc1wKk0oE8+FGpe6U4S7nOkL4=;
	b=PwRV1I/mI/gaPq6OyBiOTgOhF3DsSJpArkseYILZ+vwgoI2AKdgloseOVVCCkTOXR54Vy5
	YuGQohB13xpCZVCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3DD8E13690;
	Sun, 11 May 2025 14:16:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FVvSDUixIGhjbwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 11 May 2025 14:16:40 +0000
Date: Sun, 11 May 2025 16:16:39 +0200
Message-ID: <87msbjxmew.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-2?Q?Franti=B9ek_Ku=E8era?= <konference@frantovo.cz>
Cc: alsa-devel@alsa-project.org,	=?ISO-8859-2?Q?Franti=B9ek_Ku=E8era?=
 <franta-linux@frantovo.cz>
Subject: Re: [PATCH] ALSA: usb-audio: Rename Pioneer mixer channel controls
In-Reply-To: <20250508192223.4847-1-konference@frantovo.cz>
References: <20250508192223.4847-1-konference@frantovo.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 604C821170
X-Spamd-Result: default: False [-2.65 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MIXED_CHARSET(0.86)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
Message-ID-Hash: K7MCXRLKSSSC7LVBDRRGZB4BWRLIYSG2
X-Message-ID-Hash: K7MCXRLKSSSC7LVBDRRGZB4BWRLIYSG2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K7MCXRLKSSSC7LVBDRRGZB4BWRLIYSG2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 08 May 2025 21:22:23 +0200,
Franti¹ek Kuèera wrote:
> 
> From: Franti¹ek Kuèera <franta-linux@frantovo.cz>
> 
> so alsamixer can show the controls in correct categories: capture/playback
> 
> Signed-off-by: Franti¹ek Kuèera <franta-linux@frantovo.cz>

Applied now.  Thanks.


Takashi
