Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B02E6AAAC
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jul 2019 16:35:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 959FA168B;
	Tue, 16 Jul 2019 16:34:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 959FA168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563287712;
	bh=Rx1q+Fy766EEacHMFBZSUrTSj5wsd+mNiGk1ll2FIEc=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t+13szVV3ZnntMC5vM7tRN00QqrA1KP23C8QVq58OO8kJIIKmZcmQXoxNq6qPDZvv
	 WmsBifR+qJ9c+hsawIz9kmfg5KKPtOyayhyhGlz2cq5vpEodGUQ0Htq70xUKhVijxK
	 ZAZVvbayTlOqxaQDB6oHugdmEctwh/yzq91MM/0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECD95F80362;
	Tue, 16 Jul 2019 16:33:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 292C5F80376; Tue, 16 Jul 2019 16:33:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1586F800C6
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 16:33:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1586F800C6
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jul 2019 07:33:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,498,1557212400"; d="scan'208";a="175419394"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Jul 2019 07:33:16 -0700
Date: Tue, 16 Jul 2019 17:33:15 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@zeliteleevi
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20190716074255.14267-2-tiwai@suse.de>
Message-ID: <alpine.DEB.2.21.1907161730400.16459@zeliteleevi>
References: <20190716074255.14267-1-tiwai@suse.de>
 <20190716074255.14267-2-tiwai@suse.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: Hui Wang <hui.wang@canonical.com>, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH 2/2] ALSA: hda/hdmi - Fix i915 reverse
 port/pin mapping
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Takashi,

On Tue, 16 Jul 2019, Takashi Iwai wrote:

> The recent fix for Icelake HDMI codec introduced the mapping from pin
> NID to the i915 gfx port number.  However, it forgot the reverse
> mapping from the port number to the pin NID that is used in the ELD
> notifier callback.  As a result, it's processed to a wrong widget and
> gives a warning like
>   snd_hda_codec_hdmi hdaudioC0D2: HDMI: pin nid 5 not registered
> 
> This patch corrects it with a proper reverse mapping function.

looks good:

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
