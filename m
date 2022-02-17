Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4133C4BAA64
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Feb 2022 20:54:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3B6318CE;
	Thu, 17 Feb 2022 20:53:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3B6318CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645127664;
	bh=i98+O5/IH7+1gaZY2KMSk5E4YyB9dds/ZYaSPLMWKCM=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ifGKA12U6Uk6kTsX7K30+TBzDuxlsL1mWiQMRfitQL5ETBaznHJ7WRapXQ+1Dtiwy
	 aE4IPkZT7Glham68V7fhFixP1ZmhlujPsv84D0jbTrNcxxsDKTM2l+dXHWLIcYfAaV
	 guJTQB+tOW6T+Kkvpilv2RMN9Pp1RoL2kyI111dI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D216F80246;
	Thu, 17 Feb 2022 20:53:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07988F80240; Thu, 17 Feb 2022 20:53:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FEA1F80118
 for <alsa-devel@alsa-project.org>; Thu, 17 Feb 2022 20:53:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FEA1F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ajFOJekJ"
Received: by mail-oi1-x235.google.com with SMTP id s5so745966oic.10
 for <alsa-devel@alsa-project.org>; Thu, 17 Feb 2022 11:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=M+doG4hOkesdbvT8ytk1W2x52hbEiy5SqUAs3PiTxWs=;
 b=ajFOJekJGOXYKnbIR0AGefnhQdw2TLlmHA+b7uKmBRNsNq/jFc4XFF4MnK/vW7GToR
 phKhASp9LCiozG918AR/TyIVQQ1cNfwdH9C062r2MJqEyS6n7fqiDXRB59yV1WSyqBEF
 4Yupsavi+A8ybL/NfT6vOzUau4xa5t+rkHobQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=M+doG4hOkesdbvT8ytk1W2x52hbEiy5SqUAs3PiTxWs=;
 b=k3uvweZa2goF5GbRAB8yl7e3JpyOip/ztns/tMQyYqLYrQf5fKeIZ7OSxODfntXcjf
 7hAssfb++7dCYZoAK9Yk80xFOK8X8rk9Op70/yQcUX5jxIW3ewLbfRhU1jAcyJsLqqSS
 vBXAOnzWGLtjGQFUEV0ltvyU9RBHXyVzsrJ5G0vZ1WfrRf0KGzh0OQ5mzoLFBEgSMntm
 m8INC/lbzo2JA5YmmoS3hodwaWXVQYDRk3Hsz3NybdCUMQyeRg496Au3yA1U8SSeRD8r
 FeG5GMIagGWb6DmWST5xZ7Go+ajmPipM5DvvfKkELB5YngjmevCxFzHpCw+doZnPehVJ
 M+/g==
X-Gm-Message-State: AOAM533T5cpJo2ybgU6L9QXD7XhBXSG3crAKGkgXBOANQlVDO3/HDlnB
 +kb+GNtiW0sBGbVIsuMMxTp3APCHUaVq237Cq838Jg==
X-Google-Smtp-Source: ABdhPJybhDJoXr99rxvMT4dvF5Jw/4cgFw4TekjYxtOTU1Sr8MQippcgWwYJ5d2Dn0iO+AJDeH3ccP4DhPjQsb/YmBc=
X-Received: by 2002:a05:6808:b2f:b0:2cf:9af3:1687 with SMTP id
 t15-20020a0568080b2f00b002cf9af31687mr1800955oij.112.1645127592064; Thu, 17
 Feb 2022 11:53:12 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Feb 2022 11:53:11 -0800
MIME-Version: 1.0
In-Reply-To: <d70291a6-7e3f-0406-2826-3a30f2d5650b@quicinc.com>
References: <1644850708-11099-1-git-send-email-quic_srivasam@quicinc.com>
 <1644850708-11099-9-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n52jD_BvQm4CeTkiR723-3uKC9G4fFeynFbs5Ukg_S762g@mail.gmail.com>
 <d70291a6-7e3f-0406-2826-3a30f2d5650b@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 17 Feb 2022 11:53:11 -0800
Message-ID: <CAE-0n51zr2qZ4qSzsC4=3d_jCYGvSxh8_3znrEQFaNrGfRU2Gw@mail.gmail.com>
Subject: Re: [RESEND v13 08/10] ASoC: qcom: Add lpass CPU driver for codec dma
 control
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org, 
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org, 
 bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, 
 judyhsiao@chromium.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, quic_plai@quicinc.com, 
 robh+dt@kernel.org, rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org, 
 tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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

Quoting Srinivasa Rao Mandadapu (2022-02-16 01:42:42)
>
> On 2/15/2022 7:03 AM, Stephen Boyd wrote:
> Thanks for your time Stephen!!!
> > Quoting Srinivasa Rao Mandadapu (2022-02-14 06:58:26)
> >> +       struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
> >> +       struct lpaif_dmactl *dmactl;
> >> +       int ret = 0, id;
> >> +
> >> +       switch (cmd) {
> >> +       case SNDRV_PCM_TRIGGER_START:
> >> +       case SNDRV_PCM_TRIGGER_RESUME:
> >> +       case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> >> +               __lpass_platform_codec_intf_init(dai, substream);
> >> +               break;
> >> +       case SNDRV_PCM_TRIGGER_STOP:
> >> +       case SNDRV_PCM_TRIGGER_SUSPEND:
> >> +       case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> >> +               __lpass_get_dmactl_handle(substream, dai, &dmactl, &id);
> >> +               if (!dmactl) {
> >> +                       dev_err(soc_runtime->dev, "failed to get dmactl handle\n");
> > This same message is in many places. I really hope it never gets printed
> > because finding out which line it got printed at is going to be
> > impossible.
> Okay. Will add function name in each print.

Are they useful prints at all? They seem like development prints that
won't trigger after the driver is developed. Why can't we just remove
them?
