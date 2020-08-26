Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 307772524DA
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 03:01:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F23516FC;
	Wed, 26 Aug 2020 03:00:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F23516FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598403676;
	bh=uyH8ofU2SgQHK/i0XbOy+7D9wdJlUOBPe+yT1HG6x0A=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uaUknZqTlPYBhlS8ergo9xg3huavnQ3+Hun0rZ5XGy9Teotzs4NMOaWcs34PGHpg+
	 FgqUsgUPRddDfeeAwYu4tUfUzvy3KyzY5dL5vgFTo7VjaxjFnjDnRrn+yiP8l+xsSA
	 rEtqDQhGP/nTa67DozS/dGTXt2XTl3cSkMhllQyk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D379CF8025A;
	Wed, 26 Aug 2020 02:59:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 604F9F8025A; Wed, 26 Aug 2020 02:59:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00879F800D1
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 02:59:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00879F800D1
IronPort-SDR: gj2t+ObZilDkWBxsQg6LfS0t7djuLIPMnWgQ8u9EPIEPlROX7NhfV8OsIHxt1p2VXBD5wxNlUn
 CLLlydLi/o4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="157258145"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="157258145"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 17:59:20 -0700
IronPort-SDR: MZqZoLMfNzPxPGFz52Zc703BZo+h3Wr4O3u79OfpRl1v96oaLbsyX/J2/zugAyzoW1p2I1oWU6
 p6VAoW0I6OSg==
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="443833246"
Received: from yungchua-mobl.ccr.corp.intel.com (HELO [10.252.187.42])
 ([10.252.187.42])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 17:59:16 -0700
Subject: Re: [PATCH 4/4] regmap: sdw: add support for SoundWire 1.2 MBQ
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200825171656.75836-1-pierre-louis.bossart@linux.intel.com>
 <20200825171656.75836-5-pierre-louis.bossart@linux.intel.com>
From: Bard liao <yung-chuan.liao@linux.intel.com>
Message-ID: <8bd9593d-c81d-d01b-ee93-b15de2fe7f1f@linux.intel.com>
Date: Wed, 26 Aug 2020 08:59:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200825171656.75836-5-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Rander Wang <rander.wang@linux.intel.com>
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


On 8/26/2020 1:16 AM, Pierre-Louis Bossart wrote:
> The SoundWire 1.1 specification only allowed for reads and writes of
> bytes. The SoundWire 1.2 specification adds a new capability to
> transfer "Multi-Byte Quantities" (MBQ) across the bus. The transfers
> still happens one-byte-at-a-time, but the update is atomic.
>
> For example when writing a 16-bit volume, the first byte transferred
> is only taken into account when the second byte is successfully
> transferred.
>
> The mechanism is symmetrical for read and writes:
> - On a read, the address of the last byte to be read is modified by
> setting the MBQ bit
> - On a write, the address of all but the last byte to be written are
> modified by setting the MBQ bit. The address for the last byte relies
> on the MBQ bit being cleared.
>
> The current definitions for MBQ-based controls in the SDCA draft
> standard are limited to 16 bits for volumes, so for now this is the
> only supported format. An update will be provided if and when support
> for 24-bit and 32-bit values is specified by the SDCA standard.
>
> One possible objection is that this code could have been handled with
> regmap-sdw.c. However this is a new spec addition not handled by every
> SoundWire 1.1 and non-SDCA device, so there's no reason to load code
> that will never be used.
>
> Also in practice it's extremely unlikely that CONFIG_REGMAP would not
> be selected with CONFIG_REGMAP_MBQ selected. However there's no
> functional dependency between the two modules so they can be selected
> separately.
>
> Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
> Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Acked-by: Bard Liao <yung-chuan.liao@linux.intel.com>


