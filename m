Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 830AC68C7E3
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 21:47:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C948A1E2;
	Mon,  6 Feb 2023 21:46:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C948A1E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675716422;
	bh=ye0+OHfi6SqlBLulhv/8PkzHvZ5vR2zMLartivUuZxQ=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ANETTMnsvVzkeeV6uwSmag1syPCS5DGektC+MIFsxCSqCL5Qm5y6YC+Z1gB404klW
	 H68q1NS29430gWQealiTNn8yFUHbjfj5DqhFEkoxD99QhnEh8KmaAJkSgZeiDQcGWX
	 Ecq9QWVSlfaCINOqCdZgzrtrl1OTYJ6MeqRFiDx4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FE51F800E3;
	Mon,  6 Feb 2023 21:46:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3498AF804F1; Mon,  6 Feb 2023 21:46:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 294D0F800E3
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 21:45:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 294D0F800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=igorinstitute-com.20210112.gappssmtp.com
 header.i=@igorinstitute-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=DnQZWjpF
Received: by mail-pg1-x52a.google.com with SMTP id x31so89982pgl.6
 for <alsa-devel@alsa-project.org>; Mon, 06 Feb 2023 12:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igorinstitute-com.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qCgatFPRuUDhHayY+Kosg9sSQLTOPEXs34Upelph/fI=;
 b=DnQZWjpF/0iXmsltg1wtWSGxq7rViHImzl8JiNkEfLcwH/AQqWFShelBGku/1iT9n8
 P9lEhu4AqY5mWsVTK8YDGD/UoKk3EnQ3BH4kEo1y5zQe0I4+YODMgRuRJ5bR9z/c1IEu
 dGUm931cxzx5DEyQ5MJ407fEyxostxmE9D3bABshQTNL0qfMpCzt/i5BF0suHcisXWg3
 gOzeTO8clYBsUdFklrf2d2uWAovPn4cCTRsZ58I9wmFnu1oMZJ9GUTKKKjZDwZtQrVsB
 aaiGea5CV9K7s/sA8PlvlOZgEWdTAlQTo2fA2ZPkV8sysSyr3CpJ2KgBy+gm4vxwAWzj
 WD6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qCgatFPRuUDhHayY+Kosg9sSQLTOPEXs34Upelph/fI=;
 b=ePyIOiua1ATO+a4ov6SEBGB/ZQf01nowB/NVBbrrV/ACTUyHiLfMa3smcRcC4akw28
 A7jSiJt5oL1qTuqiTB3NWNG6smITlbAF9jtQ1jvOZS36GPD/OWkRKefFCTWNcjb8QF4p
 VMB+mzyK6+99c92i3B1dceA185UGb0JUNaCBhuVCS2oRDPdfbHVUXuplcL1vBrdZe0Pr
 v2Zu4RVbHsY/5Ymj4fNGjia8MRTRVeva4PvlJlwinexl+PLDhC01nSxyVerrRbCKhKPP
 SPBfdx7dbl5bByZasz6+uUxtMClX2bT7lrObpVkPlENedk7jcKwnMwGacvsfOOxysRVi
 pidg==
X-Gm-Message-State: AO0yUKW2VfEs+Hu2GECGodxW9ybn00xwtm9LVef6Yptn29LKbtAa4MbF
 587o6kaDqiJ0kJd+0Z/WCba1GA==
X-Google-Smtp-Source: AK7set/KYnw5723a5WPz7p0YfkjaJ21x17ft2s3rs2EyPcRq72zbtf03BlRzh39rHPu/AHXo0iHghA==
X-Received: by 2002:a62:17d4:0:b0:592:5276:95df with SMTP id
 203-20020a6217d4000000b00592527695dfmr719003pfx.2.1675716349752; 
 Mon, 06 Feb 2023 12:45:49 -0800 (PST)
Received: from localhost ([121.99.145.49]) by smtp.gmail.com with ESMTPSA id
 v18-20020a62a512000000b005938f5b7231sm558293pfm.201.2023.02.06.12.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 12:45:49 -0800 (PST)
Date: Tue, 7 Feb 2023 09:45:46 +1300
From: Daniel Beer <daniel.beer@igorinstitute.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 2/2] ASoC: tas5805m: add missing page switch.
Message-ID: <20230206204546.GA233871@nyquist.nev>
References: <cover.1675497326.git.daniel.beer@igorinstitute.com>
 <1fea38a71ea6ab0225d19ab28d1fa12828d762d0.1675497326.git.daniel.beer@igorinstitute.com>
 <Y+D8bf/19aOL7Wzl@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+D8bf/19aOL7Wzl@sirena.org.uk>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Andy Liu <andy-liu@ti.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Feb 06, 2023 at 01:11:09PM +0000, Mark Brown wrote:
> On Thu, Oct 27, 2022 at 09:38:38PM +1300, Daniel Beer wrote:
> > In tas5805m_refresh, we switch pages to update the DSP volume control,
> > but we need to switch back to page 0 before trying to alter the
> > soft-mute control. This latter page-switch was missing.
> 
> You should just use the register windowing support in regmap, it will
> take care of this for you, avoiding any further similar errors.

Hi Mark,

Thanks for reviewing.

We did discuss this a while back when the driver first went in.
Unfortunately the vendor software tools provide configuration for the
part in the form of a sequence of raw register writes, including
explicit page changes:

    https://lore.kernel.org/lkml/Yd85bjKEX9JnoOlI@sirena.org.uk/

Aside from this, I have two other practical issues.

The first is that I'm not sure how exactly to implement the paging
scheme in terms of regmap_range_cfg (assuming this is what you're
referring to). This chip has multi-level paging (books/pages), with the
book selection register itself requiring paging to access. A sequence of
three register writes is therefore required in the general case to
select the correct page. I had a quick look at a random assortment of
existing regmap_range_cfg uses, but didn't find anything that looked
like the same problem.

Secondly, the patches as submitted here have been tested, but I don't
currently have access to hardware. I'm very hesitant to make a
significant change without retesting and leave the driver in a broken
state again.

Cheers,
Daniel

-- 
Daniel Beer
Firmware Engineer at Igor Institute
daniel.beer@igorinstitute.com or +64-27-420-8101
Offices in Seattle, San Francisco, and Vancouver BC or (206) 494-3312
