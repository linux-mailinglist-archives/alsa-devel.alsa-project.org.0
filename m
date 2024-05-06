Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA888BCCB4
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2024 13:17:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87870823;
	Mon,  6 May 2024 13:17:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87870823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714994249;
	bh=KfeNDZbOMz/5HgirkBw+VH6ZB3AxFQuJi99H4YzeQS4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GH//yi1QJXXgE+iXJb9D9pXW/EZuwyfZhsN9y/X8E+jKPjYAWRLTRL3JCQE4SsWBP
	 YApfyCsCCcSkLons/AQyrYgj32JKEkxoZw+M44GGVmOrO/Ng+EP+f+Thumm+hGF4mW
	 zV4YfZMRZEqOjL5rBWULRnKY7t2urwjT6bfJgCVE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C218F8057C; Mon,  6 May 2024 13:16:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CD32F8057D;
	Mon,  6 May 2024 13:16:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACF78F8049C; Mon,  6 May 2024 13:16:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C57FCF800E2
	for <alsa-devel@alsa-project.org>; Mon,  6 May 2024 13:16:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C57FCF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=H4gk8Kik;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=NiHy2b2z;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=H4gk8Kik;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=NiHy2b2z
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5CDF73823A;
	Mon,  6 May 2024 11:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714994197;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/gowNp2KH7bD8yMa7lH80BTRR2VdWE5qZYTZ/ZrSvuQ=;
	b=H4gk8KikEta5sS6RD2QgJqZzfKkjM/xAzC9504SWKNtwMfAoNlzfc1oc1domhLyAO8Fs6X
	EMAUWRpT7Td5NKeLWnQtULCO9sqDf+zV0mmz0Ypk+yymuHNxKFA0gZ5yRnLzdUSYU0QMod
	vorQd2L1xoTIbSj13K2PvTIEaHjG4ig=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714994197;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/gowNp2KH7bD8yMa7lH80BTRR2VdWE5qZYTZ/ZrSvuQ=;
	b=NiHy2b2z98WM7GLctBBp4CAqsXirFLOU1f1kOOzHEcynge7N8krmCoXQ7e16O/Pg56LlIG
	xSZcmokcV6L5G/AQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=H4gk8Kik;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NiHy2b2z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714994197;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/gowNp2KH7bD8yMa7lH80BTRR2VdWE5qZYTZ/ZrSvuQ=;
	b=H4gk8KikEta5sS6RD2QgJqZzfKkjM/xAzC9504SWKNtwMfAoNlzfc1oc1domhLyAO8Fs6X
	EMAUWRpT7Td5NKeLWnQtULCO9sqDf+zV0mmz0Ypk+yymuHNxKFA0gZ5yRnLzdUSYU0QMod
	vorQd2L1xoTIbSj13K2PvTIEaHjG4ig=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714994197;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/gowNp2KH7bD8yMa7lH80BTRR2VdWE5qZYTZ/ZrSvuQ=;
	b=NiHy2b2z98WM7GLctBBp4CAqsXirFLOU1f1kOOzHEcynge7N8krmCoXQ7e16O/Pg56LlIG
	xSZcmokcV6L5G/AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E2CDD13A25;
	Mon,  6 May 2024 11:16:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wfuaNRS8OGYOKwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 06 May 2024 11:16:36 +0000
Date: Mon, 06 May 2024 13:16:51 +0200
Message-ID: <87r0efgpgc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Xu, Baojun" <baojun.xu@ti.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"robh+dt@kernel.org"
	<robh+dt@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"pierre-louis.bossart@linux.intel.com"
	<pierre-louis.bossart@linux.intel.com>,
	"Lu, Kevin" <kevin-lu@ti.com>,
	"Ding, Shenghao" <shenghao-ding@ti.com>,
	"Navada Kanyana, Mukund" <navada@ti.com>,
	"13916275206@139.com" <13916275206@139.com>,
	"P O, Vijeth" <v-po@ti.com>,
	"Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"soyer@irl.hu" <soyer@irl.hu>
Subject: Re: [EXTERNAL] Re: [PATCH v3 1/3] ALSA: hda/tas2781: Modification for
 add tas2781 driver for SPI
