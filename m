Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A523B28AE63
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 08:51:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EFB41671;
	Mon, 12 Oct 2020 08:50:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EFB41671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602485480;
	bh=+y6ZspLdxqsSlax91fON+U7+Yiphfpn/BmXvY5IFVZU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vUpGKrwkR6faZkdrjoSAocF7YpR/mEIXzM+bsHjXztDfk4QPqLwLJO1O/6902Pigm
	 aotBodYXkv39RRZU2SQ7IVuFGnzUtG4mBBrqXdlQkZe8uy7vzpiTxxHIrC0d/LoQUp
	 IS3mKva914lazlycn6ypJT9WyQR9mEvNn+OPyjM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3E04F80217;
	Mon, 12 Oct 2020 08:49:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58F88F8015B; Fri,  9 Oct 2020 18:08:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1EA0F80128
 for <alsa-devel@alsa-project.org>; Fri,  9 Oct 2020 18:08:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1EA0F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="kId7MjgA"
Received: by mail-lj1-x244.google.com with SMTP id r24so10128336ljm.3
 for <alsa-devel@alsa-project.org>; Fri, 09 Oct 2020 09:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4ZcCjxOSOpKZkXBVNu3kbvFlOdpYb4SLFZlWCNm3nvs=;
 b=kId7MjgANOiI/+Ylv6Eml6mUz2V6UYpbbarNiIwU/UDg4WF/38W60P5M41wGBYulPN
 h4U+CSvlkNQ/Tt9+LJWNrrglFYBsabT3y6nHC5C6mWvNSNhOlo1Aqm8vsN0RN/gHlFR6
 yZOtGiJgvv5bJgkGP4tL/+Ss3MXE/9Ye/Yii2elzkRa5TgFjoblhIZU9pcNKXeXta8rH
 J3o7OBD12f+xyvg5gNooMK3ZvAHW+DWehQt983JT4zie6kAKc2CzhHSbFtx8SyBZq5TR
 zchrOYh+PkejeHYep3CLwBi/L39Zbp28sZ413MXMDogUKQ3SH94SSXIu3CP+4WdwgzLJ
 EIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4ZcCjxOSOpKZkXBVNu3kbvFlOdpYb4SLFZlWCNm3nvs=;
 b=XVgGHkiu3lq0ayjKSeNMYeYhi4SNvjQY4HxRFwA9Y9WgDjys+QJnxARwbFNS6/eBFr
 nRbBOio7cuTzabE4SP9QwCVIRw0u5J/Dcft5dDyTc1xGDeOProar8tTH0qHy1VbDgPUR
 zxDY/l2R2COCqY1YlPY5+rNz/uJpPkz/dnnszuw+h1aP7MyqvBvZwOG7GpDYt9dN5Hpn
 XYbhl3Fg9obl2JYKMaUwdji9aty2R+HQjftj6y503w41K6L87indVgxJwf/OBdGTLIPD
 uD8On5RhpgjOe+VJo+w4m+uz3lPj8shrADLusJvR+PUoJBeNw0CMbE8ZJ1AoDU0i7utL
 KPxw==
X-Gm-Message-State: AOAM530ZSvDmHrAsQhQz7VEwozZ6KSaF02YA8lKPcGs0as53J0M9ixX0
 oZ7njiQo22ORQct0WznuoGZMqR63c36ZvL517htGpA==
X-Google-Smtp-Source: ABdhPJwFSo8884+HnefvGr5GaVc7mN7PXC03bxgHqIJryOslbYdT9kfJA9VLDlJsm2yN/L2vO5Fcn6GXV0aalX+i164=
X-Received: by 2002:a05:651c:203:: with SMTP id
 y3mr5202695ljn.457.1602259685527; 
 Fri, 09 Oct 2020 09:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200928063744.525700-1-ajye_huang@compal.corp-partner.google.com>
 <20200928063744.525700-2-ajye_huang@compal.corp-partner.google.com>
 <20201009135231.GA6655@sirena.org.uk>
In-Reply-To: <20201009135231.GA6655@sirena.org.uk>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Sat, 10 Oct 2020 00:07:54 +0800
Message-ID: <CALprXBZAFCOpWP2186RaP++613qnjPY3D3NbXEN5CToYsLNsRw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] ASoC: qcom: dt-bindings: Modify sc7180 machine
 bindings
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 12 Oct 2020 08:49:37 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ajye Huang <ajye.huang@gmail.com>,
 Patrick Lai <plai@codeaurora.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, dianders@chromium.org,
 Andy Gross <agross@kernel.org>, Rohit kumar <rohitkr@codeaurora.org>,
 tzungbi@chromium.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Cheng-yi Chiang <cychiang@chromium.org>
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

On Fri, Oct 9, 2020 at 9:52 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Sep 28, 2020 at 02:37:43PM +0800, Ajye Huang wrote:
> > Add compatible "qcom,sc7180-sndcard-rt5682-m98357-2mic"
> > for 2mic case.
>
> This doesn't apply against current code, please check and resend.

Hi, Mark

Thank you for your reply,
This patch depends on  Cheng-Yi's patch series
https://patchwork.kernel.org/patch/11773221/.

  If I misunderstand what you mean, please correct me,
Thank you,
