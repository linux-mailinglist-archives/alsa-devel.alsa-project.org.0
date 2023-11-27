Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F7B7F9CD1
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 10:38:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC7AD84D;
	Mon, 27 Nov 2023 10:38:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC7AD84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701077923;
	bh=JWtKJkDoc/ei7BMVCwqYvyqzNHOvuUtot2C810by7l0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jE+fqK0uIogIk+eqsr8+CeeW/Juf5Gf5cpXZo9h60v45Je2UAkLIX7yr/E+lX7pvJ
	 65kaIE5uI5FYBsOEjDQ2jAsjzEdp8YwY2wiyee4pTvEtYVEzWDpd31eGySvx8OSWSi
	 69JybWXajhLTHbHgjWkaW694RY2Xt8s1BsfSQ3qY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4923F80587; Mon, 27 Nov 2023 10:38:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8276F80571;
	Mon, 27 Nov 2023 10:38:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 752EDF801D5; Mon, 27 Nov 2023 10:38:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 905A6F80104
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 10:37:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 905A6F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Tpc9ICiv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=HQKEiiZn
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2E63C20127;
	Mon, 27 Nov 2023 09:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1701077869;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fhcx4H15kvG3el0b2VrCwe4+o2JrhZEvX+Pb94sy4rw=;
	b=Tpc9ICiv77P3nCJmgNcpsSAOLvxjQGb+ixQ2h5Gv1UJDTwNO/JLf0uideG1dng8zSFnLdR
	suhbRXN2VDASCEsf11Cqii4gM7v35OfAvaKW+wK111ePO3xR1kwItwbC7rAsceyTQezMed
	0h85Mk9PUzRZqEHdZw7mie/THI0DjIg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1701077869;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fhcx4H15kvG3el0b2VrCwe4+o2JrhZEvX+Pb94sy4rw=;
	b=HQKEiiZnTgtitVJI52SanYcgNJE7RVlp9rgkWU7ofZ5osfHXP3ZIcObtJSk8OzNPtgXrab
	6srcTABbtWOB0GDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CFBFB1379A;
	Mon, 27 Nov 2023 09:37:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0EJ1MGxjZGWJRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 Nov 2023 09:37:48 +0000
Date: Mon, 27 Nov 2023 10:37:48 +0100
Message-ID: <871qcbr0yb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com
Subject: Re: [PATCH v5 00/16] ALSA/ASoC: hda: Address format selection
 limitations and ambiguity
