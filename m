Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8534F8FD8
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 09:50:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 792A418CC;
	Fri,  8 Apr 2022 09:49:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 792A418CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649404247;
	bh=iHjigpeloLkTMJi44utwp+ZN5pBfBfQ/j31XhqS3o9E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rUj3bOZVZ6pK+MCONj2J2dlLiM1Is9IQrTdkUS2EOMDAm2JbBpUjZ77m4N/WPxk4U
	 /ql3bLx62ZAByfJhh6MHXPfrqEorbS2flTVNc5X3aitg4rTBmfmwT+sUhazYe++Z/E
	 XMu9jvXed6yhuDA3xPuLtyRuV2IQ5mSshIqW/9bM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36804F8052D;
	Fri,  8 Apr 2022 09:48:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06FE6F80162; Mon,  4 Apr 2022 17:20:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE363F800D1
 for <alsa-devel@alsa-project.org>; Mon,  4 Apr 2022 17:20:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE363F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CWlAjDqx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649085656; x=1680621656;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iHjigpeloLkTMJi44utwp+ZN5pBfBfQ/j31XhqS3o9E=;
 b=CWlAjDqxq5WjIw2sW4Fb5PVhozH1k2ycqeupQL4UbvueZDD2JG6tJIli
 Xga89l2RhZPQwp8W/WgyKTE2oWf2wNqqU6avaJNAWSAhyBL3mNW3TGdWj
 FKLviDqZYmR643wQ9TZkcCFRDINZ0eNP+c4ocfpW+k1Hrfn4zfANlAkC+
 m9VRJwPNwXr+dP9bRszCd9oJCZoLi+Eo5WuUO0ewFppH8CN5vwOIrd4LA
 Dsqd70PJ583y+CjZNlC4zOaikPJMQU5r9J7a1USOOT/QtMLHsNJZsXVFu
 nBe6sZ4RWED+C2qbOsdmeJQAvtK8bulfQ9AnXzLHxDV5VUKLI6rVxbqUR g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="248050810"
X-IronPort-AV: E=Sophos;i="5.90,234,1643702400"; d="scan'208";a="248050810"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2022 08:20:48 -0700
X-IronPort-AV: E=Sophos;i="5.90,234,1643702400"; d="scan'208";a="504936548"
Received: from sdavis-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.251.18.44])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2022 08:20:48 -0700
Date: Mon, 4 Apr 2022 08:20:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ALSA: hda/i915 - skip acomp init if no matching display
Message-ID: <20220404152048.x3gaiiy5ltlisfuw@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220404130356.2776970-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220404130356.2776970-1-kai.vehmanen@linux.intel.com>
X-Mailman-Approved-At: Fri, 08 Apr 2022 09:48:11 +0200
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
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

On Mon, Apr 04, 2022 at 04:03:56PM +0300, Kai Vehmanen wrote:
>In systems with only a discrete i915 GPU, the acomp init will
>always timeout for the PCH HDA controller instance.
>
>Avoid the timeout by checking the PCI device hierarchy
>whether any display class PCI device can be found on the system,
>and at the same level as the HDA PCI device. If found, proceed
>with the acomp init, which will wait until i915 probe is complete
>and component binding can proceed. If no matching display
>device is found, the audio component bind can be safely skipped.
>
>The bind timeout will still be hit if the display is present
>in the system, but i915 driver does not bind to it by configuration
>choice or probe error. In this case the 60sec timeout will be
>hit.
>
>Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
>Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> sound/hda/hdac_i915.c | 29 +++++++++++++++++++----------
> 1 file changed, 19 insertions(+), 10 deletions(-)
>
>diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
>index efe810af28c5..55b61b1a0ef9 100644
>--- a/sound/hda/hdac_i915.c
>+++ b/sound/hda/hdac_i915.c
>@@ -116,16 +116,25 @@ static int i915_component_master_match(struct device *dev, int subcomponent,
> 	return 0;
> }
>
>-/* check whether intel graphics is present */
>-static bool i915_gfx_present(void)
>+/* check whether Intel graphics is present and reachable */
>+static int i915_gfx_present(struct pci_dev *hdac_pci)
> {
>-	static const struct pci_device_id ids[] = {
>-		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_ANY_ID),
>-		  .class = PCI_BASE_CLASS_DISPLAY << 16,
>-		  .class_mask = 0xff << 16 },
>-		{}
>-	};
>-	return pci_dev_present(ids);
>+	unsigned int class = PCI_BASE_CLASS_DISPLAY << 16;
>+	struct pci_dev *display_dev = NULL;
>+	bool match = false;
>+
>+	do {
>+		display_dev = pci_get_class(class, display_dev);
>+		if (display_dev)
>+			if (display_dev->vendor == PCI_VENDOR_ID_INTEL &&
>+			    connectivity_check(display_dev, hdac_pci))

why not put this all in a single if level?

		if (display_dev && display_dev->vendor == PCI_VENDOR_ID_INTEL &&
		    connectivity_check(display_dev, hdac_pci))

basically the first check protects dereferencing the variable.

Lucas De Marchi

>+				match = true;
>+
>+		pci_dev_put(display_dev);
>+
>+	} while (!match && display_dev);
>+
>+	return match;
> }
>
> /**
>@@ -145,7 +154,7 @@ int snd_hdac_i915_init(struct hdac_bus *bus)
> 	struct drm_audio_component *acomp;
> 	int err;
>
>-	if (!i915_gfx_present())
>+	if (!i915_gfx_present(to_pci_dev(bus->dev)))
> 		return -ENODEV;
>
> 	err = snd_hdac_acomp_init(bus, NULL,
>
>base-commit: bfa1e1a62c8bdbe3d8c915fbb7a078dc783b2ee8
>-- 
>2.35.1
>
