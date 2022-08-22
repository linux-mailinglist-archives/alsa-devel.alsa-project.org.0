Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC2759C023
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 15:07:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 038B816B0;
	Mon, 22 Aug 2022 15:06:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 038B816B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661173638;
	bh=G4hBATmLM/5HOkJqWP9Jt5co1zzgbB7M4mIwYzwwRe8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ElpKK2DLGUVIKNRvlgvFZ0SzL2gX8BQ/N5N6Fb2bwTuu4cgZXm6OxteNSAB8+o5J4
	 yrw34qObyKW1SuCexXZKoYZQBFG0Bx73folwgeqkx9RV2+MjI2CT7hny2wIVd4SioY
	 oSky8TzZhVKXC42X/JVfTBFqgpqhD6xHzJxSzbKw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E70EF8026D;
	Mon, 22 Aug 2022 15:06:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D02BAF8026A; Mon, 22 Aug 2022 15:06:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48A86F800ED
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 15:06:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48A86F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Idm7Lp0Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661173571; x=1692709571;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=G4hBATmLM/5HOkJqWP9Jt5co1zzgbB7M4mIwYzwwRe8=;
 b=Idm7Lp0QK/67I07kBiOn70COuBRZ02k0XEje2YhRBLjP0MoytwrDvJud
 MzRrUSD4v4w/EriB0wZeIPUPe9ZNUtJ1oi3K++oRoP9EWmLqr4ctdbm9/
 vLalccjAiETlrDB1oeBG7zWNp/5OCGrvxOHrxk3rwdMfbdXW4hn0/sgqS
 UMWdobBcjHBytRQ4n5eYdAnGu9GIZ+q+oIMHzSy2tT5Y43517x0wTYxIJ
 HNwL+L3Adsura+rll+CoLXHZHP8iI2aT2FwXcT4xocsBqN7lT8J4/3vTA
 czu29UZhMGH6Fsgze7csIyw53c5mg59hf/eqS6wKVXAsnUJeO92ycaslY Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="379698499"
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; d="scan'208";a="379698499"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 06:06:07 -0700
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; d="scan'208";a="712176290"
Received: from mhakkine-mobl4.ger.corp.intel.com (HELO [10.249.43.69])
 ([10.249.43.69])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 06:06:06 -0700
Message-ID: <19b60ea9-6bee-1cc9-5384-89231fce3a99@linux.intel.com>
Date: Mon, 22 Aug 2022 15:06:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH] ASoC: dapm: Export new 'graph.dot' file in debugfs
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>,
 Mark Brown <broonie@kernel.org>
References: <20220822095242.3779-1-povik+lin@cutebit.org>
 <YwN2Pd4Ez08yDFno@sirena.org.uk>
 <3234D74E-0DFF-4BB5-87ED-6135BAC1F31D@cutebit.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <3234D74E-0DFF-4BB5-87ED-6135BAC1F31D@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-kernel@vger.kernel.org
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


>>> Provide a DOT summary of the DAPM graph in a newly added 'graph.dot'
>>> file in debugfs, placed in the card's DAPM directory.
>>
>> There was a tool floating about in the past (last copy I knew about was
>> on Wolfson's git but they took that down) - can we not just continue to
>> do that?
> 
> I don’t know the tool or where would I find it. I think it’s neat
> simply having a ‘graph.dot’ at hand, especially since it requires
> little code. (Although sure there’s the danger of it growing.)

The Chrome folks used an 'asoc_dapm_graph' python script since 2014
according to the copyright information. IIRC it was python2 so might
need a bit of work.

https://chromium.googlesource.com/chromiumos/third_party/adhd/+/refs/heads/master/scripts/asoc_dapm_graph
