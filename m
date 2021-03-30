Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E7D34E402
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Mar 2021 11:08:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D037168C;
	Tue, 30 Mar 2021 11:07:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D037168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617095307;
	bh=opZoReNz/9nNm7ov5Fxp2tU+51+YdFGD50nNYTeFnfo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Iw6f8wVvxltV504m3DXPvDJZ8SDD1B8gOZ+W/O1iufEanKiCik2GiHGiFB9es+hhw
	 0dTQHv0d5xWhWmsqG9yLhKM5gXPx3r0mYeBW0AdfKarjlcylJpyF6Xc6WNuJG4487V
	 jyiISNp5jC8kq6BilFqH9imOZi6XsF95u/6LVm0g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF762F800B9;
	Tue, 30 Mar 2021 11:06:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7331F800B9; Tue, 30 Mar 2021 11:06:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 688D8F800B9
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 11:06:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 688D8F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eY/2foKN"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1165B61999;
 Tue, 30 Mar 2021 09:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617095205;
 bh=opZoReNz/9nNm7ov5Fxp2tU+51+YdFGD50nNYTeFnfo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eY/2foKNgSDuzrvOGk96ENVaymg2W2Nn2ZZfUC1kHnQt1uQCdUoltYVRMAEeL//sa
 dxxUjvtdkOs2dWoGUvt16V67CcNwU+JI1Zv1GvDlhKxSwzFOlyyxZ4aYUC7HpG7uko
 wZsZfHh6HVGOdLhoYO2nQLdFAxqFPHNSnQhGRZXgxkQdxOEiSkJXIpGD0ltPSLzCve
 GdfcUx+97ORf+bBcnvrYfwd5mqslpb4gkno6x5ozmPE277Pr1k+yd+q4fsrUVLjtY/
 LzMRMqa7AaUjwLcK39jRnJH7iv2fgh2CWa3Q7kjloC6zVsy1GaJIzdsE8ihs6QxQAA
 BA8jXIyQ9l79g==
Date: Tue, 30 Mar 2021 14:36:42 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] soundwire: configure block packing mode with new
Message-ID: <YGLqIjJnT0VAUoWa@vkoul-mobl.Dlink>
References: <20210323050701.23760-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323050701.23760-1-yung-chuan.liao@linux.intel.com>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
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

On 23-03-21, 13:06, Bard Liao wrote:
> The existing code multiply a channel number by zero (SDW_BLK_GRP_CNT_1),
> and the result is used to configure the block packing mode. Sampling
> grouping and channel packing are two separate concepts in SoundWire.
> 
> In addition, the bandwidth allocation allocates a vertical slice for
> each stream, which makes the use of the PER_CHANNEL packing mode
> irrelevant.
> 
> Let's use the proper definition for block packing mode (PER_PORT).
> 
> This change has no functional impact though since the net result is
> the same configuration of the DPN_BlockCtrl3 register, when implemented.

Applied, thanks

-- 
~Vinod
