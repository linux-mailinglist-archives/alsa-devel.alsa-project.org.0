Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CECA26115C
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 14:30:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F3001750;
	Tue,  8 Sep 2020 14:30:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F3001750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599568255;
	bh=ruj8TeTcCYcqVIo5F1ZROpRfqWJ4OMBHRb+PpsTupt8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dfy2Rc/MPFrM3h5b4G5Cdt+u3suK6GXu1jiFXSDF3dSP/I6xVldvDeRNZP/C72yAc
	 6TxSgZ/RLO9nhPInE3dilfsCANd2GGLyclzsx9KkHTFRO6mESMKitiiWa6DJIWMG1q
	 +jekfzA9DXOmB7yDhi22werS2Cq5dwhuIhi44RxM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7022FF8026F;
	Tue,  8 Sep 2020 14:29:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79696F801F2; Tue,  8 Sep 2020 14:29:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 843EFF8010B
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 14:29:05 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 0E7ADA0055;
 Tue,  8 Sep 2020 14:29:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 0E7ADA0055
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1599568145; bh=kcosKIyrxTELi6uq9lm5YX5Xf7aTeUo9+Do1Y4+8o7A=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Yyq6Ui0q4YG2pmBriEBkRh3OfsWE6UZbY2OMvWhq9BSGI/mDX5tCea3GCTGlkwn/F
 jFIVqT/doKfy+AXLz2tcg3Ca8tkusRYBr/Hkz9krWuDAgzChdfOYd34kvSzdQpLSXc
 8fGQBF5obyA01iRD542jYi17r5hbI3WxntPKBUN0=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  8 Sep 2020 14:28:48 +0200 (CEST)
Subject: Re: [PATCH 1/7] soundwire: bus: use property to set interrupt masks
To: Mark Brown <broonie@kernel.org>
References: <20200818140656.29014-1-yung-chuan.liao@linux.intel.com>
 <20200818140656.29014-2-yung-chuan.liao@linux.intel.com>
 <20200828065125.GI2639@vkoul-mobl>
 <ec5fe867-f2e4-4278-0376-e54bcdd7f94d@perex.cz>
 <20200908121133.GA5551@sirena.org.uk>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <1950b662-ec59-6603-36c7-7a41d9e8460c@perex.cz>
Date: Tue, 8 Sep 2020 14:28:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200908121133.GA5551@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 hui.wang@canonical.com, Vinod Koul <vkoul@kernel.org>,
 srinivas.kandagatla@linaro.org, ranjani.sridharan@linux.intel.com,
 jank@cadence.com, mengdong.lin@intel.com, sanyog.r.kale@intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, rander.wang@linux.intel.com,
 bard.liao@intel.com
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

Dne 08. 09. 20 v 14:11 Mark Brown napsal(a):
> On Tue, Sep 08, 2020 at 02:05:11PM +0200, Jaroslav Kysela wrote:
>> Dne 28. 08. 20 v 8:51 Vinod Koul napsal(a):
> 
>>>>  sound/soc/codecs/rt700-sdw.c    |  4 ++++
>>>>  sound/soc/codecs/rt711-sdw.c    |  4 ++++
>>>>  sound/soc/codecs/rt715-sdw.c    |  4 ++++
>>>>  sound/soc/codecs/wsa881x.c      |  1 +
> 
>>> This touches codecs, can you Ack it please
> 
>> Mark, could you ack the ASoC change to accept this patch via the soundwire repo?
> 
> I don't have this patch and since I seem to get copied on quite a lot of
> soundwire only serieses I just delete them unread mostly.
> 

It can be fetched from lore (mbox format):

https://lore.kernel.org/alsa-devel/20200818140656.29014-2-yung-chuan.liao@linux.intel.com/raw

			Thanks,
				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
