Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 600A04806F0
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Dec 2021 08:13:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E685116A0;
	Tue, 28 Dec 2021 08:12:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E685116A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640675620;
	bh=VbHFquqj2jmnV6Iu3jh6A5YmaXODQzuHdjk3YMCz+Bg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RbQv4MdVwHALug+kTYwNONy1+c3S9xz6xXLcv6wUfxUlVEHVq3wGySpHivFHY2mTh
	 Ezx0YfKAQiSY6JaxLNiJOAnDtiS9eNJgBSGoPL61Jj9rTi/ZqCI/+ku/Nr+r8DkFUh
	 7eusmKNjRI6mN8iGfDwZ42hi/Y0Otgojpc3Z49lg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33549F80246;
	Tue, 28 Dec 2021 08:12:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7CECF80224; Tue, 28 Dec 2021 08:12:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FSL_HELO_FAKE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38AFEF800D3
 for <alsa-devel@alsa-project.org>; Tue, 28 Dec 2021 08:12:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38AFEF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="skfkrXno"
Received: by mail-pj1-x102a.google.com with SMTP id
 rj2-20020a17090b3e8200b001b1944bad25so16275300pjb.5
 for <alsa-devel@alsa-project.org>; Mon, 27 Dec 2021 23:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NXYVCRlkl1arj3e8WvF9NDZ27UwRswxMzQ9HSWmcWkI=;
 b=skfkrXnoE6gcXNsZO24JsoWju8VO7ddjO/I2mgv+T/TCep2bZbtmSO1O6ccPFzd5sD
 eFevQpVM1RXH/UkCEKzds05KO+5Kw14kClxop8CYk0tOqi8JG1EZboFb1FRhnmZ46gSx
 njV/5Nc+WWANbyAfOxa0uNzAy4a2qQ93p9JCAUyFVV4Sm/YCLhmuw2UFMPOq/YYslhzn
 lVDGd2co3ae6ImuSAbr8bUHlNJ58xtdeMLBRNgy7xL/ecBfYwcqD53//q2/QyMlWRmQK
 hkYw8wmshBE/+X1bq37jhosbWYqdBFPviHqGqAOqSzvrzYm9T9jQQOT92N7BVJam27Eo
 JvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NXYVCRlkl1arj3e8WvF9NDZ27UwRswxMzQ9HSWmcWkI=;
 b=yczJfx6lAOKsg5HDs/cmz4OX5bfm3MJp2p2ceiS6NGhZkIBp2s/AOwLTILSkRVXARq
 21JczI7WKt6lEIiM+uXKeT5/ANOYp36/Mef5ZZ4FX7Hx94FSxiNmxl2xDmPuw83PzosV
 m/3xb9CuKDIMMzA7T7vhKWib1jOrMJ4LxZ8iU7G7vGBQrLNUlpu/pNO6i1ycWHyPKfet
 Sku0bqCJyHrjZxVcZ2pXGzllGOAOQWpmlHTp9uSQkVULa2pDTYMuWGeVbtikkc3hVDyh
 YUxfq+uBUU+Cm48zPrSB1blH7eLPMZY5Nv3YgyRggyQKtCVpGc7KEtfTRsRFT5RQND1P
 yubA==
X-Gm-Message-State: AOAM530t6hrIV7NEJK18i/oWPMV2n+cyIQlPGfgk/KqvzuTOZYhJIa8Q
 bGgEv5BZg1xnUvtqelx41lpBgw==
X-Google-Smtp-Source: ABdhPJxgKDjojCITnOzByiXyEFe4d2LD2wr+DhASX8KwbIQB+3HttKHl2m/2SwjrTuCWYzRRF+QSYA==
X-Received: by 2002:a17:90a:5d13:: with SMTP id
 s19mr25373225pji.117.1640675540049; 
 Mon, 27 Dec 2021 23:12:20 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:a817:45ab:1beb:f01a])
 by smtp.gmail.com with ESMTPSA id a4sm21708498pjw.30.2021.12.27.23.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 23:12:19 -0800 (PST)
Date: Tue, 28 Dec 2021 15:12:16 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH v2] ASoC: mediatek: mt8195: update control for RT5682
 series
Message-ID: <Ycq40KwY8SxUslXC@google.com>
References: <20211228064821.27865-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211228064821.27865-1-trevor.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, shumingf@realtek.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, jiaxin.yu@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
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

On Tue, Dec 28, 2021 at 02:48:21PM +0800, Trevor Wu wrote:
> Playback pop is observed and the root cause is the reference clock
> provided by MT8195 is diabled before RT5682 finishes the control flow.
> 
> To ensure the reference clock supplied to RT5682 is disabled after RT5682
> finishes all register controls. We replace BCLK with MCLK for RT5682
> reference clock, and makes use of set_bias_level_post to handle MCLK
> which guarantees MCLK is off after all RT5682 register access.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
