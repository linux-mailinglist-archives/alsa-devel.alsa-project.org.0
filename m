Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 766EF375F7F
	for <lists+alsa-devel@lfdr.de>; Fri,  7 May 2021 06:36:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AB55168C;
	Fri,  7 May 2021 06:35:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AB55168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620362170;
	bh=Gz1eCuZeIbiOMnhsqzLNyv5LtO7u+tpdQc827GXMbmE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NTSlrc7QwvGc5I7MSM40zEHZYXN4qUkM9iP2DcjNxCYKbMxFKoXxSZVUauuLUm6K1
	 1JEgWSJ7VgJJjcV+Iz+3EcVNAmzdZbfZrieDaDAQ17KrlyIuXmrEDfDkDEIGSXxWfh
	 TRzsLAb7ZmeEKhJCe6VjavgwUToBGW2DlTe538LM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADCDCF80108;
	Fri,  7 May 2021 06:34:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4323BF8025F; Fri,  7 May 2021 06:34:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5C55F80108
 for <alsa-devel@alsa-project.org>; Fri,  7 May 2021 06:34:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5C55F80108
Received: by mail-qk1-f177.google.com with SMTP id i17so7307794qki.3
 for <alsa-devel@alsa-project.org>; Thu, 06 May 2021 21:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Ny/T7GETCcZsveAc22eept4j8pRJh4Gka9m8hkhoVOo=;
 b=AnUESYa9Iyydzzustmoj++WbtnYwRQfcZiEiEubwAfDoujVKr7in6XW/Em4v9l4QxJ
 jp+ZK649T615ScFxf4svq/x5pOb9kBwZ3AJUs2hIi4NsoCyRgr+50YsuUrwlsYmW9N9E
 IyYQDNu7jYRqqx5lEXlI5jada9YzmzrptDaP/1Of01AZoZvwhX+g61u9qbCICbLts8Nd
 D4YgXWq29rCv7X6u88uATHFLAxVB6/1IBXlpnFJ0iDVGbbhOGOTtz7LGD+5vygiQUQGm
 5Pkdbr3sgvRdwD3+d1KSryl45xit0gdrQb27wCJEo65TbNaRnxs0LnjMTY5UJ0lIhmci
 b95g==
X-Gm-Message-State: AOAM532z4+ar4Q96dWCgQnxEyh6+pEEkDHUyiyKSj9TSWKjAY1yB249V
 i0e8LDSM0lKVjOzOqSzSKO0LWjPLDc0=
X-Google-Smtp-Source: ABdhPJx3qDTe8f4kbU5lASQAD88Rzzj+FaRBv1rGnD/PgTTLmOeVLCJClkpxFiby7a4ddyQ2xhrGwQ==
X-Received: by 2002:a37:8744:: with SMTP id j65mr8112694qkd.304.1620362070766; 
 Thu, 06 May 2021 21:34:30 -0700 (PDT)
Received: from ?IPv6:2601:184:417f:5b5f::557e:48ed?
 ([2601:184:417f:5b5f::557e:48ed])
 by smtp.gmail.com with ESMTPSA id p187sm4149487qkd.92.2021.05.06.21.34.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 21:34:30 -0700 (PDT)
Subject: Re: [PATCH AUTOSEL 5.12 090/116] ASoC: rt286: Generalize support for
 ALC3263 codec
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20210505163125.3460440-1-sashal@kernel.org>
 <20210505163125.3460440-90-sashal@kernel.org>
From: David Ward <david.ward@gatech.edu>
Message-ID: <55cb81cd-4eb9-049a-abf6-d4628ac8cb34@gatech.edu>
Date: Fri, 7 May 2021 00:34:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210505163125.3460440-90-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 5/5/21 12:30 PM, Sasha Levin wrote:
> From: David Ward <david.ward@gatech.edu>
>
> [ Upstream commit aa2f9c12821e6a4ba1df4fb34a3dbc6a2a1ee7fe ]
>
> The ALC3263 codec on the XPS 13 9343 is also found on the Latitude 13 7=
350
> and Venue 11 Pro 7140. They require the same handling for the combo jac=
k to
> work with a headset: GPIO pin 6 must be set.
>
> The HDA driver always sets this pin on the ALC3263, which it distinguis=
hes
> by the codec vendor/device ID 0x10ec0288 and PCI subsystem vendor ID 0x=
1028
> (Dell). The ASoC driver does not use PCI, so adapt this check to use DM=
I to
> determine if Dell is the system vendor.

