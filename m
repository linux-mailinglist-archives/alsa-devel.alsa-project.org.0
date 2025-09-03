Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD924B41655
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Sep 2025 09:22:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E23D60200;
	Wed,  3 Sep 2025 09:22:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E23D60200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756884132;
	bh=XCJju57bq6ayw2SMfc0th7t/lqfRHBQUgw2HTfEIB8Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vBI/9enEa+TGnOBAuNywDhn7buSypAHR5D7+Cb1+8KQF+FcX0g1ILsU8LEAWefFLx
	 blr1P4zDJ60NTbKx7qlXDtghXyi8TTxlwN1w71GJx7wFqhi2I0Py1L/vj879WXj/Pa
	 gMFJHC/yM7z2q1nyLzugt2gaN187hv/k+2jCq6ug=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D86C4F805BF; Wed,  3 Sep 2025 09:21:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A2ADF805CA;
	Wed,  3 Sep 2025 09:21:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03749F804D6; Wed,  3 Sep 2025 09:21:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5C60F8013D
	for <alsa-devel@alsa-project.org>; Wed,  3 Sep 2025 09:21:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5C60F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=E8fWR7Wc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=lsMUQ4zU;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=E8fWR7Wc;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=lsMUQ4zU
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C76FC21293;
	Wed,  3 Sep 2025 07:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1756884078;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QFBc6RWh8ZSGiW9y51f3aVlmvJZi/JtU2Up3L8KsEe4=;
	b=E8fWR7WcOowR+xEjSfF3rWjyV27IgfjBAmDlloPDhS+uE+GuOl0XGPDbPzM2zzLgX7OR0d
	UVtC5kMyyphu0WzTwSKu0yrNzJOo9kYK71TJKSWjtJoFqDjg1HrCyxOf5Z3Uy+lImArck+
	lVlxDZhX4fudPxx5r4mgXuqEt1fW8Pg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756884078;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QFBc6RWh8ZSGiW9y51f3aVlmvJZi/JtU2Up3L8KsEe4=;
	b=lsMUQ4zUFGEIUwfgxfyVLgbox+FgoinwYG4YadgXwFrYGtqQ0n8bjtv2Y2gEt90/avqR2c
	XjrJQr0j0zHQSkDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1756884078;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QFBc6RWh8ZSGiW9y51f3aVlmvJZi/JtU2Up3L8KsEe4=;
	b=E8fWR7WcOowR+xEjSfF3rWjyV27IgfjBAmDlloPDhS+uE+GuOl0XGPDbPzM2zzLgX7OR0d
	UVtC5kMyyphu0WzTwSKu0yrNzJOo9kYK71TJKSWjtJoFqDjg1HrCyxOf5Z3Uy+lImArck+
	lVlxDZhX4fudPxx5r4mgXuqEt1fW8Pg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756884078;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QFBc6RWh8ZSGiW9y51f3aVlmvJZi/JtU2Up3L8KsEe4=;
	b=lsMUQ4zUFGEIUwfgxfyVLgbox+FgoinwYG4YadgXwFrYGtqQ0n8bjtv2Y2gEt90/avqR2c
	XjrJQr0j0zHQSkDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8129413888;
	Wed,  3 Sep 2025 07:21:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LhfzHW7st2hePQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 03 Sep 2025 07:21:18 +0000
Date: Wed, 03 Sep 2025 09:21:18 +0200
Message-ID: <87cy88vw5t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<13564923607@139.com>,
	<13916275206@139.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<baojun.xu@ti.com>,
	<Baojun.Xu@fpt.com>
Subject: Re: [PATCH v2] ALSA: hda/tas2781: Fix the order of TAS2781
 calibrated-data
In-Reply-To: <20250903041351.143-1-shenghao-ding@ti.com>
References: <20250903041351.143-1-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,139.com,alsa-project.org,vger.kernel.org,ti.com,fpt.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,ti.com:email]
Message-ID-Hash: 2U6AUEQRN5ZIGB6YTSJEBA4PIRC77DPR
X-Message-ID-Hash: 2U6AUEQRN5ZIGB6YTSJEBA4PIRC77DPR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2U6AUEQRN5ZIGB6YTSJEBA4PIRC77DPR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 03 Sep 2025 06:13:51 +0200,
Shenghao Ding wrote:
> 
> A bug reported by one of my customers that the order of TAS2781
> calibrated-data is incorrect, the correct way is to move R0_Low
> and insert it between R0 and InvR0.
> 
> Fixes: 4fe238513407 ("ALSA: hda/tas2781: Move and unified the calibrated-data getting function for SPI and I2C into the tas2781_hda lib")
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
> 
> ---
> v2:
>  - Submit to sound branch maintianed by Tiwai instead of linux-next branch
>  - drop other fix

You haven't answered to my previous question at all.

Is the issue you're trying to fix something different from what Gergo
already fixed in commit d5f8458e34a331e5b228de142145e62ac5bfda34
(which was already merged to Linus tree).


Takashi
