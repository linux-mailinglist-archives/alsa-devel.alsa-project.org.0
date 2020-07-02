Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6646A2128DE
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 18:02:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FBF316D4;
	Thu,  2 Jul 2020 18:02:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FBF316D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593705773;
	bh=FLZqBVet7K75fj6AJh6V9jGprxEeprN+xoZ3u1+4xpo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=axSLrTusfnED8OLzZQbetvA/5KCPcfc70bUhIbizRcW839A4UdoqOIKNvYc59SM+/
	 qRx95UMg7UnvwSc5YOUiyulO5ikiJ1VtB6Lf8V+Y8glkV0wmuUMMb4O0QkXwBYmAbz
	 6DTzsoPMFcXb/zjDJpUTaLO/8E2xebmPeNvl6MS8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19740F80245;
	Thu,  2 Jul 2020 18:01:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42309F8022D; Thu,  2 Jul 2020 18:01:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97EE4F800C1;
 Thu,  2 Jul 2020 18:01:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97EE4F800C1
IronPort-SDR: OXxJOqlm4mohs0B/im6uzLj5rUtQOc/kbgvGYFJMvGfc7GxZFRQw//GhP3Pn7yTfRlqg/PgdnD
 kflL8ePAy/hg==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="144453362"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="144453362"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 09:00:58 -0700
IronPort-SDR: uhwaa7uGNaoqs+PK3xjQnx7NweL6s2+zvtP9lCnnjnKJs+Ggylown6aJ0ORyzmj9w3md68k77K
 CwvEPA5TFikA==
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="304292241"
Received: from nchava-mobl1.amr.corp.intel.com (HELO [10.252.135.144])
 ([10.252.135.144])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 09:00:58 -0700
Subject: Re: [PATCH AUTOSEL 5.7 15/53] ASoC: SOF: Intel: add PCI IDs for ICL-H
 and TGL-H
To: Mark Brown <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>
References: <20200702012202.2700645-1-sashal@kernel.org>
 <20200702012202.2700645-15-sashal@kernel.org>
 <20200702111835.GB4483@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0baf17f3-1af8-a4a1-644c-ab27490f9b44@linux.intel.com>
Date: Thu, 2 Jul 2020 10:42:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200702111835.GB4483@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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



On 7/2/20 6:18 AM, Mark Brown wrote:
> On Wed, Jul 01, 2020 at 09:21:24PM -0400, Sasha Levin wrote:
>> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>
>> [ Upstream commit c8d2e2bfaeffa0f914330e8b4e45b986c8d30b58 ]
>>
>> Usually the DSP is not traditionally enabled on H skews but this might
>> be used moving forward.
> 
> "This might be used moving forward"?

There are two conditions for the SOF driver to be used in a distro:
a) the DSP needs to be enabled (as reported by the pci class info)
b) sound/hda/intel-dsp-config.c needs to contain a quirk to select SOF 
over the legacy HDaudio, such as presence of DMIC/SoundWire or a known 
vendor DMI.

Traditionally for desktops neither a) nor b) are true, but this is 
changing: we will start adding quirks for specific product lines as 
requested by OEMs.

Does this answer to your question?
