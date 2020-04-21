Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA591B2EDC
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 20:17:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADE9A16CE;
	Tue, 21 Apr 2020 20:16:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADE9A16CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587493044;
	bh=izKNP1J1n+uhEVUjHNQVsA0Au1xYcUEBxMgLnvKqra0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EsVpkSA6a85XBplyJKqpcUDiX63TNehVN7hPaTpsRKi2EQxolm5/MK46cRUUowHhd
	 hw9cIOIzDQro406rs7W0xWiJ8vTbdhniSeAxGw0yhRdDy3a7H+Y/GSqNwKhlFozA0v
	 UzLbzyOQEAVVPEHOCfwdDqNrlyWDuDY9CFuN6vy8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9BFCF80143;
	Tue, 21 Apr 2020 20:15:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9931F801EC; Tue, 21 Apr 2020 20:15:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 114CBF800E7
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 20:15:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 114CBF800E7
IronPort-SDR: ntOJVwp4x8gZSrvuTW1usaiI7HCVOuZmRS9VACPRFfklP5qs8I0B3d6thJ/oQGAmxj7M+gqfLC
 U87QFjD5r1zg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2020 11:15:32 -0700
IronPort-SDR: Ccm6WFMCwijRQVervPtfpFpKZct6QQT9tpUANf7hXAhxT0SiY5dnpxn6KhGWJEI5utIgMpVUD1
 so0VY8fXJVGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,411,1580803200"; d="scan'208";a="279736873"
Received: from gonzale2-mobl.amr.corp.intel.com (HELO [10.254.30.29])
 ([10.254.30.29])
 by fmsmga004.fm.intel.com with ESMTP; 21 Apr 2020 11:15:30 -0700
Subject: Re: [PATCH v2] ASoC: intel/skl/hda - fix oops on systems without i915
 audio codec
To: Mark Brown <broonie@kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20200420205431.13070-1-kai.vehmanen@linux.intel.com>
 <20200421180350.GA36150@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2396af30-f854-fbf2-8da3-7b92ae96eede@linux.intel.com>
Date: Tue, 21 Apr 2020 13:15:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421180350.GA36150@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: hui.wang@canonical.com, alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 jaska.uimonen@linux.intel.com
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



On 4/21/20 1:03 PM, Mark Brown wrote:
> On Mon, Apr 20, 2020 at 11:54:31PM +0300, Kai Vehmanen wrote:
>> Recent fix for jack detection caused a regression on systems with HDA
>> audio codec but no HDMI/DP audio via i915 graphics, leading to a kernel
>> oops at device probe. On these systems, HDA bus instance lookup fails,
>> as the first ASoC runtime of the card is connected to a dummy codec
>> (as no HDMI codec is present).
> 
> This still doesn't apply against current code, please check and resend.

works for me with git am on the for-next and for-5.8 branches? The patch 
does not indeed apply on for-5.7 but not sure if this was the intended 
target?
