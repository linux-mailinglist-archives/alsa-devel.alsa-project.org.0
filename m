Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B5D63B681
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 01:21:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 578CC1682;
	Tue, 29 Nov 2022 01:20:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 578CC1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669681276;
	bh=KN4KFRJKc7BwiaEo3YLwbqXlnEJe445Mhn0Kiwjex1k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dv0jJNIOPHQBK+ih1rsyUVIXTjwJwdXkxl7XUp3YHH4zTIhXn8K3RNob7FMbAQ5WV
	 Yi0TnS4Ptz8faCo9HZSrQ4ssoujKXfPDAoErRIRkmpiGGteG5VI7gu+/WGyMeIe7S5
	 Fnhrui+4cn4khyT8WVfH6vx6zGrSYbNMvqYARJ1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3FDBF800B6;
	Tue, 29 Nov 2022 01:20:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50BB2F8020D; Tue, 29 Nov 2022 01:20:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AE5FF800B6
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 01:20:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AE5FF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="YyohEtJ6"
Received: by mail-ej1-x630.google.com with SMTP id b2so13703169eja.7
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 16:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=afOr2fmIQC6dBJfLAFZ1lEeNOcz8tKXWZ8GJTXwEGZg=;
 b=YyohEtJ6qLap4dyHJjxB9q2A69k7/SoCS0qeZMEZLc1ZFBUVRVGlQ33xoNkciPPQ56
 x5DP20xjts37dK6LNApMJpL4S8D49y38crgVO+gt38n7cXyWChhanVz4BFjZkpVFGVP6
 OiwfsSQKDsFq3Bxwfk0h8k9bAO9hOq4Ues8Rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=afOr2fmIQC6dBJfLAFZ1lEeNOcz8tKXWZ8GJTXwEGZg=;
 b=oqENcogM5LYpXDHYj7EaWwkNndfxYxzVuCYu7K8wygk4/uiJWVphaHXUwG7b7gllPt
 x0iTit58npzaQmCu4JnG/a3+LcjB6chUNnJEO2+jxZNySNcG7gx4S2Jb7R1xsgXeqDya
 /oSTaY42o0kgxIX4tCgRVqMhIhPTDLynXKxYVrYcnrVXocxiEqlZlJeKpPjN6Nh9mM/H
 kJ/1yhv+zm98escqxrOGkRuKkTtP/f64Xr9r9pqySPcb42RgyUucBi7AdvJoiMmo/ucO
 XMmT9Y5xSjubdqq0ao1a5KqYmG5LZRQy0iMvmoLKYS/s7rsxapgDOJNnQxyB9Ozp1XTh
 gSAQ==
X-Gm-Message-State: ANoB5pmJbXcz7MmZ1dO3WtxaYjzwCv+on3gR9pDdUml/DImwAoIHs8iX
 DFtttp2XV1UUwg+WbfjZU2ar3TS6oJAjhOWR
X-Google-Smtp-Source: AA0mqf7hsibEd+02MdA2zeh4Ww+cOIItl0lqQ+EKB5SVWYqcEEPN/iGPL/oLXznsTdvmVFeqCms54g==
X-Received: by 2002:a17:906:43d0:b0:78d:a01b:b474 with SMTP id
 j16-20020a17090643d000b0078da01bb474mr32957040ejn.8.1669681208834; 
 Mon, 28 Nov 2022 16:20:08 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 ez15-20020a056402450f00b00463c5c32c6esm5603864edb.89.2022.11.28.16.20.07
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 16:20:08 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso9639041wmo.1
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 16:20:07 -0800 (PST)
X-Received: by 2002:a05:600c:3109:b0:3cf:5731:53db with SMTP id
 g9-20020a05600c310900b003cf573153dbmr43823918wmo.85.1669681207310; Mon, 28
 Nov 2022 16:20:07 -0800 (PST)
MIME-Version: 1.0
References: <20221129001633.v2.1.I8d1993f41f0da1eac0ecba321678ac489f9c0b9b@changeid>
In-Reply-To: <20221129001633.v2.1.I8d1993f41f0da1eac0ecba321678ac489f9c0b9b@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Nov 2022 16:19:55 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W3yB8ZGQ6QmBy7wxRSE4TdqOuM5LzM6wtiF9wtenNyXw@mail.gmail.com>
Message-ID: <CAD=FV=W3yB8ZGQ6QmBy7wxRSE4TdqOuM5LzM6wtiF9wtenNyXw@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: qcom: lpass-sc7180: Delete redundant error log
 from _resume()
To: Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Judy Hsiao <judyhsiao@google.com>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

Hi,

On Mon, Nov 28, 2022 at 4:16 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> sc7180_lpass_dev_resume() logs an error if clk_bulk_prepare_enable()
> fails. The clock framework already generates error logs if anything
> goes wrong, so the logging in _resume() is redundant, drop it.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
> Changes in v2:
> - removed the log in the error path (requested by Doug)
> - updated subject (was "ASoC: qcom: lpass-sc7180: Return 0 instead
>   of 'ret' at the end of _resume()") and commit message
>
>  sound/soc/qcom/lpass-sc7180.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
