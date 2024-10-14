Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B60499C6AE
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2024 12:06:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD6E984A;
	Mon, 14 Oct 2024 12:06:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD6E984A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728900406;
	bh=c1Vkmd+5IoIQPTf+Vi9rkDqlGgCX1fUHs6YcdbpMwkI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RALe5PeLOXRV0PcCzjaC+XR47k7jJZcUvvGtQCXtL6rFjfqiAL53pp97oetBXBUML
	 8bP7wBV6MFb4jcyHAoIutI8R+IT7LUc02kVYbAii+/hKWtVAYk3VN1+yGHoEV3jqlL
	 kxAmwmo8KYfa1O+TWGUk/mSAxkgruZClUqltqmfs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BAFFF805AD; Mon, 14 Oct 2024 12:06:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ADCB6F805B0;
	Mon, 14 Oct 2024 12:06:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DAB3F80448; Mon, 14 Oct 2024 12:06:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B23DF80104
	for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2024 12:06:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B23DF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=D7+QpBvu;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=yruzElfm;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=D7+QpBvu;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=yruzElfm
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4AF2B1F391;
	Mon, 14 Oct 2024 10:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1728900368;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wIPs40LitxG6Lhr1hU0tbJr+s6Q3AQ5cu6mKJD/Pc1Y=;
	b=D7+QpBvuErvdhPAbubxdV1BAkozfi7Eyh9/jt0dhNw1cvNi22MNs+PLA0M+pvtUWba1ZGS
	2PeRSkyYt7MHPixNvqjWqarYwaEyUMj+i6BRVobAKhVa3Z6+hGfwAlzDwKy8w82Y/NrPfH
	RfEOOpMv3INsRpmyjUG0VLhXNQUGRMU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728900368;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wIPs40LitxG6Lhr1hU0tbJr+s6Q3AQ5cu6mKJD/Pc1Y=;
	b=yruzElfm380E+/Bl41LJJlRXJjjOz1+nXe6N5dqokp76lKnSOHdp5jx+d9HFTdHcG07IRz
	ZNH2oR/Vq4YL1XBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1728900368;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wIPs40LitxG6Lhr1hU0tbJr+s6Q3AQ5cu6mKJD/Pc1Y=;
	b=D7+QpBvuErvdhPAbubxdV1BAkozfi7Eyh9/jt0dhNw1cvNi22MNs+PLA0M+pvtUWba1ZGS
	2PeRSkyYt7MHPixNvqjWqarYwaEyUMj+i6BRVobAKhVa3Z6+hGfwAlzDwKy8w82Y/NrPfH
	RfEOOpMv3INsRpmyjUG0VLhXNQUGRMU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728900368;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wIPs40LitxG6Lhr1hU0tbJr+s6Q3AQ5cu6mKJD/Pc1Y=;
	b=yruzElfm380E+/Bl41LJJlRXJjjOz1+nXe6N5dqokp76lKnSOHdp5jx+d9HFTdHcG07IRz
	ZNH2oR/Vq4YL1XBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C852013A51;
	Mon, 14 Oct 2024 10:06:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8m0BLw/tDGedFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 14 Oct 2024 10:06:07 +0000
