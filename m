Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6089755AD05
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Jun 2022 00:53:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC8D21690;
	Sun, 26 Jun 2022 00:52:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC8D21690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656197584;
	bh=x/3CJY8b07RBucsswH4q0R75uAfMe2AO1c8Bas6krMQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fHkBjgDCdu+YSSEJkjEYaao1zvQICjiCur3W54dF/FV2VFUes3BeG58trf+X7aJiQ
	 EzKfGBqrHTMeFBEkViobqB9PXP+lOV0eo5dXPzNU1Nndb8wG2fs6OPztobKVzDm5Te
	 xTwSAgLqp/6AVIgt9mcN+jOzNTFwljNqzk8uQG/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44866F8016C;
	Sun, 26 Jun 2022 00:52:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 743EBF80162; Sun, 26 Jun 2022 00:52:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12AE9F8010B
 for <alsa-devel@alsa-project.org>; Sun, 26 Jun 2022 00:51:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12AE9F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xp+KQrZl"
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-317710edb9dso55305647b3.0
 for <alsa-devel@alsa-project.org>; Sat, 25 Jun 2022 15:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x/3CJY8b07RBucsswH4q0R75uAfMe2AO1c8Bas6krMQ=;
 b=xp+KQrZlauuD2PE/DYgNZ7pEu5ZnYTvujmpuigZnI27SuYCTRDZ+6Uq69d826Ft5n4
 0ocKLmD1LJVQCIQM0g534Sp8j+mcafQ/lRP/YAXaK96Z0pL02FcHPhz/H4xbvzv7NXRs
 hqzeIYtW2QfHbrFxNmlm2EsXdsX6mdB4aNt+Hhh4pHsD+mBZjBxy1fYuDhdy/214s9bf
 B7lIZsHZsrduLVnF0p2mWI1C4b7dm4VYhSJgcTlSY/L8NJs9HSnR2CHmVhtfWpV4XhdW
 ha7mn2+M2TSHVhehLAQzirOJsaBcfSi3fjeRjtykv7iiFXsx3o2K0ww0DGoqrIF+dU/I
 0fMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x/3CJY8b07RBucsswH4q0R75uAfMe2AO1c8Bas6krMQ=;
 b=YOeku+9pDgSgPd6IZkihPhU10hXgjmLK+rSUifsc9oQhdCjjjjpHkEMwIIiL2yLleZ
 njmKGepiMtSWr1om/GV5ulYVubKJQjBP2p6ZyzhelcvKdoCSpcFwlcE2x+2NRgZbRpeT
 ppnjP2fjDa9ayMnthRh8+PgzaOdi6CCGdDrDR36WbgEiDmmjME6ByyWXIwJLbb4nzXX7
 ZFVGo6iAYhBLEYjPoYXCAYAOhTV4RTIrHy7tK9xBZn5+BQsLU2Miak0UBVUdULHJiHbF
 ZELMD6QbwnqpMVegQpzBdFjbAXLKnAukkFW8JgOU6KPP92NIcLqygr+sZDBl+zLhTWyc
 2/qw==
X-Gm-Message-State: AJIora9F5Br6aUpn+A5sznODLvuEuToBq8xZNjmBrD9Uyq1r2/MP5ITX
 OOU2+Zff3a8bZwxhV1KbI/JJgBeUbENEHbS9Q04qig==
X-Google-Smtp-Source: AGRyM1umXxfdalPMIDRFDGUVcUE4Jii7SRvJss2hlJNKGIYyu+4E52LaAQK1djFUeRB8dmAFR8j+DlFSVYQXtF4zXqw=
X-Received: by 2002:a0d:e20a:0:b0:317:ce36:a3a0 with SMTP id
 l10-20020a0de20a000000b00317ce36a3a0mr6827319ywe.448.1656197514196; Sat, 25
 Jun 2022 15:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <1654921357-16400-1-git-send-email-quic_srivasam@quicinc.com>
In-Reply-To: <1654921357-16400-1-git-send-email-quic_srivasam@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 26 Jun 2022 00:51:43 +0200
Message-ID: <CACRpkdbX3GyVxJ1wNhDTdykSFAEY9dkpLXWhP5+Lzh7pxd5oYg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] [PATCH v4 0/2] Add pinctrl support adsp bypass
 platforms
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 tiwai@suse.com, agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 linux-gpio@vger.kernel.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 bgoswami@quicinc.com, quic_plai@quicinc.com, bjorn.andersson@linaro.org,
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

On Sat, Jun 11, 2022 at 6:23 AM Srinivasa Rao Mandadapu
<quic_srivasam@quicinc.com> wrote:

> This patch set is to make clock voting optinal for adsp bypass
> sc7280 platforms.
>
> Changes Since V3:

This v4 patch set applied. Bjorn can yell if he has concerns and I'll
pull it out again.

Yours,
Linus Walleij
