Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE8878567B
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 13:10:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2484A836;
	Wed, 23 Aug 2023 13:09:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2484A836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692789011;
	bh=oqs+y/YnNCWuB7SorAfmLZTKSQEK5ISovbQ40f1Euyg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eo6QSf3U54WlYW5GDpKqmYZg4zcsiGc+H/5eA9Fwvg3f602A0CITF70GkN4+NUPN5
	 0P8eBAW/0syn6SFLd6bd1Ih/dm0FjUeA9cpK4XQqRdNZgfze/+aAUG5s+diIH9PqTD
	 1AyP0bqmx5XY+I5nOT2vdPc+Z0a8vyV2w90saMjE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6236F800BF; Wed, 23 Aug 2023 13:09:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E062F800F5;
	Wed, 23 Aug 2023 13:09:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E253F80158; Wed, 23 Aug 2023 13:08:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F273F80022
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 13:08:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F273F80022
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=WH5w/APK;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ZgIwyIKe
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2553621CF0;
	Wed, 23 Aug 2023 11:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692788927;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=baZ2jrOz05KO6yW9+jUuTn0xPITqH6J2wZsKS9Wd+dc=;
	b=WH5w/APK18246l7xB0UFon9XL2FnPSJ+lmCKnur39MgRzD2eRiFwie4tfblVG8DMfwWhMJ
	73/HYA0WxPRLrKPlQBeGZbH20+XFlqCaCorek81w2pDOOUXeTYTMVZ/EfW1WOQpTSsgI/I
	3kEnjnPa0kuCNy+42HwyBim2mx7f558=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692788927;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=baZ2jrOz05KO6yW9+jUuTn0xPITqH6J2wZsKS9Wd+dc=;
	b=ZgIwyIKeHHUMtZ9EjNbiZKxEUzD50834dJryzauntgyxAiOFB4VXQb2oMipQvsDM1YbHFm
	UAxQDeJZywk0ByDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0C73A13458;
	Wed, 23 Aug 2023 11:08:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id eomUAr/o5WT2KQAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 23 Aug 2023 11:08:47 +0000
Date: Wed, 23 Aug 2023 13:08:46 +0200
Message-ID: <87zg2iggn5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	Cezary Rojewski
 <cezary.rojewski@intel.com>,	broonie@kernel.org,	tiwai@suse.com,
	alsa-devel@alsa-project.org,	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com
Subject: Re: [RFC PATCH 01/17] ALSA: pcm: Introduce MSBITS subformat interface
In-Reply-To: <52b50220-aab0-6df4-6bab-e43d39006c45@perex.cz>
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
	<20230811164853.1797547-2-cezary.rojewski@intel.com>
	<43b25b8b-3e28-bd91-a29a-846a5aa7579e@perex.cz>
	<87bkezdsjh.wl-tiwai@suse.de>
	<67fc99db-baf8-17b0-e7c4-f420676e5c8a@perex.cz>
	<874jkrdr49.wl-tiwai@suse.de>
	<5d77217b-1083-a4d0-1b69-7511d24b6aec@perex.cz>
	<acfcc8a3-8ceb-1671-1dad-35a083354170@intel.com>
	<9d0f0555-411a-96aa-c8a5-382f595a2bbd@perex.cz>
	<871qfuhyog.wl-tiwai@suse.de>
	<85eec185-b024-573e-3fc0-31d179c832a3@perex.cz>
	<dfac60f7-e043-ca57-8005-3a744b0f920e@linux.intel.com>
	<52b50220-aab0-6df4-6bab-e43d39006c45@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EYTVKZRARDJG7A6ZKGHOVTR66XOOGSRZ
