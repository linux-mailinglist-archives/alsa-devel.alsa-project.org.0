Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47679180771
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 19:53:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E327C167B;
	Tue, 10 Mar 2020 19:52:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E327C167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583866399;
	bh=buCpniZH/2y775kKy5Le8Ahk+gjQesLxoX3Vq8/a3Y0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n7jO+G+iJdOgdBku1Uo42HxwR9r1V8obxIjcCo0tgJIIl3GMqkb23XSvhrDbEmHO6
	 FcrdOoKWgRWOIBrhzXnBriAlwWhOxyfgZMFOLTW2/8jlm7aUQmNscwTSnrB8Ut2Rdf
	 i50yZEoWDHFBWuGRMKHhMXUcHSHQ+VFNf0rMGkA8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31D03F80260;
	Tue, 10 Mar 2020 19:50:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 608B0F800DA; Tue, 10 Mar 2020 19:50:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E12FF800DA
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 19:50:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E12FF800DA
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2020 11:50:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,538,1574150400"; d="scan'208";a="236137124"
Received: from jbose-mobl.amr.corp.intel.com (HELO [10.254.201.59])
 ([10.254.201.59])
 by orsmga008.jf.intel.com with ESMTP; 10 Mar 2020 11:50:02 -0700
Subject: Re: [PATCH 2/3] ASoC: rt5682: fix compilation issues without I2C
To: Mark Brown <broonie@kernel.org>
References: <20200310163509.14466-1-pierre-louis.bossart@linux.intel.com>
 <20200310163509.14466-3-pierre-louis.bossart@linux.intel.com>
 <20200310171929.GM4106@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7bd53344-7bda-e2b3-a819-c05caff15d71@linux.intel.com>
Date: Tue, 10 Mar 2020 13:50:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200310171929.GM4106@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, Oder Chiou <oder_chiou@realtek.com>,
 alsa-devel@alsa-project.org, kbuild test robot <lkp@intel.com>
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



On 3/10/20 12:19 PM, Mark Brown wrote:
> On Tue, Mar 10, 2020 at 11:35:08AM -0500, Pierre-Louis Bossart wrote:
>> Exclude all I2C-related code from compilation to avoid compilation
>> errors and defined but not used warnings.
> 
> I think it would be better to do this by factoring the bus code out into
> a separate file like we've done with I2C and SPI, it's neater than
> ifdefs and easier to get right going forwards.

Agree, this was just a quick fix to solve compilation issues.
