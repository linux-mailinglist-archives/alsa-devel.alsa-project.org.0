Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BB630B6AC
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 05:48:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 021841775;
	Tue,  2 Feb 2021 05:47:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 021841775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612241283;
	bh=YuyulshcBgDXIxc6tUZMPdtoz3RGyqGTVQuKlffUHh8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FPGdD+SNOIHYhd5Lht0vf+VGIuSPdKo0nwT66x20BLZZbRQFKkn+fjIRcmdiNz0GC
	 bhEXtvm+6GXMjm4i60ZcrlWm5TthWvO/Z0BQckYqyeZf9IKRKq0/4e/fhnjxSXaNu3
	 WAsUKAnW40mcUd9q8vfXGQmE36JPrKWiHYsVQfkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10822F8023C;
	Tue,  2 Feb 2021 05:46:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 991C0F8023B; Tue,  2 Feb 2021 05:46:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 463E9F801F7
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 05:46:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 463E9F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dAcEaxQu"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 196AC64D79;
 Tue,  2 Feb 2021 04:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612241203;
 bh=YuyulshcBgDXIxc6tUZMPdtoz3RGyqGTVQuKlffUHh8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dAcEaxQu+yWFFJ69ocA1gEg0RbwUT/u2dHEO2rAAZudfYVw9kki/9tBuC4bca9Z2G
 /Ok8wL4eOU8A6/X1VH63vcLHTGPyB5mNjtAAtiHvdKhuBBwE4w08+Pdc+rLae1MXpg
 ZiowW7EHmIFCds0aQvnRlolFW+NfxZvnLuYg4W36ZYJ5nNS/tTzUkKjAZ2FtJAQMWw
 h/APXD7lh5SnaaE3TsytzC/GeRxkZ4D9lbvb56sd7jvw92juD/XPytXdkByV/OcsT8
 YfFige1gK0S0F7U4lzRR2xpLIBmjaJPveexj/lOJ7mslGM+ab/a6Shka1FmM1r0ekA
 J+pEXn0uJMbvw==
Date: Tue, 2 Feb 2021 10:16:38 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 4/6] soundwire: qcom: start the clock during initialization
Message-ID: <20210202044638.GK2771@vkoul-mobl>
References: <20210129173248.5941-1-srinivas.kandagatla@linaro.org>
 <20210129173248.5941-5-srinivas.kandagatla@linaro.org>
 <20210201142134.GC2771@vkoul-mobl>
 <bdedf84c-68fd-767d-8b3b-5a6ba03e03d8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdedf84c-68fd-767d-8b3b-5a6ba03e03d8@linaro.org>
Cc: sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com,
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

On 01-02-21, 15:50, Srinivas Kandagatla wrote:
> 
> 
> On 01/02/2021 14:21, Vinod Koul wrote:
> > On 29-01-21, 17:32, Srinivas Kandagatla wrote:
> > > Start the clock during initialization.
> > 
> > A detailed log please, which clock..? Also how do older controllers work
> > w/o this clk
> 
> By default this is ON, however depending on that is not really reliable!
> 
> Explicitly enabling this will make things clear when we add clk pause
> feature for this driver!

lets add this in the log please

-- 
~Vinod
