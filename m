Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD6C5B566A
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 10:37:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19A6F16C3;
	Mon, 12 Sep 2022 10:36:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19A6F16C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662971861;
	bh=r/2StSj+EsasBdd1v2y2mKFKf96fLWppGryBy74q0RU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KpdsXHFQ99ZbrZa/3SKVyXeNNWI4xjwG2YosYXEOxcf5/9njiJoCyCM6LzxgfbW7o
	 Vewm3AWRXfV5oKPxMaIu8MiNRoDxubzYR+ITZ8/mQ2CAKmDJdi85mn+saGw4OhnP/p
	 zR0N2tedvspFKht2PpOXr9Kd6AtlJBvLpgP2hRts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67CFBF80095;
	Mon, 12 Sep 2022 10:36:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 600F9F8027B; Mon, 12 Sep 2022 10:36:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF7B8F80095
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 10:36:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF7B8F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="XQYtsHRd"
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1225219ee46so21522282fac.2
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 01:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=r/2StSj+EsasBdd1v2y2mKFKf96fLWppGryBy74q0RU=;
 b=XQYtsHRdvolJForB/3cj6W0FpJv3aRcTMSAtZh+3Jg2rrqgubmbvy16NXmYj+CQ41U
 uQpFs84hMm54x4s6woJOTh8Wiwxfh/mvczy7HWk6XEiiPLIKVbw6Tira+eZrgnI3StSl
 RQOaokfc54LpMB6TDIS9NYe4FgAijgEO1IXjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=r/2StSj+EsasBdd1v2y2mKFKf96fLWppGryBy74q0RU=;
 b=748Lkcy9KacKYTK/WkgjhThN2k7xPHUk/ZmEb01XwwwUsSeClJLSWAGKBDjIiYJbF8
 GpZrQ/czptjVQ1qaR+aIxvV0uIehsB0PQ1jWLV+zMB/slKghE8eu8A3vUdXayBsj3Qe6
 tJzrLMs5N7SYXcfKksOjypQ4FheQPW6n9/LtvJu6jMVKVEIP8wAzJJqG0YXoVsYldRd8
 JZPZgGQ0LsUU/KBfXtzykyjXadSe8t/aGtNGbCQ0/W4W5jzOsNwWfJk2H/v8pPrRH26r
 /4ZqRxv9UiiLpYI2tAsOQuDVShZTFuoV2GoA3yox8RXj41SM3hlq64JmMvQuBFeNsu1X
 7pxg==
X-Gm-Message-State: ACgBeo0VWzJdM8kFhOwBAu2a2abIxcK4jIyJBNwIptq6NbxAMud9/Uff
 XImpz8OUg2uhd3oDdDRF+8KSt8pZp8WFm7572zUO9A==
X-Google-Smtp-Source: AA6agR44XZVPj4+tG+EnN6h6H4+b2opLdLYGAOir8ImE+eDWx4IQlyYPVOOxTaJz0D2+Gx7FMQWozsplmlqFQxiwmcM=
X-Received: by 2002:a05:6808:1997:b0:34f:d372:b790 with SMTP id
 bj23-20020a056808199700b0034fd372b790mr92732oib.2.1662971790185; Mon, 12 Sep
 2022 01:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220912072854.760824-1-yunjunlee@chromium.org>
 <87r10hhw5w.wl-tiwai@suse.de>
In-Reply-To: <87r10hhw5w.wl-tiwai@suse.de>
From: YJ Lee <yunjunlee@chromium.org>
Date: Mon, 12 Sep 2022 16:36:18 +0800
Message-ID: <CAPm_npZeQswPTY2pc9nb1FrNDoqZWGpMwwLN3T2JkEmcgp7YtQ@mail.gmail.com>
Subject: Re: [PATCH v1] ALSA: dummy: Fix trailing whitespaces.
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, yuhsuan@chromium.org, whalechang@chromium.org
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

On Mon, Sep 12, 2022 at 3:46 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 12 Sep 2022 09:28:54 +0200,
> YJ Lee wrote:
> >
> > Fix checkpatch.pl ERROR: trailing whitespaces.
> >
> > Signed-off-by: YJ Lee <yunjunlee@chromium.org>
>
> Thanks, applied now.
>
>
> Takashi

Thanks for your quick response. You're very welcome!

YJ
