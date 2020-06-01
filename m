Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EEA1EA10A
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jun 2020 11:35:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 339A516E7;
	Mon,  1 Jun 2020 11:34:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 339A516E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591004102;
	bh=1krl1Fg/U//qh66hmmFKmbQyTCgKqbW6kY5rRrB35vc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ptQrhRUu/ZSv+/iWagC+O6EOii5aqhcOSZJM3/yRxYwIH4qoshcR+UWBVpYB65Xk9
	 NdwOOB/iDLhCQYPzo5hH/OPiUvVm5ZFmfjTQNJCYtHydKcqLvEFxe3Mif4hTltMxzm
	 8nFJ8WwQt3NsEiZ2ANozjs5G7FfHvpY6ZXQgf3I0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E3A8F801F5;
	Mon,  1 Jun 2020 11:33:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF836F801ED; Mon,  1 Jun 2020 11:33:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FE60F800B8
 for <alsa-devel@alsa-project.org>; Mon,  1 Jun 2020 11:33:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FE60F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="NslUa6CQ"
Received: by mail-wr1-x442.google.com with SMTP id t18so10776220wru.6
 for <alsa-devel@alsa-project.org>; Mon, 01 Jun 2020 02:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kQ+7ItpJV494cqEQSRX9aBEpOfptshaMMMYe5L0226k=;
 b=NslUa6CQwZutRKaBW8LM32JDBJ+2uySdpwlwPJ8urLWxFXMCRZPWUyvjcb6lSqpdMt
 xmRJemf3K3L1kna9AivFPg/LOwy/fKfMfWJEzquu7vSfqZ+eF9KxT918GyZ5Tlf4IZJl
 0r5gy+QuYg6mnhIRfutYzuVzh7ED+xyoPDKiA2erkWYbQJJfvqpeKkHogh7I6UPLVKsp
 93cqtF7kF0jjEYZLVBXEYNijuLj8YfbrVm6q6gT+nBpoP3qjm8H7QtQyGdbwmNVIio+/
 TZdPHp7w2NH33Gv/Z+3UbPC952Gb2X+8q4I9jEzB5VIAe2bTicPFS4FuCnLHPV/BPOzF
 3/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kQ+7ItpJV494cqEQSRX9aBEpOfptshaMMMYe5L0226k=;
 b=VdscQld2DuRYmIJoNmGcw+rIWgw2tdkKAqHlPUCLJolaY7yUTw/vHGDLDiXSckR8K+
 CyrxuryKCMv4M8qM+3rG5nXqKIavySHOL/A4qgp6LGC/RxVYME5V3N1YlZF2nmr1fIfl
 I3FoJvnoKKbjkLm13QO+28U4b5QNL8MBl6mDfA+UVd71v7XHkJqE58sXUJfduKIYGodk
 H2MZfKQhbalrjkbTnALrrKNJDjFWviJFptHyFamcRTqbe3fQhsX7qL/1h6HciBupuhHA
 gw/3E7MoX8D0BLc+8IPD2Ln2P671HkJQhIKLc9J2KyR+s5M3eSnjeQOnPD8zAnbNPpiA
 TeCQ==
X-Gm-Message-State: AOAM531JCLQa8ku/DGB7DKw4pxLmxRv1jvfnCim5nBg+rJtFktc27sBb
 o1O+BlQ3tJCvt4Wbj96qGmGcfrvNWP0=
X-Google-Smtp-Source: ABdhPJzjWmsWrS9tVmYGtcsVTakxheDEkKI7KB6vntfqQNEbhQn+Q2iqPQB1rL1ki7ECA+mHkgZsUg==
X-Received: by 2002:adf:a18b:: with SMTP id u11mr20868008wru.102.1591003988097; 
 Mon, 01 Jun 2020 02:33:08 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id e10sm20083248wrn.11.2020.06.01.02.33.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jun 2020 02:33:07 -0700 (PDT)
Subject: Re: [RFC][PATCH] ASoC: qcom: q6asm-dai: kCFI fix
To: John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>
References: <20200529213823.98812-1-john.stultz@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <7d93893f-da1f-1c49-1407-9d9a8fc4f71d@linaro.org>
Date: Mon, 1 Jun 2020 10:33:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200529213823.98812-1-john.stultz@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Alistair Delva <adelva@google.com>, Amit Pundir <amit.pundir@linaro.org>,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Todd Kjos <tkjos@google.com>
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



