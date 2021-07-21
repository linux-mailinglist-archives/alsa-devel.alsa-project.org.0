Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD74D3D0F8B
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jul 2021 15:30:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CCFB16D9;
	Wed, 21 Jul 2021 15:29:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CCFB16D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626874223;
	bh=8JVdSyA1jd4fYmrVLt78N5Nm0skeorfUzsNraSoX4ig=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kqMAvAuaKlzi4nt0B/zwdIhV9Ef9T5B5Kcez/miDbRbf5E3R4B9NavxhxO9KpTFOv
	 HmuOEojHhvg+rGwpr81py2fXiPFWLjlj75CVT+ddzow4PAOC4wV7lgi5u7OFZb67f4
	 O5BwTikY50XCUx0gvWnQAdh2nhZxho19Qs8qmlC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D1B9F800FD;
	Wed, 21 Jul 2021 15:28:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE82DF804AC; Wed, 21 Jul 2021 15:28:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C21D7F800FD
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 15:28:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C21D7F800FD
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="211432734"
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="211432734"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 06:28:21 -0700
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="662114672"
Received: from tamoore1-mobl3.amr.corp.intel.com (HELO [10.209.131.176])
 ([10.209.131.176])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 06:28:20 -0700
Subject: Re: [PATCH 1/3] ASoC: SOF: Parse fw/tplg filename from DT
To: Mark Brown <broonie@kernel.org>
References: <20210715141802.880911-1-daniel.baluta@oss.nxp.com>
 <20210715141802.880911-2-daniel.baluta@oss.nxp.com>
 <20210715143906.GD4590@sirena.org.uk>
 <CAEnQRZCdSLoaLVZ7-jtufgZCG6QshMwdfyJy_4oE6cXRbA5H8A@mail.gmail.com>
 <CAEnQRZCiC5aGK6AsD0TN5fzN6AxFn6=f8hCrd2B9fhCYfCFOSg@mail.gmail.com>
 <bd85ea7c-e9b5-de67-07ce-7104a1e19805@linux.intel.com>
 <20210721125912.GE4259@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <eb98c10a-cc04-dbcf-b5cf-511703dc22fb@linux.intel.com>
Date: Wed, 21 Jul 2021 08:28:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721125912.GE4259@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Daniel Baluta <daniel.baluta@nxp.com>
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


> Please fix your mail client to word wrap within paragraphs at something
> substantially less than 80 columns.  Doing this makes your messages much
> easier to read and reply to.

Oops.

>> - we currently don't support 'shipping the topology and firmware
>> bundled up in a single image to avoid them getting out of sync'. No
>> idea how that might work.
> 
> Seems like it'd be trivial to arrange in the kernel, or with userspace
> firmware loading the loader could do the unpacking.

I think we can bundle the firmware inside of the kernel image itself,
but we've never tried so it doesn't work by default.
I don't know what userspace loading means, we rely on request_firmware
and don't assume any specific support from userspace.

>> - if the machine driver is specified in DeviceTree, then the topology
>> used is *required* to be aligned with the machine driver. The rules
>> are that a topology may not make references to a BE dailink exposed in
>> the machine driver, but conversely if the topology makes a reference
>> to a BE dailink that is not exposed in the machine driver the topology
>> parsing will fail. It's one of the current weaknesses of
>> topology-based solutions, we have non-configurable hardware-related
>> things that are described in topology but should really be described
>> in platform firmware, be it ACPI or DT, and provided to the topology.
> 
> That seems like an orthogonal issue here?  The requirement for a
> firmware that's joined up with the hardware (and system description)
> that it's being used with exists regardless of how we rename things.

It's not completely orthogonal. The topology currently defines e.g. the
I2S interface index, Mclk, bclk, fsync, etc, and my point is that these
bits of information are completely related to the hardware and should
probably come from platform firmware/ACPI.

The topology framework currently provides too much freedom to
developers, it's fine to add new pipelines, PCM devices and new
processing, but when it comes to the hardware interfaces the topology is
completely constrained. I've been arguing for a while now that the
dailink descriptions and configurations should be treated as an input to
the topology, not something that the topology can configure. I don't
know how many issues we had to deal with because the topology settings
were not supported by the hardware, or mismatches between topology and
machine drivers (missing dailinks, bad dailink index, etc).

