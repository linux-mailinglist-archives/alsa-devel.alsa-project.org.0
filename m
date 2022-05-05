Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 018D451B6E1
	for <lists+alsa-devel@lfdr.de>; Thu,  5 May 2022 06:00:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3602179B;
	Thu,  5 May 2022 06:00:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3602179B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651723255;
	bh=lmEfsT2w2r7tgbGw1nBlr42ZCZMn3JbQH4Ts1as214M=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vjUD8Z5b2zKCsvWFZbdwD7PAWKU0SrC/2tDsvYWA9dVUQm1bLjlh/kSXbxqbUiYH7
	 HH3LlbFKdzHn5bQ1xyWEshpEDX7EXof8pUOzA0E9j9vFknDikxu4LXzm5PcFGP7jXA
	 Ggux/83B7IoLr7H/f4jRobxDd2NB+FcX9izp7hgI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50F3AF800BF;
	Thu,  5 May 2022 05:59:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0529F8016B; Thu,  5 May 2022 05:59:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D69D3F800BF
 for <alsa-devel@alsa-project.org>; Thu,  5 May 2022 05:59:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D69D3F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="p0yTvBJr"
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E6F243F6FD
 for <alsa-devel@alsa-project.org>; Thu,  5 May 2022 03:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1651723179;
 bh=tHBXCEpcvE3FUcO2qJsnS05zkLtGUpvJDlRzIJIAxmo=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=p0yTvBJroZ/HuWla2wPlUWr0DNsOanxQ/04nB70vzpPkeoHZKdlUXOHIRv0bV4mwL
 RqV5PkzdBbxf0APD/elWVOt1EgIUcPCfNbwbEY17Npiq8PqopOt/cfVXe71dnH+fN+
 h8jArlmY2lfw7o8bWKuRau+KT+YQ4iq6TN+wL3XLK64dcpNjLBda2dgKeCr9EN9N4t
 cpzp7G97a35XbDOQ0Dk0c164Bw8X6/TGwf8pxdtdY1SdIENciXWsJJQ/F4GeegcNIw
 jNt6AZDiftUPWbZyJh3C8K4yR4xlZ7yd6DdYYeCmWfC+ZN7vGGOnRNFoCX8xoAq3h5
 qi9a+jpqRrZYA==
Received: by mail-pj1-f72.google.com with SMTP id
 w3-20020a17090ac98300b001b8b914e91aso1640315pjt.0
 for <alsa-devel@alsa-project.org>; Wed, 04 May 2022 20:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tHBXCEpcvE3FUcO2qJsnS05zkLtGUpvJDlRzIJIAxmo=;
 b=0kTECyMSVzRzfkvjlxWJG4tOEkz8rWmz2nuvIb/LNs2MGpfOjuOjGBVm4rE3XN9MJX
 W41FrXz7Jq4DdX95X7WjMhtkliOpnCdiyOxxneilqgcn3Vb2wCARAHBuT7P0NcDaKutg
 u8xtXTexnIrF81oLwiBywzg9KEqC3m85WjLrIO5KURD8iGZoN1ILvHPANyeQVa1b6yp1
 4hRFMSm4qU4hMP3dq86GyU79XDthFkud+vLLQlMmYkdj4ntLTiGtTS0MbVLVlKguMvi2
 FuFO2wpSBb8UQ5+gSGbQfV/DoH1K4AMWXmgb1WszIWNh65Rfa5BF8WwkZIXg6y9y8ffd
 qY3w==
X-Gm-Message-State: AOAM532En2CfGkmb8xpeYAAI7shiABpnnGUCp+InDMmivRLVB8F+ktur
 VZOI7LaegEsA19yIlTN9XAuBxey7/JabH/dGVJG7W5PnO6HrmjpnTeTwQbyP24PplZFBFYZkKio
 KyyUpeTrXDe8fCyDCK8Fn0RbWnLF6mc3oArJEjRnX
