Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 233EE270D8A
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Sep 2020 13:15:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EB6E1694;
	Sat, 19 Sep 2020 13:14:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EB6E1694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600514131;
	bh=3BCWu3jCK4lynjY+TDXCs5NcDU6Wo6bMjv7wDYfjaIs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Iiw6HmMVkgQj73s2RVRMzpM65tmFJAsVVA2pLEJcFr+SrU5TPbrOwaQjlIUNFvpaj
	 P5Rvjj+zTk21dZCdZbTXrJ9sRaoORXGhSQdpZHl9niq+KdvK3JpCaVa4hNFoSVdZBe
	 wsVrN5CXspvk8qBEeUOD978yDmiLvzgfZZCtt2t4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABD5DF8025E;
	Sat, 19 Sep 2020 13:13:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28B68F80212; Sat, 19 Sep 2020 13:13:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E7D7F800EA
 for <alsa-devel@alsa-project.org>; Sat, 19 Sep 2020 13:13:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E7D7F800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="o2XpqPbg"
Received: from localhost (unknown [171.48.27.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 56DC721481;
 Sat, 19 Sep 2020 11:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600514019;
 bh=3BCWu3jCK4lynjY+TDXCs5NcDU6Wo6bMjv7wDYfjaIs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o2XpqPbgq0Ulch8zTGluM/eKpz/wDiB2pf4crdCaakFwacltFabcugPJQXb3c/NwE
 Zi/VlvDAehyVjytUulKuXnEvnHCmb/a7dKRk6zToNWCklN7Q7cVXIXkbR1hpb6a3lV
 CrCnNAjKtccgZAbaY3KCIcXc7zSjcEpBLKeMOH7o=
Date: Sat, 19 Sep 2020 16:43:30 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 1/2] soundwire: bus: add enumerated Slave device to
 device list
Message-ID: <20200919111330.GV2968@vkoul-mobl>
References: <20200917160007.153106-1-pierre-louis.bossart@linux.intel.com>
 <20200917160007.153106-2-pierre-louis.bossart@linux.intel.com>
 <20200918120502.GR2968@vkoul-mobl>
 <eb02ba7f-5f80-cfde-9225-064d185fd64d@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb02ba7f-5f80-cfde-9225-064d185fd64d@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org,
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

On 18-09-20, 08:54, Pierre-Louis Bossart wrote:
> 
> 
> On 9/18/20 7:05 AM, Vinod Koul wrote:
> > On 17-09-20, 11:00, Pierre-Louis Bossart wrote:
> > > From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > > 
> > > Currently Slave devices are only added on startup, either from Device
> > > Tree or ACPI entries. However Slave devices that are physically
> > > present on the bus, but not described in platform firmware, will never
> > > be added to the device list. The user/integrator can only know the
> > > list of devices by looking a dynamic debug logs.
> > > 
> > > This patch suggests adding a Slave device eveb there is no matching DT or
> > > ACPI entry, so that we can see this in sysfs entry.
> > > 
> > > Initial code from Srinivas. Comments, fixes for ACPI probe and edits
> > > of commit message by Pierre.
> > 
> > You should add yours as Co-developed. That is the standard tag for these
> > things
> 
> ok, I've never used this tag before but it seems appropriate indeed, thanks
> for the suggestion.
> 
> Should I add your Co-developed tag to the second patch as well then?

Sure

-- 
~Vinod
