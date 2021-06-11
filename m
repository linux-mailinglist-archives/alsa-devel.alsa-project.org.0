Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 085B33A468B
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jun 2021 18:32:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B0101AA2;
	Fri, 11 Jun 2021 18:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B0101AA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623429163;
	bh=llEI8ye8avHDxvCkGukAM+gBct9hj3NEmRZbIuig5vI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hvgXpbreKNhTun5Zky2j8PGMUeBOWE/d04ManavnQoxVgDJ//wlJjxxoMIdiX1z5U
	 V3Vt90RAcaqoiMKGiwRCF4Td+Q5tLfs52kXdKBivPg2XR2wT1Wv8oeEtk+1o5U0GQ/
	 1wLSe7sFlIiCEYcU/heEbXRMzDWT1egZ9br1MEWE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7A5BF80149;
	Fri, 11 Jun 2021 18:31:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 964D5F8026C; Fri, 11 Jun 2021 18:31:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 778A9F800FC
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 18:31:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 778A9F800FC
IronPort-SDR: 0M7JviTUa8YcRONbZfrX4AHi47qudoDCkQsOrk5sZS8OZ3ffkBd7sCr7gMcN+LkVLuqpWRNOzB
 oMpWW6pvOrXQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10012"; a="205375112"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="205375112"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 09:30:57 -0700
IronPort-SDR: bz2/jPHh6/RFMVL0x/CxUZM8KyFANikVswvchtuMUfZ6CfYf1BEx2HDQkzWQ9V9RnjFupBsqz3
 inXjTBj3VWGA==
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="638743845"
Received: from dcpalomx-mobl4.amr.corp.intel.com (HELO [10.209.153.29])
 ([10.209.153.29])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 09:30:57 -0700
Subject: Re: [PATCH 0/8] ASoC: SOF: power optimizations for HDaudio platforms
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <20210610205326.1176400-1-pierre-louis.bossart@linux.intel.com>
 <s5hczss96jp.wl-tiwai@suse.de>
 <482fc9a8-3a27-2e5d-f280-c891832eb467@perex.cz>
 <eda25058-5a19-31e9-d012-627c2afe88f1@linux.intel.com>
 <1f71ec67-041e-d2fc-3527-5542d8982e00@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6f8c8799-2602-a5a2-cf38-cc6a11eac593@linux.intel.com>
Date: Fri, 11 Jun 2021 11:30:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1f71ec67-041e-d2fc-3527-5542d8982e00@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
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


> Perhaps, it may be acceptable to add a global control enum (to the control
> API) for the ALSA card which may modify the driver behaviour / settings at
> runtime (normal operation, battery saving operation etc.). This control can be
> set in the UCM config. In this way, we don't need to touch the PCM API for the
> user space at all.

If there was a mechanism based on ALSA controls for an application to 
query capabilities and set what it want to disable that would be fine. 
hwdep would be fine as well.

I don't get though how this could be 'set in the UCM config', different 
apps might have different needs. UCM files don't currently make 
assumptions on which application uses them, do they?
