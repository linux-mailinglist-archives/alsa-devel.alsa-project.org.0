Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B03C8662AE4
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 17:09:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8805646E;
	Mon,  9 Jan 2023 17:08:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8805646E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673280562;
	bh=L7OgefsegSZIPl94QzC1zkIELk9VjaBHZvVdo32x78U=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VD0rzcZt6OpdMciqoCeQzspSMMmGo0p7VMixAKvKZykaBQM1ACunsmhkI0+7US2Nq
	 ju5FJlmBAodBBBsYMjwnecX8znT/f2Q+bJ9Pv61+KbeBWOw/uLjy4ozQMRTzuMr0Z4
	 fJ7pzPlRvyAjIVCn3/NNFzQrtUmVtdyHlmBR1cmU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62C9AF80245;
	Mon,  9 Jan 2023 17:08:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF144F8030F; Mon,  9 Jan 2023 17:08:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 575BDF80245
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 17:08:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 575BDF80245
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YnM9uBOc
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 143B3B80E34;
 Mon,  9 Jan 2023 16:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D67CC433D2;
 Mon,  9 Jan 2023 16:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673280492;
 bh=L7OgefsegSZIPl94QzC1zkIELk9VjaBHZvVdo32x78U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YnM9uBOcWaS4MGAiYdTFD/nz5I4gZnUJuGgN1czIxdnkd4Fa+bAtrZ2eadwpCIxzC
 9C4jRlI4ScOjs0+YkXROwyQ5T4xR9Z3rvKcO6XQYpHcuM93Mc8SlG5CbVT/8K7j/FF
 LB5MDJd3OSooTFct4RI6eDWGTxtpjWR6N0GbO9RB+mgaeAxBmBmSrlnc+88s6OfWlO
 LoRFmzpkvzNj9BWxyh9hAKhrsg5f0jF7VTXxQEDAd46VgDojWdLWuIAZHUnggTZxAx
 2H+0BiGPVbs5D5O1BFSfFPiEueudQGm5YhtDyekw2Kx1r8toipRMd5F6AwBY+lFd3k
 BxP0RYB2VAdQQ==
Date: Mon, 9 Jan 2023 21:38:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2 0/2] ASoC/soundwire: revisit support for clock registers
Message-ID: <Y7w76Vv12JBJAOP9@matsya>
References: <20221118025807.534863-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118025807.534863-1-yung-chuan.liao@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 broonie@kernel.org, peter.ujfalusi@linux.intel.com, bard.liao@intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 18-11-22, 10:58, Bard Liao wrote:
> SoundWire clock base and scale registers are only supported for SDCA
> devices. That's fine, but that leaves SoundWire 1.2 with optional
> registers not supported. This is a corner case that needs to be supported.
> 
> The change is mainly on soundwire. But rt1318-sdw.c was applied to
> ASoC tree recently and not in SoundWire tree yet. @Vinod, Are you good
> if we go throutgh ASoC tree? Or @Mark can provide a tag and we can go
> through SoundWire tree?

Applied, thanks

-- 
~Vinod
