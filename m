Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E363DF02A
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Aug 2021 16:21:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A19DE18AA;
	Tue,  3 Aug 2021 16:20:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A19DE18AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628000504;
	bh=p5oWSI8jtAK0r7RAo0aIcbN6x8QEcxZarEN3lIrfI3w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HAWxXX48DR4OUZAjxjc97X9rxd0B8QHDYuC53G0Oq2YSBGBvTXK5ywDMQN+jYxwyl
	 OSA5YInCqu2F3wSCzr7pUUG2PzcgTafRXmKHlnZV0IMTOHqD0dn6QWUcP7BJwnp0+O
	 KRXaBP/20s36KJKMntpwHycKMV55SHYXak9fYuvI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDF6FF8032C;
	Tue,  3 Aug 2021 16:20:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0E27F802E8; Tue,  3 Aug 2021 16:20:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35348F8014D
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 16:20:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35348F8014D
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="277462031"
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; d="scan'208";a="277462031"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 07:20:02 -0700
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; d="scan'208";a="521268925"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.237.180.77])
 ([10.237.180.77])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 07:19:59 -0700
Subject: Re: [PATCH v3 13/20] ASoC: qdsp6: audioreach: add basic pkt alloc
 support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210803125411.28066-1-srinivas.kandagatla@linaro.org>
 <20210803125411.28066-14-srinivas.kandagatla@linaro.org>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <3c97465c-356d-9989-c855-6eae325e8da6@linux.intel.com>
Date: Tue, 3 Aug 2021 16:19:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803125411.28066-14-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
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

On 8/3/2021 2:54 PM, Srinivas Kandagatla wrote:
> Add basic helper functions for AudioReach.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---

...

> +
> +#define APM_PARAM_ID_GAIN			0x08001006
> +struct param_id_gain_cfg {
> +	uint16_t gain;
> +	uint16_t reserved;
> +};
> +
> +#define PARAM_ID_PCM_OUTPUT_FORMAT_CFG		0x08001008
> +struct param_id_pcm_output_format_cfg {
> +	uint32_t data_format;
> +	uint32_t fmt_id;
> +	uint32_t payload_size;
> +} __packed;
> +
> +struct payload_pcm_output_format_cfg {
> +	uint16_t bit_width;
> +	uint16_t alignment;
> +	uint16_t bits_per_sample;
> +	uint16_t q_factor;
> +	uint16_t endianness;
> +	uint16_t interleaved;
> +	uint16_t reserved;
> +	uint16_t num_channels;
> +	uint8_t channel_mapping[0];

Current kernel convention is to use something like:
uint8_t channel_mapping[];
for flexible arrays.
I've pointed out few more later, but it would be best to run some kind 
of search to find them all in all files in patchset.

...

> +
> +struct apm_container_cfg {
> +	uint32_t container_id;
> +	uint32_t num_prop;
> +} __packed;
> +
> +struct apm_cont_capablity  {
> +	uint32_t capability_id;
> +} __packed;
> +
> +#define APM_CONTAINER_PROP_ID_CAPABILITY_LIST	0x08001011
> +#define APM_CONTAINER_PROP_ID_CAPABILITY_SIZE	8
> +
> +#define APM_PROP_ID_INVALID			0x0
> +#define APM_CONTAINER_CAP_ID_PP			0x1
> +#define APM_CONTAINER_CAP_ID_PP			0x1
> +
> +struct apm_cont_prop_id_cap_list  {
> +	uint32_t num_capablity_id;
num_capability_id

...

> +
> +#define CONFIG_I2S_WS_SRC_EXTERNAL                          0x0
> +#define CONFIG_I2S_WS_SRC_INTERNAL                          0x1
> +
> +#define PARAM_ID_I2S_INTF_CFG	0x08001019
> +struct param_id_i2s_intf_cfg {
> +	uint32_t lpaif_type;
> +	uint32_t intf_idx;
> +	uint16_t sd_line_idx;
> +	uint16_t ws_src;
> +} __packed;
> +
> +#define I2S_INTF_TYPE_PRIMARY		0
> +#define I2S_INTF_TYPE_SECOINDARY	1
SECONDARY

> +#define I2S_INTF_TYPE_TERTINARY		2
TERTIARY

> +#define I2S_INTF_TYPE_QUATERNARY	3
> +#define I2S_INTF_TYPE_QUINARY		4
> +#define I2S_SD0				1
> +#define I2S_SD1				2
> +#define I2S_SD2				3
> +#define I2S_SD3				4
> +

...

> +#define DATA_LOGGING_MAX_INPUT_PORTS		0x1
> +#define DATA_LOGGING_MAX_OUTPUT_PORTS		0x1
> +#define DATA_LOGGING_STACK_SIZE			2048
> +#define PARAM_ID_DATA_LOGGING_CONFIG		0x08001031
> +struct data_logging_config {
> +	uint32_t log_code;
> +	uint32_t log_tap_point_id;
> +	uint32_t mode;
> +} __packed;
> +
> +#define PARAM_ID_MFC_OUTPUT_MEDIA_FORMAT	0x08001024
> +struct param_id_mfc_media_format {
> +	uint32_t sample_rate;
> +	uint16_t bit_width;
> +	uint16_t num_channels;
> +	uint16_t channel_mapping[0];
uint16_t channel_mapping[];

...

> +
> +struct payload_media_fmt_pcm {
> +	uint32_t sample_rate;
> +	uint16_t bit_width;
> +	uint16_t alignment;
> +	uint16_t bits_per_sample;
> +	uint16_t q_factor;
> +	uint16_t endianness;
> +	uint16_t num_channels;
> +	uint8_t channel_mapping[0];
uint8_t channel_mapping[];


