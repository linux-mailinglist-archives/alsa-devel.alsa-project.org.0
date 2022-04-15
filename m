Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EAD502147
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Apr 2022 06:25:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA649183E;
	Fri, 15 Apr 2022 06:24:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA649183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649996709;
	bh=W0L8azuaC2MCibnZYsueMMwFov8vLMqD5y8W/NeDMeE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UEOtxX/ImXb8VI85llNB9Ewj+WIgxVqV98+011+11I5VcUDHC+qZtoEXuB+6pKHxb
	 XjO4PPFIBdIApLnzMHvciwXgMKZGI+Gy8ET8Pr1f4cDjiJi8WGBZstTu0sF5ciUy2v
	 0SPX1n7W1XqYhA4obPeXzqOqi7xT9hgfT8rX2TNQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D13EF800AE;
	Fri, 15 Apr 2022 06:24:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2132EF8016A; Fri, 15 Apr 2022 06:24:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15834F80095
 for <alsa-devel@alsa-project.org>; Fri, 15 Apr 2022 06:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15834F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="iu04dlbs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649996642; x=1681532642;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=W0L8azuaC2MCibnZYsueMMwFov8vLMqD5y8W/NeDMeE=;
 b=iu04dlbspXXy4v+4CL5IozsDJrZJDYRoTiVAzXvDacPmU8urB7GcPVWu
 oBvQ/Qryq8UEkrG954fgzr+C1xsW7sRYpZ3e+h9aQdmXNsf6a+veCqIiZ
 jjdwkxovj9Z5y6r23jQljiP0riEZkslGveN5QJ061ZCvOQ5SRwbbdMGgh
 wGrhgt3tWe4cycoNaZqsLTMbJGUg4IQHpoHa1BWEzLwKV2ugJJGGRZ7+Q
 u38t69ezIWrd+V53w3ectL9oBcbMt0vOJ/UWDqsKMcan6AdJqIxPeOjPt
 X83zlFjRTx1Pifw3cwA3+A/GuvzouM3gjHTqMXo9qf2neqYIGmH/DNx34 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="323533767"
X-IronPort-AV: E=Sophos;i="5.90,261,1643702400"; d="scan'208";a="323533767"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 21:23:56 -0700
X-IronPort-AV: E=Sophos;i="5.90,261,1643702400"; d="scan'208";a="645897227"
Received: from rramesh2-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.35.174])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 21:23:56 -0700
Date: Thu, 14 Apr 2022 21:23:56 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v2] ALSA: hda: handle UAF at probe error
Message-ID: <20220415042356.arajaxgmzbkzltc4@ldmartin-desk2>
References: <20220414182437.14944-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220414182437.14944-1-nirmoy.das@intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, kai.vehmanen@linux.intel.com,
 matthew.auld@intel.com
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

On Thu, Apr 14, 2022 at 08:24:37PM +0200, Nirmoy Das wrote:
>Call snd_card_free_on_error() on probe error instead of
>calling snd_card_free() which should handle devres call orders.
>
>Issues: https://gitlab.freedesktop.org/drm/intel/-/issues/5701
>Fixes: e8ad415b7a55 ("ALSA: core: Add managed card creation")
>Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

This failure in i915 CI seems suspicious since is around module removal.
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_102714v1/fi-tgl-1115g4/igt@i915_suspend@system-suspend-without-i915.html

And it seems it didn't fix the issue in dg2:

https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_102714v1/bat-dg2-8/igt@gem_lmem_swapping@random-engines.html

Lucas De Marchi

>---
> sound/pci/hda/hda_intel.c | 7 ++++---
> 1 file changed, 4 insertions(+), 3 deletions(-)
>
>diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
>index 82a45f2b31c4..eb4228c9e37f 100644
>--- a/sound/pci/hda/hda_intel.c
>+++ b/sound/pci/hda/hda_intel.c
>@@ -1730,7 +1730,9 @@ static void azx_check_snoop_available(struct azx *chip)
> static void azx_probe_work(struct work_struct *work)
> {
> 	struct hda_intel *hda = container_of(work, struct hda_intel, probe_work.work);
>-	azx_probe_continue(&hda->chip);
>+	struct azx *chip = &hda->chip;
>+
>+	snd_card_free_on_error(&chip->pci->dev, azx_probe_continue(chip));
> }
>
> static int default_bdl_pos_adj(struct azx *chip)
>@@ -2028,7 +2030,7 @@ static void azx_firmware_cb(const struct firmware *fw, void *context)
> 		dev_err(card->dev, "Cannot load firmware, continue without patching\n");
> 	if (!chip->disabled) {
> 		/* continue probing */
>-		azx_probe_continue(chip);
>+		snd_card_free_on_error(&chip->pci->dev, azx_probe_continue(chip));
> 	}
> }
> #endif
>@@ -2338,7 +2340,6 @@ static int azx_probe_continue(struct azx *chip)
> out_free:
> 	if (err < 0) {
> 		pci_set_drvdata(pci, NULL);
>-		snd_card_free(chip->card);
> 		return err;
> 	}
>
>-- 
>2.35.1
>
