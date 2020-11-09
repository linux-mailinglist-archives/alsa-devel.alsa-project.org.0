Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D7C2AC48B
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Nov 2020 20:04:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B48BF1686;
	Mon,  9 Nov 2020 20:03:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B48BF1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604948651;
	bh=/sbMjxdqePOWa4vU/WvlctDxASB2XqPLKIIOtVW2g2s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rmtx7/lS0P+p8hMRgq5Ritoz97pe8F/tehanI9OjIuh1RFvZ72FG0VkLdt6dUPZ2j
	 VUDDm6WLsZ1/Qsuz9wqy2adi4WZVczONWIyWDlnuDbJBsyP65mk674YOewAIv4Q/0I
	 mTuxDJt/4abAjiszKuuHPcjHQ/3t/aCHHiZ4Zj8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24004F80059;
	Mon,  9 Nov 2020 20:02:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B956F80059; Mon,  9 Nov 2020 20:02:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PDS_TONAME_EQ_TOLOCAL_SHORT, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE, SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEEBCF80059
 for <alsa-devel@alsa-project.org>; Mon,  9 Nov 2020 20:02:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEEBCF80059
Received: by mail-ot1-f66.google.com with SMTP id 32so10023725otm.3
 for <alsa-devel@alsa-project.org>; Mon, 09 Nov 2020 11:02:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Os7Tqy6UODgwd/wlPU8zzDWJnqShuXVfWyTYThhhTQs=;
 b=fakaFR1/JAXZ4Igiko32pdyenBnQcfTjsd3Hr1IiR2pA0EaCNko5pqEnd72oD0knL1
 XQ5qoW1bD1TnRE/Txuymx2nlXYYVzFfJD8OWXERFb4ZFRDNUcyd+rXwKgK915pFdknhx
 Nr8V3K/8J4kTexV9+76+ch5/jAQZ4qajviM36zAckrZ+j2kNptpsmbOiC6TkAxumOaKT
 rr4vzbeXaaHhNXhPkfKacwy7908uHaPCBSs2X9umR+Ssb2yDZmyTGeQV7oLZHZTswwzJ
 8tGchesZQSINY/xFHNCvSjue/+SPJpm0C7cYNLtfBKReK21aksFaVaKDFGLQs4Dr3HTX
 6GGg==
X-Gm-Message-State: AOAM530QqoCVOFwQC/D5iHR9O/FMH5GzXY2DTn3NryPsYwvMVBXxZXDX
 bBFIfH6QZ4d2LzKkDONirw==
X-Google-Smtp-Source: ABdhPJzi8cf177x5y7qmvI5oZJQW3sqESbPviEGH6ObpyFz+8kfyg2yeSvBY/c2ERhInbnrt6d4HJQ==
X-Received: by 2002:a9d:4aa:: with SMTP id 39mr11584971otm.11.1604948550593;
 Mon, 09 Nov 2020 11:02:30 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x22sm2572439oix.48.2020.11.09.11.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 11:02:29 -0800 (PST)
Received: (nullmailer pid 1593859 invoked by uid 1000);
 Mon, 09 Nov 2020 19:02:28 -0000
Date: Mon, 9 Nov 2020 13:02:28 -0600
From: Rob Herring <robh@kernel.org>
To: xuyuqing <xuyuqing@huaqin.corp-partner.google.com>
Subject: Re: [PATCH v1 1/2] ASoC: google: dt-bindings: add new compatible for
 sc7180-coachz
Message-ID: <20201109190228.GA1593812@bogus>
References: <20201105013242.298518-1-xuyuqing@huaqin.corp-partner.google.com>
 <20201105013242.298518-2-xuyuqing@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105013242.298518-2-xuyuqing@huaqin.corp-partner.google.com>
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, linux-kernel@vger.kernel.org,
 Rohit kumar <rohitkr@codeaurora.org>, cychiang@chromium.org,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Andy Gross <agross@kernel.org>, dgreid@chromium.org,
 zhouguohui@huaqin.corp-partner.google.com, devicetree@vger.kernel.org,
 tzungbi@chromium.org, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, judyhsiao@chromium.org
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

On Thu, 05 Nov 2020 09:32:41 +0800, xuyuqing wrote:
> Add devicetree bindings for coachz in documentation file
> 
> Signed-off-by: xuyuqing <xuyuqing@huaqin.corp-partner.google.com>
> ---
>  .../devicetree/bindings/sound/google,sc7180-trogdor.yaml      | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
