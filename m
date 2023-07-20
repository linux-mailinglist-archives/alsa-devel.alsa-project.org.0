Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1381675AF8F
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 15:21:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C9D01F3;
	Thu, 20 Jul 2023 15:20:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C9D01F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689859298;
	bh=U+5c4b9MxdCNaRVvbdA/gzMbwWHERdwqmhuZXzWTTFM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eQEkoXAQWotn5IGStKG7BXMPG3/PYFzLWuicUBAtRv/TwRFPj8LzY44nMVQGcTnkh
	 Xmg9cvlTIxPmOBAYDpTT+fmrlLC/qsDTFk0hyC6HbaIVnz9c1h5EjIb+SFwE1uKbNn
	 14bMLCO19Et0PqwLMoJBm5BGx+lxi9UIhVd0NoC0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4120F8047D; Thu, 20 Jul 2023 15:20:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3790FF8032D;
	Thu, 20 Jul 2023 15:20:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4359F8047D; Thu, 20 Jul 2023 15:20:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 541D7F80153
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 15:20:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 541D7F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=fMpDKEa8;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=IFhWb5Cq
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B818D22BD6;
	Thu, 20 Jul 2023 13:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689859217;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rubRhHJWBI8/dkpPxnYiJ9ku11m2zq+Fr5FtgSWdbxk=;
	b=fMpDKEa8J1XmOeodUL7JgyZdencl3LTEUbkopM17V/+NjOqvoXsyMXzVc1uDJWzzHIK0we
	qNAfzMMbH6OpbtyTzDetRed/p7K+kig8y0fCorF2dkh77Sm051X5GfE5TSEnYi/Qj/WPfA
	Y21S+c4EKn8v6wu1LellIybaXokvBBE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689859217;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rubRhHJWBI8/dkpPxnYiJ9ku11m2zq+Fr5FtgSWdbxk=;
	b=IFhWb5Cqm2QT8zKmULWMsgDaOSwktXnkgsmtVl0lxrTBSm1DyvMc8YiziLwTzggi7mm6j0
	8CAz+VuM/Z1G5gBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9701A133DD;
	Thu, 20 Jul 2023 13:20:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id PgfjI5E0uWSCSwAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 20 Jul 2023 13:20:17 +0000
Date: Thu, 20 Jul 2023 15:20:17 +0200
Message-ID: <87351ik9da.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.5-rc1-2
In-Reply-To: <20230720130519.D1DFEC433C7@smtp.kernel.org>
References: <20230720130519.D1DFEC433C7@smtp.kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q6MECELSJKTYXSFFEOD37ICUV25DXCHV
X-Message-ID-Hash: Q6MECELSJKTYXSFFEOD37ICUV25DXCHV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q6MECELSJKTYXSFFEOD37ICUV25DXCHV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 20 Jul 2023 15:05:08 +0200,
Mark Brown wrote:
> 
> The following changes since commit fdf0eaf11452d72945af31804e2a1048ee1b574c:
> 
>   Linux 6.5-rc2 (2023-07-16 15:10:37 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.5-rc1-2
> 
> for you to fetch changes up to 269f399dc19f0e5c51711c3ba3bd06e0ef6ef403:
> 
>   ASoC: fsl_sai: Disable bit clock with transmitter (2023-07-17 19:15:07 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.5
> 
> A few more fixes for v6.5, just small driver specific ones.
> 
> ----------------------------------------------------------------
> Dan Carpenter (1):
>       ASoC: SOF: ipc3-dtrace: uninitialized data in dfsentry_trace_filter_write()
> 
> Derek Fang (1):
>       ASoC: rt5640: Fix the issue of speaker noise
> 
> Fabio Estevam (1):
>       ASoC: fsl_sai: Revert "ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode"
> 
> Geert Uytterhoeven (1):
>       ASoC: codecs: SND_SOC_WCD934X should select REGMAP_IRQ
> 
> Johan Hovold (15):
>       ASoC: codecs: wcd938x: fix codec initialisation race
>       ASoC: codecs: wcd938x: fix mbhc impedance loglevel
>       ASoC: codecs: wcd938x: drop inline keywords
>       ASoC: codecs: wcd938x: use dev_printk() for impedance logging
>       ASoC: codecs: wcd934x: demote impedance printk
>       ASoC: codecs: wcd934x: drop inline keywords
>       ASoC: codecs: wcd938x: fix soundwire initialisation race
>       ASoC: codecs: wcd938x: fix missing mbhc init error handling
>       ASoC: qdsp6: audioreach: fix topology probe deferral
>       ASoC: codecs: wcd938x: fix missing clsh ctrl error handling
>       ASoC: codecs: wcd938x: fix resource leaks on component remove
>       ASoC: codecs: wcd934x: fix resource leaks on component remove
>       ASoC: codecs: wcd-mbhc-v2: fix resource leaks on component remove
>       ASoC: topology: suppress probe deferral errors
>       ASoC: core: suppress probe deferral errors
> 
> Mario Limonciello (1):
>       ASoC: amd: ps: Fix extraneous error messages
> 
> Mark Brown (3):
>       ASoC: codecs: wcd938x/wcd934x: loglevel fix and
>       ASoC/soundwire/qdsp6/wcd: fix leaks and probe deferral
>       ASoC: Merge v6.5-rc2
> 
> Martin Povi¹er (1):
>       MAINTAINERS: Redo addition of ssm3515 to APPLE SOUND
> 
> Mastan Katragadda (1):
>       ASoC: SOF: amd: add revision check for sending sha dma completion command
> 
> Matthias Reichl (1):
>       ASoC: hdmi-codec: fix channel info for compressed formats
> 
> Matus Gajdos (1):
>       ASoC: fsl_sai: Disable bit clock with transmitter
> 
> Nathan Chancellor (1):
>       ASoC: cs35l45: Select REGMAP_IRQ
> 
> Rob Herring (1):
>       ASoC: dt-bindings: audio-graph-card2: Drop incomplete example
> 
> Rohit kumar (1):
>       ASoC: dt-bindings: Update maintainer email id
> 
> Sameer Pujar (1):
>       ASoC: rt5640: Fix sleep in atomic context
> 
> Sheetal (2):
>       ASoC: tegra: Fix AMX byte map
>       ASoC: tegra: Fix ADX byte map
> 
> Shuming Fan (1):
>       ASoC: rt5645: check return value after reading device id
> 
> Srinivas Kandagatla (4):
>       ASoC: qdsp6: q6apm: use dai link pcm id as pcm device number
>       ASoC: qcom: q6afe-dai: fix Display Port Playback stream name
>       ASoC: codecs: wcd938x: fix dB range for HPHL and HPHR
>       ASoC: qcom: q6apm: do not close GPR port before closing graph
> 
> Thomas Petazzoni (1):
>       ASoC: cs42l51: fix driver to properly autoload with automatic module loading
> 
> Vijendar Mukunda (6):
>       ASoC: amd: ps: add comments for DMA irq bits mapping
>       ASoC: amd: ps: add fix for dma irq mask for rx streams for SDW0 instance
>       ASoC: amd: ps: fix for position register set for AUDIO0 RX stream
>       ASoC: amd: ps: add comments for DMA register mapping
>       ASoC: amd: ps: fix byte count return value for invalid SoundWire manager instance
>       ASoC: amd: acp: fix for invalid dai id handling in acp_get_byte_count()

The shortlog is confusing as if this contains so many changes,
although it's basically only three no-merge commits.

In anyway, I pulled now.  Thanks.


Takashi
