Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3ED727C02
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 11:58:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0D793E8;
	Thu,  8 Jun 2023 11:57:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0D793E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686218312;
	bh=Abj1gkmLa48yb8iW0WQ8r6Hnx6PfuQ7ea7AnIpcaE50=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J2GHMpd4hRriZfa4AYrgVyZd4UmBq9Dx8QgAkGgZklSYoC+vz5hV5A2fZ4YIlup4C
	 aEe5CLc6itPjmSCGk+rqt8Jy+S85B89opKa1hvI3mauwssz1QmE7CyfvbX5FuQC8tM
	 KzeAn6qQL2iKCPMk1wy0jvzCMScyZqF0cLf38rqk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BA21F8016C; Thu,  8 Jun 2023 11:57:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DAC76F8016C;
	Thu,  8 Jun 2023 11:57:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5785FF80199; Thu,  8 Jun 2023 11:57:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 964DEF80130
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 11:57:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 964DEF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=Tw3LJYSw
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6F4746606F15;
	Thu,  8 Jun 2023 10:57:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686218253;
	bh=Abj1gkmLa48yb8iW0WQ8r6Hnx6PfuQ7ea7AnIpcaE50=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Tw3LJYSwlTxxs/4vWOISFnCIKFeE/Aw2I4fbULbv0/vnf0IVskSEmmKoW1SZ5+ABz
	 J1XD6X903rIQIKUtfr13/IhM1TfEDtKiNrL/sQlSXZTbU8uHPVgTrxDzqmQHDVA4yG
	 4vvStYukIMo6glYEzjByEjsKrK5erQ8pKP2avcLbMmwLqI5DoTuLx1uovnLz4GFZrc
	 wfKks3nHT+7y16s1LchIN8wnYAUila+W7zgnFzSt9eBzntD2/jL6+l+D3OaKPFp83v
	 bwCaQF6wrTRixWcgTVY26mUdj9T6D2GhHzZtA+UegMfFt67JT0rNJimmL3ZOWyocww
	 gvpFhbo/JL13g==
Message-ID: <a8b454e3-dded-02d6-b97a-6a7aa3420cf1@collabora.com>
Date: Thu, 8 Jun 2023 11:57:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 5/5] ASoC: mediatek: mt8188-mt6359: Use bitfield macros
 for registers
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, dan.carpenter@linaro.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
 <20230608084727.74403-6-angelogioacchino.delregno@collabora.com>
 <8bbbc852-6139-29d4-417c-a2d9c77c192f@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <8bbbc852-6139-29d4-417c-a2d9c77c192f@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AZHBNT7FUD6VXUUJSHDW3QZYPQXNLFPK
