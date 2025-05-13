Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EADFEAB7FBA
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 10:05:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E40562A69;
	Thu, 15 May 2025 09:59:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E40562A69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747295973;
	bh=KOKvb6clCeEMBWeq7Qn71Iy+zIt1dvIP9b5IdjG3rOQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H8sNN7DGoMA+yeBJQfct0zPL096xaIR6V7VwnhvwKfyLBodiIIDZKG8g8nn88xAF+
	 lQVwac4ZE9ovFxmV+zHANIA9MK7HQ1cde+WSCpRD/AZGo2a67FQTYGli8XARNyTM+U
	 DA9H22Y9EK6F2Ba8Dq/4oGYh+MrOLW5J+9ynSqP4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13A96F899FC; Tue, 13 May 2025 07:32:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DFC54F89A0E;
	Tue, 13 May 2025 07:32:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4205AF8993C; Tue, 13 May 2025 07:32:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6298AF89938
	for <alsa-devel@alsa-project.org>; Tue, 13 May 2025 07:32:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6298AF89938
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=vLZvAWFi;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=o+PNDXKh;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=nAsFSrIT;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=GLUEAO/k
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CFBDA1F387;
	Tue, 13 May 2025 05:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1747114360;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J8+YP3MFOf50opCxkyeILE3xRd9jN2+HBaFhELp0y+Q=;
	b=vLZvAWFiva5d6lB0+FRfkuOCegCw/IQ6A2ZNamAuibWwvXpfwZQh/QS2RqHFHKjTg92hdA
	rZVZMEXkOmHG3xhnRoemF+kcj1vs4dHzL7+mLdRXeIiNXyebnsBzu3q6Hc5czMF4u/AJTz
	qk8OF7yqzDGRfUUfqnEOxuGes5td3ME=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747114360;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J8+YP3MFOf50opCxkyeILE3xRd9jN2+HBaFhELp0y+Q=;
	b=o+PNDXKhvsLhZg5+XaH30k9u08OsHDwghEGDIWObQuoq/0nO1buedlhIxgEXjZcGXvEwL6
	PD7LQ1Z+HbhqldAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1747114359;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J8+YP3MFOf50opCxkyeILE3xRd9jN2+HBaFhELp0y+Q=;
	b=nAsFSrITww2ZP7QSea09h1JDy/B+VzVlswriGJubQ4uSgpyRSLIuZivu9TIXJVv8CMaWcm
	a/1b9ssNmcSE8jVyMifd21Rd8SVboQBfQobIsClYQLQI2YKXMlv4WAPS84L5/UuaRYUxFX
	PNmDsZrlIvaeY7egFWCl3jW6Y4fqiE8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747114359;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J8+YP3MFOf50opCxkyeILE3xRd9jN2+HBaFhELp0y+Q=;
	b=GLUEAO/kaE0kHA3HFhsZ5l4Tj5mjJTdfaS1JFuRzrr+gO36ivICTajbOZwsOBMGnRZXZ2x
	DT8ohuI5akBuMABQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 820771386D;
	Tue, 13 May 2025 05:32:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XBroHXfZImhhNQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 May 2025 05:32:39 +0000
Date: Tue, 13 May 2025 07:32:38 +0200
Message-ID: <87h61pt6rt.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v3] ALSA: hda/tas2781: Fix the ld issue reported by kernel
 test robot
In-Reply-To: <20250512234833.772-1-shenghao-ding@ti.com>
References: <20250512234833.772-1-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	REDIRECTOR_URL(0.00)[urldefense.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,139.com,alsa-project.org,vger.kernel.org,ti.com,fpt.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[urldefense.com:url,ti.com:email,intel.com:email,suse.de:mid]
Message-ID-Hash: U37PR3P6ILHT7XTVB4CDZZJBTEJALU2V
X-Message-ID-Hash: U37PR3P6ILHT7XTVB4CDZZJBTEJALU2V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U37PR3P6ILHT7XTVB4CDZZJBTEJALU2V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 May 2025 01:48:33 +0200,
Shenghao Ding wrote:
> 
> After commit 9fa6a693ad8d ("ALSA: hda/tas2781: Remove tas2781_spi_fwlib.c
> and leverage SND_SOC_TAS2781_FMWLIB")created a separated lib for i2c,
> However, tasdevice_remove() used for not only for I2C but for SPI being
> still in that lib caused ld issue.
> All errors (new ones prefixed by >>):
> >> ld.lld: error: undefined symbol: tasdevice_remove
>    >>> referenced by tas2781_hda.c:33 (sound/pci/hda/tas2781_hda.c:33)
>    >>>               vmlinux.o:(tas2781_hda_remove)
> To fix this issue, the implementation of tasdevice_remove was moved from
> tas2781-comlib-i2c.c to tas2781-comlib.c.
> 
> Fixes: 9fa6a693ad8d ("ALSA: hda/tas2781: Remove tas2781_spi_fwlib.c and leverage SND_SOC_TAS2781_FMWLIB")
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
> 
> ---
> v3:
>  - Drop the report tag in the patch description.
> v2:
>  - put the Fixes tag to point out the commit that introduced the regression
>  - Add compiling error information reported by kernel test robot into patch
>    description.
> v1:
>  - | Reported-by: kernel test robot <lkp@intel.com>
>    | Closes: https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-all/202505111855.FP2fScKA-lkp@intel.com/__;!!G3vK!U-wdsvrOG1iezggZ55RYi8ikBxMaJD

You dropped again those tags.  These should be put around your
Signed-off-by without quotes.  That is, something like:

Fixes: 9fa6a693ad8d ("....")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://....
Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>


thanks,

Takashi
