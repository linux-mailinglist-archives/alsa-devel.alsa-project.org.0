Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0CD1B1555
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 21:04:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1C43168E;
	Mon, 20 Apr 2020 21:04:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1C43168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587409496;
	bh=3bHtnjsSvJCGJtGe05yww5+GqcaKc4h5OBV50/ZW1P0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SQTDFCfwrSvDFo5I6WDG/rkJYcsvElETw17nG0JIhu9xHwrCxDC+nuIuqim9KbWni
	 XbWH7hZtfd3lKy638ojXVBzCTCLoz1Fbb2nBQ1rr2HbUwXgJoHwRFxvNILXuMpyr64
	 xEVbifCVGaVQfI+eGR3bAtF0pBIOEd+r+oX+FtHU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED0FFF801D9;
	Mon, 20 Apr 2020 21:03:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBC54F801D9; Mon, 20 Apr 2020 21:03:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C188F8012F
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 21:03:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C188F8012F
IronPort-SDR: qE5JripPYCqQ/yjPTAkZ4dUzklyrokJxIjBgCkyw5OhfhsNkkdcS1jkbduxHeQwasnKuzvCdlX
 J7ztQg1qSOpw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 12:03:04 -0700
IronPort-SDR: A86NY6IMNrtdOxYbx6uvzrDUxMvv8hjuyd4JGFl98tcYSlTocBf9zwjDHQYSMmS1ccNf2aUQzB
 nRrp0yOMXLmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,407,1580803200"; d="scan'208";a="273273893"
Received: from ktseng-mobl1.amr.corp.intel.com (HELO [10.255.68.120])
 ([10.255.68.120])
 by orsmga002.jf.intel.com with ESMTP; 20 Apr 2020 12:03:03 -0700
Subject: Re: [PATCH 1/2] ASoC: SOF: Fix "no reply expected" error during
 firmware-boot
To: Mark Brown <broonie@kernel.org>
References: <20200402184948.3014-1-hdegoede@redhat.com>
 <1ecf6c31-4eb1-0288-2353-7a7a421fe5e7@linux.intel.com>
 <a0d5d95e-113b-3543-cfc5-43dfa3f9142c@redhat.com>
 <be66d657-f4c5-46d8-d0b5-4879d7aa7463@linux.intel.com>
 <20200420124815.GB10045@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <84764e4c-8077-15b6-ff4c-9d002d42734a@linux.intel.com>
Date: Mon, 20 Apr 2020 10:17:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200420124815.GB10045@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
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



On 4/20/20 7:48 AM, Mark Brown wrote:
> On Fri, Apr 03, 2020 at 08:17:32AM -0500, Pierre-Louis Bossart wrote:
>> On 4/3/20 3:01 AM, Hans de Goede wrote:
> 
>>> That commit is not in Torvald's tree yet, but it is in
>>> broonie/sound.git, I've cherry picked it into my local tree
>>> and reverted my own fix.
> 
>>> Unfortunately even with that patch cherry picked the errors my
>>> patch silences still happen.
> 
>> Ok, we'll look into it. Give us a couple of days on this one, thanks!
> 
> It's been more than a few days now...

Sorry about the delay, on my side I don't see this anymore in my 
ApolloLake or CML tests. Kai, can you confirm for HDaudio platforms?
