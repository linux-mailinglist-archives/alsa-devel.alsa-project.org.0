Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A78A470C70
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Dec 2021 22:19:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FB7E213D;
	Fri, 10 Dec 2021 22:18:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FB7E213D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639171187;
	bh=rAOlSUXiWEeRq8vyOmbvhvIYCzBq9tDD+tblsvCckDk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hBXRjAyPhi4Jibzl4YOBJy5urKXDs+FOTquYG90Q+UW9AJicRo+boUXNirLaLrUo1
	 gdkYRG+33vGWZNnretMZjsR+7ijBYWOEEcGD/2x58Qcw/FPjvTW15UccCxyMbPMviS
	 kpAgttdzaFF2o+ouDZLhhJ+GjIwB6twbjDQDFELY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03813F804FF;
	Fri, 10 Dec 2021 22:18:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A9A3F804ED; Fri, 10 Dec 2021 22:18:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50CC2F804ED
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 22:18:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50CC2F804ED
Received: by mail-ot1-f48.google.com with SMTP id
 n17-20020a9d64d1000000b00579cf677301so10904562otl.8
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 13:18:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5Sqw8tLXZ7NhyqIz42DAJGxWZBL50vbOTyJH5mqt2+E=;
 b=sCzDsfnCqlT7RhPNbXpoWwYCJIfoEuCbSikKTYgbNwm5H8YfdBHop5RLa622h+pTlU
 GOV/PDHq06+5u1VPI05Nn4EL8TcqAcLsjnGNccSlE2aZpy/1GIQlaqydSUyRQ+tFaFJA
 6csoZXQpB0Yo2ojLwPI1zYlJ1niX+FWNI18+NcjML68QbptPJB9ATSPoeQ6aqVFUc+iu
 MjC/3kO9ho9z4l0o56d/JDjOLJ6iCcX9UpdcGhyE6vEdQw3hwYu/0T+lDJb5JwC2MLdb
 2R5MnLFJPjzVfz5M3bNovAx9yCLYamSndmF+u6tq0/YYgPaAhN980PwTcxB/hnlA2J89
 7gxQ==
X-Gm-Message-State: AOAM533S2BuzRnbkVqM36Dq3gDlcX6RxWQ5TIVYKpFPJ+QtXb7Iq9alC
 6B1/O5YzGd/vgzMKl3avpg==
X-Google-Smtp-Source: ABdhPJyJEpLusuj8i+CYQoGtrRtr3OG05BtAkAjqpcqi8XpwiO0rNK6rvnucUKeoSEvSOkQeI9S5dg==
X-Received: by 2002:a9d:70d4:: with SMTP id w20mr13178427otj.154.1639171104789; 
 Fri, 10 Dec 2021 13:18:24 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id m12sm1070226oiw.23.2021.12.10.13.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 13:18:24 -0800 (PST)
Received: (nullmailer pid 1915698 invoked by uid 1000);
 Fri, 10 Dec 2021 21:18:23 -0000
Date: Fri, 10 Dec 2021 15:18:23 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v5 2/5] dt-bindings: pinctrl: qcom: Add sc7280 lpass lpi
 pinctrl bindings
Message-ID: <YbPEHzDdz3Nag1VB@robh.at.kernel.org>
References: <1638891339-21806-1-git-send-email-quic_srivasam@quicinc.com>
 <1638891339-21806-3-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1638891339-21806-3-git-send-email-quic_srivasam@quicinc.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 broonie@kernel.org, tiwai@suse.com, swboyd@chromium.org,
 linux-gpio@vger.kernel.org, robh+dt@kernel.org, rohitkr@codeaurora.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
 judyhsiao@chromium.org, Linus Walleij <linus.walleij@linaro.org>
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

On Tue, 07 Dec 2021 21:05:36 +0530, Srinivasa Rao Mandadapu wrote:
> Add device tree binding Documentation details for Qualcomm SC7280
> LPASS LPI pinctrl driver.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  .../pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml     | 115 +++++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
