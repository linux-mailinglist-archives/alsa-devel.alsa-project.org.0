Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4521B55E6
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2019 21:04:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1376166E;
	Tue, 17 Sep 2019 21:03:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1376166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568747047;
	bh=xpmfXkRuPm7zZyyCbyJcI6r/p2jPuRiICUWkHVF3Wn8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jPVPAv1sNZtUXg+mKMMZLrAMAlbduDXZe2euH4tLXrXOg6UJ45S89inIEtWzLXAQI
	 vPVau2ZwyFrp/5lN6yOPiKhTbFcvMtP2g9xHj1Yg/MLsYWPNVRuwEnVKNcY1pZGU+H
	 w+iw5jHF6HOh2JLGd/P1PmJI/TLl9GHAuoJxnEHw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75CFEF80361;
	Tue, 17 Sep 2019 21:02:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FB0FF80361; Tue, 17 Sep 2019 21:02:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_26,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECB30F801DA
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 21:02:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECB30F801DA
Received: by mail-ot1-f65.google.com with SMTP id 21so4018507otj.11
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 12:02:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QlvUu/7EAfaFx2gMfy9waFqB/50P6PISUPQGJqzue/s=;
 b=N+SxQXAiZmBMrNxvouWg7A43P/8mLrdUr6Xmdhb69N7pvsR4JfSRnyCAMTD+Yu3fFL
 992Gn3jKVVp64oYDDZ27Sb2PYnu/YaiCnOB5cEP8t72+9+zL98NS+n5KbU0iKzxKKnTX
 pe5m8oZ8WuXtE3cCZ7I8UyhX7FseHu4UgtNhBGzgYZmHc0bSsjcqXtiWtcGpaOskXfI7
 2DkSj1AMKy8I1UXJNjfprGTW6zOREOYCk3VTpf5Z76Ot6L5EtGgrGYinivTI6ShfLWs9
 HggmHGNNNHaJLZNOS9XoGQlJyXhfvo87y0xL3OCX6uu7UEuBC4NJ3xxDpDuiz8NJiqE7
 QlBA==
X-Gm-Message-State: APjAAAVKoKFripE6nT+ISGGJlr5Jdhfm+6dAQpMkIwuRfdvIUddPaZJR
 3ZdiePS9V/o6TdoHzkdfAA==
X-Google-Smtp-Source: APXvYqy2Jk647wLh+T9cbKDUIIqeL8OFFmcgG7XrhimUWJ4jvaqNnTMnSFgdCnH83A+Rsx5xLe87bw==
X-Received: by 2002:a9d:e92:: with SMTP id 18mr265396otj.321.1568746935862;
 Tue, 17 Sep 2019 12:02:15 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k93sm964698otc.30.2019.09.17.12.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 12:02:15 -0700 (PDT)
Date: Tue, 17 Sep 2019 14:02:14 -0500
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Message-ID: <20190917190214.GA8947@bogus>
References: <20190906151221.3148-1-mripard@kernel.org>
 <20190906151221.3148-2-mripard@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906151221.3148-2-mripard@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v3 2/2] ASoC: dt-bindings: Convert
 Allwinner A23 analog codec to a schema
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

On Fri,  6 Sep 2019 18:12:21 +0300, Maxime Ripard wrote:
> From: Maxime Ripard <maxime.ripard@bootlin.com>
> 
> The Allwinner A23 SoC and later have an embedded audio codec that uses a
> separate controller to drive its analog part, which is supported in Linux,
> with a matching Device Tree binding.
> 
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> 
> ---
> 
> Changes from v2:
>   - Use an enum instead of a oneOf for the compatibles
> 
> Changes from v1:
>   - Fix subject prefix
> ---
>  .../allwinner,sun8i-a23-codec-analog.yaml     | 38 +++++++++++++++++++
>  .../bindings/sound/sun8i-codec-analog.txt     | 17 ---------
>  2 files changed, 38 insertions(+), 17 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun8i-a23-codec-analog.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/sun8i-codec-analog.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
