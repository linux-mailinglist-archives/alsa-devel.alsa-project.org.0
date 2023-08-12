Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFE9779E0A
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Aug 2023 10:23:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF59C827;
	Sat, 12 Aug 2023 10:22:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF59C827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691828618;
	bh=UmzO/rgGBGTYLdwz+qjWcZ70bdO/xs03AGmphGvUUw4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uYqGRPKSG2a7g94NDVouBCbaflaZcMg1ZyldBXwbPpYqKBc8Ptqc000kdOMY2o8IL
	 sUt32SeXgf93Vxb5RGffwdRgot4YvTVRLe9P62APKMTUnf1P99CcVDxX21SmF8NNYI
	 ezB2DBYDPl9eVlgHHH0K9K1pxgyDae5Vomeys134=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4ED8F80134; Sat, 12 Aug 2023 10:22:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52074F80134;
	Sat, 12 Aug 2023 10:22:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAF80F80166; Sat, 12 Aug 2023 10:21:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BCAEEF800FB;
	Sat, 12 Aug 2023 10:21:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCAEEF800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=WiaAOehZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=wlyiZzJL
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4CB5C2189C;
	Sat, 12 Aug 2023 08:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691828485;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VnmOoVcBZDfMJs4q91/3O477m9GJ5p+nugyF9h38FXM=;
	b=WiaAOehZJVq9xVoixizSzOzHAuJA0zkR0CbUeZbf7d3n529/T1xfV3h4bqkx1zah1eadk0
	4K4Rw7eMguswJ6DWA1MTbNpGiCFMii/20k6pvUIRoYTEo9x58e7P+WZHpU9kj++uKMWpac
	Aat8ZkJSlWBnC6GoC57nNEoSTyU/agk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691828485;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VnmOoVcBZDfMJs4q91/3O477m9GJ5p+nugyF9h38FXM=;
	b=wlyiZzJLfr/+XfJaklmFrQ3+3meVihmdF2SUw8dFY9Nwblfx/qz7vimicq5yKtxcWFV6vl
	Oba19oXYRoGsvWBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E968313357;
	Sat, 12 Aug 2023 08:21:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id RuUEOARB12TpFwAAMHmgww
	(envelope-from <tiwai@suse.de>); Sat, 12 Aug 2023 08:21:24 +0000
Date: Sat, 12 Aug 2023 10:21:24 +0200
Message-ID: <877cq0r7qz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	alsa-devel@alsa-project.org,
	Maarten Lankhorst <dev@lankhorst.se>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown
 <broonie@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v3 3/9] ALSA: hda/i915: Add an allow_modprobe argument to
 snd_hdac_i915_init
In-Reply-To: <451ab8a3-7c75-4aab-0b8b-554d9c44c34c@linux.intel.com>
References: <20230807090045.198993-1-maarten.lankhorst@linux.intel.com>
	<20230807090045.198993-4-maarten.lankhorst@linux.intel.com>
	<451ab8a3-7c75-4aab-0b8b-554d9c44c34c@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: JZMYRDESKJF3VZPTQ62SG6VC7CVU2VKR
X-Message-ID-Hash: JZMYRDESKJF3VZPTQ62SG6VC7CVU2VKR
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JZMYRDESKJF3VZPTQ62SG6VC7CVU2VKR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 07 Aug 2023 16:08:32 +0200,
Pierre-Louis Bossart wrote:
> 
> 
> 
> On 8/7/23 04:00, Maarten Lankhorst wrote:
> > Xe is a new GPU driver that re-uses the display (and sound) code from
> > i915. It's no longer possible to load i915, as the GPU can be driven
> > by the xe driver instead.
> > 
> > The new behavior will return -EPROBE_DEFER, and wait for a compatible
> > driver to be loaded instead of modprobing i915.
> > 
> > Converting all drivers at the same time is a lot of work, instead we
> > will convert each user one by one.
> > 
> > Changes since v1:
> > - Use dev_err_probe to set a probe reason for debugfs' deferred_devices.
> 
> You want the changes below the --- line ...

Note that there are subsystems preferring keeping the version change
logs in the commit log (typically found in drm trees), although
majority of subsystems (including sound) want rather cleaner logs,
AFAIK.


Takashi
