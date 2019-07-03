Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8373D5ECBE
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 21:25:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A93A1696;
	Wed,  3 Jul 2019 21:25:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A93A1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562181958;
	bh=dVm84hhKQCmiJ29i7iKGEUN3lL7hGy2MFGAxivaCc9E=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=apy814aYlmZMhzT7zqH20xgOHsMIzbadh3myXeSzZj82YSfqiGYpVj1qsRx/PkIqn
	 OpmvyNIbAA/Ok4suGP7YGDG1nQfkyY1D86Eo8RSjn+2zfvhKxyKfY1QsfIgjUU8Q4p
	 QV7YXovQzGx2gR9ItI/WFnMY8asNHa3/n9CdAaLw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D428F800F1;
	Wed,  3 Jul 2019 21:24:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBD8AF800EA; Wed,  3 Jul 2019 21:24:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73DFFF800C5
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 21:24:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73DFFF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aT//gTj/"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x63JO3Fc056323;
 Wed, 3 Jul 2019 14:24:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1562181843;
 bh=hdkWWlkE1Pov+QpahnmFk2wqv+OXG0rwblyu9V8WEVM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=aT//gTj/zBqGhmJAbE6kYfTV+dbaKY8dG45gnAsszKDwl6pzFrbadyk/YdOUgn8Ot
 JUJkMoHJQTYap8Ckiuild/L2fx1xuCW3wlKbqcrTiShVcsdN3WYPtNCoft0KbyCHnD
 3zwbK0UZaiz+m/B2AFzBwsIYxwA+ZKYEQH0/PaGs=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x63JO33J118481
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 3 Jul 2019 14:24:03 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 3 Jul
 2019 14:24:03 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 3 Jul 2019 14:24:03 -0500
Received: from [10.250.81.153] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x63JO2PS107354;
 Wed, 3 Jul 2019 14:24:02 -0500
To: Nikolaus Voss <nv@vosn.de>
References: <20190628143037.GH5379@sirena.org.uk>
 <cover.1561988282.git.nikolaus.voss@loewensteinmedical.de>
 <c79df50175d59265a37c5e7c8a0cfbf8119bcf78.1561988282.git.nikolaus.voss@loewensteinmedical.de>
 <80af3fca-f71b-c118-e5d8-fde8b7d21705@ti.com>
 <alpine.DEB.2.20.1907011633310.4353@fox.voss.local>
 <074d4df3-51d8-6e20-869d-5f88b46cc172@ti.com>
 <alpine.DEB.2.20.1907020855240.10248@fox.voss.local>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <4897e119-28fa-aa2c-aa06-2534af6b4c62@ti.com>
