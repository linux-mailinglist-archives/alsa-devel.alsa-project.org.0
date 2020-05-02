Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7AB1C25EF
	for <lists+alsa-devel@lfdr.de>; Sat,  2 May 2020 15:48:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57610168A;
	Sat,  2 May 2020 15:47:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57610168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588427283;
	bh=WLPBfrFHzrvESRQsTHmGqqosrH0f38pZglhziMIG60Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=km3XyGRLMBmv/tjM7Ihnlm3x8vlW345PBTvLyeAgQqMw209gK3XMCCcHIqb56fHeg
	 YxwZPNa86dDxyAd1JexLLXqg3ucuPxANYdFWZg7e/UD3ooBdBOz+083L1iWJOu4huq
	 YrAXDvg54KHZrNLfwEfdBbOx+4Q/e06hVTsSHz7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A59FF800C5;
	Sat,  2 May 2020 15:46:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10F98F801F7; Sat,  2 May 2020 15:46:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8467DF800C5
 for <alsa-devel@alsa-project.org>; Sat,  2 May 2020 15:46:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8467DF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uLFW385m"
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 01EF52071E;
 Sat,  2 May 2020 13:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588427170;
 bh=WLPBfrFHzrvESRQsTHmGqqosrH0f38pZglhziMIG60Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uLFW385mqVmkvrFNgsAy4k37hESslO80u8MjL+zu6gNMGd5Yr19y5cxDeVSQ5XaJu
 af/j678AcWUtir12hnJs1bQQin7J4mHEo61a18aZjWoFiC47uZy039lPBfUZe2/cdm
 gFHzoXD20W6a5oC0Ees2Abxg2kwIhhNailzHs5AQ=
Date: Sat, 2 May 2020 09:46:08 -0400
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.6 45/79] ASoC: meson: axg-card: fix
 codec-to-codec link setup
Message-ID: <20200502134608.GG13035@sasha-vm>
References: <20200430135043.19851-1-sashal@kernel.org>
 <20200430135043.19851-45-sashal@kernel.org>
 <20200430135610.GD4633@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200430135610.GD4633@sirena.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
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

On Thu, Apr 30, 2020 at 02:56:10PM +0100, Mark Brown wrote:
>On Thu, Apr 30, 2020 at 09:50:09AM -0400, Sasha Levin wrote:
>
>> Since the addition of commit 9b5db059366a ("ASoC: soc-pcm: dpcm: Only allow
>> playback/capture if supported"), meson-axg cards which have codec-to-codec
>> links fail to init and Oops:
>
>This clearly describes the issue as only being present after the above
>commit which is not in v5.6.

Uh, I thought that the fixes tag points to the same commit as mentioned
in the description... I'll drop it, sorry.

-- 
Thanks,
Sasha
