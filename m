Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AA4220416
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 06:42:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBFDB1661;
	Wed, 15 Jul 2020 06:41:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBFDB1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594788135;
	bh=7Cps2deu5EEozoenVkm17f1pN+4mr3/yXYH71x07wzk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tLTPTic1VXiZwiMg+8M6FtBvhq0aSW64cMtYvy221L60tvyBimel2N6d7NDiSI9GU
	 VHmE5fVryawAY97vvxYoBCI330ZQkiQErfhknAwQPWMq7XG2cvb0fFmSPDDaV0uDaf
	 8af/kOFYVDfGAduQf6Jbc8nslSJU1IlcY3lSFX2E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 202C8F800E8;
	Wed, 15 Jul 2020 06:40:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A8ADF8021D; Wed, 15 Jul 2020 06:40:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1C45F800E8
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 06:40:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1C45F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oFh1f10z"
Received: from localhost (unknown [122.171.202.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F3389205CB;
 Wed, 15 Jul 2020 04:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594788022;
 bh=7Cps2deu5EEozoenVkm17f1pN+4mr3/yXYH71x07wzk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oFh1f10zR9kh4Pz8bmNgMzuyp8S15g4/wa7BsBvRatoqWBVcva4m2lWza1hm6e7Vh
 O2l96/rTU2pcgG7DUfAAOVDmGF3t1+6b/vxB2FUcWuXtmL3spVGPED5MPuMxb0Bokj
 XB9++x4dIfmZtJYWwziq4D5PFZtY2CP49mLuVWrY=
Date: Wed, 15 Jul 2020 10:10:19 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2 0/5] soundwire: handle stream at the dailink level
Message-ID: <20200715044019.GN34333@vkoul-mobl>
References: <20200630184356.24939-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630184356.24939-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

On 01-07-20, 02:43, Bard Liao wrote:
> Currently, stream is handled at the dai level. But we have to handle
> stream at the dailink level in the multi-cpu dailink usage.

Applied, thanks

-- 
~Vinod
