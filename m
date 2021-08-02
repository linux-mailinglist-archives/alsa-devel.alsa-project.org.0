Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B93AF3DDB51
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 16:45:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02DD51728;
	Mon,  2 Aug 2021 16:44:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02DD51728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627915528;
	bh=ieFrG2jT7Njs/bNpK5Egf2zG1YpXSZzwC+Uq0xYPoeI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U7RwUnewvnI+tvMSIzAioGgXEKhN+dSgaAWHBqJWZZ4Kb20EyjK1OPFrhTQVmX7Iq
	 lx8FhGHg5FkACONmCQKqvBp+HdWzjQ4wn4dqSVwQenYf4nQv5tJgVLWUxrNlu7HmvE
	 GLlKgjkuBYT57xY5D9AQNDr91Qu6N7NDhwk+jhXQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B017F801F7;
	Mon,  2 Aug 2021 16:44:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 953D4F80268; Mon,  2 Aug 2021 16:43:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C7FAF8014D
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 16:43:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C7FAF8014D
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="200640123"
X-IronPort-AV: E=Sophos;i="5.84,289,1620716400"; d="scan'208";a="200640123"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 07:43:50 -0700
X-IronPort-AV: E=Sophos;i="5.84,289,1620716400"; d="scan'208";a="436685439"
Received: from skshirsa-mobl1.amr.corp.intel.com (HELO [10.209.189.56])
 ([10.209.189.56])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 07:43:49 -0700
Subject: Re: [PATCH 2/4] soundwire: intel: skip suspend/resume/wake when link
 was not started
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20210727055608.30247-1-yung-chuan.liao@linux.intel.com>
 <20210727055608.30247-3-yung-chuan.liao@linux.intel.com>
 <YQduUIXsoxlaDPsh@matsya>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <18a695a4-08b8-ce72-9e5c-2f7b9812e8f9@linux.intel.com>
Date: Mon, 2 Aug 2021 08:59:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQduUIXsoxlaDPsh@matsya>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 bard.liao@intel.com
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




>> On some HDaudio platforms, SoundWire devices are described in the
>> DSDT but never used. This patch adds a boolean status flag to skip all
>> suspend/resume/wake sequences for this configuration.
> 
> Why are the sdw devices created in this case then? I would assume you
> are detecting this configuration and should skip device creation?

The SDW Linux devices are created during the probe step, based on
information extracted from platform firmware. Since we see a matching
driver, there will be a probe and that driver also contains pm ops.

We only know if the physical peripherals described in ACPI are real or
not during the startup() phase. After the bus reset, SoundWire
peripherals will report as ATTACHED as Device0 and the enumeration starts.

So in these HDaudio cases, we create the Linux devices based on
incorrect ACPI information, but since we detect an HDaudio configuration
we never start the links and the suspend-resume fails.

For a bit of historical context, the decision to handle devices in this
way was not the original proposal from Intel. In the initial patches,
the Linux devices were created when their matching physical peripheral
was showing signs of activity and attached after synchronizing. We
modified this behavior so that a device driver could use out-of-band
signaling to power-up a peripheral so that it could attach. That wasn't
a bad idea, but that also exposes a number of 'ghost devices' that are
not real. And unfortunately the Intel BIOS reference keeps using those
invalid _ADR values...

Does this answer to the question?