Date: Mon, 14 Oct 2024 12:07:05 +0200
Message-ID: <87cyk3j8vq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 0/7] ASoC: fsl: add memory to memory function for ASRC
In-Reply-To: <1727247316-16156-1-git-send-email-shengjiu.wang@nxp.com>
References: <1727247316-16156-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,alsa-project.org,vger.kernel.org,gmail.com,lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
Message-ID-Hash: PW23T4BIUIILH6SC6W65LQNE5K7TU4UB
X-Message-ID-Hash: PW23T4BIUIILH6SC6W65LQNE5K7TU4UB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PW23T4BIUIILH6SC6W65LQNE5K7TU4UB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 25 Sep 2024 08:55:09 +0200,
Shengjiu Wang wrote:
> 
> This function is base on the accelerator implementation
> for compress API:
> https://patchwork.kernel.org/project/alsa-devel/patch/20240731083843.59911-1-perex@perex.cz/
> Add it to this patch set.
> 
> Audio signal processing also has the requirement for memory to
> memory similar as Video.
> 
> This asrc memory to memory (memory ->asrc->memory) case is a non
> real time use case.
> 
> User fills the input buffer to the asrc module, after conversion, then asrc
> sends back the output buffer to user. So it is not a traditional ALSA playback
> and capture case.
> 
> Because we had implemented the "memory -> asrc ->i2s device-> codec"
> use case in ALSA.  Now the "memory->asrc->memory" needs
> to reuse the code in asrc driver, so the patch 1 and patch 2 is for refining
> the code to make it can be shared by the "memory->asrc->memory"
> driver.
> 
> Other change is to add memory to memory support for two kinds of i.MX ASRC
> modules.
> 
> changes in v4:
> - remove the RFC tag, no comments receive in v3
> - Add Jaroslav Kysela's patch in this patch set. because it may be
>   better for reviewing in a full patch set.
> - Fix the list_for_each_entry_reverse to list_for_each_entry_safe_reverse
> - Fix some coding style issues in Jaroslav Kysela's patch
> 
> changes in v3:
> - use Jaroslav's suggestion for header file compress_params.h (PATCH 01)
> - remove the ASRC_OUTPUT_FORMAT/ASRC_OUTPUT_RATE definition
> - remove ASRC_RATIO_MOD in this version because it uses .set_metadata()
>   Will wait Jaroslav's update or other better method in the future.
> - Address some comments from Pierre.
> 
> changes in v2:
> - Remove the changes in compress API
> - drop the SNDRV_COMPRESS_SRC_RATIO_MOD
> - drop the SND_AUDIOCODEC_SRC and struct snd_dec_src
> - define private metadata key value
>   ASRC_OUTPUT_FORMAT/ASRC_OUTPUT_RATE/ASRC_RATIO_MOD
> 
> Jaroslav Kysela (1):
>   ALSA: compress_offload: introduce accel operation mode
> 
> Shengjiu Wang (6):
>   ALSA: compress: Add output rate and output format support
>   ASoC: fsl_asrc: define functions for memory to memory usage
>   ASoC: fsl_easrc: define functions for memory to memory usage
>   ASoC: fsl_asrc_m2m: Add memory to memory function
>   ASoC: fsl_asrc: register m2m platform device
>   ASoC: fsl_easrc: register m2m platform device
> 
>  .../sound/designs/compress-accel.rst          | 136 ++++
>  include/sound/compress_driver.h               |  46 ++
>  include/uapi/sound/compress_offload.h         |  63 +-
>  include/uapi/sound/compress_params.h          |  23 +-
>  sound/core/Kconfig                            |   3 +
>  sound/core/compress_offload.c                 | 351 ++++++++-
>  sound/soc/fsl/Kconfig                         |   1 +
>  sound/soc/fsl/Makefile                        |   2 +-
>  sound/soc/fsl/fsl_asrc.c                      | 179 ++++-
>  sound/soc/fsl/fsl_asrc.h                      |   2 +
>  sound/soc/fsl/fsl_asrc_common.h               |  70 ++
>  sound/soc/fsl/fsl_asrc_m2m.c                  | 727 ++++++++++++++++++
>  sound/soc/fsl/fsl_easrc.c                     | 261 ++++++-
>  sound/soc/fsl/fsl_easrc.h                     |   4 +
>  14 files changed, 1851 insertions(+), 17 deletions(-)
>  create mode 100644 Documentation/sound/designs/compress-accel.rst
>  create mode 100644 sound/soc/fsl/fsl_asrc_m2m.c

Are there any objections against this basic design and ABI?

The details of the implementations can be changed in future, but the
basic design and the ABI must be set in stone before merging.


thanks,

Takashi
