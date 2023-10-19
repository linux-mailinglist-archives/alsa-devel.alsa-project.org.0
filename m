Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DE57CFA75
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 15:11:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B09C31FC;
	Thu, 19 Oct 2023 15:10:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B09C31FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697721062;
	bh=sTJ9DntLr5ptLIgTnyJphUaWwH3fzc1T6T09FnMIO8k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VA3ddxGajBymrv7ktRPL1JB3QNUUgPDffgS+akHN9mkXljpmlim77jSqOeqviyxUU
	 yfj+DZsvALTrz9YD1ewKrMTjOLMSZxtjIkZG8IFEvDysC9WF/o6vCUC5rgl1x3PC7s
	 tbCD30lYQi5mnFHEJiBpbLCPueD0GnQ9B4TBNi4M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4191F8024E; Thu, 19 Oct 2023 15:10:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C3C9F8024E;
	Thu, 19 Oct 2023 15:10:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CEECF8025F; Thu, 19 Oct 2023 15:10:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1A18F8019B;
	Thu, 19 Oct 2023 15:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1A18F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=w0KjVboN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=7TocIZpt
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C627B1F45B;
	Thu, 19 Oct 2023 13:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1697720997;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pMdo80ym8skLmYskCwbWaL7qF0X1OubV5NErMqY/lFI=;
	b=w0KjVboNPlybkb1hlVjv6Q1IlhAg9QatVSIens5bxbW3z+DsESJkbSoTg3jiba8IhpGx8W
	w3H/24Je2YCW9xGftMUo8KVaXSBe4pS9id62LgjLRaaasIRoeFPgWUadtnjQYCts7W0R5n
	VqoMRSdCJyMwAZHi6Uxy/i1TxwarY0Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1697720997;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pMdo80ym8skLmYskCwbWaL7qF0X1OubV5NErMqY/lFI=;
	b=7TocIZptmJBazDG/K+m299/bFxbYkpplpqitD24NOxsjK8ba5etLOKD8NiFDh2wwoOJRIY
	ZawAqS+BbpTyx9Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 700031357F;
	Thu, 19 Oct 2023 13:09:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id LPNiGqUqMWUOVgAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 19 Oct 2023 13:09:57 +0000
Date: Thu, 19 Oct 2023 15:09:56 +0200
Message-ID: <87pm1alpwb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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
Subject: Re: [PATCH v7 01/13] ASoC: SOF: core: Ensure sof_ops_free() is still
 called when probe never ran.
In-Reply-To: <a581dd50-b3c0-4774-ad3e-0db5e4c47338@linux.intel.com>
References: <20231009115437.99976-1-maarten.lankhorst@linux.intel.com>
	<20231009115437.99976-2-maarten.lankhorst@linux.intel.com>
	<87il7aopcy.wl-tiwai@suse.de>
	<a581dd50-b3c0-4774-ad3e-0db5e4c47338@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-9.98 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 RCPT_COUNT_TWELVE(0.00)[15];
	 MID_CONTAINS_FROM(1.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.88)[99.50%]
Message-ID-Hash: ERCSV4PIS6FQIDS7OCRBEXJ572FPZPH2
X-Message-ID-Hash: ERCSV4PIS6FQIDS7OCRBEXJ572FPZPH2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ERCSV4PIS6FQIDS7OCRBEXJ572FPZPH2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 19 Oct 2023 12:02:55 +0200,
Maarten Lankhorst wrote:
> 
> Hey,
> 
> Den 2023-10-13 kl. 11:15, skrev Takashi Iwai:
> > On Mon, 09 Oct 2023 13:54:25 +0200,
> > Maarten Lankhorst wrote:
> >> In an effort to not call sof_ops_free twice, we stopped running it when
> >> probe was aborted.
> >> 
> >> Check the result of cancel_work_sync to see if this was the case.
> >> 
> >> Fixes: 31bb7bd9ffee ("ASoC: SOF: core: Only call sof_ops_free() on remove if the probe was successful")
> >> Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> >> Acked-by: Mark Brown <broonie@kernel.org>
> > Your Signed-off-by tag is missing.
> > 
> > Could you resubmit?
> > 
> > 
> > thanks,
> > 
> > Takashi
> 
> I missed this email apparently.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> 
> Is this enough for the tooling, or do you need an actual resubmit?

That's enough, and I applied the series to for-next branch now.


thanks,

Takashi
