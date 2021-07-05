Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 299B13BBE92
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jul 2021 16:59:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B30616AC;
	Mon,  5 Jul 2021 16:58:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B30616AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625497171;
	bh=SRbeekmALCy+S7zMtuQIogue7EB0LbZFjL4yzb1J/0M=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O0AK6fJ6U9wuq5QmnWAPPyLOsqurGIpJ8BtFOGmuLehQ0pgj5VgULvZlaE8i+wdbF
	 FguKh6Lu7NFVWNXb2lXE/zLVKl5G1jbDzlegpFCxYP53OYHtTzUfWPa6199IzFzNMF
	 vEzrb5mkFB7GpNUer69+Jx2kG3S7TFqRxlDc6etk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A376F8025C;
	Mon,  5 Jul 2021 16:58:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D3A8F80224; Mon,  5 Jul 2021 16:58:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F5BFF80124
 for <alsa-devel@alsa-project.org>; Mon,  5 Jul 2021 16:57:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F5BFF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="No2a8yoo"
Received: by mail-lj1-x233.google.com with SMTP id w11so25110191ljh.0
 for <alsa-devel@alsa-project.org>; Mon, 05 Jul 2021 07:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c62jtTESBdhj+zgxKn4K3UO9kuNCdUDnlQS6s6Ij6r8=;
 b=No2a8yoo3KOw7mHPy9P2rVG16ptsTZ1nWmPmDyGbvX5g5Itgyzal6M39/EXpr91fCK
 ULoXkmdiE4ATTrYaDzTc/Rr3cK+10ES/l2ZW1hLRFY9Y6VOmtFfoqyHhbAoLUYzJ8viX
 l3PT5EXY8TKXaUNF+vx3VR6zMcYoOeygRk45Cnx0lheUqgtAI7Zx+6YOMq3SEXnAIqhv
 STvsDhsn9AxLYcgRqBXTU/Y/vEaXerRL8DfETeyVofFX4GrN/3ki2PfR9+hKBxklPaDB
 P61dgEvzkmqMFPTM0tVyDYytRMk83ilwk81K8cPdCxZZX4cXlFJneibwgN96KKkMt2kz
 1kgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c62jtTESBdhj+zgxKn4K3UO9kuNCdUDnlQS6s6Ij6r8=;
 b=YL1gHLzbPxb01c767VuLGtAs0Rn1oaokA/dVYwv5pgZGAe1d5QVbiWEbebqaV+XuAF
 OpJsJ+Fk0Yk+ShFjEFEiG9PTx6GmclVXSvvRC/CDE3hJccOxwPDHLrfl+drT1vpmZvZK
 UsdYjjdJmeG1AA42Ah9cClDR6n/8BN66hle28rloPsNrd3497SIkDfRvmyftrD9PK11y
 mHta760tqM+eWXDwjpbkkFuxa5Cz5Cc71XauPV1aqerkOpKOSzHhE+fq+R3FmFJGFSOm
 5av4l4fQ+Ze8hXVw3XaFRSeG6h2GtfijLqNwqD25vtLlSDHWRUj/FVW1ggybkIgRYOKP
 hr2g==
X-Gm-Message-State: AOAM53202CMSb/dGSGIMIhh0KXLSqlO89tmgPCncMBR9rMIyFUPAWpEw
 aV+kIQEOop3D3nxx6ZZt4IU=
X-Google-Smtp-Source: ABdhPJzQP0LEE4SbbmpXytvLRJagEFjPCzE5zUuZuHzDUk73YVT+TUP5DbdaM7245+d1sxQq3z2GXg==
X-Received: by 2002:a2e:b4af:: with SMTP id q15mr5119851ljm.291.1625497076072; 
 Mon, 05 Jul 2021 07:57:56 -0700 (PDT)
