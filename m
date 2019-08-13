Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 482978AF3C
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 08:08:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B28001664;
	Tue, 13 Aug 2019 08:08:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B28001664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565676532;
	bh=lq6wPjzmqgg2z5J2B9gpYs7z2zOcf2SakL3vfadBUW4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jG1jvUh0aC9+6HvoR4VYrcfKbUmaIHuS3M6IGgNTK7/bKsfj+6IMefSr7DrUFEcBI
	 dXxWBh+uujQotMrBUOX1pdkxxInm++kRLUM+wZh1fLegNzIEoeZRQCr1XyvTxDrJOY
	 lom7eRNTA4Jnd5aF+p0YNPH1mx1HgMcwiWguioug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0521DF80274;
	Tue, 13 Aug 2019 08:07:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17B6FF80273; Tue, 13 Aug 2019 08:07:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F9C9F8015A
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 08:07:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F9C9F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fUJ2ULq6"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 625DA206C2;
 Tue, 13 Aug 2019 06:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565676417;
 bh=k18Vm3ai25X4rDVxWuyFZQotI4xt6Ufw+xHlCRt3JCE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fUJ2ULq6N7GPk/2GlP54WB5I31mQK+Z6aON6KBICNrynoKoXx9MWfstV2b4lmsBlO
 3wYqpImOwNvjpFm6hB6q2U4Z3LllSPSBmq1cOIJBS7c+fN6UjlRAoMph6zeLJSf98G
 TZZlpxAuQctIXcNKakBH3GHtm10Z0BQY5gD+xY1g=
Date: Tue, 13 Aug 2019 08:06:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190813060655.GF6670@kroah.com>
References: <20190812235942.7120-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190812235942.7120-1-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, slawomir.blauciak@intel.com
Subject: Re: [alsa-devel] [PATCH v2 0/3] soundwire: debugfs support for 5.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Aug 12, 2019 at 06:59:39PM -0500, Pierre-Louis Bossart wrote:
> This patchset enables debugfs support and corrects all the feedback
> provided on an earlier RFC ('soundwire: updates for 5.4')
> 
> There is one remaining hard-coded value in intel.c that will need to
> be fixed in a follow-up patchset not specific to debugfs: we need to
> remove hard-coded Intel-specific configurations from cadence_master.c
> (PDI offsets, etc).
> 
> Changes since v1 (Feedback from GKH)
> Handle debugfs in a more self-contained way (no dentry as return or parameter)
> Used CONFIG_DEBUG_FS in structures and code to make it easier to
> remove if need be.
> No functional change for register dumps.

Looks much better:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
