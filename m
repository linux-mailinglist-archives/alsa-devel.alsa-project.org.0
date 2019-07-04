Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C53E05F253
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2019 07:38:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C3FE16A2;
	Thu,  4 Jul 2019 07:37:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C3FE16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562218721;
	bh=WjmgruiYcXeOsaF/TQKCaOTUcH8FByX+sYC82ic/B6A=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qyLQY+bQEkTiBUXowX7K2GgowI2ksUnwgLLxZOonyiPNtVnpVGQMIsewGDrAP3c6R
	 Nq1iVlGeF8Kx8TuGSybW5Fze1qFSJgh2Khj9GQM3OEfyrRGBjEPEtWxJfThskgU/pX
	 zwrGiTzJKrQltNnMorYPwGWeOiSbGEMEzZvKD4gs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15B99F80110;
	Thu,  4 Jul 2019 07:36:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FE54F80111; Thu,  4 Jul 2019 07:36:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.steuer-voss.de (mail.steuer-voss.de [85.183.69.95])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8957F800E7
 for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2019 07:36:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8957F800E7
X-Virus-Scanned: Debian amavisd-new at mail.steuer-voss.de
Received: by mail.steuer-voss.de (Postfix, from userid 1000)
 id C9E644D456; Thu,  4 Jul 2019 07:36:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.steuer-voss.de (Postfix) with ESMTP id C6CB14D452;
 Thu,  4 Jul 2019 07:36:48 +0200 (CEST)
