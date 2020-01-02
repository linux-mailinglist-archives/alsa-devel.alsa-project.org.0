Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBB712EB47
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jan 2020 22:23:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA9A816C8;
	Thu,  2 Jan 2020 22:22:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA9A816C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578000221;
	bh=3yMzyI8B53gAyxc4/JZltbsLKmq8lZo0DVmLQV1Alyw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k6dRzkDboSMIW7d+Cr6dC2P1P7XIZH4A4qyLXb3FOAZ+kza8CgVn4hXp7g895XNrv
	 RkH/SQV1Uy6B0NXBILBaZI1ZGxDpJiFOUDxWY7UWqJHSP9MNJlB0gkDuK3M1q7IB2m
	 nqqWTSldVEsH0F3q8jbFoaFiUXm2z4O6O/pFPXfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60017F802A1;
	Thu,  2 Jan 2020 22:18:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73DECF80278; Thu,  2 Jan 2020 22:18:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85B27F8026F
 for <alsa-devel@alsa-project.org>; Thu,  2 Jan 2020 22:18:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85B27F8026F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jan 2020 13:18:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,388,1571727600"; d="scan'208";a="224819867"
Received: from ybabin-mobl1.amr.corp.intel.com (HELO [10.252.139.105])
 ([10.252.139.105])
 by fmsmga001.fm.intel.com with ESMTP; 02 Jan 2020 13:18:36 -0800
To: shumingf@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
References: <20191227054445.27223-1-shumingf@realtek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ae09b3aa-952a-569f-e321-269dfde372be@linux.intel.com>
Date: Thu, 2 Jan 2020 14:37:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191227054445.27223-1-shumingf@realtek.com>
Content-Language: en-US
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, Vinod Koul <vkoul@kernel.org>, derek.fang@realtek.com,
 flove@realtek.com, bard.liao@intel.com, pierre-louis.bossart@intel.com
Subject: Re: [alsa-devel] [PATCH] ASoC: rt711: add rt711 codec driver
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



On 12/26/19 11:44 PM, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> This is the initial codec driver for rt711.
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>

Thanks Shuming.

I will add my own

Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

tag, but this driver was also tested by others at Intel, including Bard 
Liao and Rander Wang, on CometLake, IceLake and TigerLake platforms. I 
am not aware of any issues with this codec, and jack detection was 
tested extensively.

The key point to be reviewed is the use of regmap, where we disable 
access to the registers until the device becomes ATTACHED (cache-only), 
and also make sure hw calibration is rerun (cache-bypass) before 
restoring settings in the resume step.

This patch also depends on interface changes on the SoundWire side, see 
below what Vinod provided before the holiday break
-Pierre


The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

   Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git 
tags/sdw_interfaces_5.6

for you to fetch changes up to 09f6a72d014386939d21899921dd379006471a4b:

   soundwire: intel: add clock stop quirks (2019-12-12 09:17:07 +0530)

----------------------------------------------------------------
SoundWire tag for ASoC

This contains the recently merged soundwire interface changes for ASoC
subsystem.

----------------------------------------------------------------
Bard Liao (2):
       soundwire: intel: update headers for interrupts
       soundwire: intel: add link_list to handle interrupts with a 
single thread

Pierre-Louis Bossart (7):
       soundwire: sdw_slave: add probe_complete structure and new fields
       soundwire: sdw_slave: add enumeration_complete structure
       soundwire: sdw_slave: add initialization_complete definition
       soundwire: sdw_slave: track unattach_request to handle all init 
sequences
       soundwire: intel: update interfaces between ASoC and SoundWire
       soundwire: intel: add mutex for shared SHIM register access
       soundwire: intel: add clock stop quirks

Rander Wang (2):
       soundwire: intel: update stream callbacks for hwparams/free 
stream operations
       soundwire: intel: add prototype for WAKEEN interrupt processing

  drivers/soundwire/intel.c           |  20 ++++++++++++++------
  drivers/soundwire/intel.h           |  13 ++++++++-----
  drivers/soundwire/intel_init.c      |  32 ++++++++------------------------
  include/linux/soundwire/sdw.h       |  19 +++++++++++++++++++
  include/linux/soundwire/sdw_intel.h | 156 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------
  5 files changed, 196 insertions(+), 44 deletions(-)

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