X-Message-ID-Hash: EYTVKZRARDJG7A6ZKGHOVTR66XOOGSRZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EYTVKZRARDJG7A6ZKGHOVTR66XOOGSRZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 23 Aug 2023 12:47:33 +0200,
Jaroslav Kysela wrote:
> 
> On 23. 08. 23 12:20, Amadeusz S³awiñski wrote:
> > On 8/23/2023 12:00 PM, Jaroslav Kysela wrote:
> >> On 23. 08. 23 11:53, Takashi Iwai wrote:
> >>> On Wed, 23 Aug 2023 11:10:38 +0200,
> >>> Jaroslav Kysela wrote:
> >>>> 
> >>>> On 23. 08. 23 10:11, Cezary Rojewski wrote:
> >>>>> On 2023-08-22 9:03 PM, Jaroslav Kysela wrote:
> >>>>>> On 22. 08. 23 17:38, Takashi Iwai wrote:
> >>>>>>> On Tue, 22 Aug 2023 17:29:47 +0200,
> >>>>>>> Jaroslav Kysela wrote:
> >>>>>>>> 
> >>>>>>>> On 22. 08. 23 17:07, Takashi Iwai wrote:
> >>>>>>>>> On Tue, 22 Aug 2023 17:03:02 +0200,
> >>>>>>>>> Jaroslav Kysela wrote:
> >>>>>>>>>> 
> >>>>>>>>>> On 11. 08. 23 18:48, Cezary Rojewski wrote:
> >>>>>>>>>> 
> >>>>>>>>>>> +#define SNDRV_PCM_SUBFMTBIT_MSBITS_32
> >>>>>>>>>>> _SNDRV_PCM_SUBFMTBIT(MSBITS_32)
> >>>>>>>>>> 
> >>>>>>>>>> What was reason to add 32/32 format ? Subformat STD + msbits == 32
> >>>>>>>>>> should already handle the maximal resolution. Until we do not
> >>>>>>>>>> have 64
> >>>>>>>>>> bit formats, it seems like an useless extension.
> >>>>>>>>> 
> >>>>>>>>> My understanding is to distinguish the cases "we do fully support
> >>>>>>>>> 32bit" and "we don't care".  But, the end effect is same for both,
> >>>>>>>>> user-space would handle 32bit in both cases, so this difference
> >>>>>>>>> won't
> >>>>>>>>> help much, indeed.
> >>>>>>>> 
> >>>>>>>> I don't think that we have a "do not care" situation. The
> >>>>>>>> applications
> >>>>>>>> currently expects to use the maximal msbits for STD subformat. The
> >>>>>>>> subformat should be used only to refine (downgrade) the
> >>>>>>>> resolution on
> >>>>>>>> the driver / hw side on demand. I would just add only necessary API
> >>>>>>>> extensions and save one bit for now.
> >>>>>>> 
> >>>>>>> Well, the current behavior (with STD) is to choose whatever 32bit
> >>>>>>> format the driver supports, and the driver may set a different value
> >>>>>>> of hw_params.msbits at hw_params.  The explicit MSBITS_32 would
> >>>>>>> enforce the hw_params.msbits to be 32, otherwise hw_refine would
> >>>>>>> fail.  So I see a potential difference.
> >>>>>> 
> >>>>>> I see. But if our target is to create a complete query/set msbits API,
> >>>>>> we should cover all cases also for other formats.
> >>>>>> 
> >>>>>> I vote to replace SUBFMTBIT_MSBITS_32 to SUBFMTBIT_MSBITS_MAX as the
> >>>>>> second bit (right after STD). The format hw parameter already defines
> >>>>>> the maximal width. We can add SUBFMTBIT_MSBITS_32 when it's really
> >>>>>> required. Note that MAX should be handled for all cases (not only for
> >>>>>> S32_LE or so).
> >>>>> 
> >>>>> In my opinion STD already states "max". The word is not explicit either
> >>>>> - max in the eyes of whom? The driver'? Then the driver may reply: max
> >>>>> allowed e.g.: 24/32. And that translates to: fallback to STD.
> >>>> 
> >>>> Max in the contents of the physical sample format (S32 = 32 bits, S24
> >>>> = 24 bits, S8 = 8 bits etc). It would mean, if the driver supports S32
> >>>> but only with 24-bit resolution, this bit should not be
> >>>> set/allowed. We can also use word full or something other. If we like
> >>>> to extend the API in this way (force the specific msbits with the
> >>>> error handling), all formats should be covered. For STD - see
> >>>> Takashi's reply.
> >>> 
> >>> I think MAX can be problematic when the device supports multiple
> >>> formats, say, 16bit and 32bit.  Then it's not clear which MAX points
> >>> to: is 16bit max or 32bit max.
> >> 
> >> I don't take this point. The subformat depends on the format, thus if
> >> one format support max, it should be set for queries.
> >> 
> >> Theoretically, this problem is in this API extension proposal too.
> >> Imagine that driver/hw support S24 and S32 formats and 20-bit msbits for
> >> one of them. How do you handle this? The subformat depends on format and
> >> should be refined when the format is known (single choice).
> >> 
> >>> I find the subformat extension OK, as this doesn't need much change in
> >>> API.  OTOH, if we want to be more consistent way, we may extend
> >>> hw_params for a new interval, e.g. SNDRV_PCM_HW_PARAM_MSBITS, and let
> >>> the driver choosing it.  This will need more hw_params rules and
> >>> become more complex, but it allows drivers really exotic setups (like
> >>> 19bit PCM :)  But my gut feeling is that the subformat extension
> >>> should suffice.
> >> 
> >> I'm not ok with 32 == 32. We should handle this case universally or
> >> discard.
> >> 
> >>                       Jaroslav
> >> 
> > 
> > The reason for MSBITS32 is that, when only MSBITS_20 and MSBITS_24 are
> > defined, when userspace (in this case aplay) asks for usable formats and
> > subformat it gets something like:
> > 
> > --------------------
> > ACCESS: MMAP_INTERLEAVED RW_INTERLEAVED
> > FORMAT: S16_LE S32_LE
> > SUBFORMAT: STD MSBITS_20 MSBITS_24
> > SAMPLE_BITS: [16 32]
> > FRAME_BITS: [32 64]
> > CHANNELS: 2
> > RATE: 48000
> > 
> > when MSBITS_32 is not defined it is not clear if HW supports 24 or 32
> > bits as maximum possible value of msbits. However when MSBITS_32 is
> > defined it is clear - in the above case maximum possible bps then is 24,
> > because MSBITS_32 is missing in output.
> > 
> > STD behaves as before and takes maximum possible value - in above case
> > it is 24.
> 
> This example is nice for S32_LE but not S16_LE. With the max/full bit,
> we can already cover also S16_LE (so that the application can ask for
> the maximal msbits which fits to the physical format for S16_LE). It
> would be also a preparation for future, when we need to deal with more
> msbits combos (like 14bit or 15bit samples stored in the bigger
> physical words) etc.
> 
> So application can set those parameters for in your case:
> 
> S16_LE + STD         (maximum bits handled by driver - 16 in this case)
> S16_LE + MSBITS_MAX  (maximum physical bits for the format - 16)
> S32_LE + STD         (maximum bits handled by driver - 24 in this case)
> S32_LE + MSBITS_MAX  (maximum physical bits for the format - 32)
> S32_LE + MSBITS_24
> S32_LE + MSBITS_20
> 
> Dtto for other format like S8, S24 etc. Another way is to define
> MSBITS_8, MSBITS_16 etc. But I'd prefer to save subformat bits. The
> MSBITS_MAX would cover almost all cases for now.

It becomes a bit tricky if we have a device that has 24bit bps on
32bit format and 16bit bps / 16bit format.  Both formats and
subformats are bitmaps in hw_params, and initially formats bitmap is
16|24 and subformats bitmap is MAX|24.

Now, suppose that app determines to use 16bit.  Then we need to we
need to update subformats bitmap to MAX by dropping 24.  OTOH, if app
chooses 32bit format, subformats will be 24 by dropping MAX, as we
don't support 32 bps.  And, it's not so trivial to achieve this
commonly only with the single subformats bitmap of snd_pcm_hardware,
as the meaning of MAX depends on the chosen format.

Meanwhile, if the subformats bitmap is with explicit bit flags,
i.e. 24|16, we can reduce the bitmap easily depending on the format.

But, OTOH, having all subformat bits is cumbersome, as you mentioned.
Hmm...


Takashi
