Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 856FF1BCFB9
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 00:17:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF80A168E;
	Wed, 29 Apr 2020 00:16:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF80A168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588112266;
	bh=gmuX42QjqCCslK6htVkysdreqEkbjdIgjunHzJP3Q2o=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IEdpCJ88WNuqmBtNk33t7x1rDq9z0xAJqoy4udNH+CxyVJdgUh6yFCJepf410t6rY
	 VLSDzar4wqlCFdEq0WGhhLaLhnOCo1lvRr2OUSBhIGuY0NjAlqMpc0vb0T9cja78Yo
	 FMn9QjuW1XNzj8Kq3KKMmk8c8+hwdGHjqfR7q9ls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBE62F801EB;
	Wed, 29 Apr 2020 00:16:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 872C5F801DB; Wed, 29 Apr 2020 00:16:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E277F800D2;
 Wed, 29 Apr 2020 00:15:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E277F800D2
IronPort-SDR: 5hYxnq2Ui/anD3jLON/3MbID+zZ9/yVMnO3aXSS+pNEW2HqmFSWKAr8cyl4LorzSMRESBQiIyN
 M29sqhbRNqyA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2020 15:15:48 -0700
IronPort-SDR: eRV6iaBNmKKuN9h0cUBLeme0Sl6sh7Bxij2kPN/7HSwyuHGDVtHBvl9TUo5UT2VOlL6q4wkR8Y
 IizTU+otdEww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,328,1583222400"; d="scan'208";a="249293993"
Received: from asehgal-mobl.amr.corp.intel.com (HELO [10.254.29.183])
 ([10.254.29.183])
 by fmsmga008.fm.intel.com with ESMTP; 28 Apr 2020 15:15:41 -0700
Subject: Re: [PATCH] ASoC: SOF: sort out Kconfig, again
To: Arnd Bergmann <arnd@arndb.de>
References: <20200428212752.2901778-1-arnd@arndb.de>
 <6b39fbba-c65d-2c02-14bf-11c2d00547af@linux.intel.com>
 <CAK8P3a24whg2RhJE3Vf5u3EWy+wvFqhXdp7EQZuQx0shPsMARw@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f91c9a68-7641-beb8-a23e-bd1b9b8d0acb@linux.intel.com>
Date: Tue, 28 Apr 2020 17:15:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a24whg2RhJE3Vf5u3EWy+wvFqhXdp7EQZuQx0shPsMARw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, YueHaibing <yuehaibing@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 sound-open-firmware@alsa-project.org, Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>
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




>> Thanks Arnd, do you mind sharing your config?
> 
> https://pastebin.com/HRX5xi3R

will give it a try, thanks!

>> We noticed last week that
>> there's a depend/select confusion might be simpler to fix, see
>> https://github.com/thesofproject/linux/pull/2047/commits
>>
>> If I look at the first line I see a IMX_DSP=n which looks exactly like
>> what we wanted to fix.
> 
> Yes, I think that fix addresses the build warning as well, but looking
> more closely I don't think it's what you want: If you do this on
> a config that has the IMX_DSP disabled, it would appear to the
> user that you have enabled the drivers, but the actual code is still
> disabled.

Are you sure? we added a select IMX_DSP, so not sure how it can be disabled?
