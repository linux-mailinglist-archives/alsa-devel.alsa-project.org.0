Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D6C14B348
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 12:07:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 426A91679;
	Tue, 28 Jan 2020 12:06:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 426A91679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580209664;
	bh=400/L1rCvAeQxegBCXBXf6Wv7U+cRdilioKHKGRlqqw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wu6EHy0i5s6BE7dg5dxuE9fuFK+a9V64zAQ4xBOX/oGVwEKAEmE/aoMLHLWfWmGgz
	 CbP0GEdlJeF4wG2OQkRJEfiQcM1pKiWzYLEK5g0GSY74N31IhjZL08Dg2piRVyvQ0h
	 50eQf4E8Z8KUy0Vef1fPV4rDoKOPb1qJexJ5dUJ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66899F80150;
	Tue, 28 Jan 2020 12:06:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE875F8014B; Tue, 28 Jan 2020 12:06:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C83FF80082
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 12:05:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C83FF80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="e5faz387"
Received: from localhost (unknown [223.226.101.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4803C22522;
 Tue, 28 Jan 2020 11:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580209556;
 bh=8lV3u+nbixjOsZy774+0etRvn3ySmiiL/FJs2S9siaM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e5faz387fFxVPvwcnQpuOmWoFNs9lVbkozPTMsOd+s+5fo5rihpnq3HhZx3+RrGD3
 /mY7kRrrySUA4yxGV4cXKZV4vtMm7j1yT5mWuLVl1DJFfJiV/WFFV1dk2wOXM0jZpr
 KRQwcwB9gqEEpuy/9yOslqwzWIvfxtgCfW3kxK88=
Date: Tue, 28 Jan 2020 16:35:51 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <20200128110551.GR2841@vkoul-mobl>
References: <20200128104356.16570-1-cezary.rojewski@intel.com>
 <20200128104356.16570-6-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200128104356.16570-6-cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Divya Prakash <divya1.prakash@intel.com>, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v3 05/11] ALSA: core: Implement compress
 page allocation and free routines
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

On 28-01-20, 11:43, Cezary Rojewski wrote:
> Add simple malloc and free methods for memory management for compress
> streams. Based on snd_pcm_lib_malloc_pages and snd_pcm_lib_free_pages
> implementation.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
