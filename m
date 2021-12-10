Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40557470942
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Dec 2021 19:46:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFBA51FB9;
	Fri, 10 Dec 2021 19:46:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFBA51FB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639162018;
	bh=8R9IzxtlCfXmD6aTS035WoJXSl7WmX55Sg6X6ge3SQ0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fu1V5cuxDONB2dirpBa2FwgWIpSwy+RumYxENtEF/LCBtGp1HXEkfG9bzYNLObF7t
	 ZttIcOk0q/O6hboGaMEqBO2sPEukY26l3zo1v1GRv1JtB9rhk4eOJrgavH1zZ8VTGw
	 /oJTCjQ/iA8s6R9sgWBP8CASh4rt9m9GyrWH6mIw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17E68F8028D;
	Fri, 10 Dec 2021 19:45:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9A66F804EC; Fri, 10 Dec 2021 19:45:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87958F804E5
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 19:45:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87958F804E5
Received: by mail-oi1-f178.google.com with SMTP id 7so14362200oip.12
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 10:45:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RER/iWppV8hMmnZQD4dlpK+kku9THlBKxNx02Kauc1U=;
 b=doV2EBhc/L+5nWkdQQAHmfAXcjctl6aHrtI5kpwjSzKMeGpQMQAsMtzVPvyxtMXOpk
 SI/jSB6B8D/DlGRvTq8JFRqMnJgp25Tic3e0attliow2v6/HPyTokcTNwXlDA3EbnMOJ
 qjTi48sGrwZUHrAFD9Yq5CP6slMsJT6WcLrS7T1jextppzWhkwtAXZOOq3Iey9lud+mq
 RyEXDR7ZYI6QLJkZyo7GRSv2UQJKCnZiJKojZieZBMZK+7siDsxhNE++/2+vA24+qQWm
 DngWUINBQCAKchFuQR+pQnQTJkCrqGfQ4q1Hoqseg84OTtoKthG3WtF6iXxlpT/tj7sh
 PNzQ==
X-Gm-Message-State: AOAM530DMh/NrBNmZsVPOWTsJ8lCUSEGUC8EjqrlNv6As0GM6zze/+3Q
 t9Kqsp5lyaKT39yQZfYyXQ==
X-Google-Smtp-Source: ABdhPJwT16W0aC4a3LaA1eXQEG2Ta3HqdgEh97oXtM7v5sDKulhdS+IbM7yFjdRFsiyNfNlmmQOhzA==
X-Received: by 2002:aca:1a04:: with SMTP id a4mr13550300oia.153.1639161938754; 
 Fri, 10 Dec 2021 10:45:38 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id m12sm963557oiw.23.2021.12.10.10.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 10:45:37 -0800 (PST)
Received: (nullmailer pid 1684290 invoked by uid 1000);
 Fri, 10 Dec 2021 18:45:36 -0000
Date: Fri, 10 Dec 2021 12:45:36 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [RESEND, v9 09/10] ASoC: dt-bindings: Add SC7280 lpass cpu
 bindings
Message-ID: <YbOgUPpQjBhqGhHC@robh.at.kernel.org>
References: <1638800567-27222-1-git-send-email-quic_srivasam@quicinc.com>
 <1638800567-27222-10-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1638800567-27222-10-git-send-email-quic_srivasam@quicinc.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 bjorn.andersson@linaro.org, bgoswami@codeaurora.org,
 Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, rohitkr@codeaurora.org,
 broonie@kernel.org, agross@kernel.org, swboyd@chromium.org,
 judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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

On Mon, 06 Dec 2021 19:52:46 +0530, Srinivasa Rao Mandadapu wrote:
> Add bindings for sc7280 lpass cpu driver which supports
> audio over i2s based speaker, soundwire based headset, msm dmics
> and HDMI Port.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 75 +++++++++++++++++++---
>  1 file changed, 67 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
