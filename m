Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2CC3D346D
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jul 2021 08:07:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBE5716F0;
	Fri, 23 Jul 2021 08:07:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBE5716F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627020473;
	bh=MjDLmdBKiP1ckIsA3tIDRIEtAdAdOT1ifF4XWjxQdpo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N8VHzMwVT2GR1TR+NUAREKJ01UpOupkCih/bysF5370SwAXvxbT4ZCwAMA8MsmjZR
	 jyYHr1WeKCa35/o3E1i4/z08rSlKPF04EBjLAFPfWIni9Dz5kC93yvWss7BG/hmVKu
	 6UMGOK8I2kCITIhkEyIt5im5CiKN23sAg7O/7lhc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C3D8F804AD;
	Fri, 23 Jul 2021 08:06:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA131F804AC; Fri, 23 Jul 2021 08:06:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 894BDF8016C
 for <alsa-devel@alsa-project.org>; Fri, 23 Jul 2021 08:06:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 894BDF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="j1bsxWKW"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3BDD860E8B;
 Fri, 23 Jul 2021 06:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627020379;
 bh=MjDLmdBKiP1ckIsA3tIDRIEtAdAdOT1ifF4XWjxQdpo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j1bsxWKWiqvlGaSobYBNH0fWWh0GQ/BEWnvfUvjQ5zbXGBNRXSbi4gzWCUxZoD0ij
 F2sGaF01LN8mD+NaBQj9dvPYqTaXZsjkNzSPQkacUs7gTQnocuXYmXibk2NZ53WDmq
 AGDKGU9cxn3TXA5tN9/Os/Wh9SGiVGB8Ha/t+i8v4u/4HTgsaWN9kIXXFVpr9asOkb
 KICbifUBj/l8A1nfWfiz3ldVxGavpEVhN7BP8T61uULRPcJiNHTxsV77ZkxTa4aMvM
 SpRhCKnsZb7L/2i01qZp1HhXXWbj0YRQZ4rH9w+0jL8N3/xvF7Olan7CJEMRDNjimq
 uDz48CK1e8MQA==
Date: Fri, 23 Jul 2021 11:36:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/2] soundwire: dmi-quirks: add quirk for Intel 'Bishop
 County' NUC M15
Message-ID: <YPpcV/dnEbWGtMFv@matsya>
References: <20210719233248.557923-1-pierre-louis.bossart@linux.intel.com>
 <20210719233248.557923-2-pierre-louis.bossart@linux.intel.com>
 <YPl6Z+jqR9gnTw05@matsya>
 <c86efd0f-b941-f3ff-885d-f1d0d7d46d30@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c86efd0f-b941-f3ff-885d-f1d0d7d46d30@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, gregkh@linuxfoundation.org, Rander Wang <rander.wang@intel.com>,
 broonie@kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>,
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

On 22-07-21, 09:25, Pierre-Louis Bossart wrote:
> 
> 
> On 7/22/21 9:02 AM, Vinod Koul wrote:
> > On 19-07-21, 18:32, Pierre-Louis Bossart wrote:
> >> The same quirk is used for LAPBC510 and LAPBC710 skews who use the
> >> same audio design.
> >>
> >> These devices have the same BIOS issues inherited from the Intel
> >> reference, add the same _ADR remap previously used on HP devices.
> > 
> > This fails to apply on rc1, pls rebase or if there are any dependencies,
> > do spell them out
> 
> it likely depends on
> 
> [PATCH] soundwire: dmi-quirks: add ull suffix for SoundWire _ADR values

As I said above, if there is a dependency, pls spell it out!

> which was sent by Bard when the merge window opened.

-- 
~Vinod
