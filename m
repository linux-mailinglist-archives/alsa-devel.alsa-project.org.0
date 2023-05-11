Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D017D6FFD4B
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 01:30:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEC951FE;
	Fri, 12 May 2023 01:29:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEC951FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683847811;
	bh=4myvbo3QGjQDsBcH7VGxTcyJ2CbmgkXUJtpS7N+W5EM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ff5WLGgmW+18xYO98kTB+cbKFUCKy0t60iGgw1/BZfiChANo3QzaDH2vL511tsK3X
	 3Pob5fjqyey2g9zxSNrcOjG9YpCevTyD7I2Vgcwr5j3zTyYl1n7wFI7J9F5iYAqxY+
	 iYiGDEiuUE35l5aMTgsCgPlPr2A43M96WotL9Xv0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EB78F80549; Fri, 12 May 2023 01:29:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9A48F8032D;
	Fri, 12 May 2023 01:29:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C4F0F8052E; Fri, 12 May 2023 01:29:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98EC6F8014C
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 01:29:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98EC6F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=myYLVNuy
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CBDD86527E;
	Thu, 11 May 2023 23:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B171C433D2;
	Thu, 11 May 2023 23:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683847746;
	bh=4myvbo3QGjQDsBcH7VGxTcyJ2CbmgkXUJtpS7N+W5EM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=myYLVNuyqT8Y6ak5xWT6BxWh1ositIfEggGf2sMSrhLYk0Z7KVkWfbRDZeQ2ywYBU
	 fCFbOJhPVH/FCqT1vJ1Epq83J8r66d9/b2ZJTahXTVDdaKSBQfIEN1Il0hX/XehXt9
	 2xtrzjbolKgoAETqe3tiOxPjylOmLSbDf6dL9flR/ACZafL4EbBkR1uQ6qE4jukAWT
	 mExai6eRnN5oumHApi7rFqBwS3EKKhMh/Fs7iz9UHQZnn82YOjkFLt5+DIGPsWD0Jo
	 bAsyXsurBkS1qFp3Lkj17u1jOlwJJYsrg9vnkVSVY6cjyDjpBJfHHAFEdjSIY37/XL
	 04oe8jYVeIo8w==
Date: Thu, 11 May 2023 19:29:05 -0400
From: Sasha Levin <sashal@kernel.org>
To: yixuanjiang <yixuanjiang@google.com>
Cc: tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/6] ASoC: soc-pcm: use GFP_ATOMIC for dpcm structure
Message-ID: <ZF16QZzmDfu+MQjz@sashalap>
References: <20230511120841.2096524-1-yixuanjiang@google.com>
 <20230511120841.2096524-2-yixuanjiang@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230511120841.2096524-2-yixuanjiang@google.com>
Message-ID-Hash: OANHKX5D7VUDZVQ2FO62BUD6GS6NQ4K2
X-Message-ID-Hash: OANHKX5D7VUDZVQ2FO62BUD6GS6NQ4K2
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OANHKX5D7VUDZVQ2FO62BUD6GS6NQ4K2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, May 11, 2023 at 08:08:36PM +0800, yixuanjiang wrote:
>From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>
>[ Upstream commit d8a9c6e1f6766a16cf02b4e99a629f3c5512c183 ]

Queued up, thanks!

-- 
Thanks,
Sasha