In-Reply-To: <20231117120610.1755254-1-cezary.rojewski@intel.com>
References: <20231117120610.1755254-1-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-3.26 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.16)[-0.781];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
Message-ID-Hash: YI36IG2L5XTWSXPXBI2D3WFBGOQZFKZX
X-Message-ID-Hash: YI36IG2L5XTWSXPXBI2D3WFBGOQZFKZX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YI36IG2L5XTWSXPXBI2D3WFBGOQZFKZX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 17 Nov 2023 13:05:54 +0100,
Cezary Rojewski wrote:
> 
> Patchset aims to address format selection restrictions present currently
> in the HDAudio library. Formats which we are concerned about are 20 and
> 24 valid bits per sample within 32 bit depth container. One may identify
> them as S20_LE and S24_LE except that those, according to comments found
> in include/uapi/sound/asound.h, are for LSB-aligned scenarios. HDAudio
> streams expect MSB-aligned data, no matter if we are speaking of HOST
> (SDxFMT) or LINK (PPLCxFMT) side - chapter 4.5.1 of the public HDAudio
> specification. In short, S20_LE and S24_LE are invalid options.
> 
> Right now, given the implementation of snd_hdac_query_supported_pcm() 
> within sound/hda/hdac_device.c, even if a codec responds with: "I
> support all possible formats specified within HDAudio specification",
> there will be no option to open a 20/32 or 24/32 stream. The kernel will
> force the stream to be opened using the highest available bit depth.
> 
> After discussing subject initially with Jaroslav and Takashi, suggestion
> was made to utilize 'subformat' option to address the problem. The
> eye-opening discussion begun much earlier though, in 2019 [1].
> 
> Paired with PRs for alsa-utils [2] and alsa-lib [3].
> 
> 
> Flow of changes:
> 
> The very first patch adds MSBITS subformat options to allow for granular
> 20/32, 24/32 and 32/32 format selection. The next two make sure
> subformat is actually honored during runtime. Most of that code is based
> on format-related API.
> 
> Follow up is upgrade to the hda stream-format interface - several
> functions are added to make the granular format selection simple in the
> HDAudio world. Core of the implementation is based on the existing
> snd_hdac_calc_stream_format(). The next ten patches are straightforward
> switch from one interface to another with cleanup of now-unsed function
> as a finishing touch.
> 
> Last but not least - the avs-driver, on which the problem analyzed and
> debugged, is updated to no longer acknowledge S24_LE as a valid format
> option.
> 
> Results with skylake-driver and snd_hda_intel show status quo on our
> RVPs. PR filed on SOF github shows promising results too [4].
> 
> 
> Changes in v5:
> - reworded 'bps' to 'bits' in all occurrences.
> - fixed an issue of MSBITS_MAX not being reported for S32_LE as reported
>   by Jaroslav
> - snd_pcm_subformat_width() has been inlined into its only user:
>   snd_pcm_hw_params_bits() as suggested by Jaroslav.
> - updated commit messege for patch 01 as it was out of date given the
>   recent updates.
> 
> Changes in v4:
> - fixed compilation issues in sof-driver, patch 12/16, reported by ikp
> - fixed sparse warnings in patch 01/16, reported by ikp
> - updated commit message for patch 03: "ASoC pcm: Honor subformat when
>   configuring runtime", as snd_pcm_hw_copy() is gone since revision v3.
> 
> Changes in v3:
> - merged the first two patches as suggested by Jaroslav
> - re-authored patch 01 to Jaroslav, added my Co-developed-by.
> - added Jaroslav' Co-developed-by to patch 02.
> - 'subformats' field now S32_LE-specific. Given the fact that it is the
>   only format currently requiring subformat-intervention, functionality
>   is narrowed to reduce amount of memory allocations and cleanup.
>   Suggested by Jaroslav.
> - note to the above: the hdaudio part converted 1:1 as requested, patch
>   02/16
> - note #2: alsa part converted to S32_LE-specific yet without addition
>   of the chicken bit. Instead, struct snd_pcm_hardware is updated with
>   u32 subformat mask to do the job.
> - ALSA-core additions in form of snd_pcm_subformat_width() and
>   snd_pcm_hw_params_bps() relocated from 01/16 to the user, patch 05.
> 
> Changes in v2:
> - patch 01/17, introduced struct snd_pcm_subformat which task is to
>   represent subformat-mask on per format basis. Expectation is that
>   manipulated arrays of subformats always end with a sentinel entry
> - patch 01/17, added snd_pcm_hw_copy() as the copying snd_pcm_hardware
>   becomes non-trivial
> - patch 02/17, added hw_rule that produces final subformat mask
>   based on provided formats as suggested by Jaroslav
> - patch 04/17, soc_pcm_hw_update_subformat() refactored as the subformat
>   intersection becomes non-trivial
> - relevant functions releasing resources occupied by hda_pcm and
>   snd_pcm_runtime updated to also kfree() subformats
> - except for 16/17, no changes to patches past 04/17, retaining acks for
>   these
> 
> Changes in v1:
> - fixed UBSAN due to missing snd_pcm_subformat_names[] entries for new
>   subformats
> - as HDMI stream capabilities are assigned on PCM open, patch 16/17 has
>   been updated to ignore such codecs for now. A separate patchset will
>   take care of this case
> - params_bps() reworded to snd_pcm_hw_params_bps()
> - fixed compilation issues in sof-driver, patch 13/17
> 
> 
> [1]: https://lore.kernel.org/alsa-devel/20190905053302.9262-1-pawel.harlozinski@linux.intel.com/
> [2]: https://github.com/alsa-project/alsa-utils/pull/228
> [3]: https://github.com/alsa-project/alsa-lib/pull/342
> [4]: https://github.com/thesofproject/linux/pull/4539
> 
> Cezary Rojewski (15):
>   ALSA: hda: Honor subformat when querying PCMs
>   ASoC: pcm: Honor subformat when configuring runtime
>   ALSA: hda: Upgrade stream-format infrastructure
>   ALSA: hda: Switch to new stream-format interface
>   ALSA: hda/hdmi: Switch to new stream-format interface
>   ALSA: hda/ca0132: Switch to new stream-format interface
>   ASoC: codecs: hda: Switch to new stream-format interface
>   ASoC: codecs: hdac_hda: Switch to new stream-format interface
>   ASoC: codecs: hdac_hdmi: Switch to new stream-format interface
>   ASoC: Intel Skylake: Switch to new stream-format interface
>   ASoC: SOF: Intel: Switch to new stream-format interface
>   ASoC: Intel: avs: Switch to new stream-format interface
>   ALSA: hda: Drop snd_hdac_calc_stream_format()
>   ASoC: Intel: avs: Kill S24_LE format
>   ASoC: Intel: avs: Unhardcode HDAudio BE DAI drivers description
> 
> Jaroslav Kysela (1):
>   ALSA: pcm: Introduce MSBITS subformat interface

Now the patch 1 became the one from Jaroslav, it's a good move.
Jaroslav, could you take a look at the rest patches?
I'm going to merge this in this week unless any objection comes up.


thanks,

Takashi
