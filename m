Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCA922040F
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 06:39:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 811F51662;
	Wed, 15 Jul 2020 06:38:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 811F51662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594787977;
	bh=FkgBXyuF+XFNy5qc841ZACxfHHnjVQ7pJoeeVggha0s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EJ9viCCwAoXO4b426neysK5Xs/4G2ThjHaS1zB7Z4soLbZj6iySRFYCB7vL3pQEcj
	 Vb6VtVsnBu1fIspnIEemAvZAjJJRbXt4Y4U2RvnDv4k4zc6x7z6UEbho6Xgx5Ad+t5
	 UTJGLa/aGtWi9w8c20WUuoxtYl8RAekINP2T2q3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88007F80113;
	Wed, 15 Jul 2020 06:37:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BB5DF8021D; Wed, 15 Jul 2020 06:37:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE047F80113
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 06:37:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE047F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HAvWgash"
Received: from localhost (unknown [122.171.202.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D92C6206D5;
 Wed, 15 Jul 2020 04:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594787864;
 bh=FkgBXyuF+XFNy5qc841ZACxfHHnjVQ7pJoeeVggha0s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HAvWgashKtwF64JCAequp2kjP2D8UhkjrctzbtPez1zqgxCBjiyQIA4o7RsxWaTMZ
 YmJLbBXCq73ZED4/dlJ02++/UXojBplD+/xSLXNC0mertqMM06YmF3Y8F6kNpW5mD6
 0btJ/Wm9TMm8fTPYipKTAxdd35KiS1uPQ+/wdN0U=
Date: Wed, 15 Jul 2020 10:07:40 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: change SoundWire maintainer
Message-ID: <20200715043740.GM34333@vkoul-mobl>
References: <20200703192644.751-1-sanyog.r.kale@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703192644.751-1-sanyog.r.kale@intel.com>
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, gregkh@linuxfoundation.org,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 yung-chuan.liao@linux.intel.com
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

On 04-07-20, 00:56, Sanyog Kale wrote:
> Add Bard as SoundWire maintainer from Intel and change Sanyog's
> role as reviewer.

Applied, thanks

-- 
~Vinod
