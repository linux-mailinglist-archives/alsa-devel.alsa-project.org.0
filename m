Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCDA5EF805
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 16:53:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28C6F15DC;
	Thu, 29 Sep 2022 16:52:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28C6F15DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664463207;
	bh=T/hYkto10LV4V6M7Q2AASMh2H6NPZuC5vSxnWGdZQAM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mnD0tYPiZV9zqQ+bKFlutk2HAq8nVHvbEXflv4LVJBUMeOtW6/PGa5LrRkpGnzRov
	 qUnswcpDP2kbkspuz49vTwUPU9u5rlDzswbnH5ewHSiOmfNmAKlt6GiHCSiYgJRAcN
	 eDHvS2M6Sg0o9Yar2mmO3nQZHnE0+LLTWAlFRcuc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 984FDF803DD;
	Thu, 29 Sep 2022 16:52:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49C6EF8023A; Thu, 29 Sep 2022 16:52:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODYSUB_4,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 196F8F800AA
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 16:52:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 196F8F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eFO3ZKn1"
Received: by mail-yb1-xb32.google.com with SMTP id u64so1847741ybb.1
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 07:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=cRiBROZUMZ4RO1YIJbO8on2J/l8wLjUeU2JeFbV/Dvg=;
 b=eFO3ZKn17a9Nj2KMJ8BZuiEauUPP79eUL5Y7Zv0Hzr0lDCsgTlwMY/0l73LiYi04rM
 gYaOIBg3gFAHROiXHTBzeXAP4tCXrJvo8yr5k+y2ZCxASsBbA/V3IDXSPTCK1kC8shhQ
 Dr7MjVdxXmZ2jRtmlOuJPM+M5WLuJ+4amXMd4hV3sLKoqyf5MkvHrHACqpSuKTbqm0Ln
 lemZ/qdspDaWj9mzKCY4lK/hx6svh6vslyL//6GwGuJjQuvMhSOn1AUJ+jmUQMQHpdWH
 NVn+6AQ/ce7DwhxKijlcZXDlK7SydJI1qw4WssR0RWd2aVl5niuGHyLWsLq+bbWaIyv1
 e/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=cRiBROZUMZ4RO1YIJbO8on2J/l8wLjUeU2JeFbV/Dvg=;
 b=CFBC+Nt4USPjM6/W9s9vaiCfBW+DayXt5v+I+u0RKKoslDD2+BfQgkzSEZCnNEyeew
 DsbFKX1PqyIPIpye5rP6phS3M2DPifkis0BdivniXh9A4Chj6FKGVTBGCQQvcUN25GGT
 7u8WzXJFxtRVAuy7MqMqrxes4EHkwfoBWRlCSjM+ekXrSSN6Ak5QAENSJolZ6nrbTsVn
 RTSUmtHbQ9VXEaCscBsXv6kk40vhkmz36XVgF6hIc1oKXeCVUlfYG5J59LkXdUMUH7qP
 XaBiH36FZwVC7EATDGXyoBNrrgpC91rtJOEPek+o+0rat0Mn9XIrWBfFCdsug2ZlPqsP
 SjTQ==
X-Gm-Message-State: ACrzQf2sRmoG5DfUbl2RaCJpfnOAlLm+USTpV85clfeVItrM2gUkCjo0
 tDK9H/t7nVg1HVJpzyBAsqH9r4Mt1z91/vTahZw=
X-Google-Smtp-Source: AMsMyM4Pi401HcDMszsbINvIGNY9kue/h+QmEV05duXd1FVwVyf/RPxdSYURZclHgFbv9ejyeh+1r9ZeeoulZaxXy+A=
X-Received: by 2002:a25:730a:0:b0:6bc:dbd6:8278 with SMTP id
 o10-20020a25730a000000b006bcdbd68278mr223301ybc.155.1664463140548; Thu, 29
 Sep 2022 07:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAFcO6XNk5Wtjju=DBOcJr46miBbaWT7jL+zjhWMp+xnz7k5K9A@mail.gmail.com>
 <87v8pa306x.wl-tiwai@suse.de>
 <CAFcO6XP2MpiAsF7YXYjgh7FMq+hyzFJjK8iBf=ccZ2B6BpNvOg@mail.gmail.com>
 <87leq6gglm.wl-tiwai@suse.de>
In-Reply-To: <87leq6gglm.wl-tiwai@suse.de>
From: butt3rflyh4ck <butterflyhuangxx@gmail.com>
Date: Thu, 29 Sep 2022 22:52:10 +0800
Message-ID: <CAFcO6XNsqKCzNBiBF4eYyh+RCSGBp_5HSzxF0gw0kgfQ2FDAiQ@mail.gmail.com>
Subject: Re: A divide error bug in snd_pcm_write
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, broonie@kernel.org
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

This one fixes the problem.
https://lore.kernel.org/all/20220926135558.26580-2-tiwai@suse.de/

Regards,
 butt3rflyh4ck.

On Tue, Sep 27, 2022 at 2:01 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 26 Sep 2022 19:16:48 +0200,
> butt3rflyh4ck wrote:
> >
> > The latest kernel upstream.
> > Yes, but using mmap, you can map the runtime->status page, and then
> > copy the data through memcpy to overwrite the status->state data, or
> > even more, which is incredible.
>
> Ah, then that's exactly the case my latest patch set covers.
> Either the first patch or the second patch alone should work.
>   https://lore.kernel.org/r/20220926135558.26580-2-tiwai@suse.de
>   https://lore.kernel.org/r/20220926135558.26580-3-tiwai@suse.de
>
> Could you verify either of them fixes the problem?
>
>
> thanks,
>
> Takashi



-- 
Active Defense Lab of Venustech
