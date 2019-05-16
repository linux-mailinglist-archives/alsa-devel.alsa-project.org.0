Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A9F207D0
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 15:16:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7769916EC;
	Thu, 16 May 2019 15:15:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7769916EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558012604;
	bh=AmwS/GjpyFzzmDvaSR5Gv/4RJsKQMnpL2M14bK+G4fM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RxtOnehNZxWI6foKk5YJdpsj5bMbeQazpQNj7mNcPtsLRVMA9XNESKFlSuo2yJ7Jz
	 IUQXoJPSa45GFO5FJeBwzGoNY8hFik4+bVZW4Vs36HvGfzk4H0BOCyNsdLKcC3MDS3
	 vjN8y+4N9w5DPqPs5LJIewtMPVXr7PsrNdxmx+BQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B061CF896B6;
	Thu, 16 May 2019 15:14:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F17ADF896B6; Thu, 16 May 2019 15:14:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40322F806E7
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 15:14:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40322F806E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="I415BZmh"
Received: by mail-lf1-x141.google.com with SMTP id l26so2566890lfh.13
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 06:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wh5JaYv97X/uxknn0B2RmMHAkSC5NRyR1TNumSEOFis=;
 b=I415BZmhf8ErYu3yvbYjy/r5AJlIKN4Zsw34Q91GVCUq+LibJECyU4xCsyIFCWH7Pb
 9rKrArLag217pZqhkK2gJLZcJ7mj29nV3BHLann1ycLke6SDAVlxkbR0MhRmyozqQoxO
 SasoVZLxpMlKIfabbsEiuVqgg3HK+CoD8d+OH8FtnVFE/OcYEKQqhMKyg1HDiyLmANji
 no8RPcfdGa/udJCAL7LopqbrttHHwcPwLf3wAZF2bDv3l5qusJFcuYTH/rkz1ACvcK9k
 VYgYa+s/ob6mmXfei6WPEHCsmYS7vlnbjHd4nAGSMMMkIsuApTY4eGb0Vc0w+kJno7/0
 sk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wh5JaYv97X/uxknn0B2RmMHAkSC5NRyR1TNumSEOFis=;
 b=Gri2LgdyfWm+TXWhWTc+f+WH/WTs1z+/EwOSMnghWl1t7RQgPDzXUTagie3IPjlnKw
 o2Y44uwfy685pnywrz+JfaPnZOIo05FcnI6lfU/3EEoOJa+L5PKdG5f8Yql7Du+IfQ4B
 CStlD1ZEckwd6GYsX6tyNWY0cdh9QKK7uVz9EIIp9EQ9at7rxZpWg2pNw9fO0ophpvsU
 S8gpLYCpFb62D4plMFB6PwLkwb/L8hHENSPKp7+PzycmSJJoKom4ezVSfA/AKriB19pR
 mxkO8KB/SgIYr0WtlpGFJ+XqGvq17c5pDeiwuTiDpJYH6QRMxUVaVs5ymC7+PuOGuwrL
 IeJQ==
X-Gm-Message-State: APjAAAX9lEnMJrBnCKqzyRN7Uoe57lysvmcfS2V1eeAn0JZWJdMbrnGz
 3X1iijND8RE+j9rdj+lXTjZ25mvA4g2hfdmkKeQ0NvZ/
X-Google-Smtp-Source: APXvYqxibpkmvr9pzW4mz+JKT7FFzpG9qkto6qjNjzt2jCqDdp/keibIZZlQFh/E5zE0FY7vNCJeXLrsf8rQZ1eqpAA=
X-Received: by 2002:a05:6512:6c:: with SMTP id
 i12mr5428680lfo.130.1558012493028; 
 Thu, 16 May 2019 06:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <1558011640-7864-1-git-send-email-viorel.suman@nxp.com>
In-Reply-To: <1558011640-7864-1-git-send-email-viorel.suman@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 16 May 2019 10:14:42 -0300
Message-ID: <CAOMZO5C1jm=7tiui221B-N+ptEknK_ZdHvrjvSHfvQ=W-K54Qw@mail.gmail.com>
To: Viorel Suman <viorel.suman@nxp.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "S.j. Wang" <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Viorel Suman <viorel.suman@gmail.com>,
 Julia Lawall <Julia.Lawall@lip6.fr>, Mark Brown <broonie@kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>, Colin Ian King <colin.king@canonical.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: AK4458: add regulator for ak4458
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, May 16, 2019 at 10:02 AM Viorel Suman <viorel.suman@nxp.com> wrote:

> +       for (i = 0; i < ARRAY_SIZE(ak4458->supplies); i++)
> +               ak4458->supplies[i].supply = ak4458_supply_names[i];
> +
> +       ret = devm_regulator_bulk_get(ak4458->dev, ARRAY_SIZE(ak4458->supplies),
> +                                     ak4458->supplies);
> +       if (ret != 0) {
> +               dev_err(ak4458->dev, "Failed to request supplies: %d\n", ret);
> +               return ret;

This would break existing users that do not pass the regulators in device tree.

Ok, in this case there is no ak4458 user in any dts, so that would not
be an issue.

Please update the dt-bindings with the regulator entries.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
