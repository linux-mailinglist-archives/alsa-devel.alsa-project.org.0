Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 558A31846B6
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 13:19:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE2A017E5;
	Fri, 13 Mar 2020 13:18:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE2A017E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584101976;
	bh=BY7e1VJdsGFKKewq1EXgQKYPas8pl3SFi703gNZeXDs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K17QYcmjJBAQO9bVqKqY8a4arzqEkpo1oM8WPWkm5rL7F/AUGh8qvyxuQ2u+xquak
	 SvvVPPo28NNT2CA79H/CTFOV1ubFA03jaSv/5mwuIyN/Ped9NePyS6HOiADgAT6dZv
	 3/SUtmnVPrgDbM+qldnRMuF6PJl7Zyh/RE6SnHUI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AFA5F80290;
	Fri, 13 Mar 2020 13:16:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CC1DF801EB; Fri, 13 Mar 2020 13:15:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD9E9F8013E
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 13:15:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD9E9F8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="b3x2jx1U"
Received: by mail-wr1-x443.google.com with SMTP id x11so7051981wrv.5
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 05:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=03slhcmvhoks3TEe8Ap/dMwGdXRQ8mfgJLK4iHfROxE=;
 b=b3x2jx1UlW5BmqjKnk9uTYg56kmkE5j1cTOSHA9CjAureDfgr60GP53Qjk1i8HFDzN
 Srix0sgQh56FjoN5gNiQ8k3xXwmF8cXah02l/ll6WG3jXdzA91uYXiX6QLGvy0SJqa70
 NGBNDxHRwXFIBJ1XKv2w9+ze7OCElYbqDayfkCZ8RUzWzIlS6lONzRH7H0o2BJZiZemQ
 gcomEiXx0JMeRHizKatgAfrw9llNWLmGFBK4vmMjG1F5MLcsTqu9JPaqJXl7wPNGYzGi
 0xcVd/pdWmzzZ9dODpUF/9olNYc3VxCSStk4CoEfsLoZTgSHUju7idE8386SJblkVsuE
 2llQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=03slhcmvhoks3TEe8Ap/dMwGdXRQ8mfgJLK4iHfROxE=;
 b=idbNfDGhBMt8xsg7XQ4DTIl1aoD2m/4B7sfi2L35hoSaaWNplTICZBbDxOa2Js2w9L
 /na7Dcc4BNI5QAG5p2DLaCZ2g3ly9BaJUQPuG2oQlpvjtVC46aYhKlBPqLFyJMmsjFEC
 3Q/QtfSIbemL417wWbLpqXzpnBvBg/xE2KH4u2RnZ78Jwt8iOLxgxyNS5U2nDPz2quw5
 C9FrfKiDvX/5SLyRDL0272YL/1+MN4xDHMf9+9xsxtQu8o2n8r9g6GlaCd9mWwzkhrym
 5OvPm1ogPddwNYsxFo3xjfvVaS5R0LY/pqmxx+CXYqRBxjYSxbtm4ES2r37OafZoxQAS
 GcXw==
X-Gm-Message-State: ANhLgQ25VEt6b0j1SznWFwU8cNUA1I5H+S2xMMFq3Y+L1heWiyr03U2P
 MgkPnsRAMOSko/T3rWbK+sDaRA==
X-Google-Smtp-Source: ADFU+vtYrwHpAYGiqlnYwHTVsIrKYnbriSKJTx9gN3G/OSkclar4UXFdkzaeltwXf9vgPIHv3KpjSQ==
X-Received: by 2002:a5d:56c4:: with SMTP id m4mr3935185wrw.182.1584101725930; 
 Fri, 13 Mar 2020 05:15:25 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id n2sm11579258wrr.62.2020.03.13.05.15.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Mar 2020 05:15:24 -0700 (PDT)
Subject: Re: [RESEND PATCH v2 4/9] ASoC: qcom: q6asm: add support to wma config
To: Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
References: <20200313101627.1561365-1-vkoul@kernel.org>
 <20200313101627.1561365-5-vkoul@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <cda84c80-a8bb-ecb5-3bda-ec1d610fd374@linaro.org>
