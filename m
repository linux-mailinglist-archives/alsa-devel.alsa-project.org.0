Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 273136447CB
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Dec 2022 16:17:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD9051755;
	Tue,  6 Dec 2022 16:16:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD9051755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670339849;
	bh=z9qELgFHnRAL/GmLE5YLU8BZoL8FScHiNDbJ/BSX5q0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I64dmvd/j9D4S58cy8dbeLi3sYOkliTlq9KfJ/KHiYpsUczilwudBfKqAQZNZoeJ1
	 ksra05GuygxR7Dje6iKIl1oqUYfXLjk+pNDgsJ2fwOY32H73hHhavr+sWvoAD15Ndp
	 7LSXMtlV3LFKBGT52IUoVZKn1IsljGx8oD0AYYoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 566BDF80290;
	Tue,  6 Dec 2022 16:16:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32532F80246; Tue,  6 Dec 2022 16:16:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30222F8014C
 for <alsa-devel@alsa-project.org>; Tue,  6 Dec 2022 16:16:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30222F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org
 header.b="CcH/ZPCB"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4NRPBn45zJz9sRf;
 Tue,  6 Dec 2022 16:16:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1670339777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t2tn+THhDzeDHl34Ye809whLfPYSKOZ/DaLoqsuH3gk=;
 b=CcH/ZPCBwWHTCNc5diUTO2FLKkq9Jh92haUiNwm2C6BQVS8fM/HdtepOJ1Rzjq3/mDfLTa
 gm/uXrAvsReXdL/F2SVxR3R0JY3D86V6TWwhxe3WdifxbQSFxX15WCaV7z/FLn+lrozhRh
 lS3sSSePXlXPH2fJmKM2KHEzeB0jxTqbbXac7t2nxSxV1yW+pM2Z2lRujJh2iaRZ+xoNWs
 tdA7oLuiSGicwOqQr8H4/ofsv6vrXEznaVHRnw+ANy8ORZTj6P1r/Quhj0+tXKhC791nQR
 Zn2nW0GqAJpDbPBDT0vkIrZ4C9cLY9py6gy/LsbhxzIax9Nebugviu6XgJIYWQ==
Message-ID: <cdee3f7d-3f98-02dc-9fc6-18ffc489c6f8@mailbox.org>
Date: Tue, 6 Dec 2022 16:16:12 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] ALSA: compress: Add AC3, EAC3, TrueHD, DTS, MPEG-H 3D
 Audio Stream (MHAS)
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20221206145317.99934-1-crg7475@mailbox.org>
 <d6da4f2f-d6d8-bab6-66f0-a4b2486d1922@linux.intel.com>
From: Carlos Rafael Giani <crg7475@mailbox.org>
In-Reply-To: <d6da4f2f-d6d8-bab6-66f0-a4b2486d1922@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: b032ba1a2d024997665
X-MBO-RS-META: sbrie75jug1xf9sa1fagpt9h1dw636p5
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

IEC61937 is quite commonly used, yes. However, I have been working with 
a commercial system that is getting support for these formats 
implemented via compress-offload. Since these formats aren't exactly 
uncommon, I figured that adding these could be useful, especially since 
only the #defines need to be added, nothing else.

On 06.12.22 16:07, Pierre-Louis Bossart wrote:
>
> On 12/6/22 08:53, Carlos Rafael Giani wrote:
>> These audio codecs are used in sound bars and digital TVs, and benefit
>> from off-loading to a DSP. In particular, Dolby Atmos and MPEG-H 3D audio
>> spatialization is done in dedicated DSPs. Thus, adding these codecs  to
>> the Compress-Offload API makes sense.
> The question is "how is the stream transported". In most implementations
> for these formats, the DSP is on the receiver side and the transport
> happens with an IEC61937 format - which does not require the use of the
> compressed API.
>
>> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
>> ---
>>   include/uapi/sound/compress_params.h | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
>> index ddc77322d571..7a58e2026be3 100644
>> --- a/include/uapi/sound/compress_params.h
>> +++ b/include/uapi/sound/compress_params.h
>> @@ -43,7 +43,13 @@
>>   #define SND_AUDIOCODEC_BESPOKE               ((__u32) 0x0000000E)
>>   #define SND_AUDIOCODEC_ALAC                  ((__u32) 0x0000000F)
>>   #define SND_AUDIOCODEC_APE                   ((__u32) 0x00000010)
>> -#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_APE
>> +#define SND_AUDIOCODEC_AC3                   ((__u32) 0x00000011)
>> +#define SND_AUDIOCODEC_EAC3                  ((__u32) 0x00000012)
>> +#define SND_AUDIOCODEC_TRUEHD                ((__u32) 0x00000013)
>> +#define SND_AUDIOCODEC_DTS                   ((__u32) 0x00000014)
> IIRC there are multiple flavors of DTS, off the top of my head DTS-ES,
> 96, HD, Master Audio. "DTS" only doesn't even begin to describe the
> possible variants.
>
>> +/* MPEG-H 3D Audio Stream (MHAS) as defined in ISO/IEC 23008-3 */
>> +#define SND_AUDIOCODEC_MHAS                  ((__u32) 0x00000015)
> Doesn't this need the definition of profiles and various types of
> formats - classic problem with designed-by-committee MPEG codecs.
>
>> +#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_MHAS
>
>>   /*
>>    * Profile and modes are listed with bit masks. This allows for a
