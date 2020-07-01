Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6410021132A
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 21:01:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED2B71677;
	Wed,  1 Jul 2020 21:00:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED2B71677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593630096;
	bh=C161OkzLaRX+Ew9ReET5s3fLtiMbfgqjofngxPs30eY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eZRWmFYo5iygEnk4YoQFcdFwA2aQo+PQw25qsF3LdL+Z/8WwEaTZ/hGaMfkS/s+0r
	 iEUUXBESd2GpSP34HipjPZVgGLF2fANy2yaPd9rFZmgR8VTZGw3T54US0X+fAg7uun
	 ISKxbso9lSdzbieiZ5C1Bn5qCldJx44geyWW7pvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24B9AF800C1;
	Wed,  1 Jul 2020 20:59:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AD5DF8020C; Wed,  1 Jul 2020 20:59:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_65,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65873F800EA
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 20:59:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65873F800EA
IronPort-SDR: YDpJALzNxsrX4peO1C+y4Un8xAR1TWY9nulBK5AdIe3Y6uldKot8wl/ZbhRUwlcScKn+asK3MC
 NHtez8SWSE7Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="208203255"
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="208203255"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:59:45 -0700
IronPort-SDR: FbYgM52SZp7HjyrdcMVB5595JySA4MomzSec+Lito5ZUCJDaGoF3dXwQoeax93+YkdhDpgZQwV
 FC9+ni/4NgEQ==
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="266835273"
Received: from sawhitac-mobl.amr.corp.intel.com (HELO [10.254.111.76])
 ([10.254.111.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:59:44 -0700
Subject: Re: [PATCH 2/2] ASoC: Intel: atom: fix 'defined but not used' warning
To: Mark Brown <broonie@kernel.org>
References: <20200701183716.83314-1-pierre-louis.bossart@linux.intel.com>
 <20200701183716.83314-3-pierre-louis.bossart@linux.intel.com>
 <20200701184450.GB3776@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <882693f9-554a-2ec2-8960-af33e02f807e@linux.intel.com>
Date: Wed, 1 Jul 2020 13:59:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200701184450.GB3776@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
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



On 7/1/20 1:44 PM, Mark Brown wrote:
> On Wed, Jul 01, 2020 at 01:37:16PM -0500, Pierre-Louis Bossart wrote:
>> Fix W=1 warning. The VOIP controls were not used in the mainline but
>> in special versions of Android. Keep and use __maybe_used to make
>> warning go away.
> 
> Why not just remove them?

You'll see a lot of patches where tools report variables/tables as not 
used, or not really necessary, it's not clear to me how to deal with 
such cases, so I preferred to err on the side of caution.

I honestly don't know if those products are maintained and by whom. I 
personally have no issue removing this variable, but I've been surprised 
to see 'old' products get a kernel upgrade so when in doubt...




