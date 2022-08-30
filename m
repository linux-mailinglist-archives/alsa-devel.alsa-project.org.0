Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 462E45A5AE9
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 06:50:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E681D1662;
	Tue, 30 Aug 2022 06:49:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E681D1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661835032;
	bh=MX3HxKSSop3rjgdhjGuG13nF1e38sAvQKoCTUvhyoj8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bpKZUDmUcFhISi1YzmhadvisbRdxRHOcksbcWPOvbarwPf8JR/DIX1o0S3bie8Rcr
	 Qw3hLQbs6ZfZPPtqXt0TjrOQcY8gmqsu7u8Jj3uzZ6nou2EJnwdIabpYeEaW65b056
	 MB7KuzUkvp1+uzkGrw68H18n6N0VWKP/xORso8gI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69F55F8032B;
	Tue, 30 Aug 2022 06:49:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27D15F8023A; Tue, 30 Aug 2022 06:49:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC9DAF800AA
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 06:49:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC9DAF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="t9Ngg8Oz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D0A87B8166E;
 Tue, 30 Aug 2022 04:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04247C433C1;
 Tue, 30 Aug 2022 04:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661834965;
 bh=MX3HxKSSop3rjgdhjGuG13nF1e38sAvQKoCTUvhyoj8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t9Ngg8Oz+9ub/LTUoxB5A7w2yb5j3iCV11c37OUcfd0/dKaWglX5MTcpxH1kRb0JB
 FJwpEb10EalJ8DWnYiNoZN08vesNBzBybRy8O163m9h4g224XJEypOdeZKmF1Q3rtJ
 KMMeTaksT20lG1YvTK/DVPf3b+OxgZr02HHMasVDYNsHSxdgbfzfWuyATTA54TutZE
 xfey/PuiLBe6AkcCLxJg4Ou/pfnFpkP9IcOjkVRy/PIaV4VfPXa/fyxkh59NjH1vZ0
 XBKci6P28xMu6BvoV9Gl1vz2uI3hgB07IbYE1cFgnYJ1nlh99/ZQNZlXDgrMLw79C+
 Z0ZR84HTHNRMg==
Date: Tue, 30 Aug 2022 10:19:20 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 00/11] soundwire: register cleanups
Message-ID: <Yw2W0GYriUZIE2k6@matsya>
References: <20220823053846.2684635-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823053846.2684635-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 bard.liao@intel.com, pierre-louis.bossart@linux.intel.com
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

On 23-08-22, 13:38, Bard Liao wrote:
> Clean-up and reorder/regroup SoundWire SHIM registers.

The series does not apply on sdw-next. I have already applied and pushed
IDA series, so I guess it needs rebase on that

-- 
~Vinod
