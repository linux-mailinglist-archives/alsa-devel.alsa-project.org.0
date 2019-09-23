Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1E8BB1FA
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Sep 2019 12:11:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AEFC1684;
	Mon, 23 Sep 2019 12:11:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AEFC1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569233511;
	bh=BHPcJhXuFIzIrP7zB6/Wok0uVnet3+K0hEcm8r3/XCg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cj+troV/4pnJgzp5QiPM2H4PqV8EWTsJ8T6gK/AEKHsBsNW4WfHRK6GUmhy0lxYhW
	 vtUhU9DT86kBcgMEaoUpRcvIsDfgyWsEae6oE5wzabAJzOz97as1bJmWpRW/mjCam1
	 B3aRrybC9vJMxQmO7anSVa3cwoWY576yuQ5FBZ+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02D07F8049A;
	Mon, 23 Sep 2019 12:10:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88092F8044C; Mon, 23 Sep 2019 12:10:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDEA5F80213
 for <alsa-devel@alsa-project.org>; Mon, 23 Sep 2019 12:10:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDEA5F80213
Received: by mail-wm1-f67.google.com with SMTP id 7so9198752wme.1
 for <alsa-devel@alsa-project.org>; Mon, 23 Sep 2019 03:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=h9qXlBn1SwboKu5LtxJjQDTNKEcy+/lavbTXOBsjGHM=;
 b=ab3XuZi6nGOLbR3IBM0YFuznJZbmi3ORv0IrIkUeEraa7EysJ4C6lV3oug8VQGswt1
 DU7X/BWfLNRQvSJsSgmec4GwNMU/P1DnHwWHLjYIUdt2AZa9RcOmm5N3knZpJrrBMFA+
 xjr7bkuem+QgFAxFJO21n9nlOg9HaimZAmPtwvvx1shem5metmHJO1L7m1dfv0555C+5
 +i/cVUwWU8wtaS5y40JvIaD398+8yqhnE9RN/6D1ULolg3byDN7uS0Idd4E6H3Dl0Elt
 HR44JHErIDdG2HqGPiImubZlAegJ3ap/pJKsY1ZSp3dyXJGmFYArtimQEMn2YnT+zLLG
 4qVw==
X-Gm-Message-State: APjAAAUH2ZomrtdLuUi7JBAZkFbOwmAx6yReaqerhnLwo9CVQB0D8wI6
 Pbmx/F1c/i375Q+I3w7649c=
X-Google-Smtp-Source: APXvYqwZ70GVq/wsIIytWY8nE0tIFLrgynh5FI/RtkKc0x6HwJVU1rez82f8Fjm1XocHptXshd8PFg==
X-Received: by 2002:a1c:150:: with SMTP id 77mr2056857wmb.116.1569233401030;
 Mon, 23 Sep 2019 03:10:01 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id l9sm9539317wme.45.2019.09.23.03.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 03:10:00 -0700 (PDT)
Date: Mon, 23 Sep 2019 12:09:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <20190923100957.GA4723@pi3>
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130316eucas1p2de713006a13c62c0b895c2e33e0d14c7@eucas1p2.samsung.com>
 <20190920130218.32690-4-s.nawrocki@samsung.com>
 <7334ce45-f192-4421-aa3d-d142582153ef@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7334ce45-f192-4421-aa3d-d142582153ef@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: Re: [alsa-devel] [PATCH v2 03/10] ASoC: wm8994: Add support for
 setting MCLK clock rate
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

On Mon, Sep 23, 2019 at 11:10:48AM +0200, Sylwester Nawrocki wrote:
> On 9/20/19 15:02, Sylwester Nawrocki wrote:
> > Extend the set_sysclk() handler so we also set frequency of the MCLK1,
> > MCLK2 clocks through clk API when those clocks are specified in DT.
> > 
> > Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Sorry, I squashed other patch to this one but forgot to remove above tags, 
> not sure if those still stand as there was rather significant change in 
> the patch. 

It's good. For the record:

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
