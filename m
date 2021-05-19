Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 581E93891BD
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 16:45:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0280E167F;
	Wed, 19 May 2021 16:44:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0280E167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621435517;
	bh=T61/GAEE2QKvoMmWOiIvNqj0c9/dnnDv9q5OBssRO3g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PvMimzKTBcxC6+2sAPrFbMVTPn9pTnq6AcvWXufTNrqnvHVV7fui+5HWSOz5GhIdq
	 BOGV45OVgzoal2LarWLM5cUoY53X9IiPkgTFJzZjnRIH1MfN+BIqCgXigtoIvfKrbq
	 dBtqRs9GktVWpgQCutXeMTIQqVY0IGjMLKXTvbR4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5606EF80127;
	Wed, 19 May 2021 16:43:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E238AF8016E; Wed, 19 May 2021 16:43:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC14CF80127
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 16:43:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC14CF80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="EkdGxM5P"
Received: by mail-wr1-x431.google.com with SMTP id a4so14342755wrr.2
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 07:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=p9EzsKAwUEoWbxJga9Lc6V9Q/wXt9Eycw+vzbvGAMdo=;
 b=EkdGxM5Pu3lbgQzfC56Fxhi2JbPsOcmQcuF8T92AcJ4NzUvMURNp9i1AferWBTSeA/
 W7nLFIFkLTAtXydfa6o1/UskE+iY3YFthjjdV9MTd16WlCBGsog4nmJDLCrk234WNB1i
 Tj8BfMRwSutc6p25S/vgIdk49Tlv69StEU2eSKFtAAwJl4L5IhJw7FqffWUNHmDxeIJT
 NrRPGa2OO7rfvqUEWc7Yg04FsaQmrr4dtCg4yE7Y1LfyFB8mapLrLyWpf7tjKuBLxuES
 QdKv4Ak2PUj2CuaC5IMMkNlojjGQsjd6eWKK1Pgkn98WJFjIOfwtxCJ+KPRKfYwdABbE
 d0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=p9EzsKAwUEoWbxJga9Lc6V9Q/wXt9Eycw+vzbvGAMdo=;
 b=Sjm6uwle1kFTb8H3T3pX0SscQD0nFJ1N15KQkUr1+N9//4Pew5YpU6/YkMpWhssPPr
 5VkKeTruWaOqaX3cV/m4P0/OqAmehrUeMygj+/rEStWdHVNoy5/Mwe5o07eDsvRUe+55
 e79tth/amqafBtepfCNp68d3Mkdw2VR2JkRuQFYXpVCNhGuwmAKZfuJBTGZVDim0o9hI
 qxqmQhV5hBBgXMJ7Hdj48LPU6+qrm8QprYaf6A5GU0b69MOIRtM9oHP7I2gCrvDFyLvN
 wVryWL93nnokxD4aR/UDU9wicdh7mWLQkk7U+y70FYBGCYwmhGgmaf01wJLFtcIAt3RL
 K3cg==
X-Gm-Message-State: AOAM533gzjT62vjv84+ejhSXKkYwqDQUDrhStKvxAdRsacT4R1L43TA5
 aZJY1gmkKdOtrY5NNSDRSyJYNQ==
X-Google-Smtp-Source: ABdhPJwl7zf40CNgtL10qhlSTYIJ8i5odorihCGBLzABsn6bKmjH9uVFMLJbhvO58dxj0gKoIK/PIw==
X-Received: by 2002:adf:df8d:: with SMTP id z13mr14922689wrl.267.1621435410817; 
 Wed, 19 May 2021 07:43:30 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id w25sm21015609wmk.25.2021.05.19.07.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 07:43:30 -0700 (PDT)
Date: Wed, 19 May 2021 15:43:28 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 05/10] docs: update pin-control.rst references
Message-ID: <20210519144328.GA2549456@dell>
References: <cover.1621413933.git.mchehab+huawei@kernel.org>
 <46ac2e918c7c4a4b701d54870f167b78466ec578.1621413933.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46ac2e918c7c4a4b701d54870f167b78466ec578.1621413933.git.mchehab+huawei@kernel.org>
Cc: alsa-devel@alsa-project.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Saravana Kannan <saravanak@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Drew Fustini <drew@beagleboard.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-gpio@vger.kernel.org,
 patches@opensource.cirrus.com, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

On Wed, 19 May 2021, Mauro Carvalho Chehab wrote:

> Changeset 5513b411ea5b ("Documentation: rename pinctl to pin-control")
> renamed: Documentation/driver-api/pinctl.rst
> to: Documentation/driver-api/pin-control.rst.
> 
> Update the cross-references accordingly.
> 
> Fixes: 5513b411ea5b ("Documentation: rename pinctl to pin-control")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  include/linux/device.h                  | 2 +-

>  include/linux/mfd/madera/pdata.h        | 2 +-

Acked-by: Lee Jones <lee.jones@linaro.org>

>  include/linux/pinctrl/pinconf-generic.h | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
