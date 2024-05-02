Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1DD8B955E
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2024 09:36:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED831BC0;
	Thu,  2 May 2024 09:36:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED831BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714635376;
	bh=6GK2X1Dyf3LwTW41qhx6/gq+NhiNlqtW7+Mhdg+svsw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uH/dMsDqLyn7LcZogecWcTWuJ55X3tjryCP1WUDQAllHe/fHRAoZeILj+KC3ZmkAW
	 cLR6B+tUd+LVVElYEKn1pYVv3Z2BA9WnXBvMo24nlFlv/zAfXEGo5xGcAqhXRPNQyJ
	 I1Hr3psr9JZW0Aa74Uyg+Ha64pF/uxuUsY9eghWI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A2B9F80269; Thu,  2 May 2024 09:35:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F2B6F805A0;
	Thu,  2 May 2024 09:35:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1687CF8003A; Thu,  2 May 2024 09:34:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A50D6F8003A
	for <alsa-devel@alsa-project.org>; Thu,  2 May 2024 09:34:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A50D6F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Lef8wLqU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=sC7nwuaY;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=1nMOIelM;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Bd7sPqdS
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 78F8835099;
	Thu,  2 May 2024 07:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714635262;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rq3Mt3aYkbi1OHfrZIjoH8On8OcteoDXqBU4IUII44Q=;
	b=Lef8wLqUZ+QzTty6aZcdo4u8MaydPvVLbPnQV7LhpQMe0Zc/fAlycuiFmCrSKFMVN7tKI1
	9LNsdZqsSUDvr8czXB/4b1aNnM+kjqP1TxeVH3gWTKs6IW4I1XFK9df7r+LOoumdA1jHGk
	nGcpD2BodRWCDu4KE4VE+MZmQarqj1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714635262;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rq3Mt3aYkbi1OHfrZIjoH8On8OcteoDXqBU4IUII44Q=;
	b=sC7nwuaYsAWRc+i6kSK213F0VTBpHXK9j9c1DNJxk/e1+wcMHxQ7wQXSgLoHZjZs9uxo93
	YY6WkZdGTIRiQECw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1nMOIelM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Bd7sPqdS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714635261;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rq3Mt3aYkbi1OHfrZIjoH8On8OcteoDXqBU4IUII44Q=;
	b=1nMOIelMFnI8yPweIRs+VSIChkgZh5HEn1HcMaE+haYO36Th/DsuljqalEcOZG2viLrcyu
	6ikprl4qTc+jS5Jpjt6uks1NnSXP+Adj1yHDtO8EawvFhB5YxTwEq58MB5P/6UEm3d/swp
	s+X14YkvO5gFDxi+ZJS2ORrE5fBkM2s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714635261;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rq3Mt3aYkbi1OHfrZIjoH8On8OcteoDXqBU4IUII44Q=;
	b=Bd7sPqdSl3vSCT8v6crKpdBoEL8zahH/ZrR7w+sOKFXMNnLHm+XlVjLvl0xmZVqrt17eeZ
	6Zryg8L9evmqfMBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3E34413957;
	Thu,  2 May 2024 07:34:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WNpZDf1BM2YCUAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 02 May 2024 07:34:21 +0000
Date: Thu, 02 May 2024 09:34:34 +0200
Message-ID: <87ttjgk6ph.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH] ALSA: hda: cs35l56: Perform firmware download in the
 background
In-Reply-To: <20240501111755.21231-1-simont@opensource.cirrus.com>
References: <20240501111755.21231-1-simont@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.40 / 50.00];
	BAYES_HAM(-2.89)[99.52%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 78F8835099
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: 6IPWB7NHDHZF27CV55TFTV5WSTJQXX4H
X-Message-ID-Hash: 6IPWB7NHDHZF27CV55TFTV5WSTJQXX4H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6IPWB7NHDHZF27CV55TFTV5WSTJQXX4H/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 01 May 2024 13:17:55 +0200,
Simon Trimmer wrote:
> @@ -964,6 +1011,14 @@ int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int hid, int id)
>  	mutex_init(&cs35l56->base.irq_lock);
>  	dev_set_drvdata(cs35l56->base.dev, cs35l56);
>  
> +	cs35l56->dsp_wq = create_singlethread_workqueue("cs35l56-dsp");
> +	if (!cs35l56->dsp_wq) {
> +		ret = -ENOMEM;
> +		goto err;
> +	}

Do we really need a dedicated workqueue?  In most usages, simple
schedule_work*() works fine and is recommended.


thanks,

Takashi
