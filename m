Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BACC9253519
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 18:42:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5738E1783;
	Wed, 26 Aug 2020 18:41:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5738E1783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598460133;
	bh=Nhxs6GLEXkmk91ceSYxBRjhcy81ZD8QVkvWailiH5V8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bwNJcgEJwdj3hT20oeFgKI749/IEpDPG0a/xcMtlqUcTLaYCKmpCBongZvPxFfpzu
	 fsZmpT81OKqXdu2aHcncHGY28QZm9hRgwc7ZISTfSVgr1zS4TqAPSMIZR3rUN1dlC9
	 ANLseeSD99sXyq813ylQWxpL8meZDcmCHwcROQpg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D098F800EB;
	Wed, 26 Aug 2020 18:40:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75E51F801D9; Wed, 26 Aug 2020 18:40:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2FDBF800EB
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 18:40:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2FDBF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="0/CE7/9x"
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4F5322071E;
 Wed, 26 Aug 2020 16:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598460022;
 bh=Nhxs6GLEXkmk91ceSYxBRjhcy81ZD8QVkvWailiH5V8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0/CE7/9xoULdHqEYGdYFuGogIbhVNQgRoRg1NbIRk3g1xglWTV8iEm8f0Y0khaTKo
 qoKGl301FSUks2EGYBJmhla9zwh0FLvlOECCAo+KTbjAqUcOk0udgLToVHois88arU
 mK3AbOh4P7yZmzG+RHaQw1vbQjHqPCqSbL4ud3Es=
Date: Wed, 26 Aug 2020 22:10:18 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 3/4] soundwire: SDCA: add helper macro to access controls
Message-ID: <20200826164018.GF2639@vkoul-mobl>
References: <20200825171656.75836-1-pierre-louis.bossart@linux.intel.com>
 <20200825171656.75836-4-pierre-louis.bossart@linux.intel.com>
 <20200826085540.GY2639@vkoul-mobl>
 <9c078341-7e90-a4e8-da30-19e9720d93e4@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c078341-7e90-a4e8-da30-19e9720d93e4@linux.intel.com>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
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

On 26-08-20, 10:00, Pierre-Louis Bossart wrote:
> 
> 
> > > +/* v1.2 device - SDCA address mapping */
> > 
> > Can you please add description of bits used by each field here,
> > something like we have done for DevId
> 
> were you referring to something like this?
> 
>  * Spec definition
>  *   Register		Bit	Contents
>  *   DevId_0 [7:4]	47:44	sdw_version
>  *   DevId_0 [3:0]	43:40	unique_id
>  *   DevId_1		39:32	mfg_id [15:8]
>  *   DevId_2		31:24	mfg_id [7:0]
>  *   DevId_3		23:16	part_id [15:8]
>  *   DevId_4		15:08	part_id [7:0]
>  *   DevId_5		07:00	class_id

Correct

> > 
> > > +#define SDW_SDCA_CTL(fun, ent, ctl, ch)		(BIT(30) |			\
> > > +						 (((fun) & 0x7) << 22) |	\
> > > +						 (((ent) & 0x40) << 15) |	\
> > > +						 (((ent) & 0x3f) << 7) |	\
> > > +						 (((ctl) & 0x30) << 15) |	\
> > > +						 (((ctl) & 0x0f) << 3) |	\
> > > +						 (((ch) & 0x38) << 12) |	\
> > > +						 ((ch) & 0x07))
> > 
> > GENMASK() for the bitmaps here please. Also it would look very neat by
> > using FIELD_PREP() here, you can skip the bit shifts and they would be
> > done by FIELD_PREP() for you.
> 
> ok.

FWIW I am testing changes to do the conversion for subsystem to use nice
stuff in bitfield.h


-- 
~Vinod
