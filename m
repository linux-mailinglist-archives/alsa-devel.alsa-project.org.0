Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A518BFD3B
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 14:35:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CB4EDEE;
	Wed,  8 May 2024 14:34:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CB4EDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715171705;
	bh=yYslb0OUmSwvxLA6zHbTZpvzOahjKxA4E3PzATeflR8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H5lcj277b3+NOPI7jB2PE7Dsr//n7U2H7sQbHyYhobDctza92Ku7vzJAJkZTshYZR
	 NIOKaCH+OPXh2gG1xgtd2/JjjGaw+9kCV8O4QMecEExYAd8meIO5QnWljIoNmXXgT2
	 wYsjwTSgH6GMJqabCbKnxRpKtM11FD52SfkptAzo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A90CF805EA; Wed,  8 May 2024 14:34:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CCBE0F805F5;
	Wed,  8 May 2024 14:34:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59EBFF805DA; Wed,  8 May 2024 14:34:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73E27F805D7
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 14:34:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73E27F805D7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=rH3cCnAv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=I6+XFoN1;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=rH3cCnAv;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=I6+XFoN1
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 78B3C5C9BD;
	Wed,  8 May 2024 12:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1715171643;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TqlxnX8S/G0wOUmeXETdKPJLjbdsBZmj/P2uIy6RbuQ=;
	b=rH3cCnAvOurWLBC9fK4xwW3YeG2TvJcshPbiBoDDW+2xM6+K8fAha+WcEq56X1NW8FTVfy
	/0MDS+kplPZpWk4KExGerT6G62xEgNcNukoOjqx6ADRIcCeJxASqjaDdhYJ2u/azYXaP2G
	nSnU0Avt5bMVnxqisEBbAEcAcCOGOLY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715171643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TqlxnX8S/G0wOUmeXETdKPJLjbdsBZmj/P2uIy6RbuQ=;
	b=I6+XFoN1josjzaLN35NdNh34BJPm4OMmjdktprYpl+CghV4ZdrWyE5FRr03wZKp9QLxlOi
	TR4ophO8Vq7fx5CQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rH3cCnAv;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=I6+XFoN1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1715171643;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TqlxnX8S/G0wOUmeXETdKPJLjbdsBZmj/P2uIy6RbuQ=;
	b=rH3cCnAvOurWLBC9fK4xwW3YeG2TvJcshPbiBoDDW+2xM6+K8fAha+WcEq56X1NW8FTVfy
	/0MDS+kplPZpWk4KExGerT6G62xEgNcNukoOjqx6ADRIcCeJxASqjaDdhYJ2u/azYXaP2G
	nSnU0Avt5bMVnxqisEBbAEcAcCOGOLY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715171643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TqlxnX8S/G0wOUmeXETdKPJLjbdsBZmj/P2uIy6RbuQ=;
	b=I6+XFoN1josjzaLN35NdNh34BJPm4OMmjdktprYpl+CghV4ZdrWyE5FRr03wZKp9QLxlOi
	TR4ophO8Vq7fx5CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4DBB21386E;
	Wed,  8 May 2024 12:34:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IfvVETtxO2ZAXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 May 2024 12:34:03 +0000
Date: Wed, 08 May 2024 14:34:18 +0200
Message-ID: <8734qscwj9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: <tiwai@suse.com>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>,
	<alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH] ALSA: hda: cs35l56: Fix lifetime of cs_dsp instance
In-Reply-To: <20240508100811.49514-1-rf@opensource.cirrus.com>
References: <20240508100811.49514-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 78B3C5C9BD
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.05 / 50.00];
	BAYES_HAM(-2.54)[97.93%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,cirrus.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
Message-ID-Hash: SDKNC2FJJEJRQDYLHKCFFRUOL6TAVKQ2
X-Message-ID-Hash: SDKNC2FJJEJRQDYLHKCFFRUOL6TAVKQ2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SDKNC2FJJEJRQDYLHKCFFRUOL6TAVKQ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 08 May 2024 12:08:11 +0200,
Richard Fitzgerald wrote:
> 
> The cs_dsp instance is initialized in the driver probe() so it
> should be freed in the driver remove(). Also fix a missing call
> to cs_dsp_remove() in the error path of cs35l56_hda_common_probe().
> 
> The call to cs_dsp_remove() was being done in the component unbind
> callback cs35l56_hda_unbind(). This meant that if the driver was
> unbound and then re-bound it would be using an uninitialized cs_dsp
> instance.
> 
> It is best to initialize the cs_dsp instance in probe() so that it
> can return an error if it fails. The component binding API doesn't
> have any error handling so there's no way to handle a failure if
> cs_dsp was initialized in the bind.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Fixes: 73cfbfa9caea ("ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier")

Applied now.  Thanks.


Takashi
