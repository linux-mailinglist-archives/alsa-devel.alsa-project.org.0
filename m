Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D6E25BE67
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 11:25:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4F0018F5;
	Thu,  3 Sep 2020 11:25:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4F0018F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599125157;
	bh=cVJhQRXqjgV7XxwF04pG2spdRIjvUmojjmAz0pS3mjs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a0mhUxRnCIUAHzEYotmHzWcVgWo9Os1vKPvUVb1ksyMvb7UvrrY86oI3OKRsSYnzl
	 GsWNqfvP/rXe4Dt2/O6vqOL7gDoHWbF9QmgstA7zKnudsE2Mt95rH3L9iDmCByF/EJ
	 gcxydq0XDl+M53JFWAE523SVqb+7e5BGrGiqZpI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA2ECF800F0;
	Thu,  3 Sep 2020 11:24:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57DE0F80217; Thu,  3 Sep 2020 11:24:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10754F800F0
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 11:24:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10754F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="IOIG7Q7j"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1599125044; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=vzyvnVN4EUQzE6hJZKmqXAP1pTaiOlGyUPxPgSRWKec=;
 b=IOIG7Q7jrnKLcbcj2p+fMq4GKRvSFJ22KA7elPMuN7LAOhOc4MEy4AGNoV89NuPo4haSPgut
 kfPBea+NX7sS4BbMXTSUSrBiLIDm1vLHDq+vyFdIUg/vwYeEmzKFccgKYcIfVr6YsnMVFXyg
 iauIW82xZln/4bjScUTQWIhiyPE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f50b62d7f21d51b30bb99e7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Sep 2020 09:23:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id ADEABC433C6; Thu,  3 Sep 2020 09:23:56 +0000 (UTC)
Received: from [10.131.172.121]
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BA6F6C433C9;
 Thu,  3 Sep 2020 09:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BA6F6C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v3 4/5] ASoC: qcom: Add support for audio over DP
To: Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org,
 lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, perex@perex.cz, plai@codeaurora.org,
 robh+dt@kernel.org, rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
 tiwai@suse.com
References: <1598855964-1042-1-git-send-email-srivasam@codeaurora.org>
 <1598855964-1042-5-git-send-email-srivasam@codeaurora.org>
 <159894552988.334488.8290895362888910651@swboyd.mtv.corp.google.com>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited
Message-ID: <25a8ca32-47f9-fb04-5f76-cc9e27f4e412@codeaurora.org>
Date: Thu, 3 Sep 2020 14:53:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <159894552988.334488.8290895362888910651@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
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

Thanks Stephen, for your time for review!!!

