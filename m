Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A9355F18F
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 00:48:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A46EE852;
	Wed, 29 Jun 2022 00:47:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A46EE852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656456524;
	bh=797b2/M51c0NOtG1ETodHSzNi0Sz/mOOoSI+3jRyEXg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jl9oEeOQbFqdRlC8YIAi5iJDWphMfejQH+3c7RvxjbgejvZOJIfDDP7vkeOiMAeZO
	 +z7km28YksWZwOYHoDCQvtPhpRIxo13dENITu1bXQOIPujki6IqGR4Yxv6UxNQKRM6
	 EdzqhLtJB+K9iUHi4Xm7c9EdiaPEc7+5DUTyPtTs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0644F8025B;
	Wed, 29 Jun 2022 00:47:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0C3BF80167; Wed, 29 Jun 2022 00:47:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE3E5F80107
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 00:47:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE3E5F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="aB5Akobm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656456460; x=1687992460;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=797b2/M51c0NOtG1ETodHSzNi0Sz/mOOoSI+3jRyEXg=;
 b=aB5AkobmnMi6TqSWfYKK+IV7gM39Vw6KHcsHooyKGzaCgENV3k8se7gg
 IcFpQ4BwKmmzooNBbef0SOEOvVGLygL6RS0APGhRMrk1j/Ju8PUstpdaV
 StKVeFsyOWQro7mnzxTla/dJMIC8bo1MOtJ/EIXnZ/8LBlOb/i9CyxhXW
 qLf5jl13/OszVvz1JTOu3BzoQNeqbnnISTG3YJjdTcE2vBVCn5Lf3NzJ/
 YcN34e0RuTQbBH7bmlw3UQgem7VmasQfntP7UiFB0veWPn18NRZ/gZGTV
 wX4FoAO/5fc0ueHOMCBlLsx+QzLGtG5MYHphqq0UtcW/Hm7y312z1HUEH g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="261669469"
X-IronPort-AV: E=Sophos;i="5.92,230,1650956400"; d="scan'208";a="261669469"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 15:47:35 -0700
X-IronPort-AV: E=Sophos;i="5.92,230,1650956400"; d="scan'208";a="680239996"
Received: from spekin-mobl3.amr.corp.intel.com (HELO [10.212.118.51])
 ([10.212.118.51])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 15:47:34 -0700
Message-ID: <18d3e724-e43f-c166-e322-26cc5e3890b7@linux.intel.com>
Date: Tue, 28 Jun 2022 17:47:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: Sound not working after commit
 bbf7d3b1c4f40eb02dd1dffb500ba00b0bff0303 on Amlogic A311D device
Content-Language: en-US
To: Alex Natalsson <harmoniesworlds@gmail.com>
References: <CADs9LoPZH_D+eJ9qjTxSLE5jGyhKsjMN7g2NighZ16biVxsyKw@mail.gmail.com>
 <15259e38-eccf-d294-a330-a48b5bbbdedf@linux.intel.com>
 <CADs9LoN-L0X1Dr1sP2K7xrcWm7dpHW6MhF47c2eBB0moLNnPRQ@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CADs9LoN-L0X1Dr1sP2K7xrcWm7dpHW6MhF47c2eBB0moLNnPRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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



On 6/28/22 17:10, Alex Natalsson wrote:
>> Any chance you could try with an updated kernel? It's not clear to me if
>> this is a real issue or just a warning that's been fixed since by commit.
> 
> I luanching 5.19-rc2 and finding this problem. Then I used git bisect
> and found this commit, which broke my audio system. I don't know maybe
> I have wrong settings, but for me this real problem because sound not
> working....
> 
>> You may also want to open a bugzilla issue
> Yes, I can. If problem not in my config settings.

It's great that you've been able to bisect.

What's surprising is that you have a long list of errors reported before
the kernel oops, e.g.

[  243.188688]  fe.dai-link-1: ASoC: no backend DAIs enabled for
fe.dai-link-1

[  243.188702]  fe.dai-link-1: ASoC: dpcm_fe_dai_prepare() failed (-22)

[  243.188919]  fe.dai-link-1: ASoC: no backend DAIs enabled for
fe.dai-link-1

[  243.188922]  fe.dai-link-1: ASoC: dpcm_fe_dai_prepare() failed (-22)

Did those appear with this commit? That's usually a sign of missing
mixer settings to connect FE and BE, not sure how this would appear
because of change in the locking.

It would also help if you could add dev_err logs in dpcm_be_connect() to
see in which code section the oops occurs. In theory we have all kinds
of checks before calling dpcm_be_connect() but we've obviously missing
something.