X-Message-ID-Hash: AZHBNT7FUD6VXUUJSHDW3QZYPQXNLFPK
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AZHBNT7FUD6VXUUJSHDW3QZYPQXNLFPK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 08/06/23 11:50, Alexandre Mergnat ha scritto:
> On 08/06/2023 10:47, AngeloGioacchino Del Regno wrote:
>> Replace open coded instances of FIELD_GET() with it, move register
>> definitions at the top of the file and also replace magic numbers
>> with register definitions.
>>
>> While at it, also change a regmap_update_bits() call to regmap_write()
>> because the top 29 bits of AUD_TOP_CFG (31:3) are reserved (unused).
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   sound/soc/mediatek/mt8188/mt8188-mt6359.c | 32 ++++++++++++++---------
>>   1 file changed, 19 insertions(+), 13 deletions(-)
>>
>> diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c 
>> b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
>> index 5b2660139421..ac69c23e0da1 100644
>> --- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
>> +++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
>> @@ -6,6 +6,7 @@
>>    * Author: Trevor Wu <trevor.wu@mediatek.com>
>>    */
>> +#include <linux/bitfield.h>
>>   #include <linux/input.h>
>>   #include <linux/module.h>
>>   #include <linux/of_device.h>
>> @@ -19,6 +20,15 @@
>>   #include "../common/mtk-afe-platform-driver.h"
>>   #include "../common/mtk-soundcard-driver.h"
>> +#define CKSYS_AUD_TOP_CFG    0x032c
>> + #define RG_TEST_ON        BIT(0)
>> + #define RG_TEST_TYPE        BIT(2)
>> +#define CKSYS_AUD_TOP_MON    0x0330
>> + #define TEST_MISO_COUNT_1    GENMASK(3, 0)
>> + #define TEST_MISO_COUNT_2    GENMASK(7, 4)
>> + #define TEST_MISO_DONE_1    BIT(28)
>> + #define TEST_MISO_DONE_2    BIT(29)
>> +
>>   #define NAU8825_HS_PRESENT    BIT(0)
>>   /*
>> @@ -251,9 +261,6 @@ static const struct snd_kcontrol_new 
>> mt8188_nau8825_controls[] = {
>>       SOC_DAPM_PIN_SWITCH("Headphone Jack"),
>>   };
>> -#define CKSYS_AUD_TOP_CFG 0x032c
>> -#define CKSYS_AUD_TOP_MON 0x0330
>> -
>>   static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
>>   {
>>       struct snd_soc_component *cmpnt_afe =
>> @@ -265,13 +272,13 @@ static int mt8188_mt6359_mtkaif_calibration(struct 
>> snd_soc_pcm_runtime *rtd)
>>       struct mtkaif_param *param;
>>       int chosen_phase_1, chosen_phase_2;
>>       int prev_cycle_1, prev_cycle_2;
>> -    int test_done_1, test_done_2;
>> +    u8 test_done_1, test_done_2;
>>       int cycle_1, cycle_2;
> 
> Shouldn't be unsigned too ?
> 
> I'm wondering if it would be better (probably in another patch) to change the data 
> type of the other variables too, to match their use-case. (maybe it's already the 
> case, I'm just wondering)
> 

In theory, yes, cycle_1 and 2 should be unsigned, but the signedness of this
variable is getting used in the calibration logic later, as in the for loop
they are both being reinitialized to -1 ... so I couldn't just switch 'em to
unsigned.

>>       int mtkaif_chosen_phase[MT8188_MTKAIF_MISO_NUM];
>>       int mtkaif_phase_cycle[MT8188_MTKAIF_MISO_NUM];
>>       int mtkaif_calibration_num_phase;
>>       bool mtkaif_calibration_ok;
>> -    unsigned int monitor = 0;
>> +    u32 monitor = 0;
>>       int counter;
>>       int phase;
>>       int i;
>> @@ -303,8 +310,7 @@ static int mt8188_mt6359_mtkaif_calibration(struct 
>> snd_soc_pcm_runtime *rtd)
>>       mt6359_mtkaif_calibration_enable(cmpnt_codec);
>>       /* set test type to synchronizer pulse */
>> -    regmap_update_bits(afe_priv->topckgen,
>> -               CKSYS_AUD_TOP_CFG, 0xffff, 0x4);
>> +    regmap_write(afe_priv->topckgen, CKSYS_AUD_TOP_CFG, RG_TEST_TYPE);
>>       mtkaif_calibration_num_phase = 42;    /* mt6359: 0 ~ 42 */
>>       mtkaif_calibration_ok = true;
>> @@ -314,7 +320,7 @@ static int mt8188_mt6359_mtkaif_calibration(struct 
>> snd_soc_pcm_runtime *rtd)
>>           mt6359_set_mtkaif_calibration_phase(cmpnt_codec,
>>                               phase, phase, phase);
>> -        regmap_set_bits(afe_priv->topckgen, CKSYS_AUD_TOP_CFG, 0x1);
>> +        regmap_set_bits(afe_priv->topckgen, CKSYS_AUD_TOP_CFG, RG_TEST_ON);
>>           test_done_1 = 0;
>>           test_done_2 = 0;
>> @@ -326,14 +332,14 @@ static int mt8188_mt6359_mtkaif_calibration(struct 
>> snd_soc_pcm_runtime *rtd)
>>           while (!(test_done_1 & test_done_2)) {
>>               regmap_read(afe_priv->topckgen,
>>                       CKSYS_AUD_TOP_MON, &monitor);
>> -            test_done_1 = (monitor >> 28) & 0x1;
>> -            test_done_2 = (monitor >> 29) & 0x1;
>> +            test_done_1 = FIELD_GET(TEST_MISO_DONE_1, monitor);
>> +            test_done_2 = FIELD_GET(TEST_MISO_DONE_2, monitor);
>>               if (test_done_1 == 1)
>> -                cycle_1 = monitor & 0xf;
>> +                cycle_1 = FIELD_GET(TEST_MISO_COUNT_1, monitor);
>>               if (test_done_2 == 1)
>> -                cycle_2 = (monitor >> 4) & 0xf;
>> +                cycle_2 = FIELD_GET(TEST_MISO_COUNT_2, monitor);
>>               /* handle if never test done */
>>               if (++counter > 10000) {
>> @@ -361,7 +367,7 @@ static int mt8188_mt6359_mtkaif_calibration(struct 
>> snd_soc_pcm_runtime *rtd)
>>               mtkaif_phase_cycle[MT8188_MTKAIF_MISO_1] = prev_cycle_2;
>>           }
>> -        regmap_clear_bits(afe_priv->topckgen, CKSYS_AUD_TOP_CFG, 0x1);
>> +        regmap_clear_bits(afe_priv->topckgen, CKSYS_AUD_TOP_CFG, RG_TEST_ON);
>>           if (mtkaif_chosen_phase[MT8188_MTKAIF_MISO_0] >= 0 &&
>>               mtkaif_chosen_phase[MT8188_MTKAIF_MISO_1] >= 0)
> 
> After that:
> 
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> 

