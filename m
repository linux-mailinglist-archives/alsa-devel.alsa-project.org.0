Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C21D397663
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 17:18:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CDB916E3;
	Tue,  1 Jun 2021 17:17:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CDB916E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622560705;
	bh=A9iLIuYTsesv4YTqm4oCXXsX07X5VWFJbv5nEdVMXNI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BLH7W0sG1krtaKCg2mmm4F5AtMlJWYwh1WDYyL58ajVAjUb9WVasIPWETpaGGJILZ
	 FmzAQ9AKE4nQG9CZd5yq6EEu6uNZapErwxyLSsbwTGAOJV3gphQenU9pvVgI0I3yfs
	 AiVNrA+bAzbd6RbgP9Cvx9oWo4T6+LqwMtUtMM2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C180BF802E7;
	Tue,  1 Jun 2021 17:17:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28ECCF80269; Tue,  1 Jun 2021 17:17:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89BA3F80253
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 17:17:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89BA3F80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="FkPjp6Fb"
Received: by mail-qk1-x72d.google.com with SMTP id k4so14636317qkd.0
 for <alsa-devel@alsa-project.org>; Tue, 01 Jun 2021 08:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SHY1Su43K3ELrQR9CrBAbBOQHJtxQOdLocpoZ2X7Ng8=;
 b=FkPjp6FbTjUVq0pXGa6pXaYuNulBbgZ3zjSZhG9UJqpFTSCH8y84SKHJER94xQE4Cn
 cykpvCo8tmeqKzyTSGAEvcES7HBlyJ+TBL+c9dqLUIAeiIt66tj6Feg42qZca/cWLFrP
 8IXz2k7nKsD/90QvJiwFL8082iMK1XOCW7vdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SHY1Su43K3ELrQR9CrBAbBOQHJtxQOdLocpoZ2X7Ng8=;
 b=ikjJcPgMLCC9DV3+Bt7sRT7KMQz2QZ9swIAuVdBQbPWfRfILMutw1fnpYY6TSud/sW
 +wljflOxyZTfuMDz3LfAV+cw+92zPzn6pckw00tb8U4MXcsCM0FmIv4JcowgWYAXgpXt
 bD97iecDCA9QqbEUAIpCGPHDzdMXezJ+aOmOgUrdwrHyCeZ1LbaCQ+H/GO/7hLnFBnd5
 YJmenZCBFoYuenARbj7HoFUYTyPldKnaGUdo1rjz11tCfX1W/TbXcIFwQwU8dHxB6qyr
 oHfdsSPUBk+ffwQFDloMNcvOLMMVuBpFbZ0lp1wkixMJ94BW432khz5ma6lNJ7PX3+oq
 FseA==
X-Gm-Message-State: AOAM5338Wyd9R8q66SDMBGdJNL+FWhIWhBmtLvSLKfnESvSJjM/OKREO
 2o7bWMC2PEU7s/q4trUqmMg/5bO8HY/DLg==
X-Google-Smtp-Source: ABdhPJz0nDP1jXq9gI/zv8u1d7atB4ULRy0XPPApH6AWiLn3K8L4bHWQyhjCy9NS9YCptBmFfGWrlw==
X-Received: by 2002:a05:620a:753:: with SMTP id
 i19mr23133817qki.320.1622560639187; 
 Tue, 01 Jun 2021 08:17:19 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175])
 by smtp.gmail.com with ESMTPSA id i10sm11722567qko.68.2021.06.01.08.17.17
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 08:17:18 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id i4so21699817ybe.2
 for <alsa-devel@alsa-project.org>; Tue, 01 Jun 2021 08:17:17 -0700 (PDT)
X-Received: by 2002:a25:6088:: with SMTP id
 u130mr40579283ybb.257.1622560637314; 
 Tue, 01 Jun 2021 08:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210524142114.18676-1-srivasam@codeaurora.org>
In-Reply-To: <20210524142114.18676-1-srivasam@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 1 Jun 2021 08:17:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X+3qP3uj2AVkejmVBmMYqWAxMCS7HBRSkKcPgwP0XGdQ@mail.gmail.com>
Message-ID: <CAD=FV=X+3qP3uj2AVkejmVBmMYqWAxMCS7HBRSkKcPgwP0XGdQ@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: qcom: lpass-cpu: Fix pop noise during audio
 capture begin
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Judy Hsiao <judyhsiao@chromium.org>, LKML <linux-kernel@vger.kernel.org>
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

On Mon, May 24, 2021 at 7:21 AM Srinivasa Rao Mandadapu
<srivasam@codeaurora.org> wrote:
>
> This patch fixes PoP noise of around 15ms observed during audio capture begin.
> Enables BCLK and LRCLK in snd_soc_dai_ops prepare call for introducing some delay
> before capture start and clock enable.
>
> Co-developed-by: Judy Hsiao <judyhsiao@chromium.org>
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
> Changes Since V2:
>         -- Updated comments as per linux style
>         -- Removed unrelated changes.
> Changes Since V1:
>         -- Enableed BCLK and LRCLK in dai ops prepare API instead of startup API
>         -- Added comments
>
>  sound/soc/qcom/lpass-cpu.c | 54 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 53 insertions(+), 1 deletion(-)

Presumably related with Srinivas Kandagatla's comments: this patch
causes a bad splat at bootup. Specifically, here's what I saw when
this patch was in the Chrome OS 5.4 kernel:

------------[ cut here ]------------
lpass_audio_core_lpaif_pri_ibit_clk already disabled
WARNING: CPU: 0 PID: 2066 at drivers/clk/clk.c:958 clk_core_disable+0x4a0/0x670
CPU: 0 PID: 2066 Comm: cras Not tainted 5.4.122-lockdep #4
Hardware name: Google Lazor (rev1 - 2) with LTE (DT)
pstate: 60400089 (nZCv daIf +PAN -UAO)
pc : clk_core_disable+0x4a0/0x670
lr : clk_core_disable+0x4a0/0x670
sp : ffffff81727cf8a0
x29: ffffff81727cf8a0 x28: 1ffffff033d2b8d5
x27: dfffffd000000000 x26: ffffff81a3781980
x25: 1ffffff03493d3b3 x24: ffffff816f433480
x23: dfffffd000000000 x22: 1ffffff035b66e2f
x21: 00000000ffffffff x20: ffffff81adb3717c
x19: ffffff81adb37100 x18: 0000000000000339
x17: ffffffffffffffff x16: 0000000000000006
x15: 0000000000000001 x14: 0720072007200720
x13: 0000000000000000 x12: ffffffd0132c1e00
x11: 0000000000000001 x10: 0000000000000000
x9 : cff2cb5e2cb22e00 x8 : cff2cb5e2cb22e00
x7 : ffffffd010288f74 x6 : 0000000000000000
x5 : 0000000000000080 x4 : 0000000000000001
x3 : ffffffd010429d10 x2 : 0000000000000001
x1 : 0000000000000008 x0 : 0000000000000034
Call trace:
 clk_core_disable+0x4a0/0x670
 clk_disable+0x50/0x64
 lpass_cpu_daiops_shutdown+0x190/0x204 [snd_soc_lpass_cpu]
 snd_soc_dai_shutdown+0x8c/0x9c
 soc_pcm_close+0x258/0x478
 snd_pcm_release_substream+0xfc/0x1e8
 snd_pcm_release+0x8c/0x124
 __fput+0x1e4/0x4fc
 ____fput+0x1c/0x28
 task_work_run+0x12c/0x164
 do_notify_resume+0x1e04/0x2c48
 work_pending+0x8/0x14
irq event stamp: 101552

-Doug
