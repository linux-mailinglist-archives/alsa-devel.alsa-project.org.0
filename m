Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F418A9368
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 08:45:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 126F9F55;
	Thu, 18 Apr 2024 08:44:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 126F9F55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713422706;
	bh=uBpaZXZ//+wXoMiuJq7TUiP5CU/5ciB016fjPPA4UKI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YG+CAD5yqthHymQ3Bj0O9XEj8EMcn+zCGqW7oAZ1ShKF1UNa4l4t1G1siSZVB9xs8
	 H6WR36lOUp6UDT7qMzO6ZfTnzkvspB9DALAoFJtrUz5n3qjlGyEpAtUfW3ihPhp3RQ
	 8mQ3p0oUTn4n6AEYiKkzTfYD6RwaNUB4B9RCFrwI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB6FBF805AC; Thu, 18 Apr 2024 08:44:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B450BF8003A;
	Thu, 18 Apr 2024 08:44:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FD3CF8025A; Thu, 18 Apr 2024 08:42:32 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D824F80124
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 08:42:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D824F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=YJXG2QHC;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=5wbPw0WV;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=igUgPFJG;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ER/RxnMo
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4B75234A58;
	Thu, 18 Apr 2024 06:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1713422539;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GCC2ifPdYJijtvyIoC+2l6z43cA42cTEO8PRZ+VUXG4=;
	b=YJXG2QHCmYMVJDxLoYLYi/HzPZTT6bhKKnzFAHPzxDZGPVXv7N8qYzEcoTRyL2XYfVDw2A
	Xof7oAlddueIN0a8qhgsxE8MLCXjyEfzTnLdW1eF80GwmKfgtbAZ2s99vHc98SCjHzGmVF
	Z0lg6bCzVrYDiiGQD4N4VIstIW22tSE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713422539;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GCC2ifPdYJijtvyIoC+2l6z43cA42cTEO8PRZ+VUXG4=;
	b=5wbPw0WVq6xh+omxhE34k77Pq1ZczjeD0rcvui9rgW7GIVr93YXxPliCmnKwFJ4WzblGH2
	chNGp4FkN9IpTgCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1713422538;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GCC2ifPdYJijtvyIoC+2l6z43cA42cTEO8PRZ+VUXG4=;
	b=igUgPFJGTg2hV9ds2L3Y5DNPEVuICXtQSA7R5CYoT0GVJjdS481O0W7lMioLZRzoaybY/W
	lr5uslL4cud8e57pi9zGjMZis+zJ1kChAeRFqpVK1oshisxBh81qd64a8gd7h3QtYg9o8f
	sLci7+R76FdIt6SOAMHju7G58nJrBZg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713422538;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GCC2ifPdYJijtvyIoC+2l6z43cA42cTEO8PRZ+VUXG4=;
	b=ER/RxnMoW4ULBR99bDF3u9ufHG0jKo7tBR1EB6Ru1r7Ip+HmPzTAgB0gDclX9BHLDgUXcc
	n08hWzpoERIFPrAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B435413687;
	Thu, 18 Apr 2024 06:42:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 82hMKsnAIGbadwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 18 Apr 2024 06:42:17 +0000
Date: Thu, 18 Apr 2024 08:42:26 +0200
Message-ID: <87jzkvxjcd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<lgirdwood@gmail.com>,
	<perex@perex.cz>,
	<pierre-louis.bossart@linux.intel.com>,
	<13916275206@139.com>,
	<mimperial@lenovo.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<liam.r.girdwood@intel.com>,
	<bard.liao@intel.com>,
	<yung-chuan.liao@linux.intel.com>,
	<kevin-lu@ti.com>,
	<robinchen@ti.com>,
	<baojun.xu@ti.com>,
	<soyer@irl.hu>,
	<Baojun.Xu@fpt.com>,
	<navada@ti.com>,
	<v-po@ti.com>
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Add new vendor_id and subsystem_id
 to support ThinkPad ICE-1
In-Reply-To: <20240411091823.1644-1-shenghao-ding@ti.com>
References: <20240411091823.1644-1-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.62 / 50.00];
	BAYES_HAM(-2.32)[96.83%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,gmail.com,perex.cz,139.com,lenovo.com,alsa-project.org,vger.kernel.org,intel.com,ti.com,irl.hu,fpt.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
Message-ID-Hash: DCLVAVA3U24KQC6BGTK37PK6JJPSZNV2
X-Message-ID-Hash: DCLVAVA3U24KQC6BGTK37PK6JJPSZNV2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DCLVAVA3U24KQC6BGTK37PK6JJPSZNV2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 11 Apr 2024 11:18:22 +0200,
Shenghao Ding wrote:
> 
> Add new vendor_id and subsystem_id to support new Lenovo laptop
> ThinkPad ICE-1
> 
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

Applied now.  Thanks.


Takashi
