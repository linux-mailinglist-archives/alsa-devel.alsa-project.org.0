Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B31947661
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 09:54:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 857715CB9;
	Mon,  5 Aug 2024 09:53:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 857715CB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722844445;
	bh=YyFSOnJHA91ZqKPYgMC8/ANKjdXFjr+RU5HyUGYKBNs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hm08XxqfoFTuZvNgeFf0bNcCUWfjhUBmvbVBy0Y2JcorQQ3d0kmpBUqKXW+T1ucZP
	 Yqulb4veox5+1cT64PSu3TZ6YOoWyoPihSm/HfL8DZEZMRSYvY421Ij2SX9aBZ4vRE
	 VxbE+Y9XVmnDtIJzsKL5xAEeiih41qVxK41CO9m4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9A68F805B5; Mon,  5 Aug 2024 09:53:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91832F805AD;
	Mon,  5 Aug 2024 09:53:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C15D0F802DB; Mon,  5 Aug 2024 09:48:58 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C6F97F800BF
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 09:48:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6F97F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=jpRXDzNE;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=d0d7JvI5;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=jpRXDzNE;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=d0d7JvI5
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 73E8621B7A;
	Mon,  5 Aug 2024 07:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1722844128;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lnDcRKh7UoJoVfaHnMiOmNsuVBJYo6i3KK6M1Qku/zg=;
	b=jpRXDzNETYctYtgPfd0Z1YSa6Zo02ZEuL1gYF4Y8bw6nLaupXi94gOusiMs+06RcqzJxgo
	e1E41Jf5RGsOsfipIrwybWZVM4pOrw7j120FjDHJGf0k0bf8ZuwwHL+xfH/l3SrfKLbojg
	vr9ZJDPyleXkcnFDRZtAGxR4FbWfa74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722844128;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lnDcRKh7UoJoVfaHnMiOmNsuVBJYo6i3KK6M1Qku/zg=;
	b=d0d7JvI5MqEI8q4nQQv84OeJuEo4aF6zNvLTonNGlVUBcudX9cBSfM5Ab8WYEP/zG2doLu
	Gdr9en/6kY3fq4Bw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jpRXDzNE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=d0d7JvI5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1722844128;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lnDcRKh7UoJoVfaHnMiOmNsuVBJYo6i3KK6M1Qku/zg=;
	b=jpRXDzNETYctYtgPfd0Z1YSa6Zo02ZEuL1gYF4Y8bw6nLaupXi94gOusiMs+06RcqzJxgo
	e1E41Jf5RGsOsfipIrwybWZVM4pOrw7j120FjDHJGf0k0bf8ZuwwHL+xfH/l3SrfKLbojg
	vr9ZJDPyleXkcnFDRZtAGxR4FbWfa74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722844128;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lnDcRKh7UoJoVfaHnMiOmNsuVBJYo6i3KK6M1Qku/zg=;
	b=d0d7JvI5MqEI8q4nQQv84OeJuEo4aF6zNvLTonNGlVUBcudX9cBSfM5Ab8WYEP/zG2doLu
	Gdr9en/6kY3fq4Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3805B13254;
	Mon,  5 Aug 2024 07:48:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eZF1DOCDsGZnUAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 05 Aug 2024 07:48:48 +0000
Date: Mon, 05 Aug 2024 09:49:26 +0200
Message-ID: <878qxbl88p.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v3] ALSA: hda: cs35l56: Stop creating ALSA controls for
 firmware coefficients
In-Reply-To: <20240801143139.34549-1-simont@opensource.cirrus.com>
References: <20240801143139.34549-1-simont@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 73E8621B7A
Message-ID-Hash: 34QYVZFY53ZD5Q2BMETK6GAXNLG34WJD
X-Message-ID-Hash: 34QYVZFY53ZD5Q2BMETK6GAXNLG34WJD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/34QYVZFY53ZD5Q2BMETK6GAXNLG34WJD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 01 Aug 2024 16:31:39 +0200,
Simon Trimmer wrote:
> 
> A number of laptops have gone to market with old firmware versions that
> export controls that have since been hidden, but we can't just install a
> newer firmware because the firmware for each product is customized and
> qualified by the OEM. The issue is that alsactl save and restore has no
> idea what controls are good to persist which can lead to
> misconfiguration.
> 
> There is no reason that the UCM or user should need to interact with any
> of the ALSA controls for the firmware coefficients so they can be
> removed entirely, this also simplifies the driver.
> 
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
> ---
> Changes in v3:
> - Remove ability to add firmware coefficients as ALSA controls
>   entirely
> 
> Changes in v2:
> - v1 was accidentally the backport version for older kernels instead of
>   the one for v6.11

Applied now to for-linus branch.  Thanks.


Takashi
