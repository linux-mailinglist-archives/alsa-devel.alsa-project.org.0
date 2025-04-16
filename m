Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1250A8B1F5
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Apr 2025 09:23:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 608976C0E6;
	Wed, 16 Apr 2025 09:23:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 608976C0E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744788195;
	bh=eseylKMdVRZH2+CNpgs9H6rty2NhrrwmC/qUEJSp59o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Jgd1NyqKh08OFXb/lffg3dM4M0ccIxfyylp80SdgycEdA63qCLQ0MpBZxO+HK3A3x
	 WriW6y8sGHTK4JoE4spRZBV9xm+8Q95FsM6snsii9HLBBvhZwmGXteb5LrmwObcwuo
	 tQN7KufPFI131o1XEYhTAjfrx6+izZde64FlTENs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 548A3F805CA; Wed, 16 Apr 2025 09:22:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FFF2F805BB;
	Wed, 16 Apr 2025 09:22:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E71E3F80224; Wed, 16 Apr 2025 09:22:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3D1FF800E4
	for <alsa-devel@alsa-project.org>; Wed, 16 Apr 2025 09:22:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3D1FF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=s9LTNb5X;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Nc0hDZPa;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=s9LTNb5X;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Nc0hDZPa
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F21E621157;
	Wed, 16 Apr 2025 07:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1744788155;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sigi6BLV9HZPEYvYXElKrGDVaSnKG9moEmfl608ubyE=;
	b=s9LTNb5X/Y1K5CSLcQhudtytXYebLDTAyXOA8U56kzvrEkCPR7AbOX3BXKfFXCIJucSCd7
	gOxeJkONdyMKM7CleJYi6pasH4GLEmBzCQMW0GUtszVVLoAFZApf82IH+7qdG1DnAnQOre
	gzwnrTyPxV9lt735rxrxFgID4YEpb+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744788155;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sigi6BLV9HZPEYvYXElKrGDVaSnKG9moEmfl608ubyE=;
	b=Nc0hDZPa++XIlgJk/AgD2I4NvdvcRrqGWn4aZ7qIk3Sfw3S9wrgG2P3Wl/XNr9EMNPf7Us
	Rv3us87240WPLHCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1744788155;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sigi6BLV9HZPEYvYXElKrGDVaSnKG9moEmfl608ubyE=;
	b=s9LTNb5X/Y1K5CSLcQhudtytXYebLDTAyXOA8U56kzvrEkCPR7AbOX3BXKfFXCIJucSCd7
	gOxeJkONdyMKM7CleJYi6pasH4GLEmBzCQMW0GUtszVVLoAFZApf82IH+7qdG1DnAnQOre
	gzwnrTyPxV9lt735rxrxFgID4YEpb+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744788155;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sigi6BLV9HZPEYvYXElKrGDVaSnKG9moEmfl608ubyE=;
	b=Nc0hDZPa++XIlgJk/AgD2I4NvdvcRrqGWn4aZ7qIk3Sfw3S9wrgG2P3Wl/XNr9EMNPf7Us
	Rv3us87240WPLHCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 90A9A13976;
	Wed, 16 Apr 2025 07:22:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Q7/7Ibpa/2fjSgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 16 Apr 2025 07:22:34 +0000
Date: Wed, 16 Apr 2025 09:22:34 +0200
Message-ID: <87lds0y3id.wl-tiwai@suse.de>
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
	<robinchen@ti.com>
Subject: Re: [PATCH v3] ALSA: hda/tas2781: Create a common header for both spi
 and i2c tas2781 hda driver
In-Reply-To: <20250416051838.2001-1-shenghao-ding@ti.com>
References: <20250416051838.2001-1-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,139.com,alsa-project.org,vger.kernel.org,ti.com,fpt.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,ti.com:email]
Message-ID-Hash: HQVWPANL4Z7CKYKVLO6DRP4PIB67GQMK
X-Message-ID-Hash: HQVWPANL4Z7CKYKVLO6DRP4PIB67GQMK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HQVWPANL4Z7CKYKVLO6DRP4PIB67GQMK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 16 Apr 2025 07:18:38 +0200,
Shenghao Ding wrote:
> 
> Move the common macro definition of kcontrols into a common header for code
> cleanup, and create a common header to store the common declaration for
> both spi and i2c hda driver.
> 
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

Applied now to for-next branch.  Thanks.


Takashi
