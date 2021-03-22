Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8FA344067
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 13:05:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 766FD15E5;
	Mon, 22 Mar 2021 13:04:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 766FD15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616414709;
	bh=mwKIvD3m2a8udoDntSattWkpAVmBGFOPr8WfGq95e5w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JJoP/B1tFBYbjuhFK3lgAW4SbBGP1CxZ/i1wY2INQdX4Hwxzp9Mcx+0flBaW5+cyt
	 enZMIl3IVhMstYrKjyI6LNzGFtKsM/Gx3IowLW/GWTCpa9F/um4AqD1h+cmtBhRhkV
	 wt4lohzYWRUQKhJWbI/HXFIkRLPi9Zen6qDAru0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4839F801D5;
	Mon, 22 Mar 2021 13:03:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64DD4F8016B; Mon, 22 Mar 2021 13:03:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2F01F80107
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 13:03:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2F01F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TsCHUKqb"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 32F1761998;
 Mon, 22 Mar 2021 12:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616414609;
 bh=mwKIvD3m2a8udoDntSattWkpAVmBGFOPr8WfGq95e5w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TsCHUKqbad1Wh33Bea4g9m/NbKCxtd0quqqHcu+kxT+7QvQ3dHmQ8Ut0hWZKV0V5U
 zwhVGlyg2LmKZzFmMwgYNeSy1gzQ+BGxQrIdeDMGMrrEogIujd39vg18ABIiduyh96
 /LyoBX/DHB+ihdsJOF+kmqERg1HFARqqoKBLj+otOdGwT3Rx8BjhCxL/BDMBDVVAwo
 qxV3aWJr8toqzRFfEvNH2cWL9N67BL+2hv467A4hHpe0RjI3yJxVGrbKgH0lVPq+ig
 h9BApB998sTSVGnQM+9hJYqca/hvcEFAwDoNSmGcl4Z8jtvmxc49NCj31XbjWoA0Si
 uhu4mYL/P88XA==
Date: Mon, 22 Mar 2021 17:33:24 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2 0/3] soundwire: add DMI quirks for overridind addr
Message-ID: <YFiHjPawbh8dId7h@vkoul-mobl.Dlink>
References: <20210302075105.11515-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210302075105.11515-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

On 02-03-21, 15:51, Bard Liao wrote:
> Platform firmware may have incorrect _ADR values causing the driver
> probes to fail. Adding the override_ops allows people to override the
> addr values.

Applied, thanks

-- 
~Vinod
