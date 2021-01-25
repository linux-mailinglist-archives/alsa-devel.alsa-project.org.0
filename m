Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFF2302341
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jan 2021 10:34:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94C5417FE;
	Mon, 25 Jan 2021 10:33:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94C5417FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611567236;
	bh=wELP+YvEcV59+ipofpYULKnsJAQvx/iCqDSfFzyoYG4=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jaSJhgFSpaD49oOcNmKQRp3SJqmDnvsBtI4JbZeKhZL63biFAX1cDHMVtUnwuU7PW
	 eZ4T85++8uBJkCkh9ZYi3E0H1aQvVesQYWRi/9x5R1AhDuukmCPL8VR+L80FnXpGkd
	 dvvmlCTlDof0lDU1t54q8F2a905g7wL6h3N4t7K0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D61BFF80130;
	Mon, 25 Jan 2021 10:32:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDBCCF8014D; Mon, 25 Jan 2021 10:32:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6E29F8014D
 for <alsa-devel@alsa-project.org>; Mon, 25 Jan 2021 10:32:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6E29F8014D
IronPort-SDR: /ybXu43ZnR6Pj3cplMi+SSUcKRH1Y+a14HuPgqA4QnVVXVjP8q3kmNPP15Xb2wt6HheP65oAAm
 mHHwxvnE8Iiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9874"; a="179843995"
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; d="scan'208";a="179843995"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 01:32:13 -0800
IronPort-SDR: krrYwPo72PKzZX/Sy7R3p82JyVurH0k9Y0NYXY/7xncHblnVo6XU2tre4QfUk24OXAKV476V76
 KmtkjvMSnEIQ==
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; d="scan'208";a="387270690"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 01:32:11 -0800
Date: Mon, 25 Jan 2021 11:28:58 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: hda: intel-dsp-config: add PCI id for TGL-H
In-Reply-To: <e04b942a-0f61-2c6c-ceb1-393668cfe549@perex.cz>
Message-ID: <alpine.DEB.2.22.394.2101251122060.864696@eliteleevi.tm.intel.com>
References: <20210125083051.828205-1-kai.vehmanen@linux.intel.com>
 <s5h35yp5rli.wl-tiwai@suse.de>
 <e04b942a-0f61-2c6c-ceb1-393668cfe549@perex.cz>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Libin Yang <libin.yang@intel.com>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 Xiuli Pan <xiuli.pan@intel.com>, broonie@kernel.org,
 Bard Liao <bard.liao@intel.com>
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

Hi,

On Mon, 25 Jan 2021, Jaroslav Kysela wrote:

> Dne 25. 01. 21 v 9:49 Takashi Iwai napsal(a):
> > Is this needed for 5.11 or only for 5.12?
> > (Or potentially needed for 5.11.x stable later? -- then we can take it
> 
> All patches sent by Kai today are required to add support for the SoundWire
> device Dell TGL-H SKU 0A5E in 5.11. But I think that this standalone patch may
> enable the DMIC only platforms.

ack on that. We are a bit late for 5.11 with these patches, but the more 
we can get to 5.11, the better. 5.11-rc already has support for 
snd-hda-intel and baseline SOF support, but this single patch helps system 
with a PCH-DMIC.

The remaining patches sent via today ASoC, enable one Soundwire SKU.

Br, Kai
