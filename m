Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C03A30B54D
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 03:36:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE5BB1710;
	Tue,  2 Feb 2021 03:35:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE5BB1710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612233373;
	bh=sjpJNs0J12vp1IhfE1UDS+GBxWHaPxs/MJ4w9Q0NI04=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bgyYGPKyGP5TQitfOus7e9isIPwN/bElAyli0CDU/bxTlQgGv7z2eO8+iWmPeHYQW
	 LUSyXHglLYG/lebi+DtMQc3eQheN1OtOxUj6HJ364X5gvZCx2jfekaEm0T53/OVgCu
	 +rdX/iAsZfazyP+M2QkccLCBzymA1ePpzvm3DoPk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E324F80155;
	Tue,  2 Feb 2021 03:34:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2ADCAF80154; Tue,  2 Feb 2021 03:34:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE072F800E9
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 03:34:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE072F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JvYNweR+"
Received: by mail-qt1-x831.google.com with SMTP id t14so13938234qto.8
 for <alsa-devel@alsa-project.org>; Mon, 01 Feb 2021 18:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sjpJNs0J12vp1IhfE1UDS+GBxWHaPxs/MJ4w9Q0NI04=;
 b=JvYNweR+f9nFJL+a49zw+w4LD5s+2syVVDuDOHSRvHkCHLFGIMyYDWbWkf5fbjU2CO
 wsls7x8LXSclZD+BZvmtobTH1BqmGUi02ejI7YhnV0jzjab/WhL2Wc+46Ia9ErE3hcGm
 h5DSgwfoPk5/9z4d8cxR10/1pnkrNVMzFwWJYl89cd6SzB4Xo82Q75u4PRoTavfDgQer
 16MJPawwfwF7XrmzeUghiNv+55Mf7pxjxvMyo3gDGPbrny0dU03ARtxudtzPRooYuY6B
 +lFE6zioMVtYH9ceA89q2cuDcIUQJVuzDaKHeE8ILjAxQoIQODLZh80gOJWZoj/tDqjl
 +6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sjpJNs0J12vp1IhfE1UDS+GBxWHaPxs/MJ4w9Q0NI04=;
 b=W4n7HAP3RwONxNsfSuXENmpwNprRmzfOSlw1cDo0eQUjtcIPb/qHqiTRnhSb/GPdxX
 9XQqRnbP5AXX8Y5IJActd2Ac86CMLly36ci+cpdaeOs9bD56ZH+jrLWrhUQx0Viokb/O
 AfupZYMAsDwVDCIgv219hwD+2nNm3OHllAV1Lb/HZE4TDlDS3j/flQOQZOQIjfdB7b9i
 ArPfDwAIYyRB3e2KOZYBwmajgWpLBZRu9z3uMyqBSsV+Nh58FP4jyBpcp/ipKJHEm1aN
 +mQkCJPMRJBn6+LV6G3vbUoP/Ygji0xh6LPbsN6xI5TeNFNrFYVtpm7EIpB9hreH/WZ5
 H57A==
X-Gm-Message-State: AOAM5319MQHxFuW1FacloZomKaO26KfrNGJExqSawbzJDUUDxHJyixxt
 gpdidCh0vNgxjlWIMmSN/KwJ3RFlCWwJbVpdL6M=
X-Google-Smtp-Source: ABdhPJyefunSNBjc33jM0hiZCz2tsvHkqwoJ3p0w2/HJkrB9lJcKW/qY+D7/0W5nvugdLhtFGClyj3y0HT/DvJN4uz4=
X-Received: by 2002:ac8:b0e:: with SMTP id e14mr17833369qti.360.1612233269172; 
 Mon, 01 Feb 2021 18:34:29 -0800 (PST)
MIME-Version: 1.0
References: <20210128112714.16324-1-tangbin@cmss.chinamobile.com>
In-Reply-To: <20210128112714.16324-1-tangbin@cmss.chinamobile.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 2 Feb 2021 10:34:17 +0800
Message-ID: <CAA+D8AN-E7HDHLOO_rnu3spwNS5GczPDMAsM+A3J66Zfhd6G-Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: Utilize the defined parameter to clear
 code
To: Tang Bin <tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
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

On Thu, Jan 28, 2021 at 7:28 PM Tang Bin <tangbin@cmss.chinamobile.com> wrote:
>
> Utilize the defined parameter 'dev' to make the code cleaner.
>
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>
