Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6487854AC
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 11:55:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 901373E8;
	Wed, 23 Aug 2023 11:54:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 901373E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692784500;
	bh=9yJcwNqfvPeCihOlGujPSIJusXWa2M/LOXpMe6Y71n0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lsoSRHENbN2tvxNHf+r7aRuzSqnoc7X8fj/Wgx2mqtlIYKiQO62VLbKfEHRQh+EIX
	 kYvlotyTzSb3oP2uujQBAsOApjYNC8FwSoGVoe+TkbvUZCSfiGTI5zqNVwyxzR3bUe
	 hCmz8sUifdnLkVkRnMZW2E90Wcpf9I/af91tLaFU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12F29F800D1; Wed, 23 Aug 2023 11:54:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C59CEF800F5;
	Wed, 23 Aug 2023 11:54:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4B1BF80158; Wed, 23 Aug 2023 11:54:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B0D9F800BF
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 11:53:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B0D9F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=TliO5TVv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=GmF7ku7R
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 51C8721F91;
	Wed, 23 Aug 2023 09:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692784432;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NzC1db+Ssq5kFSF1UuTXf/7wrzMs/Mc/H+NhTykml1s=;
	b=TliO5TVvhRYxFhIZZ/i8UrXsukUYiuNyCDPVNpjxZUzmY4bG4QAvXbmKjsUpoEvmcON1f8
	WqqhujkhSilcE+IlRDCm9XMhSLMdiPf+pd+M6MwKvwgMm7ST2lxTzokmVFW1D5380yTBt4
	3H8ImYr+7ho2GE+KQkNrK+QFo43Dy8I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692784432;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NzC1db+Ssq5kFSF1UuTXf/7wrzMs/Mc/H+NhTykml1s=;
	b=GmF7ku7RsAonSctBQU/sKHzv8R3flmQCtVdLqY7tWJT5uEYMFQ/ltl0pVmCQNeV4C7qG5r
	q0pFCHFRT6NMJ/Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 386A61351F;
	Wed, 23 Aug 2023 09:53:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4hJVDTDX5WTZBgAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 23 Aug 2023 09:53:52 +0000
Date: Wed, 23 Aug 2023 11:53:51 +0200
Message-ID: <871qfuhyog.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	broonie@kernel.org,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com
Subject: Re: [RFC PATCH 01/17] ALSA: pcm: Introduce MSBITS subformat interface
In-Reply-To: <9d0f0555-411a-96aa-c8a5-382f595a2bbd@perex.cz>
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
	<20230811164853.1797547-2-cezary.rojewski@intel.com>
	<43b25b8b-3e28-bd91-a29a-846a5aa7579e@perex.cz>
	<87bkezdsjh.wl-tiwai@suse.de>
	<67fc99db-baf8-17b0-e7c4-f420676e5c8a@perex.cz>
	<874jkrdr49.wl-tiwai@suse.de>
	<5d77217b-1083-a4d0-1b69-7511d24b6aec@perex.cz>
	<acfcc8a3-8ceb-1671-1dad-35a083354170@intel.com>
	<9d0f0555-411a-96aa-c8a5-382f595a2bbd@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PQ7IIIU5H3I2QBR7IG2URKHYOUXBU5GE
X-Message-ID-Hash: PQ7IIIU5H3I2QBR7IG2URKHYOUXBU5GE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PQ7IIIU5H3I2QBR7IG2URKHYOUXBU5GE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 23 Aug 2023 11:10:38 +0200,
Jaroslav Kysela wrote:
> 
> On 23. 08. 23 10:11, Cezary Rojewski wrote:
> > On 2023-08-22 9:03 PM, Jaroslav Kysela wrote:
> >> On 22. 08. 23 17:38, Takashi Iwai wrote:
> >>> On Tue, 22 Aug 2023 17:29:47 +0200,
> >>> Jaroslav Kysela wrote:
> >>>> 
> >>>> On 22. 08. 23 17:07, Takashi Iwai wrote:
> >>>>> On Tue, 22 Aug 2023 17:03:02 +0200,
> >>>>> Jaroslav Kysela wrote:
> >>>>>> 
> >>>>>> On 11. 08. 23 18:48, Cezary Rojewski wrote:
> >>>>>> 
> >>>>>>> +#define SNDRV_PCM_SUBFMTBIT_MSBITS_32
> >>>>>>> _SNDRV_PCM_SUBFMTBIT(MSBITS_32)
> >>>>>> 
> >>>>>> What was reason to add 32/32 format ? Subformat STD + msbits == 32
> >>>>>> should already handle the maximal resolution. Until we do not have 64
> >>>>>> bit formats, it seems like an useless extension.
> >>>>> 
> >>>>> My understanding is to distinguish the cases "we do fully support
> >>>>> 32bit" and "we don't care".  But, the end effect is same for both,
> >>>>> user-space would handle 32bit in both cases, so this difference won't
> >>>>> help much, indeed.
> >>>> 
> >>>> I don't think that we have a "do not care" situation. The applications
> >>>> currently expects to use the maximal msbits for STD subformat. The
> >>>> subformat should be used only to refine (downgrade) the resolution on
> >>>> the driver / hw side on demand. I would just add only necessary API
> >>>> extensions and save one bit for now.
> >>> 
> >>> Well, the current behavior (with STD) is to choose whatever 32bit
> >>> format the driver supports, and the driver may set a different value
> >>> of hw_params.msbits at hw_params.  The explicit MSBITS_32 would
> >>> enforce the hw_params.msbits to be 32, otherwise hw_refine would
> >>> fail.  So I see a potential difference.
> >> 
> >> I see. But if our target is to create a complete query/set msbits API,
> >> we should cover all cases also for other formats.
> >> 
> >> I vote to replace SUBFMTBIT_MSBITS_32 to SUBFMTBIT_MSBITS_MAX as the
> >> second bit (right after STD). The format hw parameter already defines
> >> the maximal width. We can add SUBFMTBIT_MSBITS_32 when it's really
> >> required. Note that MAX should be handled for all cases (not only for
> >> S32_LE or so).
> > 
> > In my opinion STD already states "max". The word is not explicit either
> > - max in the eyes of whom? The driver'? Then the driver may reply: max
> > allowed e.g.: 24/32. And that translates to: fallback to STD.
> 
> Max in the contents of the physical sample format (S32 = 32 bits, S24
> = 24 bits, S8 = 8 bits etc). It would mean, if the driver supports S32
> but only with 24-bit resolution, this bit should not be
> set/allowed. We can also use word full or something other. If we like
> to extend the API in this way (force the specific msbits with the
> error handling), all formats should be covered. For STD - see
> Takashi's reply.

I think MAX can be problematic when the device supports multiple
formats, say, 16bit and 32bit.  Then it's not clear which MAX points
to: is 16bit max or 32bit max.

I find the subformat extension OK, as this doesn't need much change in
API.  OTOH, if we want to be more consistent way, we may extend
hw_params for a new interval, e.g. SNDRV_PCM_HW_PARAM_MSBITS, and let
the driver choosing it.  This will need more hw_params rules and
become more complex, but it allows drivers really exotic setups (like
19bit PCM :)  But my gut feeling is that the subformat extension
should suffice.


Takashi
