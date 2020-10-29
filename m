Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CB029EE52
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 15:32:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5430A15DC;
	Thu, 29 Oct 2020 15:32:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5430A15DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603981978;
	bh=STsrrLsMXYXRLSgMoer9dh39AJVITKE1vAZmfbJE1+c=;
	h=From:Date:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F4y7bbX8bfpbnODdLyGrmXLQe/Dy8+BPiFqitD++vEPpH9YIdKxOLBE05aolKTy8/
	 q5c/alKOCBlmncxOHy6sJ+I5pucAI0ZBZyDvkYB2IMxsTOKTkF0uwWkswzuNSa+k9F
	 OZbIz1K2zFVL1Tw8ztvQljJSU5NU9z4LSRoPbnTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98428F800D8;
	Thu, 29 Oct 2020 15:31:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86224F8020D; Thu, 29 Oct 2020 15:31:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0E5EF800FF
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 15:31:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0E5EF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EN2kcQVa"
Received: by mail-pf1-x443.google.com with SMTP id 10so2485430pfp.5
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 07:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wLslsAi2G28LH9YJ0zfY79HW10N4bzzwRkzXCVZRDwY=;
 b=EN2kcQVa32mEd/K4hOG8By0UDzPzo+BftuvRI8L1lXA7v0f6Btzj8FmrVO4rRyiMnK
 o3v+rD6VTjsm40RtPPixW0a84KVo4k5qIs+5/TpNBLdhvrMF2NiO5KVnWk5rD3hGhxXe
 9ehk+yumZOOzJ/acHlyz8JZhgsLBgNAZWIWUjQM6EyEK1eZidelPFpddHofdrvsX7FdI
 WRam8PpMVC+lBGXVptAk2oQ9PCVTCm74PotHP+/0BDKlsWxwilH2qDcrrhVbY0b+ctBM
 FktMFpMxgQqIyP7S4uCM3UUfhSv32Yjc6UI+uDTnnivwEAXL8+O4exIuHTxhkRll/cdq
 7W9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wLslsAi2G28LH9YJ0zfY79HW10N4bzzwRkzXCVZRDwY=;
 b=jYzfp3DtLs+J5xJ5ToxPxvVCUgRqYcEuC7WImUL/D++odiOhGiE/O7qPqp5MnIXbKs
 c3Q0dc41zP5YlEW2Tr80AbN4MzsU/xbQ/uXT0Hk6AbCSvQDlW9v1bkFQOJKfHh0gIaSn
 fg4VCBf8E8g4gNecdLFdKptAGseTB3tXuxrJ5FLhlh8uf8pBXatsBr5X4bkiEQ2tfgtj
 I1FBPxj2Fo19eo3nWANs1oBA7Vtnk1moWDAv9p6ZaGuNRrNiCeNx5E760U76YS4ad9uX
 Wnbv27wn0iAteZaKrLyF3ZF9odmxq/W3BUDYR4QOGI1CvUSvwpEPhsrDBeAe9S89PM9a
 +LZw==
X-Gm-Message-State: AOAM531z47qOIwQbaE8BYdjNq5bNEeXbuiqkNBaZceQnTWrnBVBuhL3b
 SR19g0uGVLb2QjugJkyXSMs=
X-Google-Smtp-Source: ABdhPJy0sr40Jhllz/XQxRR+IEcDDKRuW5TxBqDWR9ZWN1OmyVVdN4IBmHlTPx+KqBxsvCtsYSKtYw==
X-Received: by 2002:a65:62ca:: with SMTP id m10mr4245650pgv.407.1603981876521; 
 Thu, 29 Oct 2020 07:31:16 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id b3sm3047003pfd.66.2020.10.29.07.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 07:31:16 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Thu, 29 Oct 2020 22:23:25 +0800
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 04/25] ASoC: rockchip: remove unnecessary CONFIG_PM_SLEEP
Message-ID: <20201029142325.mhq6azowlyuurhtl@Rk>
References: <20201029074301.226644-1-coiby.xu@gmail.com>
 <20201029074301.226644-4-coiby.xu@gmail.com>
 <8589f68f-fa6b-d75e-d7be-fbb354adbde0@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <8589f68f-fa6b-d75e-d7be-fbb354adbde0@arm.com>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Heiko Stuebner <heiko@sntech.de>,
 open list <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 Mark Brown <broonie@kernel.org>, "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>
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

On Thu, Oct 29, 2020 at 10:33:52AM +0000, Robin Murphy wrote:
>On 2020-10-29 07:42, Coiby Xu wrote:
>>SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.
>
>I don't see anything in the !CONFIG_PM_CONFIG side of
>SET_SYSTEM_SLEEP_PM_OPS() that prevents unused function warnings for
>the callbacks - does this change depend on some other patch or is it
>just wrong?
>
Thank you for the feedback! I'll add "__maybe_unused" in v2.

>Robin.
>
>>Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>>---
>>  sound/soc/rockchip/rockchip_pdm.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>>diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
>>index 5adb293d0435..f3c19310aeeb 100644
>>--- a/sound/soc/rockchip/rockchip_pdm.c
>>+++ b/sound/soc/rockchip/rockchip_pdm.c
>>@@ -574,7 +574,6 @@ static int rockchip_pdm_remove(struct platform_device *pdev)
>>  	return 0;
>>  }
>>-#ifdef CONFIG_PM_SLEEP
>>  static int rockchip_pdm_suspend(struct device *dev)
>>  {
>>  	struct rk_pdm_dev *pdm = dev_get_drvdata(dev);
>>@@ -601,7 +600,6 @@ static int rockchip_pdm_resume(struct device *dev)
>>  	return ret;
>>  }
>>-#endif
>>  static const struct dev_pm_ops rockchip_pdm_pm_ops = {
>>  	SET_RUNTIME_PM_OPS(rockchip_pdm_runtime_suspend,
>>

--
Best regards,
Coiby
