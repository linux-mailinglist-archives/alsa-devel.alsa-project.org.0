Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B68B7BB110
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Sep 2019 11:10:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29ACC1680;
	Mon, 23 Sep 2019 11:10:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29ACC1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569229856;
	bh=9qZ+R0YhCc68LAn05+r1GKMb1a04mB+238NyUrGS+UQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m/uolExkPa4Gejxpl396tRixTfPnbcjhJoWuYWrh0AGbsRbVTeUoW8IxzjjchSb1w
	 wDwVGqJPrNp4SHLdOvnfv//2haMeWFpCp1AUcA9neQLKAbgpq2+osuAkzh9QTE0vgR
	 f5TbCUfB6KUXliSK9aZdHEMTdBbJrSxeF5TOWROc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D6C4F80508;
	Mon, 23 Sep 2019 11:09:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E7A1F8049C; Mon, 23 Sep 2019 11:09:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9DF3F80307
 for <alsa-devel@alsa-project.org>; Mon, 23 Sep 2019 11:09:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9DF3F80307
Received: by mail-wm1-f68.google.com with SMTP id 3so8366153wmi.3
 for <alsa-devel@alsa-project.org>; Mon, 23 Sep 2019 02:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qr/xD5b8NXreFir/G/KvgwREY1aVYsklecZUpoCc1pQ=;
 b=q35rpgDVIdgvQBLnborH0YtWmwxF9hh9F/Kc/gU4bEmvfl3vszLlr78UdrXBVz/03M
 g8ALOUKo4jgY6o+CHsjGJAj/xLa/kXv6EmFkKVw6Q9O3SMw7pF7loLLAqNI7GNjKFsqn
 /Ccge1ZQ52JGAnIaU9vtvbg03ioCme77fI2xLftbjqfgJRyGD5dKZrrBOgFTfKleIYja
 LapNa6EDADYIEFxhVp+Scn+I+8hIQLLt3u2eYpmSfCgb9xIgX57HxuJYpuQecl9ITF+c
 8VQALM7mhI2owhmP1kQLSivbXC03szBKipZXudAYKTlZyE4d3S6UvwYiaQdQcBamYdkE
 UPsw==
X-Gm-Message-State: APjAAAVzHxHPLyj6V19TLUrAnJu+O5VJFicmGNpO6HP7KElh0bOlrILi
 TKyd8diWjs23IY91OTX9ybA=
X-Google-Smtp-Source: APXvYqyEPIb00KUDWsPEDYltoMAk90fKLhEAwVNUnhK5Li2Iq6c0tFivgGtKwVopYcJBdAcKIOx9ew==
X-Received: by 2002:a05:600c:2311:: with SMTP id
 17mr12600603wmo.39.1569229768689; 
 Mon, 23 Sep 2019 02:09:28 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id o22sm19458607wra.96.2019.09.23.02.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 02:09:26 -0700 (PDT)
Date: Mon, 23 Sep 2019 11:09:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <20190923090924.GB4577@pi3>
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130317eucas1p188d724710077d704f768798c6555c741@eucas1p1.samsung.com>
 <20190920130218.32690-5-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190920130218.32690-5-s.nawrocki@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: Re: [alsa-devel] [PATCH v2 04/10] ASoC: wm8994: Add support for
	MCLKn clock gating
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

On Fri, Sep 20, 2019 at 03:02:13PM +0200, Sylwester Nawrocki wrote:
> As an intermediate step before covering the clocking subsystem
> of the CODEC entirely by the clk API add handling of external CODEC's
> master clocks in DAPM events when the AIFn clocks are sourced directly
> from MCLKn; when FLLn are used we enable/disable respective MCLKn
> before/after FLLn is enabled/disabled.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes since v1:
>  - addressed review comments from Charles
> ---
>  sound/soc/codecs/wm8994.c | 108 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 104 insertions(+), 4 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
