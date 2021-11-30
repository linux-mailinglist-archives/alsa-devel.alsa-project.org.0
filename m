Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB42462EBB
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 09:44:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 484ED18D3;
	Tue, 30 Nov 2021 09:43:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 484ED18D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638261880;
	bh=/b8XGKIL7n77Pz8OOu+vmYLYY+1+owzqkRsNYEJPpko=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pFH2WQ53ArNApigSTVubdm4uRa7QoyQh8LVQge+WUxkEWJN+KiVReVzarnzeRL4/5
	 zDQG3tCVWaS/K/hgfW1IPnNsMLuADb2xSjLXRQJsWnF6rsuUSRPR1b9CmFAfxu5Coz
	 loAJTZSHLAug5RDZ3t+j2BDj3tmQjd3q4kUKYHg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F08AF8028D;
	Tue, 30 Nov 2021 09:43:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3697F800EE; Tue, 30 Nov 2021 09:43:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B185BF800EE
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 09:43:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B185BF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="dkAqbyqT"
Received: by mail-pj1-x1036.google.com with SMTP id
 n15-20020a17090a160f00b001a75089daa3so17738524pja.1
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 00:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fHVy98BTaUQF52BWKLZtuQVRzz01N8+H95C8cB4Mhtg=;
 b=dkAqbyqTPRY4L/DB0uLdYdRPU6b1N+TybDCY0FHBvSZn/2S8Ae0v0tdFZwYj7zBLDi
 8QqrjFuNnxaIPD8BAr2rJhpwB2cDkqWynWjh0Ac4qLo6dTsE54UqsPiCOX+RddtIHAO2
 8JBLdxXwcjC/F/oqOtekIMDpqcxK4ymeEg2t/OKu6eb2DQDHJUzH+N2n7plAhq184vX+
 3ilr42mjOAMqMwT+OGrhYyComtrMz2+AeX0KPKFk06V5xiL+cTmcyS3TObk+6xDdalRD
 5Gaot3pJL+djNMmQ9F1IXX3Sxk97PgB1c7iou+/rl9Rq5op0ena4PcLEXQYlr5biumJp
 qtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fHVy98BTaUQF52BWKLZtuQVRzz01N8+H95C8cB4Mhtg=;
 b=RHNMOle0txS1qWHniiMqgudcvj3bOZOPelpv+kLtAF9B9CuiFHRLBUwaGFoDQviUey
 X7TWgPR3rU8ZFBN2c4IyzNkyd+nlKAqozgs98owLZfqW2xu+LnTgqY5yrmYg/cKGhWsS
 AgPV9WbwylZSuSUflKUKTmpePm3Pic+gTk/aczEMVmMVH6+NTIkN8TEWAepfnhuIAg6C
 YTRYpYCKlxQM8zkgFOwfdvbUs/zpi+SRTDQd56brkQOFGnlVsh+f90v6ycfAOiwno1Uj
 Cf6j47pljdwIS4EgDRBj+ZgRhqpZBZBZPG5JqaS9qZKMEuYES4RcrCsKhb11/YckkDRp
 432w==
X-Gm-Message-State: AOAM533+t71QLGSZZRvF2HZem58kGNdL51dAdxy9k4aZJ6OvVFwi7v7f
 johmJ68hJfR5PDuLe+9TmNzJkw==
X-Google-Smtp-Source: ABdhPJxue2FBF6O8NbPbziRrwGNOciaOEZ/z8FnZ1b/zhjeFgaTTmvLKkjb9rz4cIuDD9UU5GWKBaQ==
X-Received: by 2002:a17:903:24d:b0:143:beb5:b6b1 with SMTP id
 j13-20020a170903024d00b00143beb5b6b1mr66622707plh.54.1638261792852; 
 Tue, 30 Nov 2021 00:43:12 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:6cb4:a0cc:6d7f:cba7])
 by smtp.gmail.com with ESMTPSA id v10sm20770644pfu.123.2021.11.30.00.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 00:43:12 -0800 (PST)
Date: Tue, 30 Nov 2021 16:43:07 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH v8 3/3] mailbox: mediatek: add support for adsp mailbox
 controller
Message-ID: <YaXkGym5QQDBSfcP@google.com>
References: <20211129101946.6008-1-allen-kh.cheng@mediatek.com>
 <20211129101946.6008-4-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211129101946.6008-4-allen-kh.cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, cujomalainey@google.com,
 linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

On Mon, Nov 29, 2021 at 06:19:45PM +0800, allen-kh.cheng wrote:
> diff --git a/drivers/mailbox/mtk-adsp-mailbox.c b/drivers/mailbox/mtk-adsp-mailbox.c
[...]
> +static int mtk_adsp_mbox_probe(struct platform_device *pdev)
> +{
[...]
> +	mbox->dev = dev;
> +	mbox->ops = &mtk_adsp_mbox_chan_ops;
> +	mbox->txdone_irq = false;
> +	mbox->txdone_poll = true;
> +	mbox->of_xlate = mtk_adsp_mbox_xlate;
> +	mbox->num_chans = 1;
> +	mbox->chans = devm_kzalloc(mbox->dev, sizeof(*mbox->chans), GFP_KERNEL);

I have commented in the v3[1].  To be neat, I prefer to use "dev" instead of "mbox->dev".  If you ever have the chance to respin the series, please fix it.

[1]: https://patchwork.kernel.org/project/linux-mediatek/patch/20211124084514.28002-3-allen-kh.cheng@mediatek.com/#24614933
