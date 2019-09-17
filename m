Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD4CB5095
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2019 16:40:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62315166A;
	Tue, 17 Sep 2019 16:39:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62315166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568731219;
	bh=av+64Sa/abu24QRwaBgKJC3XlqYGHR8rXOgaLDUuURI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mXrbi1FDYrMSWIolKqmUDdmmxM8NQKAtWvT4nEfI/Vx6i2mgXFUoTdEvHfiLrmQ9z
	 2KuYdLEZ3cMZqbV0dZjEzuK4UzM6i32xPs2oyn4ETkdSoWsSmJmy8mazHtC2rrKjZq
	 2NHUtlyzMrmjVbXYplojXIxyXKcgRE9E/Gyr7fNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5C55F8048E;
	Tue, 17 Sep 2019 16:38:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28B53F80361; Tue, 17 Sep 2019 16:38:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0821EF80146
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 16:38:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0821EF80146
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Sep 2019 07:38:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,516,1559545200"; d="scan'208";a="387578032"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 17 Sep 2019 07:38:27 -0700
Received: from pbossart-mac01.local (unknown [10.251.11.91])
 by linux.intel.com (Postfix) with ESMTP id EDF16580834;
 Tue, 17 Sep 2019 07:38:26 -0700 (PDT)
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20190912142200.8031-1-kai.vehmanen@linux.intel.com>
 <5579b62d-d949-ec62-0a85-45d0842af38f@linux.intel.com>
 <alpine.DEB.2.21.1909171415520.16459@zeliteleevi>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c646b50d-7212-92a2-ce31-71971d88f85c@linux.intel.com>
Date: Tue, 17 Sep 2019 09:38:05 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1909171415520.16459@zeliteleevi>
Content-Language: en-US
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v4 0/9] adapt SOF to use snd-hda-codec-hdmi
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 9/17/19 6:32 AM, Kai Vehmanen wrote:
> Hi,
> 
> On Mon, 16 Sep 2019, Pierre-Louis Bossart wrote:
> 
>> The series looks good to me so
>> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> thank you Pierre and Takashi for the reviews!
> 
>> I would recommend that we have a matching change for the Skylake driver and
>> validation that both SOF and cAVS/SST drivers can operate with this mode set.
>> Our goal is still to have coexistence between the two drivers in a single
>> build/distro, e.g. cAVS for SKL/KBL/APL and SOF for newer platforms. This can
>> be done in a follow-up patch but it needs to be done before distros start
>> selecting this common HDMI mode.
> 
> The current patchset actually does allow that. You can select the common
> HDMI codec in kernel config, build both SOF and SST drivers and based on
> runtime selection of the platform, either SOF with patch_hdmi.c will be
> used or SST with hdac-hdmi. This is achieved by setting the
> common-hdmi-codec mach-params flag in sof/intel/hda.c, so with SST
> drivers, this will never be set.
> 
> To change SST to use patch_hdmi.c as well, is a bigger effort. There
> are more (and much older) platforms impacted by the alsa mixer name
> changes. I'm not sure whether this is worth the trouble. But open to
> ideas here.

If the i915 interface was set in stone yes we could probably leave the 
Skylake driver alone. But there are changes from time to time and bug 
fixes that will require Intel to work on two parts of the tree, so 
really wondering if we shouldn't just move to this common mode across 
the board and remove hdac_hdmi.c. it doesn't need to be done at once but 
it's not that crazy to aim for the next kernel release.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
