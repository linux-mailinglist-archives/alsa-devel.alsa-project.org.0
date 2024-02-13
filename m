Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFD18530AD
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 13:41:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A77C7BC0;
	Tue, 13 Feb 2024 13:40:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A77C7BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707828062;
	bh=nsQaodfl9NJX9KJz9ZaP8kZ32Jiqkz3pOs9LjaG1zic=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QFoB3z4Jpj/BO+Hjhblu08CG9Q8ZRQmqPTU0qhYCOmgm9Ick4Vattpmj+Ir+YU2Vr
	 vaFFlIUaYjBLJzWjF7chog3wcWSs8atC1YFS/i9kpiTjEKSYCEgD9bRxv89hSTjjV0
	 T6Rt/UqRUCBIa1XOBZDJCAWEK3HISUqEXwMNmJ5w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 642ABF805A9; Tue, 13 Feb 2024 13:40:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 468AEF8058C;
	Tue, 13 Feb 2024 13:40:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3D28F8016E; Tue, 13 Feb 2024 13:40:25 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E5E0AF800BF
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 13:40:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5E0AF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=SZ6UQP7G;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=RPeGOW7c;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=SZ6UQP7G;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=RPeGOW7c
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2125A21B27;
	Tue, 13 Feb 2024 12:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707828017;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B0EbfyZcM04yRKW1xDvxiAp8kbWKb8cV4YUngr0YREg=;
	b=SZ6UQP7GpocFP6VMllvIikAFdA8uo6KIg5f04SHTEFNbVedmnQx4Rwis/SzgoijLdiBtJ1
	aIhge8NxNbe1nH7r5IwURQXsE/xvJNKIgzGT1N3LwgoqQbIjS3ZY53WPd94EFrs1/6YlDA
	g+P5MNN1vHgBHHTo/9BTpgM01hhOowM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707828017;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B0EbfyZcM04yRKW1xDvxiAp8kbWKb8cV4YUngr0YREg=;
	b=RPeGOW7c1E8i7WgZyS3A+AOH0GWCZHTLt0UvU2dmMI89L1KzW9hXxUJAgv1dx4jT3MFLvc
	xL0drZvFPA671wAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707828017;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B0EbfyZcM04yRKW1xDvxiAp8kbWKb8cV4YUngr0YREg=;
	b=SZ6UQP7GpocFP6VMllvIikAFdA8uo6KIg5f04SHTEFNbVedmnQx4Rwis/SzgoijLdiBtJ1
	aIhge8NxNbe1nH7r5IwURQXsE/xvJNKIgzGT1N3LwgoqQbIjS3ZY53WPd94EFrs1/6YlDA
	g+P5MNN1vHgBHHTo/9BTpgM01hhOowM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707828017;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B0EbfyZcM04yRKW1xDvxiAp8kbWKb8cV4YUngr0YREg=;
	b=RPeGOW7c1E8i7WgZyS3A+AOH0GWCZHTLt0UvU2dmMI89L1KzW9hXxUJAgv1dx4jT3MFLvc
	xL0drZvFPA671wAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DF69F13404;
	Tue, 13 Feb 2024 12:40:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sO8GNjBjy2W6DAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Feb 2024 12:40:16 +0000
Date: Tue, 13 Feb 2024 13:40:16 +0100
Message-ID: <87jzn8y1u7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Tomasz Kudela <ramzes005@gmail.com>
Cc: sbinding@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	andy.chi@canonical.com,
	david.rhodes@cirrus.com,
	james.schulman@cirrus.com,
	kailang@realtek.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	luke@ljones.dev,
	patches@opensource.cirrus.com,
	perex@perex.cz,
	rf@opensource.cirrus.com,
	ruinairas1992@gmail.com,
	shenghao-ding@ti.com,
	tiwai@suse.com,
	vitalyr@opensource.cirrus.com
Subject: Re: [PATCH v3] Add Lenovo Legion 7i gen7 sound quirk
In-Reply-To: <20240213115614.10420-1-ramzes005@gmail.com>
References: <000101da5e63$6a2565e0$3e7031a0$@opensource.cirrus.com>
	<20240213115614.10420-1-ramzes005@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-1.79 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[17];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[opensource.cirrus.com,alsa-project.org,canonical.com,cirrus.com,realtek.com,vger.kernel.org,ljones.dev,perex.cz,gmail.com,ti.com,suse.com];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.69)[98.66%]
Message-ID-Hash: XT5ZWRR2FWFXKQS4YYLFB7P7MIF4WX3H
X-Message-ID-Hash: XT5ZWRR2FWFXKQS4YYLFB7P7MIF4WX3H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XT5ZWRR2FWFXKQS4YYLFB7P7MIF4WX3H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Feb 2024 12:56:14 +0100,
Tomasz Kudela wrote:
> 
> From: "Tomasz Kudela" <ramzes005@gmail.com>
> 
> Add sound support for the Legion 7i gen7 laptop (16IAX7).
> 
> Signed-off-by: Tomasz Kudela <ramzes005@gmail.com>

You tested with this new patch and confirmed it's still working,
right?  Just to be sure.
 

Takashi
