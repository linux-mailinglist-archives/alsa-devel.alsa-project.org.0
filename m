Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 418AE906FD5
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 14:23:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72787E69;
	Thu, 13 Jun 2024 14:23:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72787E69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718281426;
	bh=axK0BDnhqirFCUDdXgvVo3g+EGvLaM0cBzN0tLj2pzk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sD0Eh8YPpDzQ7d/2OQ/rvFb5z74xCN2TwqE5ckWuO62QCffPZVUiw/p5R9S677K4q
	 rfeKBj9oGe6xXzcWLe9xS5Hw7ShXWRW+EggOn+TGScD1zWc66pt4mr87l50TGwp0XU
	 iqoQGSLkq4xIlJfDMxz0OQtFe8VTYxNotXzbYCZI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 998ECF805B3; Thu, 13 Jun 2024 14:23:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E6B0F805AF;
	Thu, 13 Jun 2024 14:23:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D65DFF80579; Thu, 13 Jun 2024 14:23:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6DC9F800D0
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 14:23:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6DC9F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=hZAaElmB;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Zjv5w1BF;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=hZAaElmB;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Zjv5w1BF
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 43C025D322;
	Thu, 13 Jun 2024 12:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718281384;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wZUNWmSgXT4ylcdc8OI7ZtHGdqliabURi29bSW7LwGc=;
	b=hZAaElmB5lred2TmOfQIoi1Gv4+Kp1y8jwfj4IMSu+jVQpE3X7S5b7KxQo857dQE47rZvn
	7Jd2bsOSMw45xxW0KdO0iOyieDjInedOrzEZ8ZJX+DosD13TPwPQtSkU8Rx+KgpWigC9iJ
	utKzXMyJm/Qtbc6JS0vpmKOX0Iei//4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718281384;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wZUNWmSgXT4ylcdc8OI7ZtHGdqliabURi29bSW7LwGc=;
	b=Zjv5w1BF2BM+A5WeGZGJxiGvEZD/xv/pwHibSHqCdSemFnKVgXTi4PbdE7k5xNoHAfDCOO
	bSmbgasiVHXbsIDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hZAaElmB;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Zjv5w1BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718281384;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wZUNWmSgXT4ylcdc8OI7ZtHGdqliabURi29bSW7LwGc=;
	b=hZAaElmB5lred2TmOfQIoi1Gv4+Kp1y8jwfj4IMSu+jVQpE3X7S5b7KxQo857dQE47rZvn
	7Jd2bsOSMw45xxW0KdO0iOyieDjInedOrzEZ8ZJX+DosD13TPwPQtSkU8Rx+KgpWigC9iJ
	utKzXMyJm/Qtbc6JS0vpmKOX0Iei//4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718281384;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wZUNWmSgXT4ylcdc8OI7ZtHGdqliabURi29bSW7LwGc=;
	b=Zjv5w1BF2BM+A5WeGZGJxiGvEZD/xv/pwHibSHqCdSemFnKVgXTi4PbdE7k5xNoHAfDCOO
	bSmbgasiVHXbsIDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B236C13A7F;
	Thu, 13 Jun 2024 12:23:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id O+/FKafkamZjJgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Jun 2024 12:23:03 +0000
Date: Thu, 13 Jun 2024 14:23:27 +0200
Message-ID: <877cetni9s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Baojun Xu <baojun.xu@ti.com>
Cc: <robh+dt@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<lgirdwood@gmail.com>,
	<perex@perex.cz>,
	<pierre-louis.bossart@linux.intel.com>,
	<kevin-lu@ti.com>,
	<shenghao-ding@ti.com>,
	<navada@ti.com>,
	<13916275206@139.com>,
	<v-hampiholi@ti.com>,
	<v-po@ti.com>,
	<niranjan.hy@ti.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<liam.r.girdwood@intel.com>,
	<yung-chuan.liao@linux.intel.com>,
	<broonie@kernel.org>,
	<soyer@irl.hu>
Subject: Re: [PATCH v7 0/1] Add tas2781 driver for SPI.
In-Reply-To: <20240613082633.388-1-baojun.xu@ti.com>
References: <20240613082633.388-1-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 43C025D322
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[19];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,gmail.com,perex.cz,ti.com,139.com,alsa-project.org,vger.kernel.org,intel.com,irl.hu];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,ti.com:email]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: HGPJC4BQY4BRCLEXART44QAQZIN5QKK5
X-Message-ID-Hash: HGPJC4BQY4BRCLEXART44QAQZIN5QKK5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HGPJC4BQY4BRCLEXART44QAQZIN5QKK5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Jun 2024 10:26:32 +0200,
Baojun Xu wrote:
> 
> This patch was used to add TAS2781 devices on SPI support in sound/pci/hda.
> It use ACPI node descript about parameters of TAS2781 on SPI, it like:
>     Scope (_SB.PC00.SPI0)
>     {
>         Device (GSPK)
>         {
>             Name (_HID, "TXNW2781")  // _HID: Hardware ID
>             Method (_CRS, 0, NotSerialized)
>             {
>                 Name (RBUF, ResourceTemplate ()
>                 {
>                     SpiSerialBusV2 (...)
>                     SpiSerialBusV2 (...)
>                 }
>             }
>         }
>     }
> 
> And in platform/x86/serial-multi-instantiate.c, those spi devices will be
> added into system as a single SPI device, so TAS2781 SPI driver will
> probe twice for every single SPI device. And driver will also parser
> mono DSP firmware binary and RCA binary for itself.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> 
> Baojun Xu (1):
>   ALSA: hda/tas2781: Add tas2781 hda driver based on SPI

Since you're sending only one patch, we need no cover letter, and all
needed stuff should be documented in the patch description itself.
That is, The texts like above should go there, too.


thanks,

Takashi
