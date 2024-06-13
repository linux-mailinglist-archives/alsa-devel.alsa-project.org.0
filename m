Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BED8906DFC
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 14:06:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACC9CA4D;
	Thu, 13 Jun 2024 14:06:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACC9CA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718280385;
	bh=Yr6Qmiiz97m3lWUH4+OI9PteO/YpPUXHxIVYxvdkpK0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cr8La0PZ4PlFQ2C2MibE/0lSWTL4C6cAvbnWTWxKPBBDkHW2+5LdmxE6Vjxrw5Pe/
	 dd0gUTsu5+QiLCyT7SSoDAJU1dMNRJoYFfCipr5znilMmXJzCHNM6uy/fFo3lriHcy
	 hEByrmn6uydUiwlMPzUwZi0fM6WxoXiRS3FecAbw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EF93F80589; Thu, 13 Jun 2024 14:05:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C03A6F8059F;
	Thu, 13 Jun 2024 14:05:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA157F8057A; Thu, 13 Jun 2024 14:05:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F9C3F80578
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 14:05:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F9C3F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=2EHn6btN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=wWfWpadM;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=2EHn6btN;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=wWfWpadM
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8221C5D2DC;
	Thu, 13 Jun 2024 12:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718280337;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WT0XyiT40kea3fhb0qgJuObeXLOKk0sgpARLAW3vIjg=;
	b=2EHn6btNnYTS4DIi6PjdCdoXufmvJyCtKdho6BidZP6gbijup35HKBuZXW2mfcmptjFZ1L
	q2IQm4Gpzd7ZRO//WeC9kSusQfl1KILM3RlEIaFHTk03xXfRAXXvMp9TAdGaVVsrzFzXd0
	v78PxHcrLLg2i1MKdepBoboV04KPiiQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718280337;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WT0XyiT40kea3fhb0qgJuObeXLOKk0sgpARLAW3vIjg=;
	b=wWfWpadMa7xe5qLeB1hemQ1xATPlfXIoAO21Y/xO45S7BZV/nNlXwZF3d3a6tcdbkU9n99
	5oBgSo1Q3OeSzFBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718280337;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WT0XyiT40kea3fhb0qgJuObeXLOKk0sgpARLAW3vIjg=;
	b=2EHn6btNnYTS4DIi6PjdCdoXufmvJyCtKdho6BidZP6gbijup35HKBuZXW2mfcmptjFZ1L
	q2IQm4Gpzd7ZRO//WeC9kSusQfl1KILM3RlEIaFHTk03xXfRAXXvMp9TAdGaVVsrzFzXd0
	v78PxHcrLLg2i1MKdepBoboV04KPiiQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718280337;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WT0XyiT40kea3fhb0qgJuObeXLOKk0sgpARLAW3vIjg=;
	b=wWfWpadMa7xe5qLeB1hemQ1xATPlfXIoAO21Y/xO45S7BZV/nNlXwZF3d3a6tcdbkU9n99
	5oBgSo1Q3OeSzFBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3800513A87;
	Thu, 13 Jun 2024 12:05:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uXZbDJHgamb7IAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Jun 2024 12:05:37 +0000
Date: Thu, 13 Jun 2024 14:06:00 +0200
Message-ID: <87h6dxnj2v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>,
	<soyer@irl.hu>,
	<shenghao-ding@ti.com>,
	<kevin-lu@ti.com>,
	<baojun.xu@ti.com>,
	<kailang@realtek.com>
Subject: Re: [PATCH v2 0/7] ALSA: hda: Improvements to hda_component
In-Reply-To: <20240603103524.32442-1-simont@opensource.cirrus.com>
References: <20240603103524.32442-1-simont@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: 4RW4CGLFPZVVNPJD77CUMSXWO5A2HNXB
X-Message-ID-Hash: 4RW4CGLFPZVVNPJD77CUMSXWO5A2HNXB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4RW4CGLFPZVVNPJD77CUMSXWO5A2HNXB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 03 Jun 2024 12:35:17 +0200,
Simon Trimmer wrote:
> 
> This series of patches makes sure that the existing consumers of
> the infrastructure unbind their interface before they begin
> destroying the driver, moves duplicated members from the
> instanced component structures into a new parent structure and
> introduces locking so that consumers of the interface do not use
> stale data.
> 
> v2:
>  - Correct application of sizeof to pointer flagged by kernel test robot
> 
> Simon Trimmer (7):
>   ALSA: hda: cs35l56: Component should be unbound before deconstruction
>   ALSA: hda: cs35l41: Component should be unbound before deconstruction
>   ALSA: hda/tas2781: Component should be unbound before deconstruction
>   ALSA: hda: hda_component: Introduce component parent structure
>   ALSA: hda: hda_component: Change codecs to use component parent
>     structure
>   ALSA: hda: hda_component: Move codec field into the parent
>   ALSA: hda: hda_component: Protect shared data with a mutex

The first three patches look rather like independent fixes.
Could you split those out and add proper Fixes tags, so that stable
trees can pick up?

The rest are a code refactoring and additional protection of the
mutex.


thanks,

Takashi

>  sound/pci/hda/cs35l41_hda.c     | 47 ++++++++++++---------
>  sound/pci/hda/cs35l56_hda.c     | 29 +++++++------
>  sound/pci/hda/hda_component.c   | 75 ++++++++++++++++++++-------------
>  sound/pci/hda/hda_component.h   | 48 ++++++++++++++-------
>  sound/pci/hda/patch_realtek.c   | 17 ++++----
>  sound/pci/hda/tas2781_hda_i2c.c | 37 ++++++++--------
>  6 files changed, 147 insertions(+), 106 deletions(-)
> 
> -- 
> 2.34.1
> 
