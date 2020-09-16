Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C4426C3B7
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Sep 2020 16:31:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D5B31693;
	Wed, 16 Sep 2020 16:30:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D5B31693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600266694;
	bh=acejB/prIRtsxQWg9QojyBj2lNUB1jdZy+zS/DMW7k8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aVFoLqkG8GwpNQVz00DnBbxKYDkLJGTc/cxfiPc9Z6imoASU5izV9pVTMwF/3iYBO
	 gElJp8f+A88SYGBV/joQECfnQuCdoFwRrgYz4FUN0GKoaM3fn9ueYEq0/ZWUXWxpbi
	 Ur9Xq5DPdZArFx/VDioIN6XM3NrBPKidSgcG47JM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B054CF800BB;
	Wed, 16 Sep 2020 16:29:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05C18F8015A; Wed, 16 Sep 2020 16:29:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69D8FF800E8
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 16:29:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69D8FF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="c/G3ibtp"
Received: from localhost (unknown [122.172.186.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3E84F22245;
 Wed, 16 Sep 2020 14:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600266577;
 bh=acejB/prIRtsxQWg9QojyBj2lNUB1jdZy+zS/DMW7k8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c/G3ibtpL/helsck+Eq0cptCROJFScHN/nQ/IkiLTpfKInK2uYM5Yn+VH8e4+GNGp
 6gDbCrwtBRP+LI1uU+hJMCbKiug6fXVyOHA7jtcAtkVGb1tZSStL9V14CEv1D4ol3j
 +rMOgaGhVEQ5nOf3CMwF2kjFH6y5qpfXEaRV61rI=
Date: Wed, 16 Sep 2020 19:59:29 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 1/3] soundwire: qcom: clear BIT FIELDs before value set.
Message-ID: <20200916142929.GR2968@vkoul-mobl>
References: <20200916092125.30898-1-srinivas.kandagatla@linaro.org>
 <20200916092125.30898-2-srinivas.kandagatla@linaro.org>
 <20200916124634.GM2968@vkoul-mobl>
 <24401c7c-b12c-0924-9d8f-fde633d15918@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24401c7c-b12c-0924-9d8f-fde633d15918@linux.intel.com>
Cc: yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On 16-09-20, 08:18, Pierre-Louis Bossart wrote:
> 
> > > According to usage (bitfields.h) of REG_FIELDS,
> > > Modify is:
> > >    reg &= ~REG_FIELD_C;
> > >    reg |= FIELD_PREP(REG_FIELD_C, c);
> 
> 
> if this is indeed the case, all the code in cadence_master.c is also broken,
> e.g:
> 
> 	dpn_config = cdns_readl(cdns, dpn_config_off);
> 
> 	dpn_config |= FIELD_PREP(CDNS_DPN_CONFIG_WL, (p_params->bps - 1));
> 	dpn_config |= FIELD_PREP(CDNS_DPN_CONFIG_PORT_FLOW, p_params->flow_mode);
> 	dpn_config |= FIELD_PREP(CDNS_DPN_CONFIG_PORT_DAT, p_params->data_mode);

This should be replaced with u32_replace_bits(), i am sending the fix
> 
> 
> Gah.

should have caught this :(

-- 
~Vinod
