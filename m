Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7DF11EE7C
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Dec 2019 00:27:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D08D51657;
	Sat, 14 Dec 2019 00:26:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D08D51657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576279638;
	bh=AEu+AXpW28m9ovwnvlEo4R3ORBvcBCXCi0V0olICDPY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tRLrFUQSbeo/qR/xdVlqurHYss1CndzPzyNEvQJONIVf8Wk1BGmWXr6K0Ny8FcRzW
	 guvBBsfggDziDWM8OjfGAEo5VTJljWR3KcooihA2I0b9sXDZ1PQiDMhvGg/2aL32DA
	 ugwXQam9vEct2pKCc4f6CbZT37/UngB9ruZohAiQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 384E2F8021E;
	Sat, 14 Dec 2019 00:25:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7962EF801F4; Sat, 14 Dec 2019 00:25:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A07EF8014F
 for <alsa-devel@alsa-project.org>; Sat, 14 Dec 2019 00:25:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A07EF8014F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 15:25:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,311,1571727600"; d="scan'208";a="239441460"
Received: from dmjacob-mobl2.amr.corp.intel.com (HELO [10.252.129.36])
 ([10.252.129.36])
 by fmsmga004.fm.intel.com with ESMTP; 13 Dec 2019 15:25:24 -0800
To: Greg KH <gregkh@linuxfoundation.org>
References: <20191213050409.12776-1-pierre-louis.bossart@linux.intel.com>
 <20191213050409.12776-9-pierre-louis.bossart@linux.intel.com>
 <20191213072844.GF1750354@kroah.com>
 <7431d8cf-4a09-42af-14f5-01ab3b15b47b@linux.intel.com>
 <20191213161046.GA2653074@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20728848-e0ae-01f6-1c45-c8eef6a6a1f4@linux.intel.com>
Date: Fri, 13 Dec 2019 17:25:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191213161046.GA2653074@kroah.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v4 08/15] soundwire: add initial
 definitions for sdw_master_device
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


> No, I mean the new MODULE_NAMESPACE() support that is in the kernel.
> I'll move the greybus code to use it too, but when you are adding new
> apis, it just makes sense to use it then as well.

Greg, would the patch below be what you had in mind?
Thanks
-Pierre


diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
index 76a5c52b12b4..5bad8422887e 100644
--- a/drivers/soundwire/Makefile
+++ b/drivers/soundwire/Makefile
@@ -7,9 +7,11 @@ ccflags-y += -DDEBUG
  #Bus Objs
  soundwire-bus-objs := bus_type.o bus.o master.o slave.o mipi_disco.o 
stream.o
  obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o
+ccflags-$(CONFIG_SOUNDWIRE) += -DDEFAULT_SYMBOL_NAMESPACE=SDW_CORE

  soundwire-generic-allocation-objs := generic_bandwidth_allocation.o
  obj-$(CONFIG_SOUNDWIRE_GENERIC_ALLOCATION) += 
soundwire-generic-allocation.o
+ccflags-$(CONFIG_SOUNDWIRE_GENERIC_ALLOCATION) += 
-DDEFAULT_SYMBOL_NAMESPACE=SDW_CORE

  ifdef CONFIG_DEBUG_FS
  soundwire-bus-objs += debugfs.o
@@ -18,6 +20,7 @@ endif
  #Cadence Objs
  soundwire-cadence-objs := cadence_master.o
  obj-$(CONFIG_SOUNDWIRE_CADENCE) += soundwire-cadence.o
+ccflags-$(CONFIG_SOUNDWIRE_CADENCE) += 
-DDEFAULT_SYMBOL_NAMESPACE=SDW_CADENCE

  #Intel driver
  soundwire-intel-objs :=        intel.o
@@ -25,3 +28,4 @@ obj-$(CONFIG_SOUNDWIRE_INTEL) += soundwire-intel.o

  soundwire-intel-init-objs := intel_init.o
  obj-$(CONFIG_SOUNDWIRE_INTEL) += soundwire-intel-init.o
+ccflags-$(CONFIG_SOUNDWIRE_INTEL) += -DDEFAULT_SYMBOL_NAMESPACE=SDW_INTEL
diff --git a/drivers/soundwire/cadence_master.c 
b/drivers/soundwire/cadence_master.c
index cf96532b0a8e..89ed97e303b9 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -1517,3 +1517,4 @@ EXPORT_SYMBOL(sdw_cdns_alloc_pdi);

  MODULE_LICENSE("Dual BSD/GPL");
  MODULE_DESCRIPTION("Cadence Soundwire Library");
+MODULE_IMPORT_NS(SDW_CORE);
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 0b510e198928..2be9c365d342 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1823,3 +1823,5 @@ EXPORT_SYMBOL(intel_sdw_driver);
  MODULE_LICENSE("Dual BSD/GPL");
  MODULE_ALIAS("platform:int-sdw");
  MODULE_DESCRIPTION("Intel Soundwire Master Driver");
+MODULE_IMPORT_NS(SDW_CADENCE);
+MODULE_IMPORT_NS(SDW_CORE);
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index 834a09bafdcc..0685be32012d 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -432,3 +432,5 @@ EXPORT_SYMBOL(sdw_intel_exit);

  MODULE_LICENSE("Dual BSD/GPL");
  MODULE_DESCRIPTION("Intel Soundwire Init Library");
+MODULE_IMPORT_NS(SDW_CADENCE);
+MODULE_IMPORT_NS(SDW_CORE);

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
