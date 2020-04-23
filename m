Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0718A1B62E3
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 20:05:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A82AA1699;
	Thu, 23 Apr 2020 20:04:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A82AA1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587665115;
	bh=odQMHGb0xgrnM72+ojR6fIJdUhN4z7P2hcCAlvaqptc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U/plFHDD95CBkXR3/j9/XH7e+Qx73RiIwqT9r0/0M7TlOE2Db7lJ6FJqZA8ypfUD5
	 jHcQ86XoLJ5kWCvijxWTigulbfErxfsSnPIiekTL0NGxYemnMBMRQ1Aa2/q+wVVXuz
	 t75uHalfhn1A0gEkkbXrizE341qcgjSwSdXD2j8I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3D71F80121;
	Thu, 23 Apr 2020 20:03:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF0B6F801EC; Thu, 23 Apr 2020 20:03:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22CC2F80121
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 20:03:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22CC2F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Tg9MY5If"
Received: by mail-ot1-x343.google.com with SMTP id e26so7696400otr.2
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 11:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=2/La/wL+coGvWMbmb0Ahh27fgATuogd6ONJOHlv/dXo=;
 b=Tg9MY5IfCmtOyZv1E5YaI5u48Aa0GMq/n5vgn6qgR8RcoRuTAN1Qo1NsHyK/nMM3Gy
 qMdC3Bhh6992NB/VIAeWF7jbJu0LzSYmftkF1HfzL9aJ+waynEJ9J2rNGG0E0TMIrCqj
 0AzADq5Sj6hhv/qw2Bl/rUgD/qXP34J3I9S0FfmYz2+oQrXX+KZ6Gk7mMjzkalhLh5f1
 zo4Jx7tsl8G9t9Gq5EPJQq73lyDrZXMHDPiontp3cJTfRD0GmPz9IV62njpsNqQstTnn
 G/M7E+Q7xyhDE1qHGtBGMLzOZzqfPg09sCNweKst45W1nP7dmbNwsPa1R1eKARjN04K5
 pxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=2/La/wL+coGvWMbmb0Ahh27fgATuogd6ONJOHlv/dXo=;
 b=PsSsHUx7ti+LD4xXshnUKPp8Jtj7X9yTQ3BSD1UVCYMzRtLbJQ8Nb6KBPsNiadBy0f
 aobchu54Rhp9lpSUdF/XMwEdEGKWRyYddWbiA9dXvxfelecX6qO4ZC8lks8YzurmMIoy
 MgXZtkxJsAonHxYO3OO639n+YjMe4szGCsFtnTpraIfUz6ECLOQwA/nLrHvbAv8sEQWq
 yZzKtntmmhlssu09Y58/yBErDdJtU+Nc5WfiCf2sejeE84KsgbDRnaw7TMbFAY7zCSW0
 wg7Au/vH7Gnja24OjFPN6WgGUZO2Y+iaKOIKHBonGA8vMiQGfqB8f5Uo7HRs/Gc50tb4
 Cv1w==
X-Gm-Message-State: AGi0PuYWxIAxianKYJYO/rw9uVnMG/ebTAAtS1dTF4GbclxPDT0ViJCx
 9Pw+4l+Vq78kHIbfoBq3npE=
X-Google-Smtp-Source: APiQypJlwGEDo4ccJA0eOVTEQHvZXXtJkUFC/LyKTI7ERYuXNAKD6DnV8AQGRPy0ysr79IcclNc3pw==
X-Received: by 2002:aca:2b0a:: with SMTP id i10mr4075605oik.22.1587665005382; 
 Thu, 23 Apr 2020 11:03:25 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id g13sm767144otk.62.2020.04.23.11.03.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Apr 2020 11:03:24 -0700 (PDT)
Date: Thu, 23 Apr 2020 11:03:23 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH -next] soundwire: intel: Make sdw_intel_init static
Message-ID: <20200423180323.GA18440@ubuntu-s3-xlarge-x86>
References: <20200410115708.27708-1-yuehaibing@huawei.com>
 <20200420071212.GV72691@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200420071212.GV72691@vkoul-mobl>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: sanyog.r.kale@intel.com, YueHaibing <yuehaibing@huawei.com>,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Mon, Apr 20, 2020 at 12:42:12PM +0530, Vinod Koul wrote:
> On 10-04-20, 19:57, YueHaibing wrote:
> > Fix sparse warning:
> > 
> > drivers/soundwire/intel_init.c:193:6: warning:
> >  symbol 'sdw_intel_init' was not declared. Should it be static?
> 
> Applied, thanks
> 
> -- 
> ~Vinod

Why was this applied? It replaces one warning with another (that is
actually visible during a normal kernel build):

$ make -j$(nproc) -s allyesconfig drivers/soundwire/intel_init.o
drivers/soundwire/intel_init.c:193:14: warning: ‘sdw_intel_init’ defined
but not used [-Wunused-function]
 static void *sdw_intel_init(acpi_handle *parent_handle,
               ^~~~~~~~~~~~~~

Cheers,
Nathan
