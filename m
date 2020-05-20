Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EADB1DB5C7
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 15:57:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1B3717F7;
	Wed, 20 May 2020 15:56:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1B3717F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589983027;
	bh=77eBqGPO9oS6IAJe/Q1U2VGxJbTGtULUpvt12elCIEE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W7NbMHmSFE/noXUq+yP7WT47m5Uz04/0uyq+t87ErhnL4bUJ4xwUnfCLWEReLRTfu
	 ydCNyliDteyS0IBO81zxGIok4F8li2X5dzWMvsMjPzHU4+rmKQodf2cuVy7YcHBvti
	 eNo+LxUiqfHz5KmcGUIMLAC43l2VQQ1RNhs8fJKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3A3BF8026F;
	Wed, 20 May 2020 15:55:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C85CF8025E; Wed, 20 May 2020 15:55:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67DE2F80132
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 15:55:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67DE2F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MDVoSJtm"
Received: from localhost (unknown [122.178.227.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1FEB6206C3;
 Wed, 20 May 2020 13:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589982917;
 bh=77eBqGPO9oS6IAJe/Q1U2VGxJbTGtULUpvt12elCIEE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MDVoSJtml/vZvPY+QL93DOKrAz8b2rx0MEzt0MpJSeplTEHUtTelisIA5A49pwfqN
 OGfnznwwcy3P5ERnzc8tsw1WuOnvrsfrm/LMe9Cju45/aJ3WiPmWC6M9nHMJTdbOQj
 gtw87WVzkIHsiXScRyFyXtT4Jktbt1UD/9phXEeQ=
Date: Wed, 20 May 2020 19:25:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 1/2] soundwire: intel: use a single module
Message-ID: <20200520135509.GY374218@vkoul-mobl.Dlink>
References: <20200519191903.6557-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519191903.6557-1-yung-chuan.liao@linux.intel.com>
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

On 20-05-20, 03:19, Bard Liao wrote:
> From: Rander Wang <rander.wang@intel.com>
> 
> It's not clear why we have two modules for the Intel controller/master
> support when there is a single Kconfig. This adds complexity for no
> good reason, the two parts need to work together anyways.

Applied, thanks

-- 
~Vinod
