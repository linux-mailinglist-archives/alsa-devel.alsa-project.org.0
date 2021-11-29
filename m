Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9CA460F32
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 08:12:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D600A17D2;
	Mon, 29 Nov 2021 08:11:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D600A17D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638169926;
	bh=oBWAyX/N5ClWH+Hv4H7SdDuyEXFOxtCACXVvIvfl1yE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M1Rk9nXZPNyQ7H9D0yqxJZ+iNHAFzGCDQKBy+qEMSUEHfPKI6V0ijd0VglaheUXGs
	 jRfk7zUHpSmzAfTyf8sFjwnhdYTrvzLw4WNE2P2SsATnaKLRY+CVYALQnwRLVVwv08
	 9BfbiMLTxD1x4ymDXQq9DLid9f1nTPjew4Jxsdj8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46179F800EE;
	Mon, 29 Nov 2021 08:10:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D552CF80246; Mon, 29 Nov 2021 08:10:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PDS_TONAME_EQ_TOLOCAL_SHORT,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E5C5F8020D
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 08:10:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E5C5F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="c1szrkhy"
Received: by mail-pf1-x436.google.com with SMTP id n26so15914828pff.3
 for <alsa-devel@alsa-project.org>; Sun, 28 Nov 2021 23:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dTA5ud3pcmUbZ1xE5uOmnFByKDozJrEPV4w4Qk6rIvw=;
 b=c1szrkhypZONQzYZOGrUNlRloRrcF2L0VerJ4UPxjPi2TuZhUKU0jgr/gTlUbZLM6c
 jj1gAFppSlboqFQ6+mIaTw1C9376FU/VOqDtPJ50/9EWgqNnAXsp0eDXry4yKsXcH1TZ
 9KJQ6GKQt+yHZofLWWLw6uVdaUO8Qv26YIaFMmW6GQBEEOrkbW0DukC+6YdjFsxHARuN
 RyfVn5RgaAkFf4SgpGj6zpvBVq/oSvNKP7To1F+ATRbrlPnqqrubhSN9F5wuOg2qqTFw
 PxwaOf9jYFmE3jJqq+b9jm8fo1ZPo/PeHVKX0yb5fNZ6ZdHtWp6rxnMdA6KYON8KQxxZ
 NZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dTA5ud3pcmUbZ1xE5uOmnFByKDozJrEPV4w4Qk6rIvw=;
 b=jkcDeJGHrUvEErCmFym5kpb7bQ7nzxTvJZbuJpl/M0eH2JiM21iD04Y+CEko+B4tCO
 Duew3zTBwya958DscyVB5yz74Bt6/POyXU/MG8Jrudl3aYP5YdgajGZvYOtfg5o5ZGK7
 gZwgptNuDz3ptEon9STV4tVwvU5wTk+Z19pabY08KMPLq2/g2aX2DR0lFXtmFXwwcBFC
 ChtIIQz+VDFaHwp9xhkBmqJR2VkiUXiMXq6SxV7+14/uVLLtKcO7iqVNWGpXHyWgL8KX
 7/kIkSDS/UIt6ETnsWnoHU2sS1/6OeQbsxBkAnEhDgK8iMDL1Q7SsyjmjXcOmhfX87rS
 tcyA==
X-Gm-Message-State: AOAM533200Xn7dRA8GzCjZlNaVmdxRhEXyQpXOvG95o5NTZB0EHXwrCc
 dlY/UGy9nyWGMA/uMoPGYGuUxXh+dtgpRQ==
X-Google-Smtp-Source: ABdhPJxDS9wOvoMttiFLB+55g1aIXEZkM+ZkIlmj4P2bMLUD9Qy8/ZRtRHZfFtAfS5ZDY4pH6Ds84w==
X-Received: by 2002:a63:448:: with SMTP id 69mr9522548pge.141.1638169834496;
 Sun, 28 Nov 2021 23:10:34 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:3807:fdf3:5573:47d6])
 by smtp.gmail.com with ESMTPSA id ip5sm7216948pjb.5.2021.11.28.23.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 23:10:34 -0800 (PST)
Date: Mon, 29 Nov 2021 15:10:29 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: mediatek: add adsp-mbox document
Message-ID: <YaR85TUlOBcMuG2a@google.com>
References: <20211129063954.1616-1-allen-kh.cheng@mediatek.com>
 <20211129063954.1616-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211129063954.1616-2-allen-kh.cheng@mediatek.com>
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

On Mon, Nov 29, 2021 at 02:39:52PM +0800, allen-kh.cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> This patch adds document for mediatek adsp mbox
> 
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> Reviewed-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

Neither AngeloGioacchino Del Regno nor myself provided the R-b tags for the patch.  Please remove them.