For this patch to be useful, commit cd8499d5c03b ("ASoC: rt286: Make=20
RT286_SET_GPIO_* readable and writable") from the same series is needed=20
as well, which fixed the regmap config.

(The same comment is true for all stable branches.)

Thank you,

David

>
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D150601
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D205961
> Signed-off-by: David Ward <david.ward@gatech.edu>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com=
>
> Link: https://lore.kernel.org/r/20210418134658.4333-6-david.ward@gatech=
=2Eedu
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>   sound/soc/codecs/rt286.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/sound/soc/codecs/rt286.c b/sound/soc/codecs/rt286.c
> index 8abe232ca4a4..2f18f5114f7e 100644
> --- a/sound/soc/codecs/rt286.c
> +++ b/sound/soc/codecs/rt286.c
> @@ -1117,12 +1117,11 @@ static const struct dmi_system_id force_combo_j=
ack_table[] =3D {
>   	{ }
>   };
>  =20
> -static const struct dmi_system_id dmi_dell_dino[] =3D {
> +static const struct dmi_system_id dmi_dell[] =3D {
>   	{
> -		.ident =3D "Dell Dino",
> +		.ident =3D "Dell",
>   		.matches =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 13 9343")
>   		}
>   	},
>   	{ }
> @@ -1133,7 +1132,7 @@ static int rt286_i2c_probe(struct i2c_client *i2c=
,
>   {
>   	struct rt286_platform_data *pdata =3D dev_get_platdata(&i2c->dev);
>   	struct rt286_priv *rt286;
> -	int i, ret, val;
> +	int i, ret, vendor_id;
>  =20
>   	rt286 =3D devm_kzalloc(&i2c->dev,	sizeof(*rt286),
>   				GFP_KERNEL);
> @@ -1149,14 +1148,15 @@ static int rt286_i2c_probe(struct i2c_client *i=
2c,
>   	}
>  =20
>   	ret =3D regmap_read(rt286->regmap,
> -		RT286_GET_PARAM(AC_NODE_ROOT, AC_PAR_VENDOR_ID), &val);
> +		RT286_GET_PARAM(AC_NODE_ROOT, AC_PAR_VENDOR_ID), &vendor_id);
>   	if (ret !=3D 0) {
>   		dev_err(&i2c->dev, "I2C error %d\n", ret);
>   		return ret;
>   	}
> -	if (val !=3D RT286_VENDOR_ID && val !=3D RT288_VENDOR_ID) {
> +	if (vendor_id !=3D RT286_VENDOR_ID && vendor_id !=3D RT288_VENDOR_ID)=
 {
>   		dev_err(&i2c->dev,
> -			"Device with ID register %#x is not rt286\n", val);
> +			"Device with ID register %#x is not rt286\n",
> +			vendor_id);
>   		return -ENODEV;
>   	}
>  =20
> @@ -1180,8 +1180,8 @@ static int rt286_i2c_probe(struct i2c_client *i2c=
,
>   	if (pdata)
>   		rt286->pdata =3D *pdata;
>  =20
> -	if (dmi_check_system(force_combo_jack_table) ||
> -		dmi_check_system(dmi_dell_dino))
> +	if ((vendor_id =3D=3D RT288_VENDOR_ID && dmi_check_system(dmi_dell)) =
||
> +		dmi_check_system(force_combo_jack_table))
>   		rt286->pdata.cbj_en =3D true;
>  =20
>   	regmap_write(rt286->regmap, RT286_SET_AUDIO_POWER, AC_PWRST_D3);
> @@ -1220,7 +1220,7 @@ static int rt286_i2c_probe(struct i2c_client *i2c=
,
>   	regmap_update_bits(rt286->regmap, RT286_DEPOP_CTRL3, 0xf777, 0x4737)=
;
>   	regmap_update_bits(rt286->regmap, RT286_DEPOP_CTRL4, 0x00ff, 0x003f)=
;
>  =20
> -	if (dmi_check_system(dmi_dell_dino)) {
> +	if (vendor_id =3D=3D RT288_VENDOR_ID && dmi_check_system(dmi_dell)) {=

>   		regmap_update_bits(rt286->regmap,
>   			RT286_SET_GPIO_MASK, 0x40, 0x40);
>   		regmap_update_bits(rt286->regmap,

