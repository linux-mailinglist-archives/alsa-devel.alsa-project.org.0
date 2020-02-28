Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2CF1731D5
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Feb 2020 08:35:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EEFE16E2;
	Fri, 28 Feb 2020 08:34:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EEFE16E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582875303;
	bh=EJ819KBDu+k2dtkanbIAzQ59SFqTDwp5/gb56PSzO98=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NCof/LzV/uH6NBpnHbNhQc7/eL7yEhi4c75GTN8NmX/FB+QLr7O+NLFk1IGlQW9Tv
	 mtd+RO2+1rQrdbUaw8I2HkaJJKKx/YU+2Vq8f7T+85+yxY3REiHlHNkGlx2+JMErFe
	 +o3+tbPDCFh4ZN4FDfJtU3QB45514qdne9qTJZUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65474F80213;
	Fri, 28 Feb 2020 08:32:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0294DF801F2; Fri, 28 Feb 2020 08:32:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96540F80113
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 08:32:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96540F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vpTK8H3P"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EBD2F246A3;
 Fri, 28 Feb 2020 07:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582875172;
 bh=EJ819KBDu+k2dtkanbIAzQ59SFqTDwp5/gb56PSzO98=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vpTK8H3PC+31WeXDZVDRv8EttvbleH1wcaGreWT5CjMg/9T8LYoDi2yjS9+Y33zO3
 jP3oHki6L93gMJK5J7kq4hjRyP3g8M7dqqQioVkMPt9t0c7j6sKa/Y84dDSCQe8ppJ
 7RsNJrhT1l1gaQr4bAC/HspSQtyYu2FkdDZdTxBc=
Date: Fri, 28 Feb 2020 08:32:49 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/8] soundwire: remove platform devices, add SOF interfaces
Message-ID: <20200228073249.GB2898712@kroah.com>
References: <20200227223206.5020-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227223206.5020-1-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
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

On Thu, Feb 27, 2020 at 04:31:58PM -0600, Pierre-Louis Bossart wrote:
> The first two patches were already reviewed by Greg KH in an earlier
> RFC. Since I only cleaned-up the error handling flow and removed an
> unnecessary wrapper, I took the liberty of adding Greg's Reviewed-by
> tag for these two patches.

That is fine, they still look sane to me :)
