Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6C174F256
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 16:34:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15214F04;
	Tue, 11 Jul 2023 16:33:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15214F04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689086086;
	bh=XYaVMQ3P2Xw+yr548W+rzf2xAqljuiRQQedbp9M8+Ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N1fmBV4uFog28cOeB6LYk7QDkSF2DanT+rNzyef2KkN6vUYvOlHmxemUQPuWZAJDO
	 CuSqwCghLjVKQImfPyPxa2G1r3jsn2NRUv/Cu586H3Mb5v9aPKa9qo3aELP64GKM26
	 REhegcpn5TDAoomTXFe6DPd18JzcFZ29KejSHvCc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63EDDF80535; Tue, 11 Jul 2023 16:33:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8F08F80236;
	Tue, 11 Jul 2023 16:33:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1BB1F80249; Tue, 11 Jul 2023 16:33:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E922F800E4
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 16:33:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E922F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jl1/Sq2L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689086025; x=1720622025;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=XYaVMQ3P2Xw+yr548W+rzf2xAqljuiRQQedbp9M8+Ao=;
  b=jl1/Sq2L3Lf8aXss1ToBTEaAG70t7UmXj48xjwXgISkuyeEzAzQGrYak
   meABrlSKhXc3LJJVVzjfQvUOmoe/SdcBNZX6FUCyLBwl+PHBUIHPtuGr7
   cgmMVe122l9ekIZ+QsJao+QjoMYJyxplUFfl5/wmdRUOsajhLcg5WNE/z
   iGTZCgrDzuzzOxd7NowitXN61QpkqZ52DlfsKPsHMRSSd6c110HIQ+KQj
   3XRYwb+/AY2opYDHzLkrAyd5nbjufyH5hFetEC5AKYMbXpAeCVd3VKKEE
   jNRcrsGlAt1m8vw6EDAMwsPWuKpcIQGNWXMX4/yC0/JaNZROd4EbQsyFL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="368135307"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="368135307"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 07:33:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="721103911"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="721103911"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 11 Jul 2023 07:33:15 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1qJEQT-001sG8-2y;
	Tue, 11 Jul 2023 17:33:13 +0300
Date: Tue, 11 Jul 2023 17:33:13 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 13/13] ASoC: Intel: sst: Convert to PCI device IDs defines
Message-ID: <ZK1oKYW0rro4FnNO@smile.fi.intel.com>
References: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
 <20230711125726.3509391-14-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230711125726.3509391-14-amadeuszx.slawinski@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: 3MMQWSIA7Z45OGVZQEBFBAAEC62P52K4
X-Message-ID-Hash: 3MMQWSIA7Z45OGVZQEBFBAAEC62P52K4
X-MailFrom: andriy.shevchenko@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3MMQWSIA7Z45OGVZQEBFBAAEC62P52K4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 11, 2023 at 02:57:26PM +0200, Amadeusz Sławiński wrote:
> Use PCI device IDs from pci_ids.h header.

...

>  	switch (sst->dev_id) {
> -	case SST_MRFLD_PCI_ID:
> +	case PCI_DEVICE_ID_INTEL_ADSP_TNG:
>  	case SST_BYT_ACPI_ID:
>  	case SST_CHV_ACPI_ID:

I think this needs a bit more, i.e. replacing the rest with respective PCI IDs.

All three will be defined with SST prefix, which makes sense to me.

ACPI here is a bit misleading, but correct. The ACPI specification assumes that
respective part of the ID space covers 100% of PCI ID space.

I have briefly checked the code and it seems that ID is used externally only
for PCI case, so we may simply use the lower 16 bits of the ACPI _HID for the
context.

diff --git a/sound/soc/intel/atom/sst/sst.c b/sound/soc/intel/atom/sst/sst.c
index a0d29510d2bc..b1f59604d825 100644
--- a/sound/soc/intel/atom/sst/sst.c
+++ b/sound/soc/intel/atom/sst/sst.c
@@ -222,7 +222,7 @@ static void sst_init_locks(struct intel_sst_drv *ctx)
 }
 
 int sst_alloc_drv_context(struct intel_sst_drv **ctx,
-		struct device *dev, unsigned int dev_id)
+		struct device *dev, unsigned short dev_id)
 {
 	*ctx = devm_kzalloc(dev, sizeof(struct intel_sst_drv), GFP_KERNEL);
 	if (!(*ctx))
diff --git a/sound/soc/intel/atom/sst/sst.h b/sound/soc/intel/atom/sst/sst.h
index 4d37d39fd8f4..c04f033e1d5f 100644
--- a/sound/soc/intel/atom/sst/sst.h
+++ b/sound/soc/intel/atom/sst/sst.h
@@ -358,7 +358,7 @@ struct sst_fw_save {
 struct intel_sst_drv {
 	int			sst_state;
 	int			irq_num;
-	unsigned int		dev_id;
+	unsigned short		dev_id;
 	void __iomem		*ddr;
 	void __iomem		*shim;
 	void __iomem		*mailbox;
@@ -523,7 +523,7 @@ int sst_register(struct device *);
 int sst_unregister(struct device *);
 
 int sst_alloc_drv_context(struct intel_sst_drv **ctx,
-		struct device *dev, unsigned int dev_id);
+		struct device *dev, unsigned short dev_id);
 int sst_context_init(struct intel_sst_drv *ctx);
 void sst_context_cleanup(struct intel_sst_drv *ctx);
 void sst_configure_runtime_pm(struct intel_sst_drv *ctx);

...

>  /* driver names */
>  #define SST_DRV_NAME "intel_sst_driver"

> -#define SST_MRFLD_PCI_ID 0x119A
>  #define SST_BYT_ACPI_ID	0x80860F28
>  #define SST_CHV_ACPI_ID	0x808622A8

And kill all three!

-- 
With Best Regards,
Andy Shevchenko


