Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1643502FEF
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Apr 2022 23:11:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CE0F173D;
	Fri, 15 Apr 2022 23:10:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CE0F173D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650057095;
	bh=oZBwHSb91HdUkWadCtrn1E1eOp04aezGc1qowiBvVa0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PKoULffG/6aZY30e4BBNo+YJ+PZk4o/U3KzBeIdCEJDQJbf2MnEqbXrGP1CyxcHGG
	 KDsZz/7t3rpc8Ph24QErCxeQriYG5iNvihvWV4KV6HlY4veAAyXTMUw9/6OSpQrAW2
	 H/KS/vq9aBSUMTzSieKDSVLdQWh1UgOqeBGcRKN4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E74B5F800AE;
	Fri, 15 Apr 2022 23:10:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1A1AF8016A; Fri, 15 Apr 2022 23:10:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62A1BF80095
 for <alsa-devel@alsa-project.org>; Fri, 15 Apr 2022 23:10:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62A1BF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="d6Lcp1mm"
Received: by mail-pg1-x532.google.com with SMTP id u2so8565971pgq.10
 for <alsa-devel@alsa-project.org>; Fri, 15 Apr 2022 14:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=A2AI4pplq8y+1V8AY4LoXu1zsRUo+0KPIG/r7h38Ai8=;
 b=d6Lcp1mmb5lvSHabXdMUO6rgO/E+hm6yhgZvoJHHJIeHRkbBWh3B5xvc4E6cjHoHyl
 Xh7/6eSJP9teC05Ct8XOAMu5ZRAUj4zf24sa8KJ5runxH3awMzhVvMeVKC3qogi6tg2Q
 Cl5hKQlt4CwXvDHkxaP11XFuVemS0ftRvUX78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A2AI4pplq8y+1V8AY4LoXu1zsRUo+0KPIG/r7h38Ai8=;
 b=wFiNeKsJf0nErvCh3/gCF3/6MRrLr96a+lhyzV1+tuRxi7Rl9on1Rrb3AZT7TvAupB
 P8wCZ9wXjwriTVvggjwSl9ZV0u2syuxmXrXmRn3JU4/d94v7cBCV64V/nTYX5OqJ1s6o
 TQY9GmrpIU0ZhmOpSFiR7cMlWsV2P5Yq6wZqZHZOhSQ6Ijcp9QLdkxe2u8J6eSe0GHf0
 dLVMBm7tgqgFsq57ZD+MRyQfLvZFRJy0xtmDgsBbHH9pXqqtYNXHd8sc7TM57DDRdwWe
 vPUmnkCehfquQ0N+TW9jAf3338ARzL5ZYXWC403B/Zr08g8XgDHKvmj0sRUNA26YWI31
 EG2w==
X-Gm-Message-State: AOAM533la3uby3cdkHDwzVwaQ6t5Ixw3x8QHwaUUVDJG7V4aCgb7FGYv
 v+VNjR94UU7+t3jqcdeEZ0FBEg==
X-Google-Smtp-Source: ABdhPJxYscLYKrQD1yLUGKWWVL2nrGynAlczX+I4wLahU1toXz5oJh3uy7J0GhdDCpqbcPSKF+N/1w==
X-Received: by 2002:a63:dc44:0:b0:381:5720:88a5 with SMTP id
 f4-20020a63dc44000000b00381572088a5mr665257pgj.219.1650057026602; 
 Fri, 15 Apr 2022 14:10:26 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:b27a:b3e7:2e3e:e4be])
 by smtp.gmail.com with UTF8SMTPSA id
 x6-20020a17090a294600b001cba3274bd0sm9350819pjf.28.2022.04.15.14.10.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 14:10:26 -0700 (PDT)
Date: Fri, 15 Apr 2022 14:10:23 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v12 4/7] pinctrl: qcom: Update lpi pin group custiom
 functions with framework generic functions
Message-ID: <YlnfPzGQDVlUnRqX@google.com>
References: <1647447426-23425-1-git-send-email-quic_srivasam@quicinc.com>
 <1647447426-23425-5-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1647447426-23425-5-git-send-email-quic_srivasam@quicinc.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, tiwai@suse.com,
 agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 linux-gpio@vger.kernel.org, rohitkr@codeaurora.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, quic_plai@quicinc.com,
 bjorn.andersson@linaro.org, judyhsiao@chromium.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
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

On Wed, Mar 16, 2022 at 09:47:03PM +0530, Srinivasa Rao Mandadapu wrote:
> Update custom pin group structure members with framework generic
> group_desc structure and replace the driver's custom pinctrl_ops
> with framework provided generic pin control group functions to avoid
> redundant code written in lpass lpi driver.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
