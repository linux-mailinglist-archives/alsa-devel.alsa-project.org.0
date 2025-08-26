Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 927F6B36DCE
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Aug 2025 17:31:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C29BD60267;
	Tue, 26 Aug 2025 17:31:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C29BD60267
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756222311;
	bh=tyUsBjItZQMaTIBmWCJs4LMl0/k68Qr2JOPz6EVpzvM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E5nm8YTUa4M+xRAZ12qycY92zG2zMl36fhWkO8Y3y/eHjGcdIpv7tutaVfhRIGmG+
	 yYiFePV+RSr6poAb2MYZOQuLDodU7uL9MuTCgpW6aoyXVJ8+GpeqtBPWVc7vOX4Vya
	 KSrUGd/1rkPqsRo2DkQakSfAAIIp5KK7KVkwmh4c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 243D2F805C5; Tue, 26 Aug 2025 17:31:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7985F805C4;
	Tue, 26 Aug 2025 17:31:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A717F8051F; Tue, 26 Aug 2025 17:31:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4AEFF80154
	for <alsa-devel@alsa-project.org>; Tue, 26 Aug 2025 17:30:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4AEFF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=KjCsAshE;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=W2KbPuEs;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Kt7ZCUFi;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=HtcJEKdK
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E0B012119C;
	Tue, 26 Aug 2025 15:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1756222252;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D2ulA5rFhGxVZgPAbguwQbAYjHqkpl/zPVZhIWuo/qw=;
	b=KjCsAshE1Wnw6YjR8OaiLqSfDrrvoXHr2N6HN9DqBuEHrH2wKkGkYRYbJGgfhBe3L3zzZy
	VS6CsfjnRbi8/ByVkAAiGQTn3z7/7xAt6tIawW8RyGaH1+hndngdd1wqlgc6TNuT3yzpnY
	zH6gdZiPJeAjZfZV72+PuicE35HIZQ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756222252;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D2ulA5rFhGxVZgPAbguwQbAYjHqkpl/zPVZhIWuo/qw=;
	b=W2KbPuEsST5DbQDcA9kFlVZlKRsWOimqsR8fFNTpyq1geDiW6Tr6Ykvmrz+HSGVM/NVJTq
	a1D5qOnNiRM92wDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1756222251;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D2ulA5rFhGxVZgPAbguwQbAYjHqkpl/zPVZhIWuo/qw=;
	b=Kt7ZCUFikh7ptdKMFML3d/xTzJCPGRQ5pLjjyxVTV5KaSyQI9rDsWF/mpUU5f5uGDd4eus
	5M1gxxG2xfqPt4aevnhZ1dmItEwQS618+56I5lS96iAKLawOk2uUBep8LArSApTUPBAI4R
	VjHjRHVIuYw1JMGIlHNN+HVKqzglDZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756222251;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D2ulA5rFhGxVZgPAbguwQbAYjHqkpl/zPVZhIWuo/qw=;
	b=HtcJEKdKp3f3keEsvumqhLgwUyhNp68Okli6IyxZQqCUuFdQI53UgG8w0a3Gr55lo2f3HY
	cAeE3iZPsoPPJ6Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8FCE913A31;
	Tue, 26 Aug 2025 15:30:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id llkbISvTrWivWwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 26 Aug 2025 15:30:51 +0000
Date: Tue, 26 Aug 2025 17:30:51 +0200
Message-ID: <878qj6gkwk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<13564923607@139.com>,
	<13916275206@139.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<baojun.xu@ti.com>,
	<Baojun.Xu@fpt.com>,
	<jesse-ji@ti.com>
Subject: Re: [PATCH v2] ALSA: hda/tas2781: Fix EFI name for calibration
 beginning with 1 instead of 0
In-Reply-To: <20250826094105.1325-1-shenghao-ding@ti.com>
References: <20250826094105.1325-1-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,139.com,alsa-project.org,vger.kernel.org,ti.com,fpt.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
Message-ID-Hash: KO5RWJMFPVKSVDGQXEVMQG4UIWUNNOVG
X-Message-ID-Hash: KO5RWJMFPVKSVDGQXEVMQG4UIWUNNOVG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KO5RWJMFPVKSVDGQXEVMQG4UIWUNNOVG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 26 Aug 2025 11:41:05 +0200,
Shenghao Ding wrote:
> 
> A bug reported by one of my customers that EFI name beginning with 0
> instead of 1.
> 
> Fixes: 4fe238513407 ("ALSA: hda/tas2781: Move and unified the calibrated-data getting function for SPI and I2C into the tas2781_hda lib")
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
> 
> ---
> v2:
>  - remove unrelated change
> v1:
>  - Fix EFI name beginning with 1 instead of 0
>  - Add extra comments on EFI name for calibration
>  - Remove an extra space
> ---
>  sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
> index ed7771ab9475..635cbd8820ac 100644
> --- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
> +++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
> @@ -340,7 +340,8 @@ static int tas2563_save_calibration(struct tas2781_hda *h)
>  		data[offset] = i;
>  		offset++;
>  		for (j = 0; j < TASDEV_CALIB_N; ++j) {
> -			ret = snprintf(var8, sizeof(var8), vars[j], i);
> +			/* EFI name for calibration started with 1, not 0 */
> +			ret = snprintf(var8, sizeof(var8), vars[j], i + 1);
>  
>  			if (ret < 0 || ret >= sizeof(var8) - 1) {
>  				dev_err(p->dev, "%s: Read %s failed\n",
> @@ -349,7 +350,7 @@ static int tas2563_save_calibration(struct tas2781_hda *h)
>  			}
>  			/*
>  			 * Our variable names are ASCII by construction, but
> -			 * EFI names are wide chars.  Convert and zero-pad.
> +			 * EFI names are wide chars. Convert and zero-pad.
>  			 */
>  			memset(efi_name, 0, sizeof(efi_name));
>  			for (k = 0; k < sizeof(var8) && var8[k]; k++)

Please drop unrelated change and concentrate on the real issue.


thanks,

Takashi
