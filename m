Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A91AC1DC
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 23:11:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC18815E2;
	Fri,  6 Sep 2019 23:10:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC18815E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567804283;
	bh=4xGWbnRbFKhraaGtMAKdwgyPdg65QKeIZ7wmPKElSSA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LKvfJqzfHsbxKZbaso7+PBBNdXL3WnkUH29k4H8oaRx7dhPVcm9RYY2EgTi6Hiy+/
	 WU7dM/JAm47Cb7iMYd2GPRuP8piozYQ/Zy+/4eyXLKPgDFiJaYczLQ/0B+nZwyuNkA
	 e6Y6xDlmI2Ez1jXu7X+h618TuhixljOXhdPeevCQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60B98F803D6;
	Fri,  6 Sep 2019 23:09:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18C25F80394; Fri,  6 Sep 2019 23:09:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,HTML_MESSAGE,PRX_BODY_30,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0E08F80171
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 23:09:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0E08F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="eLrbw2bm"
Received: by mail-qt1-x841.google.com with SMTP id n7so8806505qtb.6
 for <alsa-devel@alsa-project.org>; Fri, 06 Sep 2019 14:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WC9lCyne/S/n9UeQcdeDwvXCcqO4OtlD9qL6+Hmir/8=;
 b=eLrbw2bmu3PB2/KtvPSRCzl5kEvGY09yrImuoWENQ7oHWjJkqo4784lhl/FjeGDtNP
 YzbvEKw8fGPaWXyNDknBmK7pNfW8SMY57b5Csu0aM6j/hs7Znrnl7I00y97Y2VAlg3rI
 pVddDHFJ/0NPMKHGhXGfuIjtkwkl6CMOYoEOR+4DJLJNUtC7qYemCwPCcL5N1GrYCkkx
 FOCPM5sb24tsbHj1lmYcITlZm81R3sQjoArq9EiVZFtrDrmd2Xdfmo6IWJ71jWffRoQt
 8y//mM4QRfssGVyzalcRlhrmnAil8O61WV1Z4476KwHuESvLIomTMJSexyfmPTTZJyuB
 hjhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WC9lCyne/S/n9UeQcdeDwvXCcqO4OtlD9qL6+Hmir/8=;
 b=ooxcdXpqvhR5UTvwqZNS/zCXvobZGWdKmiBw/RRIT5ky4aTS0kL9XC/wLRg5zRUSbf
 qgRpBN68Lu+GVEaLwsEB4njCKp4UWTuxxlQO/nhVldSGSq9idacOU4TL6kzNtMlTGUpH
 cFj6aNd5LZgwYcnVek1tBz381uhR+7CMYGnGSWGHzkel60q9vfBSAnk6bb2B1QBOcjsE
 KRQ//1H+T+JFsJhxym8GtHstokmc9b5wIWSxMJkKJAHLLp/ha67SRfRZjThp2s3TXYst
 /gxfzLg/ladGCtXY1bAn7fxTO1iBI5XNU8X0dFPqr4uilV3wawThnPYaUWjcigLHtrOS
 s/uQ==
X-Gm-Message-State: APjAAAVWek4d2IC6Kfjz0jx3VaI31JjaujS6H8/vQH3qe0CCnadA16Ko
 OqdkKT1UYPOsTvcsEeQKJfmsN1mZPszUCQ4YiZ7RFg==
X-Google-Smtp-Source: APXvYqzK9nC1nrt8vbMVgyrUjbKNp316sIHy74RDWmDvDJD/QzZyHpSzotIvTVmE0JuCzh8rqGOdDKfcYwVqofAmMeM=
X-Received: by 2002:ac8:2e58:: with SMTP id s24mr6719249qta.52.1567804171397; 
 Fri, 06 Sep 2019 14:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190906194636.217881-1-cujomalainey@chromium.org>
 <b96e35fb-09d7-6cf7-8880-2cb8f377cca8@linux.intel.com>
In-Reply-To: <b96e35fb-09d7-6cf7-8880-2cb8f377cca8@linux.intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Fri, 6 Sep 2019 14:09:20 -0700
Message-ID: <CAOReqxgJQaW=XAsD4o9hq_iU1faJBK3d9Rg8FCp_4Mrx3UX-oQ@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Curtis Malainey <cujomalainey@chromium.org>,
 ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [RFC 00/15] Add Samus Hotwording for RT5677
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

Curtis Malainey | Software Engineer | cujomalainey@google.com | 650-898-3849


On Fri, Sep 6, 2019 at 1:41 PM Pierre-Louis Bossart <
pierre-louis.bossart@linux.intel.com> wrote:
>
> On 9/6/19 2:46 PM, Curtis Malainey wrote:
> > This patch series adds the hotwording implementation used in the
> > Pixelbook on the RT5677 driver.
> >
> > Known Issues:
> > There is a known issue where the system will fail to detect a hotword if
> > suspended while the stream is open. This is due to the fact that the
> > haswell-dsp suspends its I2S MCLK before the RT5677 suspends which
> > causes the writes and reads to become corrupted as a result. Any
> > recommendations to correct this behaviour would be appreciated.
>
> I don't get what 'suspend' and 'stream' refer to. is this pm_runtime,
> s2idle, system capture, SPI capture?
>
> Can you elaborate on the sequence?
Definitely can,

   1. open hotwording pcm with arecord in non-blocking mode
      - Codec won't send any data over SPI until the hotword is detected
   2. put system into S3 (see order of callbacks as follows)
      1. HSW DSP suspended which suspends stops I2S MCLK
      2. RT5677 suspended, all pm writes are lost due to the fact that the
      codec is still in DSP mode but has no clock
   3. System resumes and fails to restore the RT5677 due to the fact that
   the regmap is now out of sync

The rt5677 needs to suspend before the haswell dsp but I am not sure how to
schedule that appropriately. The reason this worked in Samus is because it
launched with a 3.14 kernel which did not
have 0d2135ecadb0b2eec5338a7587ba29724ddf612b ("ASoC: Intel: Work around to
fix HW D3 potential crash issue") which powers down the MCLK when the
haswell DSP is not in use.

Hope that clears things up.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
