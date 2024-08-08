Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2724394C2C5
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 18:32:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 380F8828;
	Thu,  8 Aug 2024 18:32:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 380F8828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723134733;
	bh=Axg/Uy31IwweFwefJABAaYAFad3zFGup2HNMHiXLjiA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FGXyNHoDppUnU6vTBsY4z605BIqKvDO60BB7z1W6RSC8Qep9FAz3PE39ylBIXBsNN
	 +FHd0t01vQpWbbe33jAnZH3MkASvK9c3d7l0Ipb/YiqTB+5Jw+szaEKagcCoHZoPyi
	 PfCd6XBXRF2TMd704aTYMLr1Em8IcPnP2VBo5/yc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB932F805AB; Thu,  8 Aug 2024 18:31:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AB59F8047C;
	Thu,  8 Aug 2024 18:31:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BA97F802DB; Thu,  8 Aug 2024 17:53:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E26BCF800E3
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 17:51:52 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 1AA0E3626A;
	Thu,  8 Aug 2024 17:51:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 1AA0E3626A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1723132311; bh=DbY2seQjiWeUCvfuBu0kNHGDdd2h/Q0xoRALsf1TuLo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mlxzOe8M4oDQjwqZBtJvU8BroSIkYakUnmDNrbRaINNDcoj3dmkHx8lFBc7QcirfI
	 7qmIK/sGIsE6oV3dIpdfWL6t5RbrLOeLyH6UuOZO4E1UrJsZ+tGK48hied60E3YOh0
	 zxBrvSJH+iKBDoWXPqnNehSPrftOLDSZk/rOkmdY=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu,  8 Aug 2024 17:51:37 +0200 (CEST)
Message-ID: <c9039808-cd04-452d-9f6c-f91811088456@perex.cz>
Date: Thu, 8 Aug 2024 17:51:36 +0200
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
 <116041ee-7139-4b77-89be-3a68f699c01b@perex.cz>
 <930bb152-860a-4ec5-9ef0-1c96f554f365@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Content-Language: en-US
