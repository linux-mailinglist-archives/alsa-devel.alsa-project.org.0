Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB26EB16CA
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2019 01:56:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 716B21677;
	Fri, 13 Sep 2019 01:55:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 716B21677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568332561;
	bh=QW/aXTkUgFlyV3962wSE88UFrQY9ySxb6CQOdhNIFEU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CEX3cmoUzbi2HBDoPElQILeLLPq/E+eb4Dt3+BS6l8Kt+ItxcsvpLSET7L/SgaysT
	 U9mfhCJqxA2aZ3p0UGUKq1ES4F7m40v6WDdD3WzjvBFXEuwcDX0g9Ien+Mr8ZhbJPx
	 jDeQWcfMzXsnp8+YMPLteSZHvrOJXs/FCWq+aPsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8C0EF80393;
	Fri, 13 Sep 2019 01:54:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8DA6F801ED; Fri, 13 Sep 2019 01:54:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13A44F801ED
 for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2019 01:54:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13A44F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pXYgnB8v"
Received: by mail-pl1-x644.google.com with SMTP id x3so12429413plr.12
 for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2019 16:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=epB8CH0IOuw5TsX1fUGnwbGIVGe9v0LlpjCzGxP60TQ=;
 b=pXYgnB8v9vuvLFdz1UIqGnHVmsaO3b0KOiGh94bEt4QtpedVNNzipx+iIyYTwI9Obp
 XO2uCQ95ITV+w4RvV4PyxkNHy+kpiezsIVRJv8PAJogfMw2vTb9xDyWb7D3JhTT3iT0B
 jvM76OsIptNMydQYZA9B5ztqtWw1qSuDVXvMIbL6N0t1jesIi2xmx2Yha5x/RhMVF3KB
 BgW/7PYc2HrGuo52dVHBTSxe80oMM70A8aPVWGjpJDye5OCJLyXU+7hak0kxTsR47VwG
 KCbqs5X+Aq8SymUGWQCh/dFK4DIJ4Lz0VTuEDEPWhLWLNLekup1nd+lkC13UMqbwrmqA
 +NRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=epB8CH0IOuw5TsX1fUGnwbGIVGe9v0LlpjCzGxP60TQ=;
 b=XQocbn3iefro++VowLTlc8l36Le+5lQNPq5mt1oBSYzKEYfUF2E34/fRuyZm10aYA9
 f8RTSvJ1wyxlgpR7YY51zCRnqYUOmzLqBkOVQelWIX10vs2jSdQBD4RJgF81Ki4KMGrT
 v7bNgV+1nlDIv/p20Ut4rS4pSYphF7I4QGhRZr4izSJ4pQrDf7agU2IBP9AX5yT7MFOi
 mX5RMKL8y/0wnsms/dK+EqpSqaWgu0Pwi47AYuYNumINSwmwAf4czNHY1wD3P8XYhw1e
 RsqsGOV18rlHrxREL9W6uAh1pwVf4iVtxNewJEHzPAFzUQVsN+I+s5r+gz0PemZN1Uoj
 BQeg==
X-Gm-Message-State: APjAAAUFIV5l7DTKN0TOUJqj+caMzv2FJcVcvDxdEOBk868qIiKtifpU
 OqbW2DesgOmfwUAjWdt2X/8=
X-Google-Smtp-Source: APXvYqwzde8vJPDro3KBWaFAJc6Uo/3ggP569vDzVpDisDugeNgt80nBA+MCUnil+1LZlDzNpLDpvA==
X-Received: by 2002:a17:902:9d90:: with SMTP id
 c16mr34653633plq.12.1568332450067; 
 Thu, 12 Sep 2019 16:54:10 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id a20sm24584085pfo.33.2019.09.12.16.54.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Sep 2019 16:54:09 -0700 (PDT)
Date: Thu, 12 Sep 2019 16:53:48 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20190912235348.GE24937@Asurada-Nvidia.nvidia.com>
References: <cover.1568025083.git.shengjiu.wang@nxp.com>
 <2b6e028ca27b8569da4ab7868d7b90ff8c3225d0.1568025083.git.shengjiu.wang@nxp.com>
 <20190910015212.GA16760@Asurada-Nvidia.nvidia.com>
 <20190911110807.GB2036@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190911110807.GB2036@sirena.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 tiwai@suse.com, lgirdwood@gmail.com, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: fsl_asrc: Fix error with S24_3LE
 format bitstream in i.MX8
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

On Wed, Sep 11, 2019 at 12:08:07PM +0100, Mark Brown wrote:
> On Mon, Sep 09, 2019 at 06:52:13PM -0700, Nicolin Chen wrote:
> 
> > And a quick feeling is that below code is mostly identical to what
> > is in the soc-generic-dmaengine-pcm.c file. So I'm wondering if we
> > could abstract a helper function somewhere in the ASoC core: Mark?
> 
> That's roughly what sound/core/pcm_dmaengine.c is doing -
> possibly we should move more stuff into there.

It looks like a right place to me. Thank you!
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
