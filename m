Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 734CB1846B3
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 13:18:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F35ED17E7;
	Fri, 13 Mar 2020 13:18:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F35ED17E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584101932;
	bh=eICaTUVnqdLrgLYjZFV6B4lCOe3ScTRooyQUY7GWhIQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p0Jcrje+GQtfRUxouMaXo4i7AjalzVCFtOflr2/HO1Qiy7qYX10Ms4QCVZI15p4Fa
	 6pCFwdUWrXN+Tgk1bRspg0+CS14VM3aUlhg72AKvtu1SrfWKuFDFj1icjUeCUfJWyp
	 gZPRzjWiKGOemk8G5CYKETgvLRMI7SDED8WKlm7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5749CF80249;
	Fri, 13 Mar 2020 13:16:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5816F801F7; Fri, 13 Mar 2020 13:15:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC851F801A3
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 13:15:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC851F801A3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Qq5X8eF/"
Received: by mail-wr1-x443.google.com with SMTP id b2so5569347wrj.10
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 05:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dkkOhNptW/+i6AyGAlAqxzIg7MAf9JOSQV9ZjZ8SZb0=;
 b=Qq5X8eF/pk2ONqTki4DzQ/QaR74gyCIuVgJhjAdSm6LRfjQvqIKFfJjp+MmGiCEmCF
 kCy+Kuh0WTq08v4WtL0QX7xPj9ZjHmYTA8dLuQDDfXdnqS18w7rJL57weHJ0D/QslzQY
 dCve5He1CXK81mR2k9/edV7/sGQdRz2XFxFY4c4VUq8LCAbAzNI1avYRfAGtLMc/p+MS
 nvGB4B/1r6i9leJd0cs9Oupl2a7bRuJRxBpC89Yv+mYXIHuU18Fljb1pYZ3pLZKlnUV4
 SLu8j8JzkMeHZMnZLTY+p7xGBwK0SSY7U6L0kBDbPc816Dv3+bLt6cEwXu6mdoEXtSzK
 7lbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dkkOhNptW/+i6AyGAlAqxzIg7MAf9JOSQV9ZjZ8SZb0=;
 b=CU2MkKGDIE8gUHRO/unEaUA4AwMnIvU1X1wdgaqB6hSeHBLVEz0MI1g9hVGMasZNeX
 Hwf1WmL2/USPqqb5rW5UafcFJi70ciz4NY2R7vNCd69y9mYyYMJ0Tc1T82Rm4dHni/iJ
 QPhjrbovLRXSyvXwMWs5285ct3+rsCYh1gMS34yzz9T/Sqkfc+TvOhfo9Uzm6mKoM831
 lCIUx2zgVGARLk/1ayK5QxtNdkcPFFnqh4HxjsmCdhjfI5WpJHznq4jVPFNdACtITL1e
 jRr+hLXNvPMxiLpfaGee7x9lWa27MhOKD/xTSe47CTte5HZnauWwnR+kIFN2Bj59DG9E
 /s8g==
X-Gm-Message-State: ANhLgQ0OzGwG4MNxmm8s5T8OT4/KoqG6h6PF64ZP2VOx0UGf3E3YvEDI
 B9Ff65Wec1PK5IhNV/kSCOGlgQ==
X-Google-Smtp-Source: ADFU+vs9izdgrrewhtkxUU5LKPkaJ65rMQLgmOmqDgkmbdhOP1bk6wyZiC5daEz2RNyitsQZf1Ladw==
X-Received: by 2002:adf:f289:: with SMTP id k9mr11052126wro.220.1584101730877; 
 Fri, 13 Mar 2020 05:15:30 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id t1sm33778054wrq.36.2020.03.13.05.15.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Mar 2020 05:15:30 -0700 (PDT)
Subject: Re: [RESEND PATCH v2 7/9] ASoC: qcom: q6asm: add support for alac and
 ape configs
To: Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
References: <20200313101627.1561365-1-vkoul@kernel.org>
 <20200313101627.1561365-8-vkoul@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a4002e22-81c8-e1bf-50dc-03fe6a55a6b1@linaro.org>
Date: Fri, 13 Mar 2020 12:15:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200313101627.1561365-8-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org
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



On 13/03/2020 10:16, Vinod Koul wrote:
> Qualcomm DSPs expect ALAC and APE configs to be send for decoders,
> so add the API to program the respective config to the DSP.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


