Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4661D4E8CB0
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 05:53:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B65581654;
	Mon, 28 Mar 2022 05:53:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B65581654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648439638;
	bh=QO0+zGKnSRhGYAtEbhFBSqTq4jjyUm+FE0oConh6oa0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C0PTKBCf0AqolYCNfewvuxpz/nx3PXowebUhrSyH6LLryatAt+FSabqUEt2MscVQ0
	 shd6ZPIeMcmF6+fGATGoeFIpKuoBo6YL0eAWJJ5UukqAetmeXIs44QQnNnD4dSGjVZ
	 Uc2n0ONP/xi/xjvPR1A3tj/zf1wxhiVBo/0D52yQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A66BF8026A;
	Mon, 28 Mar 2022 05:52:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A3A8F8024C; Mon, 28 Mar 2022 05:52:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E40B6F800FA
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 05:52:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E40B6F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="k6TqG9gL"
Received: from [192.168.0.108] (unknown [123.112.67.37])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 09E243F664; 
 Mon, 28 Mar 2022 03:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1648439561;
 bh=wdQBFQSUbAXcOzCs5md3S+NDiqjys4mnMzc+64IQmJ4=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=k6TqG9gL77ydijRiDZ7JsxxH/lzTDQreRusfC0QxWdd7SLDCoAZm41BXu11FqHlCo
 qLb7zhT6YB7plZceOV3QeVC4WsndOR02T3SNg0FFMaVpxJ+HuK16NUW/ychIUNeZnL
 ZsH1nv5q+AURWpLlLzTOr6dk2xnWn0w1nKVuMsW0U89iumTKQ6A2Z/OKGEX2UEdEqL
 ALc8wnsa0G+cayOPondhrCvmlrihHH+3+Y+OYoVEmo5roWcakiEV5RDtqCDO7Uul2h
 goqbioG5O41gQLSEuPU9nSFHqFnnfJtO+OJPUbHD+Cv5xpxWQC53gE/UZnGuk7S+fd
 2ztKIM00bJIgg==
Message-ID: <3ca0369f-5fa2-dfa7-7823-904c680d497c@canonical.com>
Date: Mon, 28 Mar 2022 11:52:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] ASoC: cs35l41: Fix a shift-out-of-bounds warning
 found by UBSAN
Content-Language: en-US
To: Lucas tanure <tanureal@opensource.cirrus.com>,
 alsa-devel@alsa-project.org, broonie@kernel.org,
 patches@opensource.cirrus.com, ckeepax@opensource.cirrus.com
References: <20220324081839.62009-1-hui.wang@canonical.com>
 <20220324081839.62009-2-hui.wang@canonical.com>
 <2ac230dd-36f3-ca70-293a-bfde833d9d0b@opensource.cirrus.com>
From: Hui Wang <hui.wang@canonical.com>
In-Reply-To: <2ac230dd-36f3-ca70-293a-bfde833d9d0b@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 3/26/22 00:46, Lucas tanure wrote:
> On 3/24/22 08:18, Hui Wang wrote:
>> We enabled UBSAN in the ubuntu kernel, and the cs35l41 driver triggers
>> a warning calltrace like below:
>>
>> cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: bitoffset= 8, 
>> word_offset=23, bit_sum mod 32=0, otp_map[i].size = 24
>> cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: bitoffset= 0, 
>> word_offset=24, bit_sum mod 32=24, otp_map[i].size = 0
>> ================================================================================ 
>>
>> UBSAN: shift-out-of-bounds in 
>> linux-kernel-src/sound/soc/codecs/cs35l41-lib.c:836:8
>> shift exponent 64 is too large for 64-bit type 'long unsigned int'
>> CPU: 10 PID: 595 Comm: systemd-udevd Not tainted 5.15.0-23-generic #23
>> Hardware name: LENOVO \x02MFG_IN_GO/\x02MFG_IN_GO, BIOS N3GET19W 
>> (1.00 ) 03/11/2022
>> Call Trace:
>>   <TASK>
>>   show_stack+0x52/0x58
>>   dump_stack_lvl+0x4a/0x5f
>>   dump_stack+0x10/0x12
>>   ubsan_epilogue+0x9/0x45
>>   __ubsan_handle_shift_out_of_bounds.cold+0x61/0xef
>>   ? regmap_unlock_mutex+0xe/0x10
>>   cs35l41_otp_unpack.cold+0x1c6/0x2b2 [snd_soc_cs35l41_lib]
>>   cs35l41_hda_probe+0x24f/0x33a [snd_hda_scodec_cs35l41]
>>   cs35l41_hda_i2c_probe+0x65/0x90 [snd_hda_scodec_cs35l41_i2c]
>>
>> When both bitoffset and otp_map[i].size are 0, the line 836 will
>> result in GENMASK(-1, 0), this triggers the shift-out-of-bounds
>> calltrace.
>>
>> Here add a checking, if both bitoffset and otp_map[i].size are 0,
>> do not run GENMASK() and directly set otp_val to 0, this will not
>> bring any function change on the driver but could avoid the calltrace.
> Here would be better to return an error and fail the probe, as this is
> a not expected case.
>
OK, got it. And I re-read the code and found It is the last entry in the 
array to introduce this call-trace, the CS35L41_NUM_OTP_ELEM is defined 
to be 100, but otp_map_1/2[] only defines 99 elements, so the last entry 
in the array are {0, 0, 0}, that is why the driver gets a 0 for map[i].size.

I will remove the CS35L41_NUM_OTP_ELEM and use ARRAY_SIZE() in the v2 patch.

Thanks,

Hui.

>>
>> Signed-off-by: Hui Wang <hui.wang@canonical.com>
>> ---
>>   sound/soc/codecs/cs35l41-lib.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/codecs/cs35l41-lib.c 
>> b/sound/soc/codecs/cs35l41-lib.c
>> index d0a480c40231..aa6823fbd1a4 100644
>> --- a/sound/soc/codecs/cs35l41-lib.c
>> +++ b/sound/soc/codecs/cs35l41-lib.c
>> @@ -831,12 +831,14 @@ int cs35l41_otp_unpack(struct device *dev, 
>> struct regmap *regmap)
>>                       GENMASK(bit_offset + otp_map[i].size - 33, 0)) <<
>>                       (32 - bit_offset);
>>               bit_offset += otp_map[i].size - 32;
>> -        } else {
>> +        } else if (bit_offset + otp_map[i].size - 1 >= 0) {
>>               otp_val = (otp_mem[word_offset] &
>>                      GENMASK(bit_offset + otp_map[i].size - 1, 
>> bit_offset)
>>                     ) >> bit_offset;
>>               bit_offset += otp_map[i].size;
>> -        }
>> +        } else /* both bit_offset and otp_map[i].size are 0 */
>> +            otp_val = 0;
>> +
>>           bit_sum += otp_map[i].size;
>>             if (bit_offset == 32) {
>
