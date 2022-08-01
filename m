Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C56586FBE
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 19:48:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 048271E4;
	Mon,  1 Aug 2022 19:48:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 048271E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659376130;
	bh=zlg48iDIzuivsoIaJJz4EYmoQEvJeQUa+WYZdd3wCrY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bvec0I9DrluC6X2FsXwJeRPrnqbMksa3Lo4N5ircFTaDoyfRMZMJGAw1nhKgGKAP6
	 AE8j2HfDqcMF/PmK7vyU2SOQprOit60vFgTBoSMK1+0zLaocf1A/WIMna6pGVMnGnJ
	 yrUs3mdSCriMP8ZLzwX4riTUcZk/Qc98ozdqOoMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62E8CF8014B;
	Mon,  1 Aug 2022 19:47:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14259F8023B; Mon,  1 Aug 2022 19:47:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFECFF8014B
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 19:47:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFECFF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="G4tRILzA"
Received: by mail-wm1-x336.google.com with SMTP id
 129-20020a1c0287000000b003a2fa488efdso3101993wmc.4
 for <alsa-devel@alsa-project.org>; Mon, 01 Aug 2022 10:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=8Jns36cM/Xdll3zQTDOynsDPWveorbrG1VHyx9CdQR0=;
 b=G4tRILzARpm1bpxvqlIvwyPp6Q3sPOp30LU8KfkTmEbQvU/HzJTfAutPmk7ojeUJl+
 IxmsFl1cOf3f9TEB0LvOEu2hnx1emE0t0Ty2+rUvwm4Stt0nmWIq/agtWwIuzyuRiZYs
 1Zy+AoDvCDe04ITvIkdsGsfBs4PQD7vQ8KRQ4vRbB1I1orGiMsmjn+OnOPlN9DXTGYDA
 TpgEPTvOgtWzpQNn8tqYXJ/pgyB0fg8VejaGxPE6PavIgCU6YQyVBnqEita9wAmkwKFJ
 hVkeHxggcnWcygVPyUBVq4QG88GP9BZGQFukG4EEtA15a9wFdZ1XZ/H9ejkRUXCDgFuJ
 5Yuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=8Jns36cM/Xdll3zQTDOynsDPWveorbrG1VHyx9CdQR0=;
 b=dotCflEx+WthkuX/QnJFy1u1N0RygRYWxjt3TxNlT+qnEHLKM6Xja4WbSfYrw8pLa4
 RHYmLlYMcBhog4AXItjPsGHJbU2oMbsBzR8C+fRVbHjPaouNumm04KgMuTFNNIXP1Hwu
 B6siG43uEJ8JRlVCUu0jZFl4l8FS6OoIj/8X+Om9JT6jufzHuBTxXK/s3h1C2X+sUQLj
 vUSUdn52bNalVaENtKKJWR+vohrZQgkgbO34ju703hK/1hRLtE/qDIu3xlKWdb8RF/r9
 2mTjakDJ5YxbG60JM1P1URjRZ4ZM5bxdru33TQhMSusvvYUIoA4251LrkeMdRE+Iw4af
 r0Lw==
X-Gm-Message-State: AJIora99wuh6I9rPl9lz3LlJibZECNIs8JvXE7pO/gK70PLol9bM6Vef
 jwcPrMdC6vuCBglniEeoZft9V1kddsSzuS0bi3Y=
X-Google-Smtp-Source: AGRyM1vXZlt10Nll2wkPPyLa+hlsyZx/+f3pCIFG+RLb7StXHim8J1UtQjk4yZr5Nc72B/VPuT0OJCtzNR7gmh4BNG0=
X-Received: by 2002:a05:600c:4f06:b0:3a3:2158:c5ed with SMTP id
 l6-20020a05600c4f0600b003a32158c5edmr11852463wmq.103.1659376059939; Mon, 01
 Aug 2022 10:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <1659356773-8315-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1659356773-8315-1-git-send-email-shengjiu.wang@nxp.com>
From: Nicolin Chen <nicoleotsuka@gmail.com>
Date: Mon, 1 Aug 2022 10:47:28 -0700
Message-ID: <CAGoOwPSy77PuBvA0BghsFrNgpXfO+JuFgTW5VTNOfMEQdnbrVA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: imx-rpmsg: Support configure sysclk for codec dai
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 Xiubo.Lee@gmail.com, festevam@gmail.com, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, shengjiu.wang@gmail.com, linux-kernel@vger.kernel.org
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

On Mon, Aug 1, 2022 at 5:42 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:

>  struct imx_rpmsg {
>         struct snd_soc_dai_link dai;
>         struct snd_soc_card card;
> +       unsigned int sysclk;

unsigned long?
