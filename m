Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A84673EC7
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 17:28:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E8702D9B;
	Thu, 19 Jan 2023 17:27:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E8702D9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674145707;
	bh=EzV80YrxebRUHuKIKvpev2GAI8oUOLaQkTdDBDXUvOI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HrBerDQTtWkswmwd/p/e+0uRLiuad6tii7fMW6x0Ukz9yKuBviKEA4y9Sp+yej7Sn
	 eRLzt/7cZunRE+uukuUX7yzbndVg+TbGQ9LM8Y9s4hF6jGxqC1rvJc2TQP22v+lUPc
	 pObVpReU1TxEheleNYw+vNjhBP0hFPJdLX7uH/Xw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FD76F80083;
	Thu, 19 Jan 2023 17:27:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A94EF8047B; Thu, 19 Jan 2023 17:27:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5014CF8024D
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 17:27:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5014CF8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EmWpQzIY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674145646; x=1705681646;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=EzV80YrxebRUHuKIKvpev2GAI8oUOLaQkTdDBDXUvOI=;
 b=EmWpQzIYBA+WNRAVjZA35VywAci1qD6G9DixpQq91kzFu/IQVb8p45dh
 zM0dtbabCMYbUf06SFs1XeetQd/muG2aLb5qT2x0rxeHVN9YOdjT6Ydh7
 14eA2Fp5OogVtNH8g1YaZnQd5RvOfd4BvNYXAvDfT7RblmH7zjtBuyrNY
 wOJzOvAWB1xAJKYdgAcYn1qWfD46p047jGpId3Bt6KanmDTfKrqmfBal7
 9unHBbL75alzRXZX/HwehmNcXB1CkeIXfDC85XtGRjq5Yf5olnrqHXLz2
 VxgcXp7gPZq01MgTkc/yufs7snsUrS/2PlnElJp643XBSrEtYYWMKr2H0 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="326614550"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="326614550"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 08:27:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="905577374"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="905577374"
Received: from sahamad-mobl1.amr.corp.intel.com (HELO [10.213.187.97])
 ([10.213.187.97])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 08:27:22 -0800
Message-ID: <c45d34ba-1aee-16aa-1ccf-79c43c8c4ed4@linux.intel.com>
Date: Thu, 19 Jan 2023 10:27:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v2 6/8] ASoC: cs42l42: Add Soundwire support
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>
References: <20230118160452.2385494-1-sbinding@opensource.cirrus.com>
 <20230118160452.2385494-7-sbinding@opensource.cirrus.com>
 <33130336-b2ce-330e-fdec-166eee977e13@linux.intel.com>
 <418f6b73-b5ac-8d87-a856-3413ec103f91@opensource.cirrus.com>
 <6ea1b85f-22e2-8744-9638-6321a5a21acf@linux.intel.com>
 <32fd1755-0128-8f32-9a88-a92f1647f903@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <32fd1755-0128-8f32-9a88-a92f1647f903@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


>> You lost me here. Are you saying the soundwire bus clock is only known
>> in the prepare stage?
>>
> 
> hw_params() doesn't know the Soundwire bus clock so it can't do the
> check. We need to wait until we have both the sample rate and the
> chosen SWIRE_CLK.

Yes, makes sense. I forgot that all the stream management and bandwidth
allocation takes place in the prepare stage at the dailink level, and
the dai prepare happens after that. Thanks for the clarification.
