Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9C2F5EAF
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Nov 2019 12:20:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C49C8167D;
	Sat,  9 Nov 2019 12:19:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C49C8167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573298428;
	bh=P/zLnNMSxru8+cemqt2v9LfM5TxsS7eKrn/+OSHNnA4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zn5sxHUfMZdQCLdZNVVdlb/x1Gjge7V+BPGxqVcw2Bn4gISJYbpS6R7DIgcuIcsWi
	 mpZeuuf439JfnSM0t5efVZWNuIrzXkIry3gAbr4o2iQAG9KrB6S1Or/UjXYGQm8Seu
	 fqgXA67E5/QLiqajYxH52C3hgzHOLuBRM5DMgwVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4055EF80111;
	Sat,  9 Nov 2019 12:18:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 899C6F80446; Sat,  9 Nov 2019 12:18:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CCE6F80111
 for <alsa-devel@alsa-project.org>; Sat,  9 Nov 2019 12:18:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CCE6F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kmkzuavN"
Received: from localhost (unknown [122.167.114.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 50EAD215EA;
 Sat,  9 Nov 2019 11:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573298316;
 bh=3Hq1uBKmbxWSyUaunSKUQp7cR6TxylIJ4pSQvHWS7Gc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kmkzuavN3jwaaLLRT3+0E5FSZqUBd4lnAoT85QaQgJf9A4jVzwLkitGq6sruZTxm5
 0pJN/VBw++T0ED+sctbq7NZNXUkNgFhhfwts+gWVzXh6920GoXySLzM3nmtVcpnvp0
 YeLxeZjdfbz304lHhZyrXUp0/dLvPWoHpJHkaP64=
Date: Sat, 9 Nov 2019 16:48:23 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191109111823.GD952516@vkoul-mobl>
References: <20191022234808.17432-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022234808.17432-1-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 0/3] soundwire: use UniqueID only when
	relevant
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

On 22-10-19, 18:48, Pierre-Louis Bossart wrote:
> The hardware UniqueID, typically enabled with pin-strapping, is
> required during enumeration to avoid conflicts between devices of the
> same type.
> 
> When there are no devices of the same type, using the UniqueID is
> overkill and results in a lot of probe errors due to mismatches
> between ACPI tables and hardware capabilities. For example it's not
> uncommon for BIOS vendors to copy/paste the same settings between
> platforms but the hardware pin-strapping is different. This is
> perfectly legit and permitted by MIPI specs.
> 
> With this patchset, the UniqueID is only used when multiple devices of
> the same type are detected. The loop to detect multiple identical
> devices is not super efficient but with typically fewer than 4 devices
> per link there's no real incentive to be smarter.
> 
> This change is only implemented for ACPI platforms, for DeviceTree
> there is no change.

I do not fully agree with the approach here but I do understand why this
was done and do not have a better alternative, so applied now

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
