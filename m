Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAC1AE1557
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jun 2025 10:00:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE0806017A;
	Fri, 20 Jun 2025 10:00:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE0806017A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750406410;
	bh=cxZILK5ddgd6MIVc5S+ZVPxVfC0dd942p8mbpOqKR5g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ey6TBn1AiD11mH6k2mwuLFNsVB6KhYedIoNwIS3Ww9fsW9tcwnpt/elfL5mcusTNU
	 Oz+TSJVerXn4Pq+PPy6MysmYEnSa8w9ANGWPg98yZQlzhgyNBatqZwA+3pUXX4Ac8O
	 wKphUvkDXqe7RHEI88oD2A+vleytHSQbLanqljKI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 978EDF805C5; Fri, 20 Jun 2025 09:59:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EF9FF805C1;
	Fri, 20 Jun 2025 09:59:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93F1BF804B2; Fri, 20 Jun 2025 09:59:32 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BA7A0F80038
	for <alsa-devel@alsa-project.org>; Fri, 20 Jun 2025 09:59:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA7A0F80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=sSmhq2m8;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=CQtVdggq;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=sSmhq2m8;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=CQtVdggq
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 822752123F;
	Fri, 20 Jun 2025 07:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1750406369;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Snggjm3dbfsxurTU2JoZyR5NpDrE6maiDGBTdupgSiY=;
	b=sSmhq2m8jtprklvJ6q7kxy1KEwPRJSaKNj/IusSeHeDHPptmAMV6xo3SD1a2AKlQO6AikU
	PQzXLzJC/POEMx8Q5v06hZ7Insh//4KFsA9nzEekqWDQ8z/QChmk9ywv2m36uEXpeLKMvU
	7zTbexLBozMKVt8v1eLg8DXxIVRj1KA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750406369;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Snggjm3dbfsxurTU2JoZyR5NpDrE6maiDGBTdupgSiY=;
	b=CQtVdggqaOLuJKWC6tIgDstPNNp2MQox5MOoSrJ/rTcEs1UbmrV9LQWy70zsB9nwy/xNqt
	6py85jgkSvPlidBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1750406369;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Snggjm3dbfsxurTU2JoZyR5NpDrE6maiDGBTdupgSiY=;
	b=sSmhq2m8jtprklvJ6q7kxy1KEwPRJSaKNj/IusSeHeDHPptmAMV6xo3SD1a2AKlQO6AikU
	PQzXLzJC/POEMx8Q5v06hZ7Insh//4KFsA9nzEekqWDQ8z/QChmk9ywv2m36uEXpeLKMvU
	7zTbexLBozMKVt8v1eLg8DXxIVRj1KA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750406369;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Snggjm3dbfsxurTU2JoZyR5NpDrE6maiDGBTdupgSiY=;
	b=CQtVdggqaOLuJKWC6tIgDstPNNp2MQox5MOoSrJ/rTcEs1UbmrV9LQWy70zsB9nwy/xNqt
	6py85jgkSvPlidBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A2CC13736;
	Fri, 20 Jun 2025 07:59:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iWhxFOEUVWgGWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Jun 2025 07:59:29 +0000
Date: Fri, 20 Jun 2025 09:59:28 +0200
Message-ID: <87wm96x2qn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.16-rc2
In-Reply-To: <fc4f65933b6ff395ce609f920dab47fc.broonie@kernel.org>
References: <fc4f65933b6ff395ce609f920dab47fc.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: 63R4UTRPAF4Z4Z6IE4MUAURYRDYWI63L
X-Message-ID-Hash: 63R4UTRPAF4Z4Z6IE4MUAURYRDYWI63L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/63R4UTRPAF4Z4Z6IE4MUAURYRDYWI63L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 20 Jun 2025 01:37:07 +0200,
Mark Brown wrote:
> 
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.16-rc2
> 
> for you to fetch changes up to 16ea4666bbb7f5bd1130fa2d75631ccf8b62362e:
> 
>   ASoC: Intel: sof-function-topology-lib: Print out the unsupported dmic count (2025-06-19 15:44:42 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.16
> 
> A relatively large collection of fixes and updates that came in since
> the merge window.  Of note are a couple of Cirrus ones which change the
> firmware naming for some newly added devices, and a fix from Laurentiu
> for issues booting firmwares on the DSPs on i.MX8 SoCs.

Pulled now.  Thanks.


Takashi
