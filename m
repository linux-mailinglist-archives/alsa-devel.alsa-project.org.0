Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3A0742A4E
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 18:09:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 563EF7F1;
	Thu, 29 Jun 2023 18:08:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 563EF7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688054979;
	bh=ha9nFOTThKQkXYIfeLwSXUJFETP5wuyEziul21nMFA0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=tBo2zrT9ieCC4hnwyTesy6gAcQx3M9b49oixctZTaECHEZIxH3payKL2xSLWeu2qa
	 zYW8jPkE0oUG+Rm7miCp2C2EsSrDbwB/kneyRYXbyJWSxWPSuoZQ9IcBvYgyTPtPve
	 T2f8j0W6Nsoq0T8SlGT58vmcK4ByRGGZq/L3kPHE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 231BAF80535; Thu, 29 Jun 2023 18:08:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D68E0F80212;
	Thu, 29 Jun 2023 18:08:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DF05F80246; Thu, 29 Jun 2023 18:08:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51954F800E3
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 18:08:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51954F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aqQUQ/Ja
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 80603614C0;
	Thu, 29 Jun 2023 16:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9259C433C0;
	Thu, 29 Jun 2023 16:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688054918;
	bh=ha9nFOTThKQkXYIfeLwSXUJFETP5wuyEziul21nMFA0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=aqQUQ/JaA3UajUyWxo6+H5aNLqjsbbodmBl1f1j5E5/cTJTNkPWlsITqtNi3M0Xsq
	 3JaoJs6hKAGv75Znl3Ay1BcYBwMUMJ6cYPim8BF4JmR+CN9qohwCB7pxUX+T8FxNaU
	 kpIbDUyFyEKkGrzqFd9xvTYs58ztGiOdIeomTilEJPpZXGxgR2wWJN/cEHqK0iUf/g
	 7L4rrj2VaPRR82GNDS7dKFNRcL74ygZVLWxkfldMtnDVedxIsyr747/yFqtvO6yqqo
	 2SFpcIiUINvurr2TfCfOHxqlz3rJoKqidSlD71R+HJPumfFeQJe5KCacUu/+teRgwb
	 YljrYtXdfkykg==
Date: Thu, 29 Jun 2023 11:08:36 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [RFC PATCH 3/8] ALSA: hda: Update PCI ID list
Message-ID: <20230629160836.GA398698@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230628205135.517241-4-amadeuszx.slawinski@linux.intel.com>
Message-ID-Hash: 53NTOTY626BZBB6OPBAB2X4GTP25HZJH
X-Message-ID-Hash: 53NTOTY626BZBB6OPBAB2X4GTP25HZJH
X-MailFrom: helgaas@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/53NTOTY626BZBB6OPBAB2X4GTP25HZJH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Personally I would look for a more descriptive verb for the subject.
"Update" suggests that you might be adding or removing IDs, but I
think this patch is basically a mechanical conversion to use macros
instead of hard-coded hex.  Maybe "Convert to PCI_VDEVICE" or
something?

On Wed, Jun 28, 2023 at 10:51:30PM +0200, Amadeusz Sławiński wrote:
> Use PCI device IDs from pci_ids.h header and while at it change to using
> PCI_VDEVICE macro, to simplify declarations. This allows to change magic
> number PCI vendor IDs to macro ones for all vendors. For Intel devices
> use device IDs macros where defined.

> -#define IS_BXT(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0x5a98)
> +#define IS_APL(pci) ((pci)->vendor == PCI_VENDOR_ID_INTEL && \
> +					(pci)->device == PCI_DEVICE_ID_INTEL_HDA_APL)

The actual content change seems fine, but the name change from BXT to
APL seems like it might be material for a separate patch, possibly
along with a similar name and comment change for
bxt_reduce_dma_latency()?

>  static const char * const driver_short_names[] = {
>  	[AZX_DRIVER_ICH] = "HDA Intel",
> @@ -571,7 +572,7 @@ static void hda_intel_init_chip(struct azx *chip, bool full_reset)
>  	snd_hdac_set_codec_wakeup(bus, false);
>  
>  	/* reduce dma latency to avoid noise */
> -	if (IS_BXT(pci))
> +	if (IS_APL(pci))
>  		bxt_reduce_dma_latency(chip);

