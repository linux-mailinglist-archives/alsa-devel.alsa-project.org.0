Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D99894BD3
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 08:51:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1A732BBC;
	Tue,  2 Apr 2024 08:51:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1A732BBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712040679;
	bh=X1kX69Jlpw+6CmX8mQiJm4O+sWo7JoMK2tt6HDIjWZE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YW34bUmzSdaoNMmNzc3NPkMtnL1U2HTNkZQIjsCNz8cvS8kFnS+5/qv/MmOJj5C25
	 cTCemnpg0CBoAtKHiq6h6KIdGvuhxAcNG+wNb90kZRrklMZRfHmMvGAJfU94FjP+zC
	 IyMxO3mqBlPEyCZ4cA7OLbUIQz+ZHugr/FGyMhU0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AB8AF8067E; Tue,  2 Apr 2024 08:48:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7123F80756;
	Tue,  2 Apr 2024 08:48:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97ACBF8025F; Tue, 26 Mar 2024 16:39:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 576B3F80093
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 16:39:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 576B3F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=salutedevices.com header.i=@salutedevices.com
 header.a=rsa-sha256 header.s=mail header.b=ePA7RZGi
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id B15B9120004;
	Tue, 26 Mar 2024 18:39:50 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru B15B9120004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1711467590;
	bh=BspCg4rrPJ0Kpig9Yf6f5Zh/R+hA73hjDZvRIpKseLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=ePA7RZGi1LFC23l7KSsw/4S8dcZ2KX7MSOkB/o4z7Kk2vlwHcGfjZwFTTSddxMF+f
	 URyiU38kBwTwoJt/UMLBrUizr1BgaYdV4ur+KuUm83f1EozvmNDZ9cpdkeUnpSqQuw
	 1drQJP1WX826/tyNAVRms1daZhOuqIEHvqQLsIC+JCu+9ywl2hDy5YQDDnBdKRfQvD
	 pj8lzOMMbooGkBUAhXtSGhBv0LHmcIPKS1BFyB+YOywk42LakpkX/wKKFjbJBw+WEo
	 z3xSGvHF6QNA37l/vjQL+zyxidP40CmEf+/uQkGuApvFmVpnxMJwDPazWs1VmAbs9x
	 B2Fcv3mMDFswA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru
 [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 26 Mar 2024 18:39:50 +0300 (MSK)
Received: from [192.168.20.2] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 26 Mar 2024 18:39:50 +0300
Message-ID: <13bfb247-9210-48ae-902b-629d850cbae7@salutedevices.com>
Date: Tue, 26 Mar 2024 18:38:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] ASoC: meson: g12a-toacodec: rework the definition
 of bits
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	<alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20240325235311.411920-1-jan.dakinevich@salutedevices.com>
 <1j34sd9fur.fsf@starbuckisacylon.baylibre.com>
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <1j34sd9fur.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184425 [Mar 26 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 12 0.3.12
 d1a01b14eb3fc102c904d35fe6c2622ed2d1c16e, {Tracking_smtp_not_equal_from},
 {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to},
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;lore.kernel.org:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;salutedevices.com:7.1.1,
 FromAlignment: n, {Tracking_smtp_domain_mismatch},
 {Tracking_smtp_domain_2level_mismatch}, {Tracking_white_helo},
 ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/03/26 11:48:00
X-KSMG-LinksScanning: Clean, bases: 2024/03/26 11:48:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/03/26 13:11:00 #24452135
X-KSMG-AntiVirus-Status: Clean, skipped
X-MailFrom: YVDakinevich@sberdevices.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XQTGN74G774IYPDJCXVVG62MVKBTQCTD
X-Message-ID-Hash: XQTGN74G774IYPDJCXVVG62MVKBTQCTD
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:47:45 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XQTGN74G774IYPDJCXVVG62MVKBTQCTD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/26/24 18:15, Jerome Brunet wrote:
> 
> On Tue 26 Mar 2024 at 02:53, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:
> 
>> There is a lot of defines, but almost all of them are not used. Lets
>> rework them:
> 
> Thanks for noticing. Please start by removing what's unused.
> 

I mean, that some values are named. But then numbers are used instead names.

>>
>>  - keep separate the definition for different platforms to make easier
>>    checking that they match documentation.
>>
>>  - use LSB/MSB sufixes for uniformity.
> 
> I'd be in favor of dropping these suffixes completely.
> 
>>
>>  - don't use hard-coded values for already declared defines.
>>
>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>> ---
>> Links:
>>
>>  [1] https://lore.kernel.org/lkml/20240314232201.2102178-1-jan.dakinevich@salutedevices.com/
>>
>> Changes v1 -> v2:
>>  - Detached from v1's series (patch 7).
>>  - Fixed my wrong understanding of SOC_SINGLE's input parameters.
>>
>>  sound/soc/meson/g12a-toacodec.c | 79 ++++++++++++++++++++-------------
>>  1 file changed, 49 insertions(+), 30 deletions(-)
>>
>> diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
>> index 531bb8707a3e..22181f4bab72 100644
>> --- a/sound/soc/meson/g12a-toacodec.c
>> +++ b/sound/soc/meson/g12a-toacodec.c
>> @@ -20,26 +20,37 @@
>>  #define G12A_TOACODEC_DRV_NAME "g12a-toacodec"
>>  
>>  #define TOACODEC_CTRL0			0x0
>> -#define  CTRL0_ENABLE_SHIFT		31
>> -#define  CTRL0_DAT_SEL_SM1_MSB		19
>> -#define  CTRL0_DAT_SEL_SM1_LSB		18
>> -#define  CTRL0_DAT_SEL_MSB		15
>> -#define  CTRL0_DAT_SEL_LSB		14
>> -#define  CTRL0_LANE_SEL_SM1		16
>> -#define  CTRL0_LANE_SEL			12
>> -#define  CTRL0_LRCLK_SEL_SM1_MSB	14
>> -#define  CTRL0_LRCLK_SEL_SM1_LSB	12
>> -#define  CTRL0_LRCLK_SEL_MSB		9
>> -#define  CTRL0_LRCLK_SEL_LSB		8
>> -#define  CTRL0_LRCLK_INV_SM1		BIT(10)
>> -#define  CTRL0_BLK_CAP_INV_SM1		BIT(9)
>> -#define  CTRL0_BLK_CAP_INV		BIT(7)
>> -#define  CTRL0_BCLK_O_INV_SM1		BIT(8)
>> -#define  CTRL0_BCLK_O_INV		BIT(6)
>> -#define  CTRL0_BCLK_SEL_SM1_MSB		6
>> -#define  CTRL0_BCLK_SEL_MSB		5
>> -#define  CTRL0_BCLK_SEL_LSB		4
>> -#define  CTRL0_MCLK_SEL			GENMASK(2, 0)
>> +
>> +/* Common bits */
>> +#define CTRL0_ENABLE_SHIFT		31
>> +#define CTRL0_MCLK_SEL			GENMASK(2, 0)
>> +
>> +/* G12A bits */
>> +#define CTRL0_DAT_SEL_G12A_MSB		15
>> +#define CTRL0_DAT_SEL_G12A_LSB		14
>> +#define CTRL0_LANE_SEL_G12A_MSB		13
>> +#define CTRL0_LANE_SEL_G12A_LSB		12
>> +#define CTRL0_LANE_SEL_G12A_MAX		3
>> +#define CTRL0_LRCLK_SEL_G12A_MSB	9
>> +#define CTRL0_LRCLK_SEL_G12A_LSB	8
>> +#define CTRL0_BLK_CAP_INV_G12A		BIT(7)
>> +#define CTRL0_BCLK_O_INV_G12A		BIT(6)
>> +#define CTRL0_BCLK_SEL_G12A_MSB		5
>> +#define CTRL0_BCLK_SEL_G12A_LSB		4
>> +
>> +/* SM1 bits */
>> +#define CTRL0_DAT_SEL_SM1_MSB		19
>> +#define CTRL0_DAT_SEL_SM1_LSB		18
>> +#define CTRL0_LANE_SEL_SM1_MSB		17
>> +#define CTRL0_LANE_SEL_SM1_LSB		16
>> +#define CTRL0_LANE_SEL_SM1_MAX		3
>> +#define CTRL0_LRCLK_SEL_SM1_MSB		14
>> +#define CTRL0_LRCLK_SEL_SM1_LSB		12
>> +#define CTRL0_LRCLK_INV_SM1		BIT(10)
>> +#define CTRL0_BLK_CAP_INV_SM1		BIT(9)
>> +#define CTRL0_BCLK_O_INV_SM1		BIT(8)
>> +#define CTRL0_BCLK_SEL_SM1_MSB		6
>> +#define CTRL0_BCLK_SEL_SM1_LSB		4
>>  
>>  #define TOACODEC_OUT_CHMAX		2
>>  
>> @@ -108,7 +119,7 @@ static int g12a_toacodec_mux_put_enum(struct snd_kcontrol *kcontrol,
>>  }
>>  
>>  static SOC_ENUM_SINGLE_DECL(g12a_toacodec_mux_enum, TOACODEC_CTRL0,
>> -			    CTRL0_DAT_SEL_LSB,
>> +			    CTRL0_DAT_SEL_G12A_LSB,
>>  			    g12a_toacodec_mux_texts);
>>  
>>  static SOC_ENUM_SINGLE_DECL(sm1_toacodec_mux_enum, TOACODEC_CTRL0,
>> @@ -210,7 +221,7 @@ static int g12a_toacodec_component_probe(struct snd_soc_component *c)
>>  {
>>  	/* Initialize the static clock parameters */
>>  	return snd_soc_component_write(c, TOACODEC_CTRL0,
>> -				       CTRL0_BLK_CAP_INV);
>> +				       CTRL0_BLK_CAP_INV_G12A);
>>  }
>>  
>>  static int sm1_toacodec_component_probe(struct snd_soc_component *c)
>> @@ -229,11 +240,13 @@ static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
>>  };
>>  
>>  static const struct snd_kcontrol_new g12a_toacodec_controls[] = {
>> -	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL, 3, 0),
>> +	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_G12A_LSB,
>> +		   CTRL0_LANE_SEL_G12A_MAX, 0),
>>  };
>>  
>>  static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
>> -	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 3, 0),
>> +	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1_LSB,
>> +		   CTRL0_LANE_SEL_SM1_MAX, 0),
>>  };
>>  
>>  static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
>> @@ -266,16 +279,22 @@ static const struct regmap_config g12a_toacodec_regmap_cfg = {
>>  
>>  static const struct g12a_toacodec_match_data g12a_toacodec_match_data = {
>>  	.component_drv	= &g12a_toacodec_component_drv,
>> -	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, 14, 15),
>> -	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 8, 9),
>> -	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 5),
>> +	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_DAT_SEL_G12A_LSB,
>> +				    CTRL0_DAT_SEL_G12A_MSB),
>> +	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, CTRL0_LRCLK_SEL_G12A_LSB,
>> +				     CTRL0_LRCLK_SEL_G12A_MSB),
>> +	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_BCLK_SEL_G12A_LSB,
>> +				    CTRL0_BCLK_SEL_G12A_MSB),
>>  };
>>  
>>  static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
>>  	.component_drv	= &sm1_toacodec_component_drv,
>> -	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, 18, 19),
>> -	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 12, 14),
>> -	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 6),
>> +	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_DAT_SEL_SM1_LSB,
>> +				    CTRL0_DAT_SEL_SM1_MSB),
>> +	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, CTRL0_LRCLK_SEL_SM1_LSB,
>> +				     CTRL0_LRCLK_SEL_SM1_MSB),
>> +	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_BCLK_SEL_SM1_LSB,
>> +				    CTRL0_BCLK_SEL_SM1_MSB),
> 
> Those defines are already platform specific by the structure holding
> them and the defines you have added are not helping readability.
> 

These values are duplicated. Would it be reasonable to remove them from
defines?

> I don't see the point to see.
> I'd prefer to keep the field defined as they are.
> 

Main goal of this patch is to rearrange definitions by platforms. From
my point it is quite difficult to read things like this:

#define  CTRL0_LANE_SEL_SM1		16
#define  CTRL0_LANE_SEL			12
#define  CTRL0_LRCLK_SEL_SM1_MSB	14
#define  CTRL0_LRCLK_SEL_SM1_LSB	12
#define  CTRL0_LRCLK_SEL_MSB		9
#define  CTRL0_LRCLK_SEL_LSB		8

I am going to add one more platforms, and this will get worse.

>>  };
>>  
>>  static const struct of_device_id g12a_toacodec_of_match[] = {
> 
> 

-- 
Best regards
Jan Dakinevich
