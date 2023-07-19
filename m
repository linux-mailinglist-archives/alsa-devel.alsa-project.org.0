Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3088E75969A
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 15:25:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FE581FC;
	Wed, 19 Jul 2023 15:24:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FE581FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689773125;
	bh=ZLLTSx0IzKCM/an51/aXKuOB95zBOZBM8T9n0lJWTy0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k1w93Hk83ZmE0dbwkRKazaET/tGY02XKCA1wtNZYrxO/0tA8tuz+BYZEjEr4grozA
	 /GZtB8ngZfwYyaelfK8xzKLAzP9IYHhE6HZSBv06nAQGXFQs3tndomb0Mt1BMQQNya
	 hN9ZMOlLxmzjtnlM/Ax9KG25iSRyQqG850IsJFq4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 221ABF80557; Wed, 19 Jul 2023 15:23:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C07B0F80548;
	Wed, 19 Jul 2023 15:23:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82B58F8047D; Wed, 19 Jul 2023 14:14:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C93CDF800D2;
	Wed, 19 Jul 2023 14:14:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C93CDF800D2
Message-ID: <2ed288d0-c8fe-1856-dbe9-74f4f7c075ba@linux.intel.com>
Date: Wed, 19 Jul 2023 14:13:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: [PATCH] ASoC: SOF: Intel: Remove deferred probe for SOF
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Alsa-devel <alsa-devel@alsa-project.org>,
 sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Matthew Auld <matthew.auld@intel.com>
References: <20230718084522.116952-1-maarten.lankhorst@linux.intel.com>
 <20230718084522.116952-7-maarten.lankhorst@linux.intel.com>
 <alpine.DEB.2.22.394.2307181922160.3532114@eliteleevi.tm.intel.com>
 <874jm0modf.wl-tiwai@suse.de>
 <66d22637-069f-5262-2249-6041ef9d4614@linux.intel.com>
 <875y6g5feo.wl-tiwai@suse.de>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <875y6g5feo.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: maarten.lankhorst@linux.intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IT62ZFUE7436KRXVMCS2CQLYCXBEMNLL
X-Message-ID-Hash: IT62ZFUE7436KRXVMCS2CQLYCXBEMNLL
X-Mailman-Approved-At: Wed, 19 Jul 2023 13:23:45 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IT62ZFUE7436KRXVMCS2CQLYCXBEMNLL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 2023-07-19 13:06, Takashi Iwai wrote:
> On Wed, 19 Jul 2023 11:48:06 +0200,
> Maarten Lankhorst wrote:
>>
>>      The 60 seconds timeout is a thing "better than complete disablement",
>>      so it's not ideal, either.  Maybe we can add something like the
>>      following:
>>      
>>      - Check when the deferred probe takes too long, and warn it
>>      - Provide some runtime option to disable the component binding, so
>>        that user can work around it if needed
>>      
>> A module option to snd_hdac_i915_init would probably be the least of all evils
>> here.
> 
> Yes, probably it's the easiest option and sufficient.
> 
> 
> thanks,
> 
> Takashi
Hey,

Patch below, can be applied immediately iresspective of the other patches.

---->8----------

Selecting CONFIG_DRM selects CONFIG_VIDEO_NOMODESET, which exports 
video_firmware_drivers_only(). This can be used as a first approximation
on whether i915 will be available. It's safe to use as this is only 
built when CONFIG_SND_HDA_I915 is selected by CONFIG_I915.

It's not completely fool proof, as you can boot with "nomodeset 
i915.modeset=1" to make i915 load regardless, or use
"i915.force_probe=!*" to never load i915, but the common case of booting
with nomodeset to disable all GPU drivers this will work as intended.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index 1637dc6e630a6..90bcf84f7b2ce 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -11,6 +11,8 @@
  #include <sound/hda_i915.h>
  #include <sound/hda_register.h>

+#include <video/nomodeset.h>
+
  #define IS_HSW_CONTROLLER(pci) (((pci)->device == 0x0a0c) || \
  				((pci)->device == 0x0c0c) || \
  				((pci)->device == 0x0d0c) || \
@@ -122,6 +124,9 @@ static int i915_gfx_present(struct pci_dev *hdac_pci)
  {
  	struct pci_dev *display_dev = NULL;

+	if (video_firmware_drivers_only())
+		return false;
+
  	for_each_pci_dev(display_dev) {
  		if (display_dev->vendor == PCI_VENDOR_ID_INTEL &&
  		    (display_dev->class >> 16) == PCI_BASE_CLASS_DISPLAY &&
