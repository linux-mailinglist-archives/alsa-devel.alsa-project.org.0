Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6D525BF29
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 12:38:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAB7A18F4;
	Thu,  3 Sep 2020 12:37:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAB7A18F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599129493;
	bh=kqm1wlMuvFVbDd51jTk7L1toUWZ2fJJxYONbN3DTuRg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rimc5IR2gUPAAQAqJiWNTNI2JgorJ6UWF8Ge7SPCF00aP6If4w08DMQKjI2xcACcE
	 dMVB8pLYl5/nQTa+C+65nPfSbqbcfpL9M44ivb3lqLNSNwNkP2Mfvjf5vDjt2DXkpR
	 zgbPJBH9DOliwmcoHx1uYztUHNUfifJ2rNkr1AX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15EA8F8021D;
	Thu,  3 Sep 2020 12:36:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3F3AF80217; Thu,  3 Sep 2020 12:36:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C698EF800F0
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 12:36:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C698EF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jRAUC0z+"
Received: from localhost (unknown [122.171.179.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB79F20716;
 Thu,  3 Sep 2020 10:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599129381;
 bh=kqm1wlMuvFVbDd51jTk7L1toUWZ2fJJxYONbN3DTuRg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jRAUC0z+n5b92cAV5/GcMQTk5OGfNurSzIl5vVM29P3nRNADe8LBuSTIZ1SDvqQv4
 ipoRbX5nqJZHVJRtHZLUWZPUwCT1qwaNinDjzkpiWh//3/ESw777/4IDTNVVL+X0Dj
 g+HNpeSd7bY7tBy0OglWdwKxPrZJ1TNX4pqPNM20=
Date: Thu, 3 Sep 2020 16:06:17 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 0/3] regmap: add SoundWire 1.2 MBQ support
Message-ID: <20200903103617.GP2639@vkoul-mobl>
References: <20200901162225.33343-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901162225.33343-1-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 broonie@kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>,
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

On 01-09-20, 11:22, Pierre-Louis Bossart wrote:
> In preparation of the upstream contribution of SDCA (SoundWire Device
> Class for Audio) ASoC codec drivers [1] [2], add regmap support
> SoundWire 1.2 MBQ support. The MBQ (Multi-Byte Quantity) registers
> need to be handled in a different way from regular 8-bit SoundWire
> registers, their main application is going to be for volume/gain
> controls.
> 
> The second patch was initially suggested for inclusion in the
> SoundWire tree, and was modified to add more background information on
> SDCA in the commit message as requested by Vinod Koul.

Is this targetted towards the sdw tree or regmap tree, I think it may
have dependencies so sdw can be used.

It would be nice to mention these things here in cover

> 
> Changes since v1:
> Rebased on regmap tree (conflict with SPI stuff).
> Removed mod_devicetable.h header
> Removed -EOPNOTSUPP error codes, use -ENOTSUPP
> Added long description of SDCA
> Used FIELD_PREP/GET as suggested by Vinod Koul
> Added Bard Liao's Acked-by tag.
> 
> Pierre-Louis Bossart (3):
>   regmap: sdw: add required header files
>   soundwire: SDCA: add helper macro to access controls
>   regmap: sdw: add support for SoundWire 1.2 MBQ
> 
>  drivers/base/regmap/Kconfig             |   6 +-
>  drivers/base/regmap/Makefile            |   1 +
>  drivers/base/regmap/regmap-sdw-mbq.c    | 101 ++++++++++++++++++++++++
>  drivers/base/regmap/regmap-sdw.c        |   2 +
>  include/linux/regmap.h                  |  21 +++++
>  include/linux/soundwire/sdw_registers.h |  33 ++++++++
>  6 files changed, 163 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/base/regmap/regmap-sdw-mbq.c
> 
> 
> base-commit: d17343b87da422a59d99a3ed130573dbeb96c582
> -- 
> 2.25.1

-- 
~Vinod