> ---
>   sound/soc/qcom/qdsp6/q6asm.c | 118 +++++++++++++++++++++++++++++++++++
>   sound/soc/qcom/qdsp6/q6asm.h |  32 ++++++++++
>   2 files changed, 150 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
> index 4cec95c657ba..0e0e8f7a460a 100644
> --- a/sound/soc/qcom/qdsp6/q6asm.c
> +++ b/sound/soc/qcom/qdsp6/q6asm.c
> @@ -48,6 +48,8 @@
>   #define ASM_STREAM_CMD_OPEN_READ_V3                 0x00010DB4
>   #define ASM_DATA_EVENT_READ_DONE_V2 0x00010D9A
>   #define ASM_STREAM_CMD_OPEN_READWRITE_V2        0x00010D8D
> +#define ASM_MEDIA_FMT_ALAC			0x00012f31
> +#define ASM_MEDIA_FMT_APE			0x00012f32
>   
>   
>   #define ASM_LEGACY_STREAM_SESSION	0
> @@ -133,6 +135,36 @@ struct asm_wmaprov10_fmt_blk_v2 {
>   	u32          advanced_enc_options2;
>   } __packed;
>   
> +struct asm_alac_fmt_blk_v2 {
> +	struct asm_data_cmd_media_fmt_update_v2 fmt_blk;
> +	u32 frame_length;
> +	u8 compatible_version;
> +	u8 bit_depth;
> +	u8 pb;
> +	u8 mb;
> +	u8 kb;
> +	u8 num_channels;
> +	u16 max_run;
> +	u32 max_frame_bytes;
> +	u32 avg_bit_rate;
> +	u32 sample_rate;
> +	u32 channel_layout_tag;
> +} __packed;
> +
> +struct asm_ape_fmt_blk_v2 {
> +	struct asm_data_cmd_media_fmt_update_v2 fmt_blk;
> +	u16 compatible_version;
> +	u16 compression_level;
> +	u32 format_flags;
> +	u32 blocks_per_frame;
> +	u32 final_frame_blocks;
> +	u32 total_frames;
> +	u16 bits_per_sample;
> +	u16 num_channels;
> +	u32 sample_rate;
> +	u32 seek_table_present;
> +} __packed;
> +
>   struct asm_stream_cmd_set_encdec_param {
>   	u32                  param_id;
>   	u32                  param_size;
> @@ -941,6 +973,12 @@ int q6asm_open_write(struct audio_client *ac, uint32_t format,
>   			goto err;
>   		}
>   		break;
> +	case SND_AUDIOCODEC_ALAC:
> +		open->dec_fmt_id = ASM_MEDIA_FMT_ALAC;
> +		break;
> +	case SND_AUDIOCODEC_APE:
> +		open->dec_fmt_id = ASM_MEDIA_FMT_APE;
> +		break;
>   	default:
>   		dev_err(ac->dev, "Invalid format 0x%x\n", format);
>   		rc = -EINVAL;
> @@ -1198,6 +1236,86 @@ int q6asm_stream_media_format_block_wma_v10(struct audio_client *ac,
>   }
>   EXPORT_SYMBOL_GPL(q6asm_stream_media_format_block_wma_v10);
>   
> +int q6asm_stream_media_format_block_alac(struct audio_client *ac,
> +					 struct q6asm_alac_cfg *cfg)
> +{
> +	struct asm_alac_fmt_blk_v2 *fmt;
> +	struct apr_pkt *pkt;
> +	void *p;
> +	int rc, pkt_size;
> +
> +	pkt_size = APR_HDR_SIZE + sizeof(*fmt);
> +	p = kzalloc(pkt_size, GFP_KERNEL);
> +	if (!p)
> +		return -ENOMEM;
> +
> +	pkt = p;
> +	fmt = p + APR_HDR_SIZE;
> +
> +	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, true, ac->stream_id);
> +
> +	pkt->hdr.opcode = ASM_DATA_CMD_MEDIA_FMT_UPDATE_V2;
> +	fmt->fmt_blk.fmt_blk_size = sizeof(*fmt) - sizeof(fmt->fmt_blk);
> +
> +	fmt->frame_length = cfg->frame_length;
> +	fmt->compatible_version = cfg->compatible_version;
> +	fmt->bit_depth =  cfg->bit_depth;
> +	fmt->num_channels = cfg->num_channels;
> +	fmt->max_run = cfg->max_run;
> +	fmt->max_frame_bytes = cfg->max_frame_bytes;
> +	fmt->avg_bit_rate = cfg->avg_bit_rate;
> +	fmt->sample_rate = cfg->sample_rate;
> +	fmt->channel_layout_tag = cfg->channel_layout_tag;
> +	fmt->pb = cfg->pb;
> +	fmt->mb = cfg->mb;
> +	fmt->kb = cfg->kb;
> +
> +	rc = q6asm_ac_send_cmd_sync(ac, pkt);
> +	kfree(pkt);
> +
> +	return rc;
> +}
> +EXPORT_SYMBOL_GPL(q6asm_stream_media_format_block_alac);
> +
> +int q6asm_stream_media_format_block_ape(struct audio_client *ac,
> +					struct q6asm_ape_cfg *cfg)
> +{
> +	struct asm_ape_fmt_blk_v2 *fmt;
> +	struct apr_pkt *pkt;
> +	void *p;
> +	int rc, pkt_size;
> +
> +	pkt_size = APR_HDR_SIZE + sizeof(*fmt);
> +	p = kzalloc(pkt_size, GFP_KERNEL);
> +	if (!p)
> +		return -ENOMEM;
> +
> +	pkt = p;
> +	fmt = p + APR_HDR_SIZE;
> +
> +	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, true, ac->stream_id);
> +
> +	pkt->hdr.opcode = ASM_DATA_CMD_MEDIA_FMT_UPDATE_V2;
> +	fmt->fmt_blk.fmt_blk_size = sizeof(*fmt) - sizeof(fmt->fmt_blk);
> +
> +	fmt->compatible_version = cfg->compatible_version;
> +	fmt->compression_level = cfg->compression_level;
> +	fmt->format_flags = cfg->format_flags;
> +	fmt->blocks_per_frame = cfg->blocks_per_frame;
> +	fmt->final_frame_blocks = cfg->final_frame_blocks;
> +	fmt->total_frames = cfg->total_frames;
> +	fmt->bits_per_sample = cfg->bits_per_sample;
> +	fmt->num_channels = cfg->num_channels;
> +	fmt->sample_rate = cfg->sample_rate;
> +	fmt->seek_table_present = cfg->seek_table_present;
> +
> +	rc = q6asm_ac_send_cmd_sync(ac, pkt);
> +	kfree(pkt);
> +
> +	return rc;
> +}
> +EXPORT_SYMBOL_GPL(q6asm_stream_media_format_block_ape);
> +
>   /**
>    * q6asm_enc_cfg_blk_pcm_format_support() - setup pcm configuration for capture
>    *
> diff --git a/sound/soc/qcom/qdsp6/q6asm.h b/sound/soc/qcom/qdsp6/q6asm.h
> index 5d9fbc75688c..38a207d6cd95 100644
> --- a/sound/soc/qcom/qdsp6/q6asm.h
> +++ b/sound/soc/qcom/qdsp6/q6asm.h
> @@ -58,6 +58,34 @@ struct q6asm_wma_cfg {
>   	u32 adv_enc_options2;
>   };
>   
> +struct q6asm_alac_cfg {
> +	u32 frame_length;
> +	u8 compatible_version;
> +	u8 bit_depth;
> +	u8 pb;
> +	u8 mb;
> +	u8 kb;
> +	u8 num_channels;
> +	u16 max_run;
> +	u32 max_frame_bytes;
> +	u32 avg_bit_rate;
> +	u32 sample_rate;
> +	u32 channel_layout_tag;
> +};
> +
> +struct q6asm_ape_cfg {
> +	u16 compatible_version;
> +	u16 compression_level;
> +	u32 format_flags;
> +	u32 blocks_per_frame;
> +	u32 final_frame_blocks;
> +	u32 total_frames;
> +	u16 bits_per_sample;
> +	u16 num_channels;
> +	u32 sample_rate;
> +	u32 seek_table_present;
> +};
> +
>   typedef void (*q6asm_cb) (uint32_t opcode, uint32_t token,
>   			  void *payload, void *priv);
>   struct audio_client;
> @@ -86,6 +114,10 @@ int q6asm_stream_media_format_block_wma_v9(struct audio_client *ac,
>   					   struct q6asm_wma_cfg *cfg);
>   int q6asm_stream_media_format_block_wma_v10(struct audio_client *ac,
>   					    struct q6asm_wma_cfg *cfg);
> +int q6asm_stream_media_format_block_alac(struct audio_client *ac,
> +					 struct q6asm_alac_cfg *cfg);
> +int q6asm_stream_media_format_block_ape(struct audio_client *ac,
> +					struct q6asm_ape_cfg *cfg);
>   int q6asm_run(struct audio_client *ac, uint32_t flags, uint32_t msw_ts,
>   	      uint32_t lsw_ts);
>   int q6asm_run_nowait(struct audio_client *ac, uint32_t flags, uint32_t msw_ts,
> 