Autocrypt: addr=perex@perex.cz; keydata=
 xsFNBFvNeCsBEACUu2ZgwoGXmVFGukNPWjA68/7eMWI7AvNHpekSGv3z42Iy4DGZabs2Jtvk
 ZeWulJmMOh9ktP9rVWYKL9H54gH5LSdxjYYTQpSCPzM37nisJaksC8XCwD4yTDR+VFCtB5z/
 E7U0qujGhU5jDTne3dZpVv1QnYHlVHk4noKxLjvEQIdJWzsF6e2EMp4SLG/OXhdC9ZeNt5IU
 HQpcKgyIOUdq+44B4VCzAMniaNLKNAZkTQ6Hc0sz0jXdq+8ZpaoPEgLlt7IlztT/MUcH3ABD
 LwcFvCsuPLLmiczk6/38iIjqMtrN7/gP8nvZuvCValLyzlArtbHFH8v7qO8o/5KXX62acCZ4
 aHXaUHk7ahr15VbOsaqUIFfNxpthxYFuWDu9u0lhvEef5tDWb/FX+TOa8iSLjNoe69vMCj1F
 srZ9x2gjbqS2NgGfpQPwwoBxG0YRf6ierZK3I6A15N0RY5/KSFCQvJOX0aW8TztisbmJvX54
 GNGzWurrztj690XLp/clewmfIUS3CYFqKLErT4761BpiK5XWUB4oxYVwc+L8btk1GOCOBVsp
 4xAVD2m7M+9YKitNiYM4RtFiXwqfLk1uUTEvsaFkC1vu3C9aVDn3KQrZ9M8MBh/f2c8VcKbN
 njxs6x6tOdF5IhUc2E+janDLPZIfWDjYJ6syHadicPiATruKvwARAQABzSBKYXJvc2xhdiBL
 eXNlbGEgPHBlcmV4QHBlcmV4LmN6PsLBjgQTAQgAOBYhBF7f7LZepM3UTvmsRTCsxHw/elMJ
 BQJbzXgrAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEDCsxHw/elMJDGAP/ReIRiRw
 lSzijpsGF/AslLEljncG5tvb/xHwCxK5JawIpViwwyJss06/IAvdY5vn5AdfUfCl2J+OakaR
 VM/hdHjCYNu4bdBYZQBmEiKsPccZG2YFDRudEmiaoaJ1e8ZsiA3rSf4SiWWsbcBOYHr/unTf
 4KQsdUHzPUt8Ffi9HrAFzI2wjjiyV5yUGp3x58ZypAIMcKFtA1aDwhA6YmQ6lb8/bC0LTC6l
 cAAS1tj7YF5nFfXsodCOKK5rKf5/QOF0OCD2Gy+mGLNQnq6S+kD+ujQfOLaUHeyfcNBEBxda
 nZID7gzd65bHUMAeWttZr3m5ESrlt2SaNBddbN7NVpVa/292cuwDCLw2j+fAZbiVOYyqMSY4
 LaNqmfa0wJAv30BMKeRAovozJy62j0AnntqrvtDqqvuXgYirj2BEDxx0OhZVqlI8o5qB6rA5
 Pfp2xKRE8Fw3mASYRDNad08JDhJgsR/N5JDGbh4+6sznOA5J63TJ+vCFGM37M5WXInrZJBM3
 ABicmpClXn42zX3Gdf/GMM3SQBrIriBtB9iEHQcRG/F+kkGOY4QDi4BZxo45KraANGmCkDk0
 +xLZVfWh8YOBep+x2Sf83up5IMmIZAtYnxr77VlMYHDWjnpFnfuja+fcnkuzvvy7AHJZUO1A
 aKexwcBjfTxtlX4BiNoK+MgrjYywzsFNBFvNeCsBEACb8FXFMOw1g+IGVicWVB+9AvOLOhqI
 FMhUuDWmlsnT8B/aLxcRVUTXoNgJpt0y0SpWD3eEJOkqjHuvHfk+VhKWDsg6vlNUmF1Ttvob
 18rce0UH1s+wlE8YX8zFgODbtRx8h/BpykwnuWNTiotu9itlE83yOUbv/kHOPUz4Ul1+LoCf
 V2xXssYSEnNr+uUG6/xPnaTvKj+pC7YCl38Jd5PgxsP3omW2Pi9T3rDO6cztu6VvR9/vlQ8Z
 t0p+eeiGqQV3I+7k+S0J6TxMEHI8xmfYFcaVDlKeA5asxkqu5PDZm3Dzgb0XmFbVeakI0be8
 +mS6s0Y4ATtn/D84PQo4bvYqTsqAAJkApEbHEIHPwRyaXjI7fq5BTXfUO+++UXlBCkiH8Sle
 2a8IGI1aBzuL7G9suORQUlBCxy+0H7ugr2uku1e0S/3LhdfAQRUAQm+K7NfSljtGuL8RjXWQ
 f3B6Vs7vo+17jOU7tzviahgeRTcYBss3e264RkL62zdZyyArbVbK7uIU6utvv0eYqG9cni+o
 z7CAe7vMbb5KfNOAJ16+znlOFTieKGyFQBtByHkhh86BQNQn77aESJRQdXvo5YCGX3BuRUaQ
 zydmrgwauQTSnIhgLZPv5pphuKOmkzvlCDX+tmaCrNdNc+0geSAXNe4CqYQlSnJv6odbrQlD
 Qotm9QARAQABwsF2BBgBCAAgFiEEXt/stl6kzdRO+axFMKzEfD96UwkFAlvNeCsCGwwACgkQ
 MKzEfD96Uwlkjg/+MZVS4M/vBbIkH3byGId/MWPy13QdDzBvV0WBqfnr6n99lf7tKKp85bpB
 y7KRAPtXu+9WBzbbIe42sxmWJtDFIeT0HJxPn64l9a1btPnaILblE1mrfZYAxIOMk3UZA3PH
 uFdyhQDJbDGi3LklDhsJFTAhBZI5xMSnqhaMmWCL99OWwfyJn2omp8R+lBfAJZR31vW6wzsj
 ssOvKIbgBpV/o3oGyAofIXPYzhY+jhWgOYtiPw9bknu748K+kK3fk0OeEG6doO4leB7LuWig
 dmLZkcLlJzSE6UhEwHZ8WREOMIGJnMF51WcF0A3JUeKpYYEvSJNDEm7dRtpb0x/Y5HIfrg5/
 qAKutAYPY7ClQLu5RHv5uqshiwyfGPaiE8Coyphvd5YbOlMm3mC/DbEstHG7zA89fN9gAzsJ
 0TFL5lNz1s/fo+//ktlG9H28EHD8WOwkpibsngpvY+FKUGfJgIxpmdXVOkiORWQpndWyRIqw
 k8vz1gDNeG7HOIh46GnKIrQiUXVzAuUvM5vI9YaW3YRNTcn3pguQRt+Tl9Y6G+j+yvuLL173
 m4zRUU6DOygmpQAVYSOJvKAJ07AhQGaWAAi5msM6BcTU4YGcpW7FHr6+xaFDlRHzf1lkvavX
 WoxP1IA1DFuBMeYMzfyi4qDWjXc+C51ZaQd39EulYMh+JVaWRoY=
