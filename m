Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E68668E85B
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 07:34:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F175210;
	Wed,  8 Feb 2023 07:33:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F175210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675838086;
	bh=UEggocAYhaG/5pIix0dPz0HoDLSOKs9I71rtFWBGYa0=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z+hCE70rNrZuykL0iGnsgbOyo6sl05U15wBCGb3MzmIVt9sH/XaI3Y/zXcQYtUIEy
	 oNW/oDt88AouD9bdp021KilD2uir+ga4RPJcgoLJ2zuso3pcFJglendoStcEbLKn1F
	 4aVKesdhFdrYg+NkuIASmlhVV0uZ2jUxAuWcxqgM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20F7BF8010B;
	Wed,  8 Feb 2023 07:33:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCC7EF8012B; Wed,  8 Feb 2023 07:33:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D63FF800E2
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 07:33:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D63FF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C2t7tI5U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UEggocAYhaG/5pIix0dPz0HoDLSOKs9I71rtFWBGYa0=; b=C2t7tI5UScFx41Y+EJFG/GT56Q
	Xm/a/f18f4YdAtMw/RKIozICP2fUC5b+HKoNnjUnH3G9dTqVqBs/1Po1wLT7meHeGN7Qdl7P/3FI1
	FG9kvtzv6mKRZW2kLXTEbMak7PLNJbtZY0VholxN6BaS2+N530WpbbtT4nVlJITS9dgAmNUyoF+3K
	Ts0yCvRAYQuQ1LAUhht8Y6wUiFIewzK5uAQgEv3NJwRcZNUNYBPdkIe2qQ3AJyGn/hC2K+pTZ7d6A
	uqqKC99BvogXSszzxTI5+qoSnaVNTV/gXTxeOA6trqfAQr84V8aVhIj1NwlheD9+RJMKuv9oHnSJF
	LKjf9p7g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux))
	id 1pPe19-00EJMq-EB; Wed, 08 Feb 2023 06:33:19 +0000
Date: Tue, 7 Feb 2023 22:33:19 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] soundwire: export sdw_compute_slave_ports() function
Message-ID: <Y+NCL1MdgwcuLTLk@infradead.org>
References: <20230201165944.3169125-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201165944.3169125-1-Vijendar.Mukunda@amd.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Message-ID-Hash: KZHGWGJHD2MFFPVZZ3TCJ2USKLRVFMZI
X-Message-ID-Hash: KZHGWGJHD2MFFPVZZ3TCJ2USKLRVFMZI
X-MailFrom: 
 BATV+3d14ed7283e31597757f+7108+infradead.org+hch@bombadil.srs.infradead.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: broonie@kernel.org, alsa-devel@alsa-project.org,
 Basavaraj.Hiregoudar@amd.com, Sunilkumar.Dommati@amd.com,
 Mario.Limonciello@amd.com, Mastan.Katragadda@amd.com,
 arungopal.kondaveeti@amd.com, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KZHGWGJHD2MFFPVZZ3TCJ2USKLRVFMZI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Feb 01, 2023 at 10:29:44PM +0530, Vijendar Mukunda wrote:
> Export sdw_compute_slave_ports() function to use it in another
> soundwire manager module.
> Move sdw_transport_data structure to bus header file to export
> sdw_compute_slave_ports() function.

You might want to send this along with the actual user.
