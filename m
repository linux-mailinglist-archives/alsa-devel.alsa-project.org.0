Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 976F0581612
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 17:07:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD0E186E;
	Tue, 26 Jul 2022 17:07:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD0E186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658848074;
	bh=yok4uHt7PsQrOxWrRFJ3wPkzLA0NCV0ZHAExNDm1PFE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ru0aHGjb3qKy+8Aj9/2xDIb4V4v+WyzhpoTGV9PZNf/EWm0adNW4gFc/T/p757JPP
	 Z6xip/iO8t9m6O5FnKEPJmMCoTt7S8zzX6Fe0gXXx+PGY61aH21KB5aAJQpdH8ELlS
	 hSFiZ88qUXzU8i6Ek+Uy/syHJiI9gvPrhDC4W+SM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0D92F80271;
	Tue, 26 Jul 2022 17:06:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BEB9F8025A; Tue, 26 Jul 2022 17:06:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94EB5F80153
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 17:06:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94EB5F80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RGfBv2br"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658848009; x=1690384009;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yok4uHt7PsQrOxWrRFJ3wPkzLA0NCV0ZHAExNDm1PFE=;
 b=RGfBv2braMtbo0Gcrubi30PwGVaUFWKbwAle/ztex7BS+UpSF4s7xcjv
 DhcKDF2qpdD7k9fuMK3BuNxeGP4tEXpZ5UOPVpj+Nc9nM+NpQpYMkPDvx
 X89MPWWTH6Y7fQV1z4Kbgl6/A2ZVpf1mZ6GBUyjnPbV+fY46ry+Zfjq8J
 Y8Mgc64lTsgFuLFpHnYewkifFM5VA0kL/ZGbDgqsXj5Kbyrj8cRaZDAxP
 gFei4ITJ5GFyveEDSFY8z7ujq7hkle/TMiSOYj1j911PM0vD9PNIjC6lC
 xpKHH8NP5e7v5txdSzr4A+BshLP8hPhQLXipmVH5NuVfV+kBp0o5MY4Zd Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10420"; a="268365414"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="268365414"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2022 08:06:32 -0700
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="597054386"
Received: from adamreed-mobl.amr.corp.intel.com (HELO [10.212.70.145])
 ([10.212.70.145])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2022 08:06:31 -0700
Message-ID: <372a1c8c-b70c-c5f9-3a0b-a4d554d5acf2@linux.intel.com>
Date: Tue, 26 Jul 2022 10:06:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/2] ASoC: codecs: add support for ES8326
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220726131747.127992-1-zhuning0077@gmail.com>
 <2f031e44-4d8a-a69f-697f-1bb83ba1f9f9@linux.intel.com>
 <YuAApMG8XbxOoGIv@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <YuAApMG8XbxOoGIv@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 Zhu Ning <zhuning0077@gmail.com>, devicetree@vger.kernel.org, tiwai@suse.com,
 Zhu Ning <zhuning@everest-semi.com>, David Yang <yangxiaohua@everest-semi.com>
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



On 7/26/22 09:56, Mark Brown wrote:
> On Tue, Jul 26, 2022 at 09:06:10AM -0500, Pierre-Louis Bossart wrote:
>> Much improved version, thank you. See additional comments/questions below.
> 
>>> +	regmap_write(es8326->regmap, ES8326_CLK_CTL_01, ES8326_CLK_OFF);
>>> +	regcache_cache_only(es8326->regmap, true);
>>> +	regcache_mark_dirty(es8326->regmap);
>>> +
>>> +	return 0;
>>> +}
> 
>> One question on the interrupt handling: should there be an interrupt
>> disable on suspend and conversely an interrupt enable on resume?
> 
> That shouldn't be needed (in general the interrupt enable/disable stuff
> shouldn't be needed at all).

isn't there a risk of an interrupt being triggered after all the jack
detection resources are disabled?

> 
>>> +	ret = clk_prepare_enable(es8326->mclk);
>>> +	if (ret) {
>>> +		dev_err(&i2c->dev, "unable to enable mclk\n");
>>> +		return ret;
>>> +	}
> 
>> I am not really following what happens if es8326->mclk is NULL. Why
>> would you call clk_prepare_enable() with a NULL pointer? If you look at
>> the code in es8326_set_bias_level(), you do test for that case, so why
>> not here? Something's not right here.
> 
>> Could it be that this is a scope issue? This block should be moved under
>> the scope of the if (!es8236->mclk) test, no?
> 
> The clock API will happily consume NULL clocks (it uses NULL as an
> equivalent to the regulator API's dummy regulator), there's no *need* to
> skip clock handling if you've got a NULL clock.

Right, so the code in es8326_set_bias_level() can remove the tests for a
NULL mclk.