In-Reply-To: <d96bea0bacc842e0b30a100f43ff264f@ti.com>
References: <20240418040240.2337-1-baojun.xu@ti.com>
	<20240418040240.2337-2-baojun.xu@ti.com>
	<ZiEKc4OTVlOt8llU@smile.fi.intel.com>
	<0c7b29075dc347299602668660adb4b6@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[18];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,gmail.com,perex.cz,ti.com,139.com,alsa-project.org,vger.kernel.org,intel.com,irl.hu];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,ti.com:email,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 5CDF73823A
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: 5KFVZL53B3OJNK6HOXGABBFOH77M73HQ
X-Message-ID-Hash: 5KFVZL53B3OJNK6HOXGABBFOH77M73HQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5KFVZL53B3OJNK6HOXGABBFOH77M73HQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 06 May 2024 09:44:05 +0200,
Xu, Baojun wrote:
> 
> Hi Andy
> 
> Thanks for your comments, answer in line:
> 
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: 02 May 2024 18:22
> > To: Xu, Baojun
> > Cc: tiwai@suse.de; robh+dt@kernel.org; lgirdwood@gmail.com; perex@perex.cz; pierre-louis.bossart@linux.intel.com; Lu, Kevin; Ding, Shenghao; Navada Kanyana, Mukund; 13916275206@139.com; P O, Vijeth; Holalu Yogendra, Niranjan; alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org; liam.r.girdwood@intel.com; yung-chuan.liao@linux.intel.com; broonie@kernel.org; soyer@irl.hu
> > Subject: Re: [EXTERNAL] Re: [PATCH v3 1/3] ALSA: hda/tas2781: Modification for add tas2781 driver for SPI
> > 
> > On Thu, Apr 25, 2024 at 07: 54: 41AM +0000, Xu, Baojun wrote: > > From: Andy Shevchenko <andriy. shevchenko@ linux. intel. com> > > Sent: 18 April 2024 19: 56 > > On Thu, Apr 18, 2024 at 12: 02: 37PM +0800, Baojun Xu wrote: 
> > ZjQcmQRYFpfptBannerStart
> > This message was sent from outside of Texas Instruments.
> > Do not click links or open attachments unless you recognize the source of this email and know the content is safe. If you wish to report this message to IT Security, please forward the message as an attachment to phishing@list.ti.com
> > 
> > ZjQcmQRYFpfptBannerEnd
> > 
> > On Thu, Apr 25, 2024 at 07:54:41AM +0000, Xu, Baojun wrote:
> > > > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > Sent: 18 April 2024 19:56
> > > > On Thu, Apr 18, 2024 at 12: 02: 37PM +0800, Baojun Xu wrote:
> > > > On Thu, Apr 18, 2024 at 12:02:37PM +0800, Baojun Xu wrote:
> > 
> > ...
> > 
> > > > >  sound/pci/hda/Kconfig                           | 15 +++++++++++++++
> > > > >  sound/pci/hda/Makefile                          |  2 ++
> > > >
> > > Is this correct? You are adding a dead "code", isn't it?
> > >
> > > What's mean "dead code"? After add CONFIG_SND_HDA_SCODEC_TAS2781_SPI=m
> > > in my config file, the whole patch code has worked.
> > 
> > Is that file already in the repository?
> > If not, I don't see it in this patch either --> dead code.
> 
> When I integrated CONFIG_SND_HDA_SCODEC_TAS2781_SPI and compiled the whole kernel,
> it used to popup the following message for TAS2781 SPI module in first compile:
>  
>  Build TAS2781 HD-audio side codec support for SPI Bus (SND_HDA_SCODEC_TAS2781_SPI) [N/m/?] (NEW) 
> 
> Normally, selected m. And TAS2781 SPI module would be compiled.

At each patch / commit, the build must be kept successful.
In your case, in the patch 1, you introduced the new driver stuff to
Kconfig and Makefile while there is no actual code for that yet (which
will be added in later patches).  This breaks the build at this
commit (lacking tas2781_hda_spi.c and co), and it's not acceptable.

You have to split patches in sensible manners; those to be logically
split, and yet they must not break builds.


thanks,

Takashi
