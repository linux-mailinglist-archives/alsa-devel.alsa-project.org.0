Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4493251CE2
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2019 23:15:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 959E315F2;
	Mon, 24 Jun 2019 23:14:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 959E315F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561410924;
	bh=ACCuLK+IQxr3tFfGJplapRMVROmIIMXI11EGpgJn4CQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MoZNQFN4sr0ZZ36+EFQMsWaYdElWI8KYXne4YcrEck6CgON0opucIU4prxCoCQH3i
	 4uFrGQ9PFGZWl+rU83D2jBgFj1Gb0RHCGKKbPKQy2errikU0eiWAoIZeUkmO0M2CYd
	 N75HVWvAC60Akal53wQeM+a88kSZUYq6esuVLg64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0620BF896B7;
	Mon, 24 Jun 2019 23:13:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42DEDF896B7; Mon, 24 Jun 2019 23:13:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,FSL_HELO_FAKE,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9392FF8071F
 for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2019 23:13:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9392FF8071F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="KYiOOAa4"
Received: by mail-io1-xd44.google.com with SMTP id n5so61285ioc.7
 for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2019 14:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TaoFP7RoPHP/mewfLzTbrkirIyTlEEz0wR3IG3gPD14=;
 b=KYiOOAa47nunOtSXr41xWbSvXqYnE8v7PDyTmtpy/ZsgZ4m9LT4vdSG4/v/am4Xalz
 w71arpxurJeDQAxAhQm1l6rrD8W3gob6WxW7vnT9wo9Wa+LeQh3VvxMgcbHuMIbvX8Cd
 5/hnbGnswvvueLybIiWyEfVOjfegIoNM6qjUoxX7gzioUtLJSL3S3tQXFsoiTSzFXyAj
 OMyqFD9aeht4jWHcDZB65MZLJE00WYhE/S1jOg/oBKjv70PT0Znq1ZqjUK1hBvlPRRHq
 7w2SM5IdZLv6jqVy5ZTCLlJljCgJP43RRz+9W2i6nJgrSePYcd5bwZlvXHJ7+iTiluwl
 Gcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TaoFP7RoPHP/mewfLzTbrkirIyTlEEz0wR3IG3gPD14=;
 b=tRMS9rx5jzq86t3PUrV1kwrP+2S+6ElKwTYHNsJNuexKB+VA8SBgMhJ0yf1/jEF7NV
 YJcZlCdDRg3/U0gtnwBAk1SbuxkW6NwydIRQTVS4IJtcTga4eo+7zP7HetdmUiZXoZRV
 O9iO0vU5xzbE4jjD5M/hyqCP8zV+D5x93ul5UmyysoLeqRa6DOwAe76upGEj2svK2rBL
 i7VtjcBiIwr/ZVQA/o/L1DTcCeVXxsQKqSAPxVvE59GNObMhbxuwyKV1Cdo1S2pJ23Ua
 CVgimsG2jm/L8618LBdkj/wvO9dCcSKmUl7orRIy3qSs8GlCCj+SLMcBCUZHHpSKgTxK
 pKow==
X-Gm-Message-State: APjAAAVTcipvlfVtqZLVfZa4FTAyDHvOw2PM6zOhpNutzoa5VgLs0sLV
 zSxNqbsj+no9mdbD2v9Lge9xHw==
X-Google-Smtp-Source: APXvYqzb4oUHRS9AUHLzfe7iEYkTz3ViFg4DCBBe7tHbvavg+kNtAb4UdceEJDagDM7ciXwHniyXEw==
X-Received: by 2002:a6b:6b0d:: with SMTP id g13mr513834ioc.55.1561410812400;
 Mon, 24 Jun 2019 14:13:32 -0700 (PDT)
Received: from google.com ([2620:15c:183:200:855f:8919:84a7:4794])
 by smtp.gmail.com with ESMTPSA id w23sm13468829iod.12.2019.06.24.14.13.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 14:13:31 -0700 (PDT)
Date: Mon, 24 Jun 2019 15:13:29 -0600
From: Ross Zwisler <zwisler@google.com>
To: Curtis Malainey <cujomalainey@chromium.org>
Message-ID: <20190624211329.GA241793@google.com>
References: <20190624205239.150516-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190624205239.150516-1-cujomalainey@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Ross Zwisler <zwisler@chromium.org>,
 Bard Liao <bardliao@realtek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rt5677: depop stereo dac
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

On Mon, Jun 24, 2019 at 01:52:39PM -0700, Curtis Malainey wrote:
> Upon enabling the ASRC DAC we need a delay to avoid popping the
> speakers.
> 
> Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> Cc: Ross Zwisler <zwisler@chromium.org>

This solves the popping issue for me.

Tested-by: Ross Zwisler <zwisler@google.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
