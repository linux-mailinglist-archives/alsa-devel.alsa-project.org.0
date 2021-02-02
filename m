Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EA530C72A
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 18:15:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A1B0174F;
	Tue,  2 Feb 2021 18:14:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A1B0174F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612286137;
	bh=R9+VZ08mb33ZsTxVzQHNgGkTJo5Su5clNDxSbYpH3ag=;
	h=In-Reply-To:References:Subject:From:To:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X1XYpgN4dzh+eGvYZlkQMo/Aa/ljXD15ZY1LypWzDNO9xm816c78yBjgpdcEa2b5q
	 yXYwQAVsRxSZ788YTWVShd4DS3xSd0H1JchfOg1PxB9aMZDoA+pomZrqhRipCK4dO5
	 WJdUCJ9CegrAIm8qP6BbjBjq+7gy53Z9c9HiHjuQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3501AF801F7;
	Tue,  2 Feb 2021 18:14:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99C73F80171; Tue,  2 Feb 2021 18:14:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73A48F800E1
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 18:13:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73A48F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="diRSFPRy"
Received: by mail-pl1-x635.google.com with SMTP id x9so6934921plb.5
 for <alsa-devel@alsa-project.org>; Tue, 02 Feb 2021 09:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=R9+VZ08mb33ZsTxVzQHNgGkTJo5Su5clNDxSbYpH3ag=;
 b=diRSFPRygD49Poc/JZ4AusskfpBz3SaZRrJbDOY2fzcR5LXqQZkKd93tiH5mFnVm+c
 l1os581Ds05eO63iyR7OnzGQMv2TCaYRXhmgGXRHMgUlySvwd30gJYp/5SmK4zxMQ/r3
 vIwgooy/K8jXDGjVec6xdrGb/eVPIVdbTEm8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=R9+VZ08mb33ZsTxVzQHNgGkTJo5Su5clNDxSbYpH3ag=;
 b=S80CQtXirLMX93zwfXy3PqNia0zIpg+OtB9igNf0k9ZYm7jaYVh1HRCZPk5mkdX3DX
 76cuDwzIpTbPH3CXvioYMg4oD0p9rs6LJxsokvx0qIUgEftRjpNY4hDXzAwOmLIInGWA
 Ca4CLORMYjX+xM1uCIbK3ir61maRjY8PRGXiYCwJbUDthaj+XnSou6LoCOdO2qmDn4Gt
 i4w8tynY5A4CzfS8NQFoYCpTvcN352vrUQn1xmr/ie5kIk04yWebUyjNTW9JcbdNyHvu
 Gse+AEtaXfKa4Natsy4mtoZax5jwI0650I7iKI6Ht0okHiV6W5PWPRoD4m7g0LeFvRUS
 lJig==
X-Gm-Message-State: AOAM5321fSOcCl74+HWdQhi1chcAhGmE+s8ntWL8uuoZs7+VPZLyhhz8
 2lXU+hGMVvaD4HHWO3wYz8oQyw==
X-Google-Smtp-Source: ABdhPJxEYEQvyqydvkJ+XYVfnYzEhjQ5pqGLkN0GNmAahlnaTN7GjhaapXRizG0V3QW8Ky6mrCbAVQ==
X-Received: by 2002:a17:902:d4d0:b029:df:d246:ca81 with SMTP id
 o16-20020a170902d4d0b02900dfd246ca81mr23826450plg.58.1612286029370; 
 Tue, 02 Feb 2021 09:13:49 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3571:bd6e:ee19:b59f])
 by smtp.gmail.com with ESMTPSA id c17sm21839493pfi.88.2021.02.02.09.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 09:13:48 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210202062727.22469-1-srivasam@codeaurora.org>
References: <20210202062727.22469-1-srivasam@codeaurora.org>
Subject: Re: [PATCH] ASoC: qcom: Fix typo error in HDMI regmap config callbacks
From: Stephen Boyd <swboyd@chromium.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org,
 lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, perex@perex.cz, plai@codeaurora.org,
 robh+dt@kernel.org, rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
 tiwai@suse.com
Date: Tue, 02 Feb 2021 09:13:47 -0800
Message-ID: <161228602729.76967.7642340787963440028@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
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

Quoting Srinivasa Rao Mandadapu (2021-02-01 22:27:27)
> Had a typo in lpass platform driver that resulted in crash
> during suspend/resume with an HDMI dongle connected.
>=20
> The regmap read/write/volatile regesters validation callbacks in lpass-cpu
> were using MI2S rdma_channels count instead of hdmi_rdma_channels.
>=20
> This typo error causing to read registers from the regmap beyond the leng=
th
> of the mapping created by ioremap().
>=20
> This fix avoids the need for reducing number hdmi_rdma_channels,
> which is done in
> commit 7dfe20ee92f6 ("ASoC: qcom: Fix number of HDMI RDMA channels on sc7=
180").
> So reverting the same.
>=20
> Fixes: 7cb37b7bd0d3c ("ASoC: qcom: Add support for lpass hdmi driver")
>=20
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>
