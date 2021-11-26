Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E87145E87F
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 08:33:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3A6418F1;
	Fri, 26 Nov 2021 08:32:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3A6418F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637912017;
	bh=H8GxqclEr9GMquFQtjl1gpKJQNY7uiPr2ofl1kPxFr8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OjTvAiDUjoTOeMisXdfY3Eas4d1xJqHi2S57sWVpNj0QwhKVefm6isE7A2yiD7yzQ
	 Mj7kMnbLg/W7ULtiMqySkjCIuVcFuldaF0QJaxKgj5KyitcvgxzoXrf4WOisU8gYDS
	 nvL5c6Y3g7Bo/is7adGDGLkxZ77bpuWI6yeWxqKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6954EF80132;
	Fri, 26 Nov 2021 08:32:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8C58F80212; Fri, 26 Nov 2021 08:32:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PDS_TONAME_EQ_TOLOCAL_SHORT,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22345F80132
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 08:32:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22345F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="QtX6ktAU"
Received: by mail-pf1-x42f.google.com with SMTP id x131so8056684pfc.12
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 23:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=H8GxqclEr9GMquFQtjl1gpKJQNY7uiPr2ofl1kPxFr8=;
 b=QtX6ktAUTquUbbu/XOyp6jWTVUuSqaNmzTULmqMDfikHAyzqP43gXs0Qiz1+xV1n5X
 ATR9ww7pCysgtrScPJ5/Radq/UKWOxeSOCqA5xNWv/pfGK0sWy0240aVhQUz+upUtD6h
 TATUZrwUNl5/CT3FynWVOWc4prfhgF/8h7WYLdSF6JXRC278QmPNvQrCaJCt4YaQ36JP
 oxjoieXS4Q2tmI3P0nscYNJmSnbKa42ojl9Maut8hucqEZ48Mag6E/RfYcNR3BvnxCtY
 S2eIDcm+I0gHyZoewwhRyDJ89GH+wM69nzAZfg3BoZOxY7Efle4lLQW+aCpm0tqcwCJZ
 ITYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H8GxqclEr9GMquFQtjl1gpKJQNY7uiPr2ofl1kPxFr8=;
 b=xUFRn9MLkMHjqSc3ktOYEoRmzF3qit9diPUIa0V4tdW3PnEoUyW7FJJSOkv260KJ/U
 iVQZ9FjPo4iajM274fs3XGdEb6qgmVdPZiLnWgelZhTZ9EUl2cm4OU396x4CLHNyZsN7
 3h79xGMHSkDGzpdpp0V5g2dSQ8y99/wMkaMS0ZY3DzlZgr29OHdHqkkliog7wMiW6wNh
 2eHlxvEyePHBlFn5YKhwpBVoHVj2/4/aVGtBofdgnD/+lQa3btbYwfoGcDbXaZ2uUy0X
 G169hyxQ0Lx+R8K5dwD3PfbgF8gNTAeh1KQhlcddsmZHtIwS3PxDflqoNtFZinyZKrDy
 BQaA==
X-Gm-Message-State: AOAM530XI/rebRUhVHyjwM1JhKExl3Rg8jUIooUdYMFyhJ/CfpB9bgI5
 u3htkTdGGyg+lvnlBGe/2BabGA==
X-Google-Smtp-Source: ABdhPJxcei67hA/Fni82mRFZEub3sKfv3jtMYS4/HzkNPETjajfDoqXCgeZufPfpR7ZM3kGXnFC6sw==
X-Received: by 2002:a63:5526:: with SMTP id j38mr8662880pgb.86.1637911925535; 
 Thu, 25 Nov 2021 23:32:05 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:5eda:d984:1426:91ca])
 by smtp.gmail.com with ESMTPSA id mv22sm4638283pjb.36.2021.11.25.23.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 23:32:05 -0800 (PST)
Date: Fri, 26 Nov 2021 15:32:01 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH v5 2/3] firmware: mediatek: add adsp ipc protocol interface
Message-ID: <YaCNcVjyems1lCX8@google.com>
References: <20211126071432.21990-1-allen-kh.cheng@mediatek.com>
 <20211126071432.21990-3-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126071432.21990-3-allen-kh.cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, cujomalainey@google.com,
 Daniel Baluta <daniel.baluta@nxp.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, sound-open-firmware@alsa-project.org
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

On Fri, Nov 26, 2021 at 03:14:31PM +0800, allen-kh.cheng wrote:
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
