Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D316951A83
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2024 14:02:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21B9E2972;
	Wed, 14 Aug 2024 14:02:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21B9E2972
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723636959;
	bh=pT803Kq6Wz6RBK3l5cGSiRM04ieGhjqvtUpKHRYq2bU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iTiiXoSp+Dv8avYVh+AFJreVTIiIRy5f1h04a9RqcPQ7wFhPWUhbqXxOjd+t/JFwM
	 7pMIDWoXBc+1q6C2CDGM1TYsqniIlZppotFtDPM4otrrGGqn/pCYp0NtWDFrkQKZz+
	 KY7oYOT9q+V1NDbv0aMSzX6od9mOqMCwV0p+882g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 843DAF805BD; Wed, 14 Aug 2024 14:02:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DDCEDF80301;
	Wed, 14 Aug 2024 14:02:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E517CF80423; Wed, 14 Aug 2024 13:58:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54DF3F80107
	for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2024 13:58:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54DF3F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dWELGEgu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723636713; x=1755172713;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pT803Kq6Wz6RBK3l5cGSiRM04ieGhjqvtUpKHRYq2bU=;
  b=dWELGEguOqDQkdEY0SfZi8hupLO2Xu98OTOFXpy0EA8OTAoO8u92Nli0
   nYkgaY1j/WDL+WzD6EIppwwqPeQGO2J+4BT8j+JIlmxuvRzrPZYrqp8My
   22RxJCKsTq49Z6yDQ9d5f4fusReAnsBW8T3iGzprv4y8rCdQdYLTXVdEF
   GyZYAqtmfW9/v6D5lMTlUW5pzJbliJBQBKeMQRukiRxw7BnftWjnza2MC
   1U4Nb+vRUtPYlRAsTe1FzM6W1rj1uudx+k1rGMfVtuorTlenCDvYVkS4I
   908V6SSbUoNPchvyuRLSUBl5pasb8Y5Pts3WYZxx5raIo/oiOFlpK5xsR
   w==;
X-CSE-ConnectionGUID: JPQPVsbNTvSozJ40zyMS9w==
X-CSE-MsgGUID: TtBRiObLTGe2VtirEAQEIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="32470835"
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800";
   d="scan'208";a="32470835"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 04:58:28 -0700
X-CSE-ConnectionGUID: NpMJ2d0JRAuj66NXJE42xw==
X-CSE-MsgGUID: p7bfGS0/Tvae6Eglw6n09Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800";
   d="scan'208";a="58956636"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.246.67])
 ([10.245.246.67])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 04:58:24 -0700
Message-ID: <55a82ba3-1c33-4d1b-9f5f-8af33d76222f@linux.intel.com>
Date: Wed, 14 Aug 2024 13:58:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] ALSA: compress: add Sample Rate Converter codec
 support
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 vkoul@kernel.org, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org, linuxppc-dev@lists.ozlabs.org
References: <1722940003-20126-1-git-send-email-shengjiu.wang@nxp.com>
 <e89a56bf-c377-43d8-bba8-6a09e571ed64@linux.intel.com>
 <CAA+D8AN9JXJr-BZf8aY7d4rB6M60pXS_DG=qv=P6=2r1A18ATA@mail.gmail.com>
 <ffa85004-8d86-4168-b278-afd24d79f9d8@linux.intel.com>
 <116041ee-7139-4b77-89be-3a68f699c01b@perex.cz>
 <930bb152-860a-4ec5-9ef0-1c96f554f365@linux.intel.com>
 <c9039808-cd04-452d-9f6c-f91811088456@perex.cz>
 <ed1192e0-00e7-4739-a687-c96dc2d62898@linux.intel.com>
 <CAA+D8AMOh=G7W5-dYw_=Xx-s0PqEu2suKYorscoWku86Rn-=+A@mail.gmail.com>
 <542d47c5-7ce3-4c17-8c0a-3a2b2a9e6c6a@linux.intel.com>
 <c3b8f7b8-fc5e-4285-bee8-7edd448a405d@perex.cz>
 <CAA+D8ANg7C7vuxU44mAG8EnmcZjB_te5N_=4M4v_-Q9ZyPZ49g@mail.gmail.com>
 <2be4303e-58e1-4ad7-92cf-f06fa6fa0f08@perex.cz>
 <7dc039db-ecce-4650-8eb7-96d0cfde09a2@linux.intel.com>
 <CAA+D8AMv=tHV3b-Rfo9Pjqs0bX5SVschD=WD06qxjJOk5zQmiQ@mail.gmail.com>
 <3cdb2041-59d4-4d43-ac4d-39d7f9640cef@linux.intel.com>
 <CAA+D8APSrH_pum6Cm0YxDzWMs4Roi=h1hkBjPMfXocXt7z4oVA@mail.gmail.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <CAA+D8APSrH_pum6Cm0YxDzWMs4Roi=h1hkBjPMfXocXt7z4oVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BLHMEL4WDWAQXMTQ2H55XEMOAHHYSUTH
X-Message-ID-Hash: BLHMEL4WDWAQXMTQ2H55XEMOAHHYSUTH
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BLHMEL4WDWAQXMTQ2H55XEMOAHHYSUTH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/14/24 13:12, Shengjiu Wang wrote:
> On Wed, Aug 14, 2024 at 5:40 PM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>>
>>
>>> Yes, to go further, I think we can use SND_AUDIOCODEC_PCM, then
>>> the SRC type will be dropped.
>>
>> sounds good.
>>
>>> But my understanding of the control means the .set_metadata() API, right?
>>> As I said, the output rate, output format, and ratio modifier are applied to
>>> the instances of ASRC,  which is the snd_compr_stream in driver.
>>> so only the .set_metadata() API can be used for these purposes.
>>
>> Humm, this is more controversial.
>>
>> The term 'metadata' really referred to known information present in
>> headers or additional ID3 tags and not in the compressed file itself.
>> The .set_metadata was assumed to be called ONCE before decoding.
>>
>> But here you have a need to update the ratio modifier on a regular basis
>> to compensate for the drift. This isn't what this specific callback was
>> designed for. We could change and allow this callback to be used
>> multiple times, but then this could create problems for existing
>> implementations which cannot deal with modified metadata on the fly.
> 
> .set_metadata can be called multi times now, no need to change currently.

Not really, this set_metadata() callback is used only for gapless
transitions between tracks, see fcplay.c in tinycompress.

And now I am really confused because tinycompress uses an IOCTL directly:

	metadata.key = SNDRV_COMPRESS_ENCODER_PADDING;
	metadata.value[0] = mdata->encoder_padding;
	if (ioctl(compress->fd, SNDRV_COMPRESS_SET_METADATA, &metadata))

Whereas you want to use the ops callback directly from the control layer?

What would present a userspace program from using the ioctl directly
then? In that case, why do we need the control? I must be missing something.


>> And then there's the problem of defining a 'key' for the metadata. the
>> definition of the key is a u32, so there's plenty of space for different
>> implementations, but a collision is possible. We'd need an agreement on
>> how to allocate keys to different solutions without changing the header
>> file for every implementation.
> 
> Can we define a private space for each case?   For example the key larger
> than 0x80000000 is private, each driver can define it by themself?

that would be a possibility indeed - provided that the opens above are
straightened out.

>> It sounds like we'd need a 'runtime params' callback - unless there's a
>> better trick to tie the control and compress layers?
