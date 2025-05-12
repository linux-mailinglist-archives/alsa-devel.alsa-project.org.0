Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D51AB7FB6
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 10:05:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 650F96299A;
	Thu, 15 May 2025 09:58:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 650F96299A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747295938;
	bh=FK8pEdCRQtG6bJlXiQWdi88Bu8Ab4nVxy28DqpeqP7s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gHF90kHAQsf/Q/s0pnSwrIUnuEi/XF0F9FtmlB9v3Jl/XpnQx8DSurACbGtD1wwyw
	 bHhPyeWNW5gUqWX+OIMy4+dKYZhF3PJOPhECHtYdgHwH+ip6UAhh3rSDGqwAfjg+ua
	 M+CWjup4DDq72Klv3gf4y8YMGMvhivJXKMOqtVm0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B16ABF899B1; Mon, 12 May 2025 08:08:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9601FF899AE;
	Mon, 12 May 2025 08:08:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96D98F89995; Mon, 12 May 2025 08:08:25 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CA64EF80800
	for <alsa-devel@alsa-project.org>; Mon, 12 May 2025 08:08:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA64EF80800
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=P68ZAven;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=X4ag0s25;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=P68ZAven;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=X4ag0s25
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 64D4D211AD;
	Mon, 12 May 2025 06:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1747030102;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=39IvRBcW+cJ8NVSVS1ljrzz9mXA6cTtMOoBmdCkC5GE=;
	b=P68ZAvenefYZ4NDkzAWQDonwBFNXbXDZYtwdUfPOBWs8iBbR6DO+hrj5Vtu3tQBn+spiOY
	q58yLInZAbDhIWmys5/OFX8u+6Ni7k73KhtjmMmPt5n5k3cDox5eBljtiIDEV+OcLlWAsX
	torlOTa9h37E+iCwkWbtj5kDdFnw6Jc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747030102;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=39IvRBcW+cJ8NVSVS1ljrzz9mXA6cTtMOoBmdCkC5GE=;
	b=X4ag0s250XMgQ+nRAVL/unRTUX8pJeSCz4LYIb78m0QmkvgTes7RIDftLdnkXs45BtG4O0
	+vaouCEWQtpR85Cg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=P68ZAven;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=X4ag0s25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1747030102;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=39IvRBcW+cJ8NVSVS1ljrzz9mXA6cTtMOoBmdCkC5GE=;
	b=P68ZAvenefYZ4NDkzAWQDonwBFNXbXDZYtwdUfPOBWs8iBbR6DO+hrj5Vtu3tQBn+spiOY
	q58yLInZAbDhIWmys5/OFX8u+6Ni7k73KhtjmMmPt5n5k3cDox5eBljtiIDEV+OcLlWAsX
	torlOTa9h37E+iCwkWbtj5kDdFnw6Jc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747030102;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=39IvRBcW+cJ8NVSVS1ljrzz9mXA6cTtMOoBmdCkC5GE=;
	b=X4ag0s250XMgQ+nRAVL/unRTUX8pJeSCz4LYIb78m0QmkvgTes7RIDftLdnkXs45BtG4O0
	+vaouCEWQtpR85Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 210211397F;
	Mon, 12 May 2025 06:08:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zdDjBlaQIWgYcgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 12 May 2025 06:08:22 +0000
Date: Mon, 12 May 2025 08:08:21 +0200
Message-ID: <878qn2xsx6.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Fix the ld issue reported by kernel
 test robot
In-Reply-To: <20250511221844.1123-1-shenghao-ding@ti.com>
References: <20250511221844.1123-1-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 64D4D211AD
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.981];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,139.com,alsa-project.org,vger.kernel.org,ti.com,fpt.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	REDIRECTOR_URL(0.00)[urldefense.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Action: no action
Message-ID-Hash: 3YBF74AJJ4DFVJJQ5MZGDJYX6JTRUCBE
X-Message-ID-Hash: 3YBF74AJJ4DFVJJQ5MZGDJYX6JTRUCBE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3YBF74AJJ4DFVJJQ5MZGDJYX6JTRUCBE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 12 May 2025 00:18:44 +0200,
Shenghao Ding wrote:
> 
> Fix the ld issue reported by kernel test robot, moving the implementation
> of tasdevice_remove from tas2781-comlib-i2c.c to tas2781-comlib.c.
> 
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
> 
> ---
> v1:
>  - | Reported-by: kernel test robot <lkp@intel.com>
>    | Closes: https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-all/202505111855.FP2fScKA-lkp@intel.com/__;!!G3vK!U-wdsvrOG1iezggZ55RYi8ikBxMaJD

You must put this in the patch description around your Signed-off-by
line (without quotes).
Also, please put the Fixes tag to point out the commit that introduced
the regression, too.

Care to resubmit?


thanks,

Takashi