X-Received: by 2002:a17:902:cf0f:b0:15a:24e0:d9b0 with SMTP id
 i15-20020a170902cf0f00b0015a24e0d9b0mr25320127plg.42.1651723178519; 
 Wed, 04 May 2022 20:59:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw82gsr0PpaFQdwd8j/stSV+YDDfhbUCXqlhmGf94ePNM8YZXcOkPEx+bfep4SF537NhgOtsQ==
X-Received: by 2002:a17:902:cf0f:b0:15a:24e0:d9b0 with SMTP id
 i15-20020a170902cf0f00b0015a24e0d9b0mr25320082plg.42.1651723177947; 
 Wed, 04 May 2022 20:59:37 -0700 (PDT)
Received: from [10.102.97.125] (118-163-61-247.hinet-ip.hinet.net.
 [118.163.61.247]) by smtp.gmail.com with ESMTPSA id
 s6-20020a170902ea0600b0015e8d4eb2d5sm277509plg.287.2022.05.04.20.59.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 20:59:37 -0700 (PDT)
Message-ID: <bb0801fa-3007-b837-17f4-f729c6473253@canonical.com>
Date: Thu, 5 May 2022 11:59:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v1 3/3] ALSA: hda/cs8409: Support manual mode detection
 for CS42L42
Content-Language: en-US
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20220504161236.2490532-1-sbinding@opensource.cirrus.com>
 <20220504161236.2490532-4-sbinding@opensource.cirrus.com>
From: Chris Chiu <chris.chiu@canonical.com>
In-Reply-To: <20220504161236.2490532-4-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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


On 2022/5/5 00:12, Stefan Binding wrote:
> For Jack detection on CS42L42, detection is normally done using
> "auto" mode, which automatically detects what type of jack is
> connected to the device. However, some headsets are not
> automatically detected, and as such and alternative detection
> method "manual mode" can be used to detect these headsets.
>
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---

Tested-by: Chris Chiu <chris.chiu@canonical.com>


