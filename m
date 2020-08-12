Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 659C12423F4
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Aug 2020 04:08:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04F79166B;
	Wed, 12 Aug 2020 04:07:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04F79166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597198087;
	bh=Bd+FnW2nhzgCq8ve9wofALLEcDiU3JqVX/3MCQf9CPQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i3q1apBKKjXxuo3BzO6u4uKOl30gvmbMjcTALIe8wYj6MIalVGqV40HsPoCAbR0qc
	 gs7DXgsG+HlPUmY7ZMk+JSfO6ojbZ/Oy5gpPO6RgId0gkJDoye72RlrX7eoIDSCFPb
	 fNIAC1+0PFs7FxHP/HAaVhY/h5KoroCDQSgRRmSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 305EAF801DB;
	Wed, 12 Aug 2020 04:06:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5C16F8022B; Wed, 12 Aug 2020 04:06:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17F42F80147
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 04:06:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17F42F80147
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="hRwaGE62"
Received: by mail-oi1-x241.google.com with SMTP id h3so449290oie.11
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 19:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lbC/xnk+zoIlMr8AR4zX7C8E5HyHt5wuUCG1GuQ26BI=;
 b=hRwaGE62EJNwc8VprIWo2PXefmpSvqiIQ71e1bUZyJmlKFzMCBnlDmvJMTCr053w7Z
 Eq0SMtGmiJocJ/qjUXdNWxaJDGT/SKGCBFQ3I/1sJxQgpkT8wJQ+3s6tJsTq9OH2PQ5e
 rmGgfhGza3n/PNEgW0nbBGZHNH9f95SXLDRWhkKJ+Y0J9a4ouwjE5/762kLRnkbEwfxe
 +eA/xOLBAAdziLo7YsIl3v33kuMgRiCdVF/4ac6PMcB3wnTNC3wseY/E9DIUfp4Hk867
 wBgTPVpRQsuUfO/dwJ1w7Rdfor2DuNzyr+CeyD+ld4g8jwnZnquOdJFr2LgFCIi/aXV2
 ewiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lbC/xnk+zoIlMr8AR4zX7C8E5HyHt5wuUCG1GuQ26BI=;
 b=gHF08hspx3TfG1+abi3faBzx9JPQn5objIqfGsCxrjWAYHOLi/kIPsK57YdBgfEg+0
 lsOmdbgkOn8J9ASvpcVnuiB8hya4sJYJBgjTPL20kerh1y4+yfHTJody/EuJSVDiCStr
 DDl6sqO8n4z87/fB7XqPYgle3hfuY40icybTviB7JPgm0pINdGHXBvr8+xGBLlxWjMLA
 e9N8WPThS/PEYgBtG2PGM4G+XwFx0JtyuJxnzg7x+hd5ZH/EIU5HqD6tN3wSrC/7aUGt
 5nPPIU83MxWqnq3dXo0Tlu6X8Fj5bnlpXKFsG3d4skeA1p0aes0LKK44+WEnZwiUKFj7
 EQ5Q==
X-Gm-Message-State: AOAM530rEUFMjEP4d/VQRRfOiAc9eGq8ZDXrG8xDWPfa67ct6FNo+jxY
 LfYtuVfedM55Gtl0eUIv3F5UkpR3AiQ6eduYyBARkg==
X-Google-Smtp-Source: ABdhPJx3TRX0Gwz1ar78DLMWbgZMau4UKE7Ax6fe96u9FtrMFQJJlyTadKZitcKb3lkK7CwNTVc3hbZeSHmn8RGqg60=
X-Received: by 2002:aca:b50b:: with SMTP id e11mr6080825oif.10.1597197974841; 
 Tue, 11 Aug 2020 19:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200811120205.21805-1-srinivas.kandagatla@linaro.org>
In-Reply-To: <20200811120205.21805-1-srinivas.kandagatla@linaro.org>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 11 Aug 2020 19:06:03 -0700
Message-ID: <CALAqxLUdMpnhHfLDYw-z0QEHdp+UtvdSt-m3+KqMUgcXP+PSNg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: q6afe-dai: mark all widgets registers as
 SND_SOC_NOPM
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Stephan Gerhold <stephan@gerhold.net>, lkml <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
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

On Tue, Aug 11, 2020 at 5:02 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> Looks like the q6afe-dai dapm widget registers are set as "0",
> which is a not correct.
>
> As this registers will be read by ASoC core during startup
> which will throw up errors, Fix this by making the registers
> as SND_SOC_NOPM as these should be never used.
>
> With recent changes to ASoC core, every register read/write
> failures are reported very verbosely. Prior to this fails to reads
> are totally ignored, so we never saw any error messages.
>
> Reported-by: John Stultz <john.stultz@linaro.org>
> Fixes: 24c4cbcfac09 ("ASoC: qdsp6: q6afe: Add q6afe dai driver")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
> Changes since v1:
>         - replaced reg 0 with SND_SOC_NOPM and removed read callback
>

For both patches:
Tested-by: John Stultz <john.stultz@linaro.org>

thanks!
-john
