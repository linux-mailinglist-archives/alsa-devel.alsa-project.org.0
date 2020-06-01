Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B1B1EA31C
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jun 2020 13:52:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF2021704;
	Mon,  1 Jun 2020 13:52:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF2021704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591012376;
	bh=YzPMa7MYeU4MNb8V125XjMlGEgHrLbjHNKRJ0bidZEA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pGVLxrwmD3tOM3ideL9rcTg39GZUGwSNPAp4+N+quOLTvEuSDHpf63+0H0zyd7nHO
	 R/jBIXsN2bqMu/tfITxHrDFwI+r9e1fhhqtgQ3qxy6mGef9ocfnuM31SNDVKuI66sH
	 9quusQ6KffQDZiQD5J+jIWqoEb9DrNwYheY2rCt4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB9D8F800B8;
	Mon,  1 Jun 2020 13:51:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 486D3F801ED; Mon,  1 Jun 2020 13:51:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DCDEF800B8
 for <alsa-devel@alsa-project.org>; Mon,  1 Jun 2020 13:51:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DCDEF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gIoNZVqL"
Received: by mail-wm1-x344.google.com with SMTP id f185so11054980wmf.3
 for <alsa-devel@alsa-project.org>; Mon, 01 Jun 2020 04:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+aScGOS09m9YOzzeSTkeDdM4kVUuzxi8K357z9UNKI0=;
 b=gIoNZVqLsqFvtsTg1MUBOuJ/1n1QmY9dFbvc590I10eFcK0quGggYeoLEo8cHTHbIz
 6UK9naQLnwghhVXvqojbVte1C4rkRfI+Wcxbh25lC9fAb/jyJ8d0b2OEjf75WYuRsw6B
 evQT/TZnmOP+tGpqnxBIBYl6zJo8gwqRuLMrx/CLSyrUrGNUaZOibq++qdt4/XzpOu6/
 3S/v8bpcqkvZfxM62MyrbdMTB9mg3z/gzLj4m8X89vTOWn42fCiIdrXQ9zMHSmyXxzW7
 1Rqe2KhwOK8ac7yXdhbstMImk0i8YupAP5WBxOdn1DDqoz0snLctpiA0zSFq7kT14sik
 SBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+aScGOS09m9YOzzeSTkeDdM4kVUuzxi8K357z9UNKI0=;
 b=W7OmD09BG96qLjqj96RSLkO7KPsCD6IvZTqd6Or9XpMfqdgHLzqmcBhgYzSsOBbr4Z
 vsFlL6QvwWd3BvS3/zINRBdNt9EK/VAjgg6sWZR2JHATlpHMAIm5JwrWvvevhN0jWix7
 DGgCSkVQSRK8SqWxg1vY8de3qH5aMBIeYKi1lDmbrR9DCKQAC/fY+sZTIOqUZuGWYi1D
 7MRTIjxjIjT9npIvs7eI+ZymP4M8oYA4rp86S1/i1lqgJZQ4mUR4+jhwLlinSgXVJo3F
 p5bFvw1o2atJyLH8YYyWZkgTYSdiaR43VE4jJ8cCsgOaCzyfX4bkJz2wZvgHPOPgLDVh
 8rlw==
X-Gm-Message-State: AOAM532okD5ovUAK5E0B8rZ61rK1RVy7TxvhyD0szi3QFbX3XuqYhoDr
 QPF3sIJst2Oted/wrT53U2rPzN02
X-Google-Smtp-Source: ABdhPJzoBWKJ9Dld+MHE9ThyDtU5qswpEveeDj49eijhhr9+ETYtKXa13miPsB2YIqlV9KTVYloEKw==
X-Received: by 2002:a7b:c248:: with SMTP id b8mr20299855wmj.2.1591012267027;
 Mon, 01 Jun 2020 04:51:07 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id d16sm10780376wmd.42.2020.06.01.04.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 04:51:05 -0700 (PDT)
Date: Mon, 1 Jun 2020 11:50:48 +0000
From: sylvain.bertrand@gmail.com
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] augment snd_pcm_drain() documentation regarding its
 non-blocking mode usage
Message-ID: <20200601115048.GB1626@freedom>
References: <20200502193311.GA19340@freedom>
 <47281cd6-2ae5-309e-f1a9-8906ff50c9cc@perex.cz>
 <20200515112411.GA550@freedom>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200515112411.GA550@freedom>
User-Agent: Mutt/ (2018-04-13)
Cc: alsa-devel@alsa-project.org
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

ping?

regards,

-- 
Sylvain
