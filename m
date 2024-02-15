Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73589856548
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Feb 2024 15:05:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDE07850;
	Thu, 15 Feb 2024 15:05:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDE07850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708005917;
	bh=Gb62lNzlGcxhWMN7PmcpYeoQAZ3RHJ/oXhjwb9Ixst8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KoY8t44k51xGoZcFlYSmvqNg3USx/VT1EpOrgjK0TfITJ4pBTFjaQWx9O8KQgXRSp
	 7HLJdo1oH+TpL8g1K6RNc+15B5HIxjFvJT4UiyNbXtEjvidImvVBpApgnmCDKYm8zd
	 aAf4KPB+0hsMdUqZ+4uWhchL52HoPV8CkKg6HOdQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9269FF80588; Thu, 15 Feb 2024 15:04:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6758DF80238;
	Thu, 15 Feb 2024 15:04:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6E12F8016E; Thu, 15 Feb 2024 15:04:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 286F3F800BF
	for <alsa-devel@alsa-project.org>; Thu, 15 Feb 2024 15:04:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 286F3F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=m479UUfc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jBs+kPo5;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=m479UUfc;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jBs+kPo5
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 120B11F8A4;
	Thu, 15 Feb 2024 14:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708005855;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fG330bgjiBuVg4DSJNYD8wYobfKgiVnxtiq5Q0hdTz8=;
	b=m479UUfcH9cKrpVZ+d6o8FJsvmgpXop1srguhkqTdXtFupp+y/VU6Jta6jY4gRYOuUYcvn
	UmqvmiH+2eyeQzjt1UM6MtFTLsUp0Ml+hHbaRt5qlA8Q1CMSDoZIL6qW7ThgvrMxvmR9tL
	7IOF2puIdXeyD0igGq7xRusVQAtf/MA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708005855;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fG330bgjiBuVg4DSJNYD8wYobfKgiVnxtiq5Q0hdTz8=;
	b=jBs+kPo5udVDpfBTOOd6wH7dP5hYMHafTRkMY59z7XXvFeFAEDMY+4vCTtKtSSQtVIdMCu
	GsS35sgqUQG8yoBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708005855;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fG330bgjiBuVg4DSJNYD8wYobfKgiVnxtiq5Q0hdTz8=;
	b=m479UUfcH9cKrpVZ+d6o8FJsvmgpXop1srguhkqTdXtFupp+y/VU6Jta6jY4gRYOuUYcvn
	UmqvmiH+2eyeQzjt1UM6MtFTLsUp0Ml+hHbaRt5qlA8Q1CMSDoZIL6qW7ThgvrMxvmR9tL
	7IOF2puIdXeyD0igGq7xRusVQAtf/MA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708005855;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fG330bgjiBuVg4DSJNYD8wYobfKgiVnxtiq5Q0hdTz8=;
	b=jBs+kPo5udVDpfBTOOd6wH7dP5hYMHafTRkMY59z7XXvFeFAEDMY+4vCTtKtSSQtVIdMCu
	GsS35sgqUQG8yoBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DE2E413A82;
	Thu, 15 Feb 2024 14:04:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id h760NN4ZzmUWYAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 15 Feb 2024 14:04:14 +0000
Date: Thu, 15 Feb 2024 15:04:14 +0100
Message-ID: <87o7chesdd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.8-rc4
In-Reply-To: <20240215133838.766F5C433C7@smtp.kernel.org>
References: <20240215133838.766F5C433C7@smtp.kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Bar: /
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=m479UUfc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jBs+kPo5
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.65 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.14)[68.06%]
X-Rspamd-Queue-Id: 120B11F8A4
Message-ID-Hash: K4BTMEH3WNBSXMVHEXRTWJKEZM3H544R
X-Message-ID-Hash: K4BTMEH3WNBSXMVHEXRTWJKEZM3H544R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K4BTMEH3WNBSXMVHEXRTWJKEZM3H544R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 15 Feb 2024 14:38:29 +0100,
Mark Brown wrote:
> 
> The following changes since commit e81fdba0208666b65bafeaba814874b4d6e5edde:
> 
>   ALSA: Various fixes for Cirrus Logic CS35L56 support (2024-02-01 17:45:32 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.8-rc4
> 
> for you to fetch changes up to 0db0c1770834f39e11a2902e20e1f11a482f4465:
> 
>   ASoC: cs35l56: Workaround for ACPI with broken spk-id-gpios property (2024-02-13 19:37:25 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.8
> 
> A relatively large set of fixes and quirk additions here but they're all
> driver specific, people seem to be back into the swing of things after
> the holidays.  This is all driver specific and much of it fairly minor.

Thanks, merged now.


Takashi
