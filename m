Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AB42555A9
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 09:51:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2AEF187B;
	Fri, 28 Aug 2020 09:51:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2AEF187B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598601117;
	bh=NNuyrQlMojjJklrBvWVr2Dpn4uxkjEtV2E5JBA+oGWU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=smLJ2PS4S+MjbLb6MpYFFuK0QbKjjOeuCrJmGbck+rclU/9MK7/u9hHYDYP+OQw/f
	 BVapfVO7q32TQp2TJXH57EoZXx1cnmsk6LJ9ALjM7rruKRD7D3W95D0pH+qfawcy+3
	 B2nssmqcYFjbp8/AGUnvbfvpRPqoZv95cK6vWxFA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80E72F80257;
	Fri, 28 Aug 2020 09:50:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5822EF8020C; Fri, 28 Aug 2020 09:50:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27247F800EB
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 09:49:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27247F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nFQEiSEU"
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 69DFB2078A;
 Fri, 28 Aug 2020 07:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598600996;
 bh=NNuyrQlMojjJklrBvWVr2Dpn4uxkjEtV2E5JBA+oGWU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nFQEiSEUytCjWefRFRgUjJQ2NVOhkve6dF106PTG/snvexkpMSDQaVsy1f652YuNP
 L0Gf7X/f2LeYVV1xscapD0lUYVbMJeiFrmTvi/mvdATGE2eXcP0jRBliufZqV+pCUy
 B2NEZmjDnXNMSRKLO8Em4aSntiwBewOH/eUSLVnk=
Date: Fri, 28 Aug 2020 13:19:52 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 09/11] soundwire: intel: add dynamic debug trace for
 clock-stop invalid configs
Message-ID: <20200828074952.GO2639@vkoul-mobl>
References: <20200818024120.20721-1-yung-chuan.liao@linux.intel.com>
 <20200818024120.20721-10-yung-chuan.liao@linux.intel.com>
 <20200826094817.GC2639@vkoul-mobl>
 <21038e8d-dbd9-76c7-c758-9933fb45024a@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21038e8d-dbd9-76c7-c758-9933fb45024a@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, sanyog.r.kale@intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, rander.wang@linux.intel.com,
 bard.liao@intel.com
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

On 26-08-20, 09:38, Pierre-Louis Bossart wrote:
> 
> 
> On 8/26/20 4:48 AM, Vinod Koul wrote:
> > On 18-08-20, 10:41, Bard Liao wrote:
> > > From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > > 
> > > Detect cases where the clock is assumed to be stopped but the IP is
> > > not in the relevant state, and add a dynamic debug trace.
> > 
> > you meant a debug print..and it looks like error print below (also in title).
> 
> I don't understand the comment. Is the 'trace' confusing and are you asking
> to e.g. change the commit message to 'add dynamic debug log'?

Question is what is dynamic about this?

-- 
~Vinod
