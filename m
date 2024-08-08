Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB7294BD48
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 14:21:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42EDB84D;
	Thu,  8 Aug 2024 14:20:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42EDB84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723119669;
	bh=exOdBfdg4VM52hsXdl1mRTe850gNBB3PNyrq4KhgP9o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RHQo0X36SabDHjvRXFcuBdETBm/bGWIQ/AVmJa5qY8FgBTMkNVqEPGJctm3zWFu/F
	 5tQaFwy2JUDLR6FTfqxnH4YhvxrV0+uPJvfKzExuTQnaNhJkvhD0pGQAskrKO6Ntm2
	 1FSXYt8Am42zotXOr6Eqg44pwWgBLllelXf3abDM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93DF1F805B4; Thu,  8 Aug 2024 14:20:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 699FEF805AE;
	Thu,  8 Aug 2024 14:20:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBB3BF80236; Thu,  8 Aug 2024 14:07:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,TIME_LIMIT_EXCEEDED,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 601ECF80236
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 14:02:25 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 3403E36283;
	Thu,  8 Aug 2024 14:02:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 3403E36283
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1723118545; bh=kMUMEW3ImDplg1v0AnjB9CjDxOxAGshFk4BDonEmUuI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vBN2iYbifVaMXCNevpfjls5s5W28zv4JKTcWd8mDhoGqtZ+rqFhU7tNL1LSuq5gv9
	 UWTt2Yg6K38AUU2uARfObLJRo/YzvodqD30c+rxR/1bfvLoeJA5Cp3/rtGwsvQ9Ite
	 dI5FV1pCfCFeW0b2s5TWxP5jyC8sDDAfGbDPjwTg=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu,  8 Aug 2024 14:02:11 +0200 (CEST)
Message-ID: <116041ee-7139-4b77-89be-3a68f699c01b@perex.cz>
Date: Thu, 8 Aug 2024 14:02:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] ALSA: compress: add Sample Rate Converter codec
 support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <1722940003-20126-1-git-send-email-shengjiu.wang@nxp.com>
 <1722940003-20126-2-git-send-email-shengjiu.wang@nxp.com>
 <e89a56bf-c377-43d8-bba8-6a09e571ed64@linux.intel.com>
 <CAA+D8AN9JXJr-BZf8aY7d4rB6M60pXS_DG=qv=P6=2r1A18ATA@mail.gmail.com>
 <ffa85004-8d86-4168-b278-afd24d79f9d8@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Content-Language: en-US
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <ffa85004-8d86-4168-b278-afd24d79f9d8@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FA5JAP67JLPR3XMDI3D3DN7DX34YKGOO
X-Message-ID-Hash: FA5JAP67JLPR3XMDI3D3DN7DX34YKGOO
X-MailFrom: perex@perex.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FA5JAP67JLPR3XMDI3D3DN7DX34YKGOO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08. 08. 24 13:27, Pierre-Louis Bossart wrote:
> 
> 
> On 8/8/24 11:17, Shengjiu Wang wrote:
>> On Tue, Aug 6, 2024 at 7:25 PM Pierre-Louis Bossart
>> <pierre-louis.bossart@linux.intel.com> wrote:
>>>
>>>
>>>
>>> On 8/6/24 12:26, Shengjiu Wang wrote:
>>>> Add Sample Rate Converter(SRC) codec support, define the output
>>>> format and rate for SRC.
>>>>
>>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>>>> ---
>>>>   include/uapi/sound/compress_offload.h | 2 ++
>>>>   include/uapi/sound/compress_params.h  | 9 ++++++++-
>>>>   2 files changed, 10 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
>>>> index 98772b0cbcb7..8b2b72f94e26 100644
>>>> --- a/include/uapi/sound/compress_offload.h
>>>> +++ b/include/uapi/sound/compress_offload.h
>>>> @@ -112,10 +112,12 @@ struct snd_compr_codec_caps {
>>>>    * end of the track
>>>>    * @SNDRV_COMPRESS_ENCODER_DELAY: no of samples inserted by the encoder at the
>>>>    * beginning of the track
>>>> + * @SNDRV_COMPRESS_SRC_RATIO_MOD: Resampling Ratio Modifier for sample rate converter
>>>>    */
>>>>   enum sndrv_compress_encoder {
>>>>        SNDRV_COMPRESS_ENCODER_PADDING = 1,
>>>>        SNDRV_COMPRESS_ENCODER_DELAY = 2,
>>>> +     SNDRV_COMPRESS_SRC_RATIO_MOD = 3,
>>>>   };
>>>
>>> this sounds wrong to me. The sample rate converter is not an "encoder",
>>> and the properties for padding/delay are totally specific to an encoder
>>> function.
>>
>> There is only decoder and encoder definition for compress,  I know
>> it is difficult to add SRC to encoder or decoder classification,
>> SRC is a Post Processing.  I hope you can have a recommandation
> 
> I don't. I think we're blurring layers in a really odd way.
> 
> The main reason why the compress API was added is to remove the
> byte-to-time conversions. But that's clearly not useful for a
> post-processing of PCM data, where the bitrate is constant. It really
> feels like we're adding this memory-to-memory API to the compress
> framework because we don't have anything else available, not because it
> makes sense to do so.

It makes sense to offload decoder/encoder tasks as batch processing for 
standard compress stream and return back result (PCM stream or encoded stream) 
to user space. So it makes sense to use the compress interface (parameters 
handshake) for it. Let's talk about the proper SRC extension.

For SRC and dynamic rate modification. I would just create an ALSA control for 
this. We are already using the "PCM Rate Shift 100000" control in the 
sound/drivers/aloop.c for this purpose (something like pitch in MIDI) for 
example. There is no requirement to add this function through metadata ioctls. 
As bonus, this control can be monitored with multiple tasks.

> Then there's the issue of parameters, we chose to only add parameters
> for standard encoders/decoders. Post-processing is highly specific and
> the parameter definitions varies from one implementation to another -
> and usually parameters are handled in an opaque way with binary
> controls. This is best handled with a UUID that needs to be known only
> to applications and low-level firmware/hardware, the kernel code should
> not have to be modified for each and every processing and to add new
> parameters. It just does not scale and it's unmaintainable.
> 
> At the very least if you really want to use this compress API, extend it
> to use a non-descript "UUID-defined" type and an opaque set of
> parameters with this UUID passed in a header.

We don't need to use UUID-defined scheme for simple (A)SRC implementation. As 
I noted, the specific runtime controls may use existing ALSA control API.

					Jaroslav


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

