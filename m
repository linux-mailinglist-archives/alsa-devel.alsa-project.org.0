Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B40319F12E
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Apr 2020 09:48:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23D181662;
	Mon,  6 Apr 2020 09:47:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23D181662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586159296;
	bh=bI+uJ7gkkE5jDVsVxARgkwPeJ8ANNTxpg1MsCzgzlB8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bkaiCFNX/x8jdzyzZ3blqadK06IRKzoP0YVma3I8KlmjAIwkKp296BF+HTq7COxVn
	 u47yyknzV5plW5NpTBBDfX1SVhJ107g5qh9aELc1uPLgydjwUxHRfuiKHVwcr+WDRm
	 IF3JthhaolAmYgODA7NCSzQn/wJto9RwRAAQUqDU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47359F80142;
	Mon,  6 Apr 2020 09:46:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FA84F80143; Mon,  6 Apr 2020 09:46:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C766AF80121
 for <alsa-devel@alsa-project.org>; Mon,  6 Apr 2020 09:46:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C766AF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="AUiAbr0r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586159186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bI+uJ7gkkE5jDVsVxARgkwPeJ8ANNTxpg1MsCzgzlB8=;
 b=AUiAbr0rMggL/A4loYeezhz/qpFAE1dDRq4LGZf474m8z0KTHw/ETndP4zWCfUH4gxW/mB
 azvnSd3kJccoB9c9mMwnlDaiA5qKRqvsuIzlVIfUX0TUh8mmD+Mh799QRMCqbgly0oYMi6
 3swygyrkuQu3MKa5+E2tVwD9x/VGZ1U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-iVdg5VYGPPaWUFRQUC1WdA-1; Mon, 06 Apr 2020 03:46:22 -0400
X-MC-Unique: iVdg5VYGPPaWUFRQUC1WdA-1
Received: by mail-wm1-f71.google.com with SMTP id l13so4582685wme.7
 for <alsa-devel@alsa-project.org>; Mon, 06 Apr 2020 00:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sqgG1nZOVPAS8oa93H0+mXtanr1VRMVcv1jZ5QjbFfI=;
 b=Vbofq8Xj3uNJl2ekxrWUnojfPqLziXC77pqxjqqeR62McZU7RtoMsG91d7VWVOda7W
 upFWiIW5Q3v/hwkYqOAEAzgefNfedqU8S1umot4x61e1ABcXExbXj69Rei9NZjRRnobZ
 ovLqx6vJqQEI9L11hpARLRUYvOPxmo0sLLJdcKBstfc0Oa+RXJM72uEE9/f/poZJ866N
 KDuiNdINKfox8n0BviH+X7w2aUjNwKtneDvkrAi7VgCS2VbhRl59MkiJokLU9jqVFeqN
 LLwtzPH7NoC5UViSxg96rTdEqa9Y4MUu8omjMG31FYhLOEc8Z8pgHZtj5kKJFakA94cn
 88VQ==
X-Gm-Message-State: AGi0PuZ+cQ2czK+8TWcqhdw7JwIj98oSk8MaIEE9UZ1NzorsP0CNJ9nH
 FazAmzTjcGv+O5s056YJx2GjQr0Vfqq9rz3sGYV8OUl8Q/IPL37Os8hYbdKSgISU6Dp4bxGCI+Q
 u9e/g3xyn4Lz1oALDl/iyJ/Q=
X-Received: by 2002:adf:ed8b:: with SMTP id c11mr8498338wro.14.1586159181185; 
 Mon, 06 Apr 2020 00:46:21 -0700 (PDT)
X-Google-Smtp-Source: APiQypK64Ah4CPJVTRh34n1QZbn2XNrwh8iBAslgw2Lwwdt0Ha+lC3SWXY/GpMjtGMEpiKsa3B+cQA==
X-Received: by 2002:adf:ed8b:: with SMTP id c11mr8498327wro.14.1586159180991; 
 Mon, 06 Apr 2020 00:46:20 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id t2sm6945717wrs.7.2020.04.06.00.46.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2020 00:46:20 -0700 (PDT)
Subject: Re: [PATCH v3] ASoC: Intel: bytcr_rt5640: Add quirk for MPMAN
 MPWIN895CL tablet
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 flove@realtek.com, shumingf@realtek.com, Oder Chiou <oder_chiou@realtek.com>
References: <20200405133726.24154-1-hdegoede@redhat.com>
 <0b7cfac8-857c-c4c1-0f79-7ce6522e073e@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <6eb5952c-a619-9dc7-694e-3e2c94204fef@redhat.com>
Date: Mon, 6 Apr 2020 09:46:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <0b7cfac8-857c-c4c1-0f79-7ce6522e073e@linux.intel.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org
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

Hi,

On 4/6/20 12:55 AM, Pierre-Louis Bossart wrote:
>=20
>=20
> On 4/5/20 8:37 AM, Hans de Goede wrote:
>> The MPMAN MPWIN895CL tablet almost fully works with out default settings=
.
>> The only problem is that it has only 1 speaker so any sounds only playin=
g
>> on the right channel get lost.
>>
>> Add a quirk for this model using the default settings + MONO_SPEAKER.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>=20
> Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks. Can you please also review this quirk addition ? :

https://patchwork.kernel.org/patch/11471275/

Regards,

Hans



>> ---
>> =C2=A0 sound/soc/intel/boards/bytcr_rt5640.c | 11 +++++++++++
>> =C2=A0 1 file changed, 11 insertions(+)
>>
>> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boa=
rds/bytcr_rt5640.c
>> index 6bd9ae813be2..d14d5f7db168 100644
>> --- a/sound/soc/intel/boards/bytcr_rt5640.c
>> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
>> @@ -591,6 +591,17 @@ static const struct dmi_system_id byt_rt5640_quirk_=
table[] =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BYT_RT5640_SSP0_AIF1=
 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BYT_RT5640_MCLK_EN),
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>> +=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MPMAN MPWIN895CL */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .matches =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMI_=
EXACT_MATCH(DMI_SYS_VENDOR, "MPMAN"),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMI_=
EXACT_MATCH(DMI_PRODUCT_NAME, "MPWIN8900CL"),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void *)(BY=
TCR_INPUT_DEFAULTS |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BYT_RT5640_MONO_SPEAKER |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BYT_RT5640_SSP0_AIF1 |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BYT_RT5640_MCLK_EN),
>> +=C2=A0=C2=A0=C2=A0 },
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {=C2=A0=C2=A0=C2=A0 /* MSI S100 tablet */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .matches =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."=
),
>>
>=20

