Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B8F62783C
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Nov 2022 09:56:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CFA3161F;
	Mon, 14 Nov 2022 09:56:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CFA3161F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668416218;
	bh=NP14WmdySktpy0hl2GV/AlDCefE33UV4zYy0ThUsLq0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gk9G9CS0VZeSF9/Dulyx3cuoEx+F6kdnacrd+Vqi15vS2B+l+YCIDjt6PLZahxwyw
	 TbS1uyGnKKdYIAZREBmPXcAbz7ttq/nUdzJaRzZXaWNPr94gzsjtNV7gfkFqbIwYIb
	 +njR8KQj/9zKGDAelvo3jyAd0g9hV4Q8XiYw6G9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 096E7F800B8;
	Mon, 14 Nov 2022 09:55:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBC5FF800B8; Mon, 14 Nov 2022 09:35:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from forwardcorp1b.mail.yandex.net (forwardcorp1b.mail.yandex.net
 [178.154.239.136])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D217CF800B8
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 09:35:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D217CF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.b="DGOMXti8"
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 3C7D05FEF4;
 Mon, 14 Nov 2022 11:35:13 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:7220::1:21] (unknown
 [2a02:6b8:b081:7220::1:21])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 wpjdqnXUTF-ZBOWTaqP; Mon, 14 Nov 2022 11:35:12 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1668414912; bh=PaWl5kxzPZDLe8sZ1fNM9BbgGs/+I2HQx03eZhHAjWY=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=DGOMXti8YRdNbkv9ZzO+MKzXBD3SbRceqjCZhr39RVZx0PtW3hATVGQzkgQWbZkOy
 I3i9juH1GgoScvK10LtYvxNGt5kBTBTxEmFca6o+8XFBwtntNEr9E9207D1VIJE/gz
 Cx3eyz/B1ZB936ZA3fihfSZWcby+jrIOmWO3vasM=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <d3a31735-8f5c-3168-6a0d-2cf1e9005864@yandex-team.ru>
Date: Mon, 14 Nov 2022 11:35:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1] sound/pci/hda/patch_realtek: don't call
 alc_shutup_pins without a spec
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20221114082048.3477027-1-d-tatianin@yandex-team.ru>
 <87r0y63psf.wl-tiwai@suse.de>
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
In-Reply-To: <87r0y63psf.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 14 Nov 2022 09:55:46 +0100
Cc: Stefan Binding <sbinding@opensource.cirrus.com>,
 lvc-project@linuxtesting.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 Meng Tang <tangmeng@uniontech.com>, Philipp Jungkamp <p.jungkamp@gmx.net>,
 Tim Crawford <tcrawford@system76.com>, Takashi Iwai <tiwai@suse.com>,
 Werner Sembach <wse@tuxedocomputers.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, yc-core@yandex-team.ru,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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



On 11/14/22 11:26 AM, Takashi Iwai wrote:
> On Mon, 14 Nov 2022 09:20:48 +0100,
> Daniil Tatianin wrote:
>>
>> alc_shutup_pins always expects the spec to be present, so make sure
>> it is before we call it.
>>
>> Found by Linux Verification Center (linuxtesting.org) with the SVACE
>> static analysis tool.
>>
>> Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
> 
> In which path can it be without spec assigned?
> That's the internal callback that is set only by the codec driver
> where the allocation of codec->spec is mandatory.

Would you then say that the "if (spec && ...)" that was there before was 
redundant? Should we remove it perhaps to avoid further confusion about 
it being optional? The else branch with alc_shutup_pins would crash if 
it was null anyway.

Thanks

> 
> thanks,
> 
> Takashi
> 
> 
>> ---
>>   sound/pci/hda/patch_realtek.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
>> index 60e3bc124836..2cf4b64971d7 100644
>> --- a/sound/pci/hda/patch_realtek.c
>> +++ b/sound/pci/hda/patch_realtek.c
>> @@ -939,10 +939,12 @@ static inline void alc_shutup(struct hda_codec *codec)
>>   {
>>   	struct alc_spec *spec = codec->spec;
>>   
>> +	if (!spec)
>> +		return;
>>   	if (!snd_hda_get_bool_hint(codec, "shutup"))
>>   		return; /* disabled explicitly by hints */
>>   
>> -	if (spec && spec->shutup)
>> +	if (spec->shutup)
>>   		spec->shutup(codec);
>>   	else
>>   		alc_shutup_pins(codec);
>> -- 
>> 2.25.1
>>
