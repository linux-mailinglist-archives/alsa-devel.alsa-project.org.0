Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F8C780F03
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 17:24:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 142C9E7F;
	Fri, 18 Aug 2023 17:23:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 142C9E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692372240;
	bh=CcvCMZwksy77MVSoBiltMDpzb731tXnFXEAROKQujeY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ezPvrLjJMXWLcHBYXb+NKi8kqLVU+8Fy8q0LkEwSNDt5yVI+vKD88svI5uXXw26o2
	 eVA+52errLKkm189tcAi3SZ0Vm9UhJspOuoR343nG5RWSJi4TK0HDgaEMCPXywljm6
	 wqi5uWocXcUizee1Zx4rvJy1RbzmPVY+nUQkPEPU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8239CF8025F; Fri, 18 Aug 2023 17:22:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F098FF801EB;
	Fri, 18 Aug 2023 17:22:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9504FF80254; Fri, 18 Aug 2023 17:22:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2172BF8016D
	for <alsa-devel@alsa-project.org>; Fri, 18 Aug 2023 17:22:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2172BF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=hMlkbZ8c;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=PFt6iTK8
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 696771F8AC;
	Fri, 18 Aug 2023 15:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692372161;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gaAbXCo2nIsfhs3VdokXXWWByIuIfsygwICM7HtY3ow=;
	b=hMlkbZ8cGMGg20gSNwIPWNDyq60FQpi7Js5HelLyrxjOu7YvG8J9Nw9ksFXexZgnfUHbwr
	jKQtpbxMP3YP8lGmHTLmLRZE6y8Fmr9BdZfKo7coON44x4Ysf43NKcPI/QlJVvHx21HH9b
	DlKH/kwWccCT9EQ2dGrs6Cr2Zgp7v04=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692372161;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gaAbXCo2nIsfhs3VdokXXWWByIuIfsygwICM7HtY3ow=;
	b=PFt6iTK8eLwsBFKa1eAueqgHW1Rp2bSQc5/BoVrvQOeX2qEprZd2kg16yq9mOJWGWizxEW
	B45dFdtLkkBqsTAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1FDC5138F0;
	Fri, 18 Aug 2023 15:22:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id PObkBsGM32QLXQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 18 Aug 2023 15:22:41 +0000
Date: Fri, 18 Aug 2023 17:22:40 +0200
Message-ID: <871qg0iddr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	lgirdwood@gmail.com,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	rander.wang@intel.com,
	guennadi.liakhovetski@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	regressions@leemhuis.info
Subject: Re: [PATCH] ASoC: SOF: intel: hda: Clean up link DMA for IPC3 during
 stop
In-Reply-To: <8428b13b-50c4-4db5-8de9-7a9b165f6254@sirena.org.uk>
References: <20230808110627.32375-1-peter.ujfalusi@linux.intel.com>
	<169151742693.78353.2991484643013989552.b4-ty@kernel.org>
	<b23c2ef1-7c9f-5eca-f61d-6f6994226ddc@perex.cz>
	<8428b13b-50c4-4db5-8de9-7a9b165f6254@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: FVLFGM4Q73HKVYRMOEDFBJJOPDTNVOBJ
X-Message-ID-Hash: FVLFGM4Q73HKVYRMOEDFBJJOPDTNVOBJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FVLFGM4Q73HKVYRMOEDFBJJOPDTNVOBJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 18 Aug 2023 17:18:54 +0200,
Mark Brown wrote:
> 
> On Fri, Aug 18, 2023 at 05:08:35PM +0200, Jaroslav Kysela wrote:
> > On 08. 08. 23 19:57, Mark Brown wrote:
> 
> > > [1/1] ASoC: SOF: intel: hda: Clean up link DMA for IPC3 during stop
> > >        commit: 90219f1bd273055f1dc1d7bdc0965755b992c045
> 
> > 	if it's not late, this patch should be also applied to the 6.5 tree. It
> > seems that many new laptops are affected (sound may be really weird when an
> > underrun occurs on those devices and users are not really happy).
> 
> It was applied for 6.5, the reports always say for-next due to
> difficulties with serieses which mix fixes and new development.

Right, the commit is on the way to Linus now.


Takashi