Received: from [10.0.0.115] (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id a25sm1421542ljp.71.2021.07.05.07.57.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 07:57:55 -0700 (PDT)
Subject: Re: [PATCH 1/5] ASoC: ti: davinci-mcasp: Fix DIT mode support
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
To: broonie@kernel.org, tony@atomide.com
References: <20210704150450.20106-1-peter.ujfalusi@gmail.com>
 <20210704150450.20106-2-peter.ujfalusi@gmail.com>
Message-ID: <4b530480-bcd6-08cc-b8d6-7e57d0a823ce@gmail.com>
Date: Mon, 5 Jul 2021 17:58:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210704150450.20106-2-peter.ujfalusi@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: hns@goldelico.com, alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 lgirdwood@gmail.com
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

On 04/07/2021 18:04, Peter Ujfalusi wrote:
> The DIT mode support has not been tested due to lack of platform where it
> can be tested.
> To be able to use the McASP on OMAP4/5 (only supporting DIT mode) we need
> to have DIT mode working in the McASP driver on a know platform.
> After hacking around (on BBW, mcasp1.axr1 can be routed out for this) it
> appeared that DIT mode is broken.
> 
> This patch fixes it up and 16/24 bit audio works along with passthrough,
> but I have only tested with DTS example and test files.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
> ---
>  sound/soc/ti/davinci-mcasp.c | 142 ++++++++++++++++++++++++++++++-----
>  1 file changed, 122 insertions(+), 20 deletions(-)
> 
> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
> index 017a5a5e56cd..e56a22c28467 100644
> --- a/sound/soc/ti/davinci-mcasp.c
> +++ b/sound/soc/ti/davinci-mcasp.c
> @@ -83,6 +83,8 @@ struct davinci_mcasp {
>  	struct snd_pcm_substream *substreams[2];
>  	unsigned int dai_fmt;
>  
> +	u32 iec958_status;
> +
>  	/* Audio can not be enabled due to missing parameter(s) */
>  	bool	missing_audio_param;
>  
> @@ -757,6 +759,9 @@ static int davinci_mcasp_set_tdm_slot(struct snd_soc_dai *dai,
>  {
>  	struct davinci_mcasp *mcasp = snd_soc_dai_get_drvdata(dai);
>  
> +	if (mcasp->op_mode == DAVINCI_MCASP_DIT_MODE)
> +		return 0;
> +
>  	dev_dbg(mcasp->dev,
>  		 "%s() tx_mask 0x%08x rx_mask 0x%08x slots %d width %d\n",
>  		 __func__, tx_mask, rx_mask, slots, slot_width);
> @@ -827,6 +832,20 @@ static int davinci_config_channel_size(struct davinci_mcasp *mcasp,
>  		mcasp_mod_bits(mcasp, DAVINCI_MCASP_RXFMT_REG, RXROT(rx_rotate),
>  			       RXROT(7));
>  		mcasp_set_reg(mcasp, DAVINCI_MCASP_RXMASK_REG, mask);
> +	} else {
> +		/*
> +		 * according to the TRM it should be TXROT=0, this one works:
> +		 * 16 bit to 23-8 (TXROT=6, rotate 24 bits)
> +		 * 24 bit to 23-0 (TXROT=0, rotate 0 bits)
> +		 *
> +		 * TXROT = 0 only works with 24bit samples
> +		 */
> +		tx_rotate = (sample_width / 4 + 2) & 0x7;
> +
> +		mcasp_mod_bits(mcasp, DAVINCI_MCASP_TXFMT_REG, TXROT(tx_rotate),
> +			       TXROT(7));
> +		mcasp_mod_bits(mcasp, DAVINCI_MCASP_TXFMT_REG, TXSSZ(15),
> +			       TXSSZ(0x0F));
>  	}
>  
>  	mcasp_set_reg(mcasp, DAVINCI_MCASP_TXMASK_REG, mask);
> @@ -841,7 +860,7 @@ static int mcasp_common_hw_param(struct davinci_mcasp *mcasp, int stream,
>  	int i;
>  	u8 tx_ser = 0;
>  	u8 rx_ser = 0;
> -	u8 slots = mcasp->tdm_slots;
> +	u8 slots = mcasp->op_mode == DAVINCI_MCASP_DIT_MODE ? 384 : mcasp->tdm_slots;

This is wrong.
384 will not fit to u8...
I wonder why I don't saw this...

-- 
Péter