>   sound/pci/hda/patch_cs8409-tables.c |   3 -
>   sound/pci/hda/patch_cs8409.c        | 159 +++++++++++++++++++++++-----
>   sound/pci/hda/patch_cs8409.h        |   1 -
>   3 files changed, 132 insertions(+), 31 deletions(-)
>
> diff --git a/sound/pci/hda/patch_cs8409-tables.c b/sound/pci/hda/patch_cs8409-tables.c
> index a7ee489e6aec..0d11b24a1317 100644
> --- a/sound/pci/hda/patch_cs8409-tables.c
> +++ b/sound/pci/hda/patch_cs8409-tables.c
> @@ -252,7 +252,6 @@ struct sub_codec cs8409_cs42l42_codec = {
>   	.init_seq_num = ARRAY_SIZE(cs42l42_init_reg_seq),
>   	.hp_jack_in = 0,
>   	.mic_jack_in = 0,
> -	.force_status_change = 1,
>   	.paged = 1,
>   	.suspended = 1,
>   	.no_type_dect = 0,
> @@ -444,7 +443,6 @@ struct sub_codec dolphin_cs42l42_0 = {
>   	.init_seq_num = ARRAY_SIZE(dolphin_c0_init_reg_seq),
>   	.hp_jack_in = 0,
>   	.mic_jack_in = 0,
> -	.force_status_change = 1,
>   	.paged = 1,
>   	.suspended = 1,
>   	.no_type_dect = 0,
> @@ -458,7 +456,6 @@ struct sub_codec dolphin_cs42l42_1 = {
>   	.init_seq_num = ARRAY_SIZE(dolphin_c1_init_reg_seq),
>   	.hp_jack_in = 0,
>   	.mic_jack_in = 0,
> -	.force_status_change = 1,
>   	.paged = 1,
>   	.suspended = 1,
>   	.no_type_dect = 1,
> diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
> index d35d124bf3dc..c3a8b04c71d8 100644
> --- a/sound/pci/hda/patch_cs8409.c
> +++ b/sound/pci/hda/patch_cs8409.c
> @@ -634,38 +634,128 @@ static void cs42l42_run_jack_detect(struct sub_codec *cs42l42)
>   	cs8409_i2c_write(cs42l42, CS42L42_HSDET_CTL2, 0xc0);
>   }
>   
> -static int cs42l42_handle_tip_sense(struct sub_codec *cs42l42, unsigned int reg_ts_status)
> +static int cs42l42_manual_hs_det(struct sub_codec *cs42l42)
>   {
> -	int status_changed = cs42l42->force_status_change;
> +	unsigned int hs_det_status;
> +	unsigned int hs_det_comp1;
> +	unsigned int hs_det_comp2;
> +	unsigned int hs_det_sw;
> +	unsigned int hs_type;
> +
> +	/* Set hs detect to manual, active mode */
> +	cs8409_i2c_write(cs42l42, CS42L42_HSDET_CTL2,
> +			 (1 << CS42L42_HSDET_CTRL_SHIFT) |
> +			 (0 << CS42L42_HSDET_SET_SHIFT) |
> +			 (0 << CS42L42_HSBIAS_REF_SHIFT) |
> +			 (0 << CS42L42_HSDET_AUTO_TIME_SHIFT));
> +
> +	/* Configure HS DET comparator reference levels. */
> +	cs8409_i2c_write(cs42l42, CS42L42_HSDET_CTL1,
> +			 (CS42L42_HSDET_COMP1_LVL_VAL << CS42L42_HSDET_COMP1_LVL_SHIFT) |
> +			 (CS42L42_HSDET_COMP2_LVL_VAL << CS42L42_HSDET_COMP2_LVL_SHIFT));
> +
> +	/* Open the SW_HSB_HS3 switch and close SW_HSB_HS4 for a Type 1 headset. */
> +	cs8409_i2c_write(cs42l42, CS42L42_HS_SWITCH_CTL, CS42L42_HSDET_SW_COMP1);
> +
> +	msleep(100);
> +
> +	hs_det_status = cs8409_i2c_read(cs42l42, CS42L42_HS_DET_STATUS);
> +
> +	hs_det_comp1 = (hs_det_status & CS42L42_HSDET_COMP1_OUT_MASK) >>
> +			CS42L42_HSDET_COMP1_OUT_SHIFT;
> +	hs_det_comp2 = (hs_det_status & CS42L42_HSDET_COMP2_OUT_MASK) >>
> +			CS42L42_HSDET_COMP2_OUT_SHIFT;
> +
> +	/* Close the SW_HSB_HS3 switch for a Type 2 headset. */
> +	cs8409_i2c_write(cs42l42, CS42L42_HS_SWITCH_CTL, CS42L42_HSDET_SW_COMP2);
>   
> -	cs42l42->force_status_change = 0;
> +	msleep(100);
> +
> +	hs_det_status = cs8409_i2c_read(cs42l42, CS42L42_HS_DET_STATUS);
> +
> +	hs_det_comp1 |= ((hs_det_status & CS42L42_HSDET_COMP1_OUT_MASK) >>
> +			CS42L42_HSDET_COMP1_OUT_SHIFT) << 1;
> +	hs_det_comp2 |= ((hs_det_status & CS42L42_HSDET_COMP2_OUT_MASK) >>
> +			CS42L42_HSDET_COMP2_OUT_SHIFT) << 1;
> +
> +	/* Use Comparator 1 with 1.25V Threshold. */
> +	switch (hs_det_comp1) {
> +	case CS42L42_HSDET_COMP_TYPE1:
> +		hs_type = CS42L42_PLUG_CTIA;
> +		hs_det_sw = CS42L42_HSDET_SW_TYPE1;
> +		break;
> +	case CS42L42_HSDET_COMP_TYPE2:
> +		hs_type = CS42L42_PLUG_OMTP;
> +		hs_det_sw = CS42L42_HSDET_SW_TYPE2;
> +		break;
> +	default:
> +		/* Fallback to Comparator 2 with 1.75V Threshold. */
> +		switch (hs_det_comp2) {
> +		case CS42L42_HSDET_COMP_TYPE1:
> +			hs_type = CS42L42_PLUG_CTIA;
> +			hs_det_sw = CS42L42_HSDET_SW_TYPE1;
> +			break;
> +		case CS42L42_HSDET_COMP_TYPE2:
> +			hs_type = CS42L42_PLUG_OMTP;
> +			hs_det_sw = CS42L42_HSDET_SW_TYPE2;
> +			break;
> +		case CS42L42_HSDET_COMP_TYPE3:
> +			hs_type = CS42L42_PLUG_HEADPHONE;
> +			hs_det_sw = CS42L42_HSDET_SW_TYPE3;
> +			break;
> +		default:
> +			hs_type = CS42L42_PLUG_INVALID;
> +			hs_det_sw = CS42L42_HSDET_SW_TYPE4;
> +			break;
> +		}
> +	}
> +
> +	/* Set Switches */
> +	cs8409_i2c_write(cs42l42, CS42L42_HS_SWITCH_CTL, hs_det_sw);
> +
> +	/* Set HSDET mode to Manual—Disabled */
> +	cs8409_i2c_write(cs42l42, CS42L42_HSDET_CTL2,
> +			 (0 << CS42L42_HSDET_CTRL_SHIFT) |
> +			 (0 << CS42L42_HSDET_SET_SHIFT) |
> +			 (0 << CS42L42_HSBIAS_REF_SHIFT) |
> +			 (0 << CS42L42_HSDET_AUTO_TIME_SHIFT));
> +
> +	/* Configure HS DET comparator reference levels. */
> +	cs8409_i2c_write(cs42l42, CS42L42_HSDET_CTL1,
> +			 (CS42L42_HSDET_COMP1_LVL_DEFAULT << CS42L42_HSDET_COMP1_LVL_SHIFT) |
> +			 (CS42L42_HSDET_COMP2_LVL_DEFAULT << CS42L42_HSDET_COMP2_LVL_SHIFT));
> +
> +	return hs_type;
> +}
> +
> +static int cs42l42_handle_tip_sense(struct sub_codec *cs42l42, unsigned int reg_ts_status)
> +{
> +	int status_changed = 0;
>   
>   	/* TIP_SENSE INSERT/REMOVE */
>   	switch (reg_ts_status) {
>   	case CS42L42_TS_PLUG:
> -		if (!cs42l42->hp_jack_in) {
> -			if (cs42l42->no_type_dect) {
> -				status_changed = 1;
> -				cs42l42->hp_jack_in = 1;
> -				cs42l42->mic_jack_in = 0;
> -			} else {
> -				cs42l42_run_jack_detect(cs42l42);
> -			}
> +		if (cs42l42->no_type_dect) {
> +			status_changed = 1;
> +			cs42l42->hp_jack_in = 1;
> +			cs42l42->mic_jack_in = 0;
> +		} else {
> +			cs42l42_run_jack_detect(cs42l42);
>   		}
>   		break;
>   
>   	case CS42L42_TS_UNPLUG:
> -		if (cs42l42->hp_jack_in || cs42l42->mic_jack_in) {
> -			status_changed = 1;
> -			cs42l42->hp_jack_in = 0;
> -			cs42l42->mic_jack_in = 0;
> -		}
> +		status_changed = 1;
> +		cs42l42->hp_jack_in = 0;
> +		cs42l42->mic_jack_in = 0;
>   		break;
>   	default:
>   		/* jack in transition */
>   		break;
>   	}
>   
> +	codec_dbg(cs42l42->codec, "Tip Sense Detection: (%d)\n", reg_ts_status);
> +
>   	return status_changed;
>   }
>   
> @@ -698,24 +788,40 @@ static int cs42l42_jack_unsol_event(struct sub_codec *cs42l42)
>   
>   		type = (reg_hs_status & CS42L42_HSDET_TYPE_MASK) >> CS42L42_HSDET_TYPE_SHIFT;
>   
> +		/* Configure the HSDET mode. */
> +		cs8409_i2c_write(cs42l42, CS42L42_HSDET_CTL2, 0x80);
> +
>   		if (cs42l42->no_type_dect) {
>   			status_changed = cs42l42_handle_tip_sense(cs42l42, current_plug_status);
> -		} else if (type == CS42L42_PLUG_INVALID) {
> -			/* Type CS42L42_PLUG_INVALID not supported	*/
> -			status_changed = cs42l42_handle_tip_sense(cs42l42, CS42L42_TS_UNPLUG);
>   		} else {
> -			if (!cs42l42->hp_jack_in) {
> -				status_changed = 1;
> -				cs42l42->hp_jack_in = 1;
> +			if (type == CS42L42_PLUG_INVALID || type == CS42L42_PLUG_HEADPHONE) {
> +				codec_dbg(cs42l42->codec,
> +					  "Auto detect value not valid (%d), running manual det\n",
> +					  type);
> +				type = cs42l42_manual_hs_det(cs42l42);
>   			}
> -			/* type = CS42L42_PLUG_HEADPHONE has no mic */
> -			if ((!cs42l42->mic_jack_in) && (type != CS42L42_PLUG_HEADPHONE)) {
> +
> +			switch (type) {
> +			case CS42L42_PLUG_CTIA:
> +			case CS42L42_PLUG_OMTP:
>   				status_changed = 1;
> +				cs42l42->hp_jack_in = 1;
>   				cs42l42->mic_jack_in = 1;
> +				break;
> +			case CS42L42_PLUG_HEADPHONE:
> +				status_changed = 1;
> +				cs42l42->hp_jack_in = 1;
> +				cs42l42->mic_jack_in = 0;
> +				break;
> +			default:
> +				status_changed = 1;
> +				cs42l42->hp_jack_in = 0;
> +				cs42l42->mic_jack_in = 0;
> +				break;
>   			}
> +			codec_dbg(cs42l42->codec, "Detection done (%d)\n", type);
>   		}
> -		/* Configure the HSDET mode. */
> -		cs8409_i2c_write(cs42l42, CS42L42_HSDET_CTL2, 0x80);
> +
>   		/* Enable the HPOUT ground clamp and configure the HP pull-down */
>   		cs8409_i2c_write(cs42l42, CS42L42_DAC_CTL2, 0x02);
>   		/* Re-Enable Tip Sense Interrupt */
> @@ -803,7 +909,6 @@ static void cs42l42_suspend(struct sub_codec *cs42l42)
>   	cs42l42->last_page = 0;
>   	cs42l42->hp_jack_in = 0;
>   	cs42l42->mic_jack_in = 0;
> -	cs42l42->force_status_change = 1;
>   
>   	/* Put CS42L42 into Reset */
>   	gpio_data = snd_hda_codec_read(codec, CS8409_PIN_AFG, 0, AC_VERB_GET_GPIO_DATA, 0);
> diff --git a/sound/pci/hda/patch_cs8409.h b/sound/pci/hda/patch_cs8409.h
> index 988259f8a940..ebf473a3f109 100644
> --- a/sound/pci/hda/patch_cs8409.h
> +++ b/sound/pci/hda/patch_cs8409.h
> @@ -304,7 +304,6 @@ struct sub_codec {
>   
>   	unsigned int hp_jack_in:1;
>   	unsigned int mic_jack_in:1;
> -	unsigned int force_status_change:1;
>   	unsigned int suspended:1;
>   	unsigned int paged:1;
>   	unsigned int last_page;
>