On 29/05/2020 22:38, John Stultz wrote:
> Fixes the following kCFI crash seen on db845c, caused
> by the function prototypes not matching the callback
> function prototype.
> 
> [   82.585661] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000001
> [   82.595387] Mem abort info:
> [   82.599463]   ESR = 0x96000005
> [   82.602658]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   82.608177]   SET = 0, FnV = 0
> [   82.611829]   EA = 0, S1PTW = 0
> [   82.615369] Data abort info:
> [   82.618751]   ISV = 0, ISS = 0x00000005
> [   82.622641]   CM = 0, WnR = 0
> [   82.625774] user pgtable: 4k pages, 39-bit VAs, pgdp=0000000174259000
> [   82.632292] [0000000000000001] pgd=0000000000000000, pud=0000000000000000
> [   82.639167] Internal error: Oops: 96000005 [#1] PREEMPT SMP
> [   82.644795] Modules linked in: hci_uart btqca xhci_plat_hcd xhci_pci_renesas xhci_pci xhci_hcd wcn36xx wcnss_ctrl wcd934x vctrl_regulator ufs_qcom syscon_reboot_e
> [   82.644927]  qcom_apcs_ipc_mailbox q6asm_dai q6routing q6asm q6afe_dai q6adm q6afe q6core q6dsp_common pm8941_pwrkey pm8916_wdt platform_mhu pinctrl_spmi_mpp pine
> [   82.812982] CPU: 3 PID: 240 Comm: kworker/u16:4 Tainted: G        W         5.6.0-rc7-mainline-00960-g0c34353d11b9-dirty #1
> [   82.824201] Hardware name: Thundercomm Dragonboard 845c (DT)
> [   82.829937] Workqueue: qcom_apr_rx apr_rxwq [apr]
> [   82.834698] pstate: 80c00005 (Nzcv daif +PAN +UAO)
> [   82.839553] pc : __cfi_check_fail+0x4/0x1c [q6asm_dai]
> [   82.844754] lr : __cfi_check+0x3a8/0x3b0 [q6asm_dai]
> [   82.849767] sp : ffffffc0105f3c20
> [   82.853123] x29: ffffffc0105f3c30 x28: 0000000000000020
> [   82.858489] x27: ffffff80f4588400 x26: ffffff80f458ec94
> [   82.863854] x25: ffffff80f458ece8 x24: ffffffe3670c7000
> [   82.869220] x23: ffffff8094bb7b34 x22: ffffffe367137000
> [   82.874585] x21: bd07909b332eada6 x20: 0000000000000001
> [   82.879950] x19: ffffffe36713863c x18: ffffff80f8df4430
> [   82.885316] x17: 0000000000000001 x16: ffffffe39d15e660
> [   82.890681] x15: 0000000000000001 x14: 0000000000000027
> [   82.896047] x13: 0000000000000000 x12: ffffffe39e6465a0
> [   82.901413] x11: 0000000000000051 x10: 000000000000ffff
> [   82.906779] x9 : 000ffffffe366c19 x8 : c3c5f18762d1ceef
> [   82.912145] x7 : 0000000000000000 x6 : ffffffc010877698
> [   82.917511] x5 : ffffffc0105f3c00 x4 : 0000000000000000
> [   82.922877] x3 : 0000000000000000 x2 : 0000000000000001
> [   82.928243] x1 : ffffffe36713863c x0 : 0000000000000001
> [   82.933610] Call trace:
> [   82.936099]  __cfi_check_fail+0x4/0x1c [q6asm_dai]
> [   82.940955]  q6asm_srvc_callback+0x22c/0x618 [q6asm]
> [   82.945973]  apr_rxwq+0x1a8/0x27c [apr]
> [   82.949861]  process_one_work+0x2e8/0x54c
> [   82.953919]  worker_thread+0x27c/0x4d4
> [   82.957715]  kthread+0x144/0x154
> [   82.960985]  ret_from_fork+0x10/0x18
> [   82.964603] Code: a8c37bfd f85f8e5e d65f03c0 b40000a0 (39400008)
> [   82.970762] ---[ end trace 410accb839617143 ]---
> [   82.975429] Kernel panic - not syncing: Fatal exception
> 
> Cc: Patrick Lai <plai@codeaurora.org>
> Cc: Banajit Goswami <bgoswami@codeaurora.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: Todd Kjos <tkjos@google.com>
> Cc: Alistair Delva <adelva@google.com>
> Cc: Amit Pundir <amit.pundir@linaro.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>   sound/soc/qcom/qdsp6/q6asm-dai.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Thanks for the Patch!


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>



> 
> diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
> index 125af00bba53..4640804aab7f 100644
> --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
> @@ -176,7 +176,7 @@ static const struct snd_compr_codec_caps q6asm_compr_caps = {
>   };
>   
>   static void event_handler(uint32_t opcode, uint32_t token,
> -			  uint32_t *payload, void *priv)
> +			  void *payload, void *priv)
>   {
>   	struct q6asm_dai_rtd *prtd = priv;
>   	struct snd_pcm_substream *substream = prtd->substream;
> @@ -490,7 +490,7 @@ static int q6asm_dai_hw_params(struct snd_soc_component *component,
>   }
>   
>   static void compress_event_handler(uint32_t opcode, uint32_t token,
> -				   uint32_t *payload, void *priv)
> +				   void *payload, void *priv)
>   {
>   	struct q6asm_dai_rtd *prtd = priv;
>   	struct snd_compr_stream *substream = prtd->cstream;
> 
