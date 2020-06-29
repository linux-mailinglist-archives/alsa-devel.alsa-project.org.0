Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AC020CE0B
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 13:01:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78769846;
	Mon, 29 Jun 2020 13:00:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78769846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593428495;
	bh=F9yc76dllBQnO/0SNt01rAhctcmIbR2BvDh67iPOI7Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pO8eYp4hJL7MLiKK8w9CSujyuEXnmWRes7Ne71OTlWh/m7VPymXKK0uoEFUw+OoX1
	 HzVqvDUVvFqKo9Zrph8rFnWbF/0ER9Hh1NuPg91yRCAHGIHPFkV19xMlreP+EKp0Co
	 Hp+GnWWtnRtJvCrlE7GPHzVPgWgvZnoKJa+HmzJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CAC5F80096;
	Mon, 29 Jun 2020 12:59:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAA9BF800EA; Mon, 29 Jun 2020 12:59:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0432CF800EA
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 12:59:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0432CF800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="u7i4gLoB"
Received: from localhost (unknown [122.182.251.219])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9026E239ED;
 Mon, 29 Jun 2020 10:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593428384;
 bh=F9yc76dllBQnO/0SNt01rAhctcmIbR2BvDh67iPOI7Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u7i4gLoBFJh8FDswEs4uWCnzV8kp5cBaykYs9RrKg54vCoL3/C0EaOFpjx1DrhjfS
 4mNJ4glCP/jr3gLNi8kdWFWb1vABqEYXsI71Lc4tw/tmxGVS0uQm2WRHvx/eLCmk1m
 b/FFCTozE9w12rAUVRu6J6hMGYAE5c8rVRP+XLHc=
Date: Mon, 29 Jun 2020 16:29:39 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH v4 1/3] ALSA: compress: document the compress audio state
 machine
Message-ID: <20200629105939.GK2599@vkoul-mobl>
References: <20200629075002.11436-1-vkoul@kernel.org>
 <20200629075002.11436-2-vkoul@kernel.org>
 <c29b3199-cebd-2153-5530-e75f76aa8b4b@linux.intel.com>
 <20200629093429.GA2599@vkoul-mobl>
 <3a43467a-5432-a3ef-2250-2ac1054539d0@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a43467a-5432-a3ef-2250-2ac1054539d0@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

On 29-06-20, 12:02, Amadeusz Sławiński wrote:
> On 6/29/2020 11:34 AM, Vinod Koul wrote:
> >
> > Not sure, this is not in the version I posted, arrow is from setup ->
> > prepare. See
> https://lore.kernel.org/alsa-devel/20200629075002.11436-2-vkoul@kernel.org/
> >
> > I don't know how it got reversed in your version, maybe the MUA messed
> > up??
> >
> Ah... I must have edited it myself when preparing edited version, sorry for
> noise ;)

No worries

> 
> > a compr_write() moves from SETUP -> PREPARE. Fixing that above looks
> > better version of mine..
> Yes, I feel it is easier to understand, A redirect confused me for a short
> bit when I first looked at graph and it can be easily avoided.

Thanks for the suggestion, it was a good one indeed, I will send the
update shortly

-- 
~Vinod