In-Reply-To: <930bb152-860a-4ec5-9ef0-1c96f554f365@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GSMR3MYY4TBSYIXO2GDVABSXDJFKSEKD
X-Message-ID-Hash: GSMR3MYY4TBSYIXO2GDVABSXDJFKSEKD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GSMR3MYY4TBSYIXO2GDVABSXDJFKSEKD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08. 08. 24 14:19, Pierre-Louis Bossart wrote:
>   files changed, 10 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/
>>>>>> sound/compress_offload.h
>>>>>> index 98772b0cbcb7..8b2b72f94e26 100644
>>>>>> --- a/include/uapi/sound/compress_offload.h
>>>>>> +++ b/include/uapi/sound/compress_offload.h
>>>>>> @@ -112,10 +112,12 @@ struct snd_compr_codec_caps {
>>>>>>     * end of the track
>>>>>>     * @SNDRV_COMPRESS_ENCODER_DELAY: no of samples inserted by the
>>>>>> encoder at the
>>>>>>     * beginning of the track
>>>>>> + * @SNDRV_COMPRESS_SRC_RATIO_MOD: Resampling Ratio Modifier for
>>>>>> sample rate converter
>>>>>>     */
>>>>>>    enum sndrv_compress_encoder {
>>>>>>         SNDRV_COMPRESS_ENCODER_PADDING = 1,
>>>>>>         SNDRV_COMPRESS_ENCODER_DELAY = 2,
>>>>>> +     SNDRV_COMPRESS_SRC_RATIO_MOD = 3,
>>>>>>    };
>>>>>
>>>>> this sounds wrong to me. The sample rate converter is not an "encoder",
>>>>> and the properties for padding/delay are totally specific to an encoder
>>>>> function.
>>>>
>>>> There is only decoder and encoder definition for compress,  I know
>>>> it is difficult to add SRC to encoder or decoder classification,
>>>> SRC is a Post Processing.  I hope you can have a recommandation
>>>
>>> I don't. I think we're blurring layers in a really odd way.
>>>
>>> The main reason why the compress API was added is to remove the
>>> byte-to-time conversions. But that's clearly not useful for a
>>> post-processing of PCM data, where the bitrate is constant. It really
>>> feels like we're adding this memory-to-memory API to the compress
>>> framework because we don't have anything else available, not because it
>>> makes sense to do so.
>>
>> It makes sense to offload decoder/encoder tasks as batch processing for
>> standard compress stream and return back result (PCM stream or encoded
>> stream) to user space. So it makes sense to use the compress interface
>> (parameters handshake) for it. Let's talk about the proper SRC extension.
>>
>> For SRC and dynamic rate modification. I would just create an ALSA
>> control for this. We are already using the "PCM Rate Shift 100000"
>> control in the sound/drivers/aloop.c for this purpose (something like
>> pitch in MIDI) for example. There is no requirement to add this function
>> through metadata ioctls. As bonus, this control can be monitored with
>> multiple tasks.
> 
> this wouldn't work when the rate is estimated in firmware/hardware,
> which is precisely what the 'asynchronous' part of ASRC does.
> 
> 
>>> Then there's the issue of parameters, we chose to only add parameters
>>> for standard encoders/decoders. Post-processing is highly specific and
>>> the parameter definitions varies from one implementation to another -
>>> and usually parameters are handled in an opaque way with binary
>>> controls. This is best handled with a UUID that needs to be known only
>>> to applications and low-level firmware/hardware, the kernel code should
>>> not have to be modified for each and every processing and to add new
>>> parameters. It just does not scale and it's unmaintainable.
>>>
>>> At the very least if you really want to use this compress API, extend it
>>> to use a non-descript "UUID-defined" type and an opaque set of
>>> parameters with this UUID passed in a header.
>>
>> We don't need to use UUID-defined scheme for simple (A)SRC
>> implementation. As I noted, the specific runtime controls may use
>> existing ALSA control API.
> 
> "Simple (A)SRC" is an oxymoron. There are multiple ways to define the
> performance, and how the drift estimator is handled. There's nothing
> simple if you look under the hood. The SOF implementation has for
> example those parameters:
> 
> uint32_t source_rate;           /**< Define fixed source rate or */
> 				/**< use 0 to indicate need to get */
> 				/**< the rate from stream */
> uint32_t sink_rate;             /**< Define fixed sink rate or */
> 				/**< use 0 to indicate need to get */
> 				/**< the rate from stream */
> uint32_t asynchronous_mode;     /**< synchronous 0, asynchronous 1 */
> 				/**< When 1 the ASRC tracks and */
> 				/**< compensates for drift. */
> uint32_t operation_mode;        /**< push 0, pull 1, In push mode the */
> 				/**< ASRC consumes a defined number */
> 				/**< of frames at input, with varying */
> 				/**< number of frames at output. */
> 				/**< In pull mode the ASRC outputs */
> 				/**< a defined number of frames while */
> 				/**< number of input frames varies. */
> 
> They are clearly different from what is suggested above with a 'ratio-mod'.

I don't think so. The proposed (A)SRC for compress-accel is just one case for 
the above configs where the input is known and output is controlled by the 
requested rate. The I/O mechanism is abstracted enough in this case and the 
driver/hardware/firmware must follow it.

> Same if you have a 'simple EQ'. there are dozens of ways to implement
> the functionality with FIR, IIR or a combination of the two, and
> multiple bands.
> 
> The point is that you have to think upfront about a generic way to pass
> parameters. We didn't have to do it for encoders/decoders because we
> only catered to well-documented standard solutions only. By choosing to
> support PCM processing, a new can of worms is now open.
> 
> I repeat: please do not make the mistake of listing all processing with
> an enum and a new structure for parameters every time someone needs a
> specific transform in their pipeline. We made that mistake with SOF and
> had to backtrack rather quickly. The only way to scale is an identifier
> that is NOT included in the kernel code but is known to higher and
> lower-levels only.

There are two ways - black box (UUID - as you suggested) - or well defined 
purpose (abstraction). For your example 'simple EQ', the parameters should be 
the band (frequency range) volume values. It's abstract and the real filters 
(resp. implementation) used behind may depend on the hardware/driver capabilities.

 From my view, the really special cases may be handled as black box, but 
others like (A)SRC should follow some well-defined abstraction IMHO to not 
force user space to handle all special cases.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