On 9/1/2020 1:02 PM, Stephen Boyd wrote:
> Quoting Srinivasa Rao Mandadapu (2020-08-30 23:39:23)
>> diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
>> index 167bf2c..cea7ae7 100644
>> --- a/sound/soc/qcom/lpass-sc7180.c
>> +++ b/sound/soc/qcom/lpass-sc7180.c
>> @@ -190,15 +232,92 @@ static struct lpass_variant sc7180_data = {
>>                                     "mi2s-bit-clk0",
>>                                     "mi2s-bit-clk1",
>>                                  },
>> +       .id                             = I2S_INTERFACE,
>>          .init                   = sc7180_lpass_init,
>>          .exit                   = sc7180_lpass_exit,
>>          .alloc_dma_channel      = sc7180_lpass_alloc_dma_channel,
>>          .free_dma_channel       = sc7180_lpass_free_dma_channel,
>>   };
>>   
>> +static struct lpass_variant sc7180_hdmi_data = {
> Can this be const?
Yes this can be constant. will change in next patch.
>
>> +       .hdmi_tx_ctl_addr       = 0x1000,
>> +       .hdmi_legacy_addr       = 0x1008,
>> +       .hdmi_vbit_addr         = 0x610c0,
>> +       .hdmi_ch_lsb_addr       = 0x61048,
>> +       .hdmi_ch_msb_addr       = 0x6104c,
>> +       .ch_stride              = 0x8,
>> +       .hdmi_parity_addr       = 0x61034,
>> +       .hdmi_dmactl_addr       = 0x61038,
>> +       .hdmi_dma_stride        = 0x4,
>> +       .hdmi_DP_addr           = 0x610c8,
>> +       .hdmi_sstream_addr      = 0x6101c,
>> +       .irq_reg_base           = 0x63000,
>> +       .irq_ports              = 1,
>> +       .rdma_reg_base          = 0x64000,
>> +       .rdma_reg_stride        = 0x1000,
>> +       .rdma_channels          = 4,
>> +
>> +       .rdma_dyncclk           = REG_FIELD_ID(0x64000, 14, 14, 4, 0x1000),
>> +       .rdma_bursten           = REG_FIELD_ID(0x64000, 13, 13, 4, 0x1000),
>> +       .rdma_burst8            = REG_FIELD_ID(0x64000, 15, 15, 4, 0x1000),
>> +       .rdma_burst16           = REG_FIELD_ID(0x64000, 16, 16, 4, 0x1000),
>> +       .rdma_dynburst          = REG_FIELD_ID(0x64000, 18, 18, 4, 0x1000),
>> +       .rdma_wpscnt            = REG_FIELD_ID(0x64000, 10, 12, 4, 0x1000),
>> +       .rdma_fifowm            = REG_FIELD_ID(0x64000, 1, 5, 4, 0x1000),
>> +       .rdma_enable            = REG_FIELD_ID(0x64000, 0, 0, 4, 0x1000),
>> +
>> +       .sstream_en             = REG_FIELD(0x6101c, 0, 0),
>> +       .dma_sel                        = REG_FIELD(0x6101c, 1, 2),
>> +       .auto_bbit_en   = REG_FIELD(0x6101c, 3, 3),
>> +       .layout                 = REG_FIELD(0x6101c, 4, 4),
>> +       .layout_sp              = REG_FIELD(0x6101c, 5, 8),
>> +       .set_sp_on_en   = REG_FIELD(0x6101c, 10, 10),
>> +       .dp_audio               = REG_FIELD(0x6101c, 11, 11),
>> +       .dp_staffing_en = REG_FIELD(0x6101c, 12, 12),
>> +       .dp_sp_b_hw_en  = REG_FIELD(0x6101c, 13, 13),
>> +
>> +       .mute                   = REG_FIELD(0x610c8, 0, 0),
>> +       .as_sdp_cc              = REG_FIELD(0x610c8, 1, 3),
>> +       .as_sdp_ct              = REG_FIELD(0x610c8, 4, 7),
>> +       .aif_db4                        = REG_FIELD(0x610c8, 8, 15),
>> +       .frequency              = REG_FIELD(0x610c8, 16, 21),
>> +       .mst_index              = REG_FIELD(0x610c8, 28, 29),
>> +       .dptx_index             = REG_FIELD(0x610c8, 30, 31),
>> +
>> +       .soft_reset             = REG_FIELD(0x1000, 31, 31),
>> +       .force_reset    = REG_FIELD(0x1000, 30, 30),
>> +
>> +       .use_hw_chs             = REG_FIELD(0x61038, 0, 0),
>> +       .use_hw_usr             = REG_FIELD(0x61038, 1, 1),
>> +       .hw_chs_sel             = REG_FIELD(0x61038, 2, 4),
>> +       .hw_usr_sel             = REG_FIELD(0x61038, 5, 6),
>> +
>> +       .replace_vbit   = REG_FIELD(0x610c0, 0, 0),
>> +       .vbit_stream    = REG_FIELD(0x610c0, 1, 1),
>> +
>> +       .legacy_en              =  REG_FIELD(0x1008, 0, 0),
>> +       .calc_en                =  REG_FIELD(0x61034, 0, 0),
>> +       .lsb_bits               =  REG_FIELD(0x61048, 0, 31),
>> +       .msb_bits               =  REG_FIELD(0x6104c, 0, 31),
>> +
>> +       .clk_name               = (const char*[]) {
>> +                                       "pcnoc-sway-clk",
>> +                                       "audio-core",
>> +                                       "pcnoc-mport-clk",
>> +                               },
>> +       .num_clks               = 3,
>> +       .id                     = HDMI_INTERFACE,
>> +       .dai_driver             = sc7180_lpass_cpu_hdmi_dai_driver,
>> +       .num_dai                = ARRAY_SIZE(sc7180_lpass_cpu_hdmi_dai_driver),
>> +       .init                   = sc7180_lpass_init,
>> +       .exit                   = sc7180_lpass_exit,
>> +       .alloc_dma_channel = sc7180_lpass_alloc_hdmi_dma_channel,
>> +       .free_dma_channel = sc7180_lpass_free_hdmi_dma_channel,
>> +
>> +};
> Add a newline here?
okay
>
>>   static const struct of_device_id sc7180_lpass_cpu_device_id[] = {
>>          {.compatible = "qcom,sc7180-lpass-cpu", .data = &sc7180_data},
>> -       {}
>> +       {.compatible = "qcom,sc7180-lpass-hdmi", .data = &sc7180_hdmi_data}
> This most likely needs to keep the sentinel around so that a match can
> be made or stop if nothing is found.
okay..
>
>>   };
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

