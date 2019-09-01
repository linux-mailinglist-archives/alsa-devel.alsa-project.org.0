Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F133EA5A7E
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2019 17:24:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39D3616C8;
	Mon,  2 Sep 2019 17:23:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39D3616C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567437873;
	bh=qURVnu9dG9DEjdWpFlmFb8mG0p4HJ2a3ScpLVlfwKKY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WWL/U2t34BNzpR9k/nfc5b3FUIUo5yood6Hzrr0onXTPcfLJBMhj8o/4Xk3kvcfXp
	 ik4aVtu/Zbu6YQdU/JLvCYFAfZnFAeWAADbX2QgvosRjIPSYDP3v6JhTTnx8bWUn3a
	 yb1LHUDkAln6q8AoJhFL75GcFvsDsAw+ti4rA2hM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87EB5F8060F;
	Mon,  2 Sep 2019 17:20:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8794FF803D7; Sun,  1 Sep 2019 15:00:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4957EF800D1
 for <alsa-devel@alsa-project.org>; Sun,  1 Sep 2019 15:00:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4957EF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Qf+PO/6d"
Received: by mail-wm1-x343.google.com with SMTP id k2so10357611wmj.4
 for <alsa-devel@alsa-project.org>; Sun, 01 Sep 2019 06:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/kY5ez2UY78GlNnuNQzpPG/veO6d9ypsF/qsZ3kn5iE=;
 b=Qf+PO/6dtwNFaVxqtGJzKTaKniz8RX6ESuac+SqGHXNMJroDYDHse2EpvXnI1uqf1j
 BFOg7dyecrIKQlEXcTKZy2diaA7VNcMszCo2/IL5OLspUAl13UwTCG8IWjkAmcPL9H9n
 kvHwSsgaOB9kHEHzHT5ikPvuq64SnOL1Cx40FuPBcFOUzURaUp2NyFqwmE33tMv8lZKo
 WdA88vtnDPwjExBd6zXOiL9FU5nW+3oy0wiyMaZ+iDKi7j/WBZTMckmQ0Mlwm1vtsYgv
 h3hLM7uWQTVZI53G1+VNqw0iJdQrTC7GiQxyqiYPofVd5jgNMIc5iPNyLIxsLLv1JpkX
 pSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=/kY5ez2UY78GlNnuNQzpPG/veO6d9ypsF/qsZ3kn5iE=;
 b=Hc8K2dOzFnpUxygpF286fX+og5VVifIqsZ+HkZdxcqy67Y2uJR/uEwCetKfyBSqqVc
 PrewbpfULtjV9yzhmFujdrs6xbnKDaHJVDlBLvTtCaqr/MEMmZDrCgFrLkbVpJGwwu6h
 gtKElqQdzDJ+Nl/X4sj7o+kCpp8GppM7ElvK4gkWkzUD5JcIUpAyKVsqBrc1S29/8J4u
 R7F97QDkHBtXvSTbdCvli6O/ZefKdUdDe0kFqQGPxuih0VIb/Zfk//GHDDdLVNSI/Z5a
 qStMj/epOpz41xudA7hpCCecKwxUXtOj/nG974nFxEZEOvKX8f49mZBvYVvuslJVSD8C
 A/WQ==
X-Gm-Message-State: APjAAAWSZD8NQ5zs6CsYJOBxemNFnMtmEmvKyR/X0EWYdmWhr/pxe6t2
 CNYc3KA+Xe9NQx6vCJ1Z2gE=
X-Google-Smtp-Source: APXvYqyhivmpE3lMGP6u1JMIOvrjJ4rxcsVaL4kw5hjjdftxOOcZ52sYnbiN8SIqnrz1+BPycOIUSg==
X-Received: by 2002:a1c:9d0b:: with SMTP id g11mr29085302wme.22.1567342830477; 
 Sun, 01 Sep 2019 06:00:30 -0700 (PDT)
Received: from eldamar (host85-134-dynamic.30-79-r.retail.telecomitalia.it.
 [79.30.134.85])
 by smtp.gmail.com with ESMTPSA id o11sm11093069wrw.19.2019.09.01.06.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2019 06:00:29 -0700 (PDT)
Date: Sun, 1 Sep 2019 15:00:28 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Hui Peng <benquike@gmail.com>
Message-ID: <20190901130028.GB23334@eldamar.local>
References: <20190830214730.27842-1-benquike@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190830214730.27842-1-benquike@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 02 Sep 2019 17:20:13 +0200
Cc: Mathias Payer <mathias.payer@nebelwelt.net>, alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wenwen Wang <wang6495@umn.edu>, Takashi Iwai <tiwai@suse.com>,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 2/2] Fix a stack buffer overflow bug in
	check_input_term
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

Hi Hui,

On Fri, Aug 30, 2019 at 05:47:29PM -0400, Hui Peng wrote:
> `check_input_term` recursively calls itself with input from
> device side (e.g., uac_input_terminal_descriptor.bCSourceID)
> as argument (id). In `check_input_term`, if `check_input_term`
> is called with the same `id` argument as the caller, it triggers
> endless recursive call, resulting kernel space stack overflow.
> 
> This patch fixes the bug by adding a bitmap to `struct mixer_build`
> to keep track of the checked ids and stop the execution if some id
> has been checked (similar to how parse_audio_unit handles unitid
> argument).
> 
> CVE: CVE-2018-15118

Similar to the previous one, this should be CVE-2019-15118 as far I
can tell.

Regards,
Salvatore
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