Date: Fri, 13 Mar 2020 12:15:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200313101627.1561365-5-vkoul@kernel.org>
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
> Qualcomm DSPs expect wma v9 and wma v10 configs to be set for wma
> decoders, so add the API to program the respective wma config to the DSP
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>   sound/soc/qcom/qdsp6/q6asm.c | 123 +++++++++++++++++++++++++++++++++++
>   sound/soc/qcom/qdsp6/q6asm.h |  17 +++++
>   2 files changed, 140 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
> index 64eb7b6ba305..4cec95c657ba 100644
> --- a/sound/soc/qcom/qdsp6/q6asm.c
> +++ b/sound/soc/qcom/qdsp6/q6asm.c
> @@ -39,6 +39,8 @@
>   #define ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V2	0x00010DA5
>   #define ASM_MEDIA_FMT_MP3			0x00010BE9
>   #define ASM_MEDIA_FMT_FLAC			0x00010C16
> +#define ASM_MEDIA_FMT_WMA_V9			0x00010DA8
> +#define ASM_MEDIA_FMT_WMA_V10			0x00010DA7
>   #define ASM_DATA_CMD_WRITE_V2			0x00010DAB
>   #define ASM_DATA_CMD_READ_V2			0x00010DAC
>   #define ASM_SESSION_CMD_SUSPEND			0x00010DEC
> @@ -104,6 +106,33 @@ struct asm_flac_fmt_blk_v2 {
>   	u16 reserved;
>   } __packed;
>   
> +struct asm_wmastdv9_fmt_blk_v2 {
> +	struct asm_data_cmd_media_fmt_update_v2 fmt_blk;
> +	u16          fmtag;
> +	u16          num_channels;
> +	u32          sample_rate;
> +	u32          bytes_per_sec;
> +	u16          blk_align;
> +	u16          bits_per_sample;
> +	u32          channel_mask;
> +	u16          enc_options;
> +	u16          reserved;
> +} __packed;
> +
> +struct asm_wmaprov10_fmt_blk_v2 {
> +	struct asm_data_cmd_media_fmt_update_v2 fmt_blk;
> +	u16          fmtag;
> +	u16          num_channels;
> +	u32          sample_rate;
> +	u32          bytes_per_sec;
> +	u16          blk_align;
> +	u16          bits_per_sample;
> +	u32          channel_mask;
> +	u16          enc_options;
> +	u16          advanced_enc_options1;
> +	u32          advanced_enc_options2;
> +} __packed;
> +
>   struct asm_stream_cmd_set_encdec_param {
>   	u32                  param_id;
>   	u32                  param_size;
> @@ -894,6 +923,24 @@ int q6asm_open_write(struct audio_client *ac, uint32_t format,
>   	case SND_AUDIOCODEC_FLAC:
>   		open->dec_fmt_id = ASM_MEDIA_FMT_FLAC;
>   		break;
> +	case SND_AUDIOCODEC_WMA:
> +		switch (codec_profile) {
> +		case SND_AUDIOPROFILE_WMA9:
> +			open->dec_fmt_id = ASM_MEDIA_FMT_WMA_V9;
> +			break;
> +		case SND_AUDIOPROFILE_WMA10:
> +		case SND_AUDIOPROFILE_WMA9_PRO:
> +		case SND_AUDIOPROFILE_WMA9_LOSSLESS:
> +		case SND_AUDIOPROFILE_WMA10_LOSSLESS:
> +			open->dec_fmt_id = ASM_MEDIA_FMT_WMA_V10;
> +			break;
> +		default:
> +			dev_err(ac->dev, "Invalid codec profile 0x%x\n",
> +				codec_profile);
> +			rc = -EINVAL;
> +			goto err;
> +		}
> +		break;
>   	default:
>   		dev_err(ac->dev, "Invalid format 0x%x\n", format);
>   		rc = -EINVAL;
> @@ -1075,6 +1122,82 @@ int q6asm_stream_media_format_block_flac(struct audio_client *ac,
>   	return rc;
>   }
>   EXPORT_SYMBOL_GPL(q6asm_stream_media_format_block_flac);
> +
> +int q6asm_stream_media_format_block_wma_v9(struct audio_client *ac,
> +					   struct q6asm_wma_cfg *cfg)
> +{
> +	struct asm_wmastdv9_fmt_blk_v2 *fmt;
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
> +	fmt->fmtag = cfg->fmtag;
> +	fmt->num_channels = cfg->num_channels;
> +	fmt->sample_rate = cfg->sample_rate;
> +	fmt->bytes_per_sec = cfg->bytes_per_sec;
> +	fmt->blk_align = cfg->block_align;
> +	fmt->bits_per_sample = cfg->bits_per_sample;
> +	fmt->channel_mask = cfg->channel_mask;
> +	fmt->enc_options = cfg->enc_options;
> +	fmt->reserved = 0;
> +
> +	rc = q6asm_ac_send_cmd_sync(ac, pkt);
> +	kfree(pkt);
> +
> +	return rc;
> +}
> +EXPORT_SYMBOL_GPL(q6asm_stream_media_format_block_wma_v9);
> +
> +int q6asm_stream_media_format_block_wma_v10(struct audio_client *ac,
> +					    struct q6asm_wma_cfg *cfg)
> +{
> +	struct asm_wmaprov10_fmt_blk_v2 *fmt;
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
> +	fmt->fmtag = cfg->fmtag;
> +	fmt->num_channels = cfg->num_channels;
> +	fmt->sample_rate = cfg->sample_rate;
> +	fmt->bytes_per_sec = cfg->bytes_per_sec;
> +	fmt->blk_align = cfg->block_align;
> +	fmt->bits_per_sample = cfg->bits_per_sample;
> +	fmt->channel_mask = cfg->channel_mask;
> +	fmt->enc_options = cfg->enc_options;
> +	fmt->advanced_enc_options1 = cfg->adv_enc_options;
> +	fmt->advanced_enc_options2 = cfg->adv_enc_options2;
> +
> +	rc = q6asm_ac_send_cmd_sync(ac, pkt);
> +	kfree(pkt);
> +
> +	return rc;
> +}
> +EXPORT_SYMBOL_GPL(q6asm_stream_media_format_block_wma_v10);
> +
>   /**
>    * q6asm_enc_cfg_blk_pcm_format_support() - setup pcm configuration for capture
>    *
> diff --git a/sound/soc/qcom/qdsp6/q6asm.h b/sound/soc/qcom/qdsp6/q6asm.h
> index 1cff7f68b95d..5d9fbc75688c 100644
> --- a/sound/soc/qcom/qdsp6/q6asm.h
> +++ b/sound/soc/qcom/qdsp6/q6asm.h
> @@ -45,6 +45,19 @@ struct q6asm_flac_cfg {
>           u16 md5_sum;
>   };
>   
> +struct q6asm_wma_cfg {
> +	u32 fmtag;
> +	u32 num_channels;
> +	u32 sample_rate;
> +	u32 bytes_per_sec;
> +	u32 block_align;
> +	u32 bits_per_sample;
> +	u32 channel_mask;
> +	u32 enc_options;
> +	u32 adv_enc_options;
> +	u32 adv_enc_options2;
> +};
> +
>   typedef void (*q6asm_cb) (uint32_t opcode, uint32_t token,
>   			  void *payload, void *priv);
>   struct audio_client;
> @@ -69,6 +82,10 @@ int q6asm_media_format_block_multi_ch_pcm(struct audio_client *ac,
>   					  uint16_t bits_per_sample);
>   int q6asm_stream_media_format_block_flac(struct audio_client *ac,
>   					 struct q6asm_flac_cfg *cfg);
> +int q6asm_stream_media_format_block_wma_v9(struct audio_client *ac,
> +					   struct q6asm_wma_cfg *cfg);
> +int q6asm_stream_media_format_block_wma_v10(struct audio_client *ac,
> +					    struct q6asm_wma_cfg *cfg);
>   int q6asm_run(struct audio_client *ac, uint32_t flags, uint32_t msw_ts,
>   	      uint32_t lsw_ts);
>   int q6asm_run_nowait(struct audio_client *ac, uint32_t flags, uint32_t msw_ts,
> 