Date: Wed, 3 Jul 2019 15:24:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1907020855240.10248@fox.voss.local>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 7/2/19 6:12 AM, Nikolaus Voss wrote:
> On Mon, 1 Jul 2019, Andrew F. Davis wrote:
>> On 7/1/19 11:35 AM, Nikolaus Voss wrote:
>>> On Mon, 1 Jul 2019, Andrew F. Davis wrote:
>>>> On 7/1/19 9:42 AM, Nikolaus Voss wrote:
>>>>> Replace enum tas572x_type with struct tas5720_variant which aggregates
>>>>> variant specific stuff and can be directly referenced from an id
>>>>> table.
>>>>>
>>>>> Signed-off-by: Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
>>>>> ---
>>>>> =A0sound/soc/codecs/tas5720.c | 98
>>>>> +++++++++++++-------------------------
>>>>> =A01 file changed, 33 insertions(+), 65 deletions(-)
>>>>>
>>>>> diff --git a/sound/soc/codecs/tas5720.c b/sound/soc/codecs/tas5720.c
>>>>> index 37fab8f22800..b2e897f094b4 100644
>>>>> --- a/sound/soc/codecs/tas5720.c
>>>>> +++ b/sound/soc/codecs/tas5720.c
>>>>> @@ -28,9 +28,10 @@
>>>>> =A0/* Define how often to check (and clear) the fault status register
>>>>> (in ms) */
>>>>> =A0#define TAS5720_FAULT_CHECK_INTERVAL=A0=A0=A0=A0=A0=A0=A0 200
>>>>>
>>>>> -enum tas572x_type {
>>>>> -=A0=A0=A0 TAS5720,
>>>>> -=A0=A0=A0 TAS5722,
>>>>> +struct tas5720_variant {
>>>>> +=A0=A0=A0 const int device_id;
>>>>> +=A0=A0=A0 const struct regmap_config *reg_config;
>>>>> +=A0=A0=A0 const struct snd_soc_component_driver *comp_drv;
>>>>> =A0};
>>>>>
>>>>> =A0static const char * const tas5720_supply_names[] =3D {
>>>>> @@ -44,7 +45,7 @@ struct tas5720_data {
>>>>> =A0=A0=A0=A0 struct snd_soc_component *component;
>>>>> =A0=A0=A0=A0 struct regmap *regmap;
>>>>> =A0=A0=A0=A0 struct i2c_client *tas5720_client;
>>>>> -=A0=A0=A0 enum tas572x_type devtype;
>>>>> +=A0=A0=A0 const struct tas5720_variant *variant;
>>>>
>>>> Why add a new struct? Actually I don't see the need for this patch at
>>>> all, the commit message only explains the 'what' not the 'why'. We can
>>>> and do already build this info from the tas572x_type.
>>>
>>> As the commit message says, the purpose is to aggregate the variant
>>> specifics and make it accessible via one pointer. This is a standard
>>> approach for of/acpi_device_id tables and thus makes the code simpler
>>> and improves readability. This is a maintenance patch to prepare using
>>> the device match API in a proper way.
>>>
>>
>>
>> "make it accessible via one pointer" is again a "what", the "why" is:
>>
>> "This is a standard approach"
>> "makes the code simpler and improves readability"
>>
>> Those are valid reasons and should be what you put in the commit message.
> =

> ok
> =

>>
>>
>>>>
>>>> Also below are several functional changes, the cover letter says
>>>> this is
>>>> not a functional change, yet the driver behaves differently now.
>>>
>>> Can you be a little bit more specific? The code should behave exactly as
>>> before.
>>>
>>
>>
>> Sure, for instance the line "unexpected private driver data" is removed,
>> this can now never happen, that is a functional change. The phrase "no
>> functional change", should be reserved for only changes to spelling,
>> formatting, code organizing, etc..
> =

> "unexpected private driver data" was unreachable code before, but you're
> right, debug output has changed a little, but the functional part is
> exactly the same.
> =

>>
>>
>>> Niko
>>>
>>>>
>>>> Andrew
>>>>
>>>>> =A0=A0=A0=A0 struct regulator_bulk_data supplies[TAS5720_NUM_SUPPLIES=
];
>>>>> =A0=A0=A0=A0 struct delayed_work fault_check_work;
>>>>> =A0=A0=A0=A0 unsigned int last_fault;
>>>>> @@ -179,17 +180,13 @@ static int tas5720_set_dai_tdm_slot(struct
>>>>> snd_soc_dai *dai,
>>>>> =A0=A0=A0=A0=A0=A0=A0=A0 goto error_snd_soc_component_update_bits;
>>>>>
>>>>> =A0=A0=A0=A0 /* Configure TDM slot width. This is only applicable to
>>>>> TAS5722. */
>>>>> -=A0=A0=A0 switch (tas5720->devtype) {
>>>>> -=A0=A0=A0 case TAS5722:
>>>>> +=A0=A0=A0 if (tas5720->variant->device_id =3D=3D TAS5722_DEVICE_ID) {
>>
>>
>> I also don't like this, TAS5722_DEVICE_ID is the expected contents of a
>> register, you are using it like the enum tas572x_type that you removed.
>> I'd leave that enum, the device ID register itself is not guaranteed to
>> be correct or unique, which is why we warn about mismatches below but
>> then continue to use the user provided device type anyway.
> =

> Strange, with me it's the other way round, I don't like the enum. The
> mismatch behavior hasn't changed a bit, the same warning is printed. If
> the device ID is no longer unique in the future (apparently it is for
> now) the driver should explicitly handle this instead of printing a
> warning, because warnings should be reserved for an indication of any
> kind of misconfiguration and not of expected behavior.
> =

> That said the variant struct can of course replace the enum in every
> aspect, even for what you describe above. The enum was an ordinal
> representation of the user-selected i2c_device_id, the variant struct* is
> a pointer representation of the user-selected i2c/of/acpi_device_id. The
> only difference is that it directly points to the variant specific parts
> of the driver instead of resolving those via multiple switch/case
> statements.

The enum identifies the device type, easy as that, if you want to
instead do all the logic switching on some internal ID register value
code then make a patch for just that and explain what is gained. Don't
do that into this one.

Andrew

> =

> Niko
> =

>>
>> Andrew
>>
>>
>>>>> =A0=A0=A0=A0=A0=A0=A0=A0 ret =3D snd_soc_component_update_bits(compon=
ent,
>>>>> TAS5722_DIGITAL_CTRL2_REG,
>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 TAS5722_TDM_SLOT_16B,
>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 slot_width =3D=3D 16 ?
>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 TAS5722_TDM_SLOT_16B : 0);
>>>>> =A0=A0=A0=A0=A0=A0=A0=A0 if (ret < 0)
>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto error_snd_soc_component_upd=
ate_bits;
>>>>> -=A0=A0=A0=A0=A0=A0=A0 break;
>>>>> -=A0=A0=A0 default:
>>>>> -=A0=A0=A0=A0=A0=A0=A0 break;
>>>>> =A0=A0=A0=A0 }
>>>>>
>>>>> =A0=A0=A0=A0 return 0;
>>>>> @@ -277,7 +274,7 @@ static void tas5720_fault_check_work(struct
>>>>> work_struct *work)
>>>>> =A0static int tas5720_codec_probe(struct snd_soc_component *component)
>>>>> =A0{
>>>>> =A0=A0=A0=A0 struct tas5720_data *tas5720 =3D
>>>>> snd_soc_component_get_drvdata(component);
>>>>> -=A0=A0=A0 unsigned int device_id, expected_device_id;
>>>>> +=A0=A0=A0 unsigned int device_id;
>>>>> =A0=A0=A0=A0 int ret;
>>>>>
>>>>> =A0=A0=A0=A0 tas5720->component =3D component;
>>>>> @@ -301,21 +298,9 @@ static int tas5720_codec_probe(struct
>>>>> snd_soc_component *component)
>>>>> =A0=A0=A0=A0=A0=A0=A0=A0 goto probe_fail;
>>>>> =A0=A0=A0=A0 }
>>>>>
>>>>> -=A0=A0=A0 switch (tas5720->devtype) {
>>>>> -=A0=A0=A0 case TAS5720:
>>>>> -=A0=A0=A0=A0=A0=A0=A0 expected_device_id =3D TAS5720_DEVICE_ID;
>>>>> -=A0=A0=A0=A0=A0=A0=A0 break;
>>>>> -=A0=A0=A0 case TAS5722:
>>>>> -=A0=A0=A0=A0=A0=A0=A0 expected_device_id =3D TAS5722_DEVICE_ID;
>>>>> -=A0=A0=A0=A0=A0=A0=A0 break;
>>>>> -=A0=A0=A0 default:
>>>>> -=A0=A0=A0=A0=A0=A0=A0 dev_err(component->dev, "unexpected private dr=
iver data\n");
>>>>> -=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
>>>>> -=A0=A0=A0 }
>>>>> -
>>>>> -=A0=A0=A0 if (device_id !=3D expected_device_id)
>>>>> +=A0=A0=A0 if (device_id !=3D tas5720->variant->device_id)
>>>>> =A0=A0=A0=A0=A0=A0=A0=A0 dev_warn(component->dev, "wrong device ID. e=
xpected: %u
>>>>> read: %u\n",
>>>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 expected_device_id, device_id);
>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tas5720->variant->device_id, de=
vice_id);
>>>>>
>>>>> =A0=A0=A0=A0 /* Set device to mute */
>>>>> =A0=A0=A0=A0 ret =3D snd_soc_component_update_bits(component,
>>>>> TAS5720_DIGITAL_CTRL2_REG,
>>>>> @@ -637,7 +622,6 @@ static int tas5720_probe(struct i2c_client
>>>>> *client,
>>>>> =A0{
>>>>> =A0=A0=A0=A0 struct device *dev =3D &client->dev;
>>>>> =A0=A0=A0=A0 struct tas5720_data *data;
>>>>> -=A0=A0=A0 const struct regmap_config *regmap_config;
>>>>> =A0=A0=A0=A0 int ret;
>>>>> =A0=A0=A0=A0 int i;
>>>>>
>>>>> @@ -646,20 +630,10 @@ static int tas5720_probe(struct i2c_client
>>>>> *client,
>>>>> =A0=A0=A0=A0=A0=A0=A0=A0 return -ENOMEM;
>>>>>
>>>>> =A0=A0=A0=A0 data->tas5720_client =3D client;
>>>>> -=A0=A0=A0 data->devtype =3D id->driver_data;
>>>>>
>>>>> -=A0=A0=A0 switch (id->driver_data) {
>>>>> -=A0=A0=A0 case TAS5720:
>>>>> -=A0=A0=A0=A0=A0=A0=A0 regmap_config =3D &tas5720_regmap_config;
>>>>> -=A0=A0=A0=A0=A0=A0=A0 break;
>>>>> -=A0=A0=A0 case TAS5722:
>>>>> -=A0=A0=A0=A0=A0=A0=A0 regmap_config =3D &tas5722_regmap_config;
>>>>> -=A0=A0=A0=A0=A0=A0=A0 break;
>>>>> -=A0=A0=A0 default:
>>>>> -=A0=A0=A0=A0=A0=A0=A0 dev_err(dev, "unexpected private driver data\n=
");
>>>>> -=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
>>>>> -=A0=A0=A0 }
>>>>> -=A0=A0=A0 data->regmap =3D devm_regmap_init_i2c(client, regmap_confi=
g);
>>>>> +=A0=A0=A0 data->variant =3D (const struct tas5720_variant *)id->driv=
er_data;
>>>>> +
>>>>> +=A0=A0=A0 data->regmap =3D devm_regmap_init_i2c(client,
>>>>> data->variant->reg_config);
>>>>> =A0=A0=A0=A0 if (IS_ERR(data->regmap)) {
>>>>> =A0=A0=A0=A0=A0=A0=A0=A0 ret =3D PTR_ERR(data->regmap);
>>>>> =A0=A0=A0=A0=A0=A0=A0=A0 dev_err(dev, "failed to allocate register ma=
p: %d\n", ret);
>>>>> @@ -678,42 +652,36 @@ static int tas5720_probe(struct i2c_client
>>>>> *client,
>>>>>
>>>>> =A0=A0=A0=A0 dev_set_drvdata(dev, data);
>>>>>
>>>>> -=A0=A0=A0 switch (id->driver_data) {
>>>>> -=A0=A0=A0 case TAS5720:
>>>>> -=A0=A0=A0=A0=A0=A0=A0 ret =3D devm_snd_soc_register_component(&clien=
t->dev,
>>>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &soc_compo=
nent_dev_tas5720,
>>>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tas5720_da=
i,
>>>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ARRAY_SIZE=
(tas5720_dai));
>>>>> -=A0=A0=A0=A0=A0=A0=A0 break;
>>>>> -=A0=A0=A0 case TAS5722:
>>>>> -=A0=A0=A0=A0=A0=A0=A0 ret =3D devm_snd_soc_register_component(&clien=
t->dev,
>>>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &soc_compo=
nent_dev_tas5722,
>>>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tas5720_da=
i,
>>>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ARRAY_SIZE=
(tas5720_dai));
>>>>> -=A0=A0=A0=A0=A0=A0=A0 break;
>>>>> -=A0=A0=A0 default:
>>>>> -=A0=A0=A0=A0=A0=A0=A0 dev_err(dev, "unexpected private driver data\n=
");
>>>>> -=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
>>>>> -=A0=A0=A0 }
>>>>> -=A0=A0=A0 if (ret < 0) {
>>>>> -=A0=A0=A0=A0=A0=A0=A0 dev_err(dev, "failed to register component: %d=
\n", ret);
>>>>> -=A0=A0=A0=A0=A0=A0=A0 return ret;
>>>>> -=A0=A0=A0 }
>>>>> -
>>>>> -=A0=A0=A0 return 0;
>>>>> +=A0=A0=A0 ret =3D devm_snd_soc_register_component(&client->dev,
>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 data->variant->comp_drv,
>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 tas5720_dai,
>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 ARRAY_SIZE(tas5720_dai));
>>>>> +=A0=A0=A0 return ret;
>>>>> =A0}
>>>>>
>>>>> +static const struct tas5720_variant tas5720 =3D {
>>>>> +=A0=A0=A0 .device_id =3D TAS5720_DEVICE_ID,
>>>>> +=A0=A0=A0 .reg_config =3D &tas5720_regmap_config,
>>>>> +=A0=A0=A0 .comp_drv =3D &soc_component_dev_tas5720,
>>>>> +};
>>>>> +
>>>>> +static const struct tas5720_variant tas5722 =3D {
>>>>> +=A0=A0=A0 .device_id =3D TAS5722_DEVICE_ID,
>>>>> +=A0=A0=A0 .reg_config =3D &tas5722_regmap_config,
>>>>> +=A0=A0=A0 .comp_drv =3D &soc_component_dev_tas5722,
>>>>> +};
>>>>> +
>>>>> =A0static const struct i2c_device_id tas5720_id[] =3D {
>>>>> -=A0=A0=A0 { "tas5720", TAS5720 },
>>>>> -=A0=A0=A0 { "tas5722", TAS5722 },
>>>>> +=A0=A0=A0 { "tas5720", (kernel_ulong_t)&tas5720 },
>>>>> +=A0=A0=A0 { "tas5722", (kernel_ulong_t)&tas5722 },
>>>>> =A0=A0=A0=A0 { }
>>>>> =A0};
>>>>> =A0MODULE_DEVICE_TABLE(i2c, tas5720_id);
>>>>>
>>>>> =A0#if IS_ENABLED(CONFIG_OF)
>>>>> =A0static const struct of_device_id tas5720_of_match[] =3D {
>>>>> -=A0=A0=A0 { .compatible =3D "ti,tas5720", },
>>>>> -=A0=A0=A0 { .compatible =3D "ti,tas5722", },
>>>>> +=A0=A0=A0 { .compatible =3D "ti,tas5720", .data =3D &tas5720, },
>>>>> +=A0=A0=A0 { .compatible =3D "ti,tas5722", .data =3D &tas5722, },
>>>>> =A0=A0=A0=A0 { },
>>>>> =A0};
>>>>> =A0MODULE_DEVICE_TABLE(of, tas5720_of_match);
>>>>>
>>>>
>>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