Date: Thu, 4 Jul 2019 07:36:48 +0200 (CEST)
From: Nikolaus Voss <nv@vosn.de>
X-X-Sender: nv@fox.voss.local
To: "Andrew F. Davis" <afd@ti.com>
In-Reply-To: <4897e119-28fa-aa2c-aa06-2534af6b4c62@ti.com>
Message-ID: <alpine.DEB.2.20.1907040731270.27853@fox.voss.local>
References: <20190628143037.GH5379@sirena.org.uk>
 <cover.1561988282.git.nikolaus.voss@loewensteinmedical.de>
 <c79df50175d59265a37c5e7c8a0cfbf8119bcf78.1561988282.git.nikolaus.voss@loewensteinmedical.de>
 <80af3fca-f71b-c118-e5d8-fde8b7d21705@ti.com>
 <alpine.DEB.2.20.1907011633310.4353@fox.voss.local>
 <074d4df3-51d8-6e20-869d-5f88b46cc172@ti.com>
 <alpine.DEB.2.20.1907020855240.10248@fox.voss.local>
 <4897e119-28fa-aa2c-aa06-2534af6b4c62@ti.com>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Kate Stewart <kstewart@linuxfoundation.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-acpi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Andreas Dannenberg <dannenberg@ti.com>
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: tas5720.c: cleanup variant
	management
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 3 Jul 2019, Andrew F. Davis wrote:
> On 7/2/19 6:12 AM, Nikolaus Voss wrote:
>> On Mon, 1 Jul 2019, Andrew F. Davis wrote:
>>> On 7/1/19 11:35 AM, Nikolaus Voss wrote:
>>>> On Mon, 1 Jul 2019, Andrew F. Davis wrote:
>>>>> On 7/1/19 9:42 AM, Nikolaus Voss wrote:
>>>>>> Replace enum tas572x_type with struct tas5720_variant which aggregat=
es
>>>>>> variant specific stuff and can be directly referenced from an id
>>>>>> table.
>>>>>>
>>>>>> Signed-off-by: Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
>>>>>> ---
>>>>>> =A0sound/soc/codecs/tas5720.c | 98
>>>>>> +++++++++++++-------------------------
>>>>>> =A01 file changed, 33 insertions(+), 65 deletions(-)
>>>>>>
>>>>>> diff --git a/sound/soc/codecs/tas5720.c b/sound/soc/codecs/tas5720.c
>>>>>> index 37fab8f22800..b2e897f094b4 100644
>>>>>> --- a/sound/soc/codecs/tas5720.c
>>>>>> +++ b/sound/soc/codecs/tas5720.c
>>>>>> @@ -28,9 +28,10 @@
>>>>>> =A0/* Define how often to check (and clear) the fault status register
>>>>>> (in ms) */
>>>>>> =A0#define TAS5720_FAULT_CHECK_INTERVAL=A0=A0=A0=A0=A0=A0=A0 200
>>>>>>
>>>>>> -enum tas572x_type {
>>>>>> -=A0=A0=A0 TAS5720,
>>>>>> -=A0=A0=A0 TAS5722,
>>>>>> +struct tas5720_variant {
>>>>>> +=A0=A0=A0 const int device_id;
>>>>>> +=A0=A0=A0 const struct regmap_config *reg_config;
>>>>>> +=A0=A0=A0 const struct snd_soc_component_driver *comp_drv;
>>>>>> =A0};
>>>>>>
>>>>>> =A0static const char * const tas5720_supply_names[] =3D {
>>>>>> @@ -44,7 +45,7 @@ struct tas5720_data {
>>>>>> =A0=A0=A0=A0 struct snd_soc_component *component;
>>>>>> =A0=A0=A0=A0 struct regmap *regmap;
>>>>>> =A0=A0=A0=A0 struct i2c_client *tas5720_client;
>>>>>> -=A0=A0=A0 enum tas572x_type devtype;
>>>>>> +=A0=A0=A0 const struct tas5720_variant *variant;
>>>>>
>>>>> Why add a new struct? Actually I don't see the need for this patch at
>>>>> all, the commit message only explains the 'what' not the 'why'. We can
>>>>> and do already build this info from the tas572x_type.
>>>>
>>>> As the commit message says, the purpose is to aggregate the variant
>>>> specifics and make it accessible via one pointer. This is a standard
>>>> approach for of/acpi_device_id tables and thus makes the code simpler
>>>> and improves readability. This is a maintenance patch to prepare using
>>>> the device match API in a proper way.
>>>>
>>>
>>>
>>> "make it accessible via one pointer" is again a "what", the "why" is:
>>>
>>> "This is a standard approach"
>>> "makes the code simpler and improves readability"
>>>
>>> Those are valid reasons and should be what you put in the commit messag=
e.
>>
>> ok
>>
>>>
>>>
>>>>>
>>>>> Also below are several functional changes, the cover letter says
>>>>> this is
>>>>> not a functional change, yet the driver behaves differently now.
>>>>
>>>> Can you be a little bit more specific? The code should behave exactly =
as
>>>> before.
>>>>
>>>
>>>
>>> Sure, for instance the line "unexpected private driver data" is removed,
>>> this can now never happen, that is a functional change. The phrase "no
>>> functional change", should be reserved for only changes to spelling,
>>> formatting, code organizing, etc..
>>
>> "unexpected private driver data" was unreachable code before, but you're
>> right, debug output has changed a little, but the functional part is
>> exactly the same.
>>
>>>
>>>
>>>> Niko
>>>>
>>>>>
>>>>> Andrew
>>>>>
>>>>>> =A0=A0=A0=A0 struct regulator_bulk_data supplies[TAS5720_NUM_SUPPLIE=
S];
>>>>>> =A0=A0=A0=A0 struct delayed_work fault_check_work;
>>>>>> =A0=A0=A0=A0 unsigned int last_fault;
>>>>>> @@ -179,17 +180,13 @@ static int tas5720_set_dai_tdm_slot(struct
>>>>>> snd_soc_dai *dai,
>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0 goto error_snd_soc_component_update_bits;
>>>>>>
>>>>>> =A0=A0=A0=A0 /* Configure TDM slot width. This is only applicable to
>>>>>> TAS5722. */
>>>>>> -=A0=A0=A0 switch (tas5720->devtype) {
>>>>>> -=A0=A0=A0 case TAS5722:
>>>>>> +=A0=A0=A0 if (tas5720->variant->device_id =3D=3D TAS5722_DEVICE_ID)=
 {
>>>
>>>
>>> I also don't like this, TAS5722_DEVICE_ID is the expected contents of a
>>> register, you are using it like the enum tas572x_type that you removed.
>>> I'd leave that enum, the device ID register itself is not guaranteed to
>>> be correct or unique, which is why we warn about mismatches below but
>>> then continue to use the user provided device type anyway.
>>
>> Strange, with me it's the other way round, I don't like the enum. The
>> mismatch behavior hasn't changed a bit, the same warning is printed. If
>> the device ID is no longer unique in the future (apparently it is for
>> now) the driver should explicitly handle this instead of printing a
>> warning, because warnings should be reserved for an indication of any
>> kind of misconfiguration and not of expected behavior.
>>
>> That said the variant struct can of course replace the enum in every
>> aspect, even for what you describe above. The enum was an ordinal
>> representation of the user-selected i2c_device_id, the variant struct* is
>> a pointer representation of the user-selected i2c/of/acpi_device_id. The
>> only difference is that it directly points to the variant specific parts
>> of the driver instead of resolving those via multiple switch/case
>> statements.
>
> The enum identifies the device type, easy as that, if you want to
> instead do all the logic switching on some internal ID register value
> code then make a patch for just that and explain what is gained. Don't
> do that into this one.

I don't do and I don't want to. The struct pointer identifies the device =

type the same way as the enum does. I guess we better leave things as they =

are. Anyway, thanks for your time and effort.

Nikolaus
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
