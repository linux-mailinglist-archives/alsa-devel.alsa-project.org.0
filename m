Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 510FB402CA6
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Sep 2021 18:10:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B769B1724;
	Tue,  7 Sep 2021 18:09:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B769B1724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631031049;
	bh=3YP64A0QVrscKbS++co+4Zu5o94txm7JJ+mxGb5HeKk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dp/WN9Lpzp0/YFCCW2VKlxHcuN2wSQHC6kvpM0wKGV/a7RH7Apc+wSOWRHWAlScik
	 q+T95wVmRayE1+0pZ+YM2XzCYX4/7NNT2mziPz4Z8wZ0TPyhvV+1LqYo4d1RoTcsch
	 HgjMKHsqFdaZdxUdFxzZWrCbjyTtImTu70Iy/dyE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74D73F80431;
	Tue,  7 Sep 2021 18:09:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B43CCF80224; Tue,  7 Sep 2021 18:09:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CDC0F80103
 for <alsa-devel@alsa-project.org>; Tue,  7 Sep 2021 18:08:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CDC0F80103
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="217081409"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="217081409"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 09:06:06 -0700
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="512893376"
Received: from mrburno-mobl.amr.corp.intel.com (HELO [10.212.10.81])
 ([10.212.10.81])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 09:06:05 -0700
Subject: Re: [PATCH] ASoC: rt1011: add i2s reference control for rt1011
To: Jack Yu <jack.yu@realtek.com>, broonie@kernel.org, lgirdwood@gmail.com
References: <20210906101208.11585-1-jack.yu@realtek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3062f5e5-d2d7-8150-ef89-989af3b4b1d6@linux.intel.com>
Date: Tue, 7 Sep 2021 09:53:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210906101208.11585-1-jack.yu@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lars@metafoo.de,
 kent_chen@realtek.com, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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



On 9/6/21 5:12 AM, Jack Yu wrote:
> Add i2s reference control for rt1011 amp.
> 
> Signed-off-by: Jack Yu <jack.yu@realtek.com>

> +static const char * const rt1011_i2s_ref[] = {
> +	"None", "Left Channel", "Right Channel"
> +};

> +enum {
> +	RT1011_I2S_REF_NONE,
> +	RT1011_I2S_REF_LEFT_CH,
> +	RT1011_I2S_REF_RIGHT_CH,
> +};

is it possible to get Left-Right-mix (mixed on rt1011) and Left-Right
(two channels, with the application selecting what they want)?

