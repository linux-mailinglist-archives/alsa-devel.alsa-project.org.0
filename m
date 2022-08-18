Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CD5597EF4
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 09:06:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AC3D1621;
	Thu, 18 Aug 2022 09:05:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AC3D1621
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660806386;
	bh=AjriiNks9RHRoCBN7ZUJ6jtj7TS2aTJuQAkCqUAkW5Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ux9o2LfjpNf4H6W3LG6T0Xw0OEaR1Tjwe4pTFs1KCpfV1CnGvcwUdIbQfSM9iiae7
	 nr6jo96ptwviuWaETnUqmerA3kUcOU6H4NgSFGUhkk2qiEPPhtpIDJ4gWIY6PzDzPJ
	 8Zwysq+UJg3b7+kXvoQrcwsJ5JECuPIeEzAD6qFw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3637EF804AD;
	Thu, 18 Aug 2022 09:05:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAAACF80430; Thu, 18 Aug 2022 09:05:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69650F800E9;
 Thu, 18 Aug 2022 09:05:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69650F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OveoAobs"
Received: by mail-vs1-xe33.google.com with SMTP id o123so645638vsc.3;
 Thu, 18 Aug 2022 00:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=AjriiNks9RHRoCBN7ZUJ6jtj7TS2aTJuQAkCqUAkW5Y=;
 b=OveoAobst4dQgzVcV+b2hUYKC6v8Bu1nEkiCbdf5FW37KCqyv7XSu0oLbibqxi+P2I
 JSVBCOQ3WWAceNJsnm/Zhwd/xIVJAd+M9IrJ48Cb52rDvVi0eb52FvtUIj4/+Xld+MPr
 qBgTd99HbHfHUA9Hrg6Bh0CZOOEy1ozS3724GEhA0ki99vdSYKASgLbgNpxYHBKne+LL
 aRs/q4iSpgR72FZYFsqU5vun7DfI3ru4dlg3Fw7EVEbdIxWzq0yPgfmP/e4HSx8qgOT7
 gug5se3NsFe2RVzQU5JzrnQoTlZYnNemIwDMFA1gss78x4jizikMd+gDBllm0l6pEV0E
 CGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=AjriiNks9RHRoCBN7ZUJ6jtj7TS2aTJuQAkCqUAkW5Y=;
 b=FNk810NdrFzZFkqsKApT8RJrdN92dsLHyDBPZYrn7wQ6c+XhZZu74Co0D8BtoOXANF
 q5MwLLHoNrnUIAlaSPJq4RhhnRVbz7DQcwYmo9UC+tDVKNAjtboCFZm1HzLgCPbCc9fp
 EYgsBK6LMeCe4hJ2HM5f930tTLn21p85D3IN3xogCZg5UBqj9Ypm5dc0BPy0vmzPQ+Ml
 PSd5f6LBED/t0/8UtPNpTj6GOwsyKUiRA4JR+UJfVioQyToYU1dUJfAGEzaCmRLyp8ws
 rAJ8PmtD+aMhgzobMK/cbQudk+lfH0/Wt52E0NifnlG9jbQbsxuruK/bvoY3IfCMj/79
 HHUQ==
X-Gm-Message-State: ACgBeo1SyDlvneDTSQ6CGqyQrRA14GuGaw6a0DPm2VXCsbNNFtEmW6TK
 ng4X5vbbjE5d4qxn60mBR77wAaKNkV1TbnywYsg=
X-Google-Smtp-Source: AA6agR4SXRtluW797qZbkdraB+aWdq4UMbY/7gnYhTK9K3tJvmg7YIGhYwFKeNd/Azfqw6j+kBLhK3/iwIRasxLKc3A=
X-Received: by 2002:a05:6102:2139:b0:38d:1e1f:7230 with SMTP id
 f25-20020a056102213900b0038d1e1f7230mr510987vsg.47.1660806309000; Thu, 18 Aug
 2022 00:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <1660787634-28550-1-git-send-email-shengjiu.wang@nxp.com>
 <1660787634-28550-2-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1660787634-28550-2-git-send-email-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 18 Aug 2022 10:04:55 +0300
Message-ID: <CAEnQRZB19WxVYxabOdN3ee+pp9cbwgY7p=k+6P1BqONCEJjjnQ@mail.gmail.com>
Subject: Re: [Sound-open-firmware] [RESEND PATCH v2 2/2] ASoC: SOF: imx: Add
 i.MX8ULP HW support
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 tiwai@suse.com, krzysztof.kozlowski+dt@linaro.org, festevam@gmail.com,
 sound-open-firmware@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 shengjiu.wang@gmail.com, ranjani.sridharan@linux.intel.com, linux-imx@nxp.com,
 devicetree@vger.kernel.org, s.hauer@pengutronix.de,
 peter.ujfalusi@linux.intel.com, robh+dt@kernel.org, daniel.baluta@nxp.com,
 linux-arm-kernel@lists.infradead.org, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 kernel@pengutronix.de, shawnguo@kernel.org
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

On Thu, Aug 18, 2022 at 5:12 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> From: Zhang Peng <peng.zhang_8@nxp.com>
>
> This adds skeleton support for the audio DSP hardware found on
> NXP i.MX8ULP platform.
>
> On i.MX8ULP resources (clocks, power, etc) are managed by the
> System Integration Module in LPAV domain and XRDC which is handled
> by arm trusted firmware.
>
> Signed-off-by: Zhang Peng <peng.zhang_8@nxp.com>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
