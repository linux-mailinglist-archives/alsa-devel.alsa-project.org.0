Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB454B0F28
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 14:50:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98C4918FC;
	Thu, 10 Feb 2022 14:49:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98C4918FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644501000;
	bh=p4N+78S3zEuymfrL0nYcGvJ9HSg9I+EqER3IH8vanbw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LevAfYyJCsRHzE6T2PiEVrZiCFadNP/nZPEtr+7IwpspLqF4CZ1mGOfa4iC6cmiQ9
	 qJm4Vc1uMWndlCgMR+nvLQbDkrJ+vPYjXVh38aZJddTZvF3XIxwwFQBDvcrhgPwfw6
	 Y8RoRrsyFxa1Q3cnYiT5TMvk8f5KECI2Beu0vURs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FD19F80054;
	Thu, 10 Feb 2022 14:48:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00DD2F8028B; Thu, 10 Feb 2022 14:48:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E3C9F800A7
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 14:48:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E3C9F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RCpZyENI"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8B294B82551;
 Thu, 10 Feb 2022 13:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EACDC004E1;
 Thu, 10 Feb 2022 13:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644500923;
 bh=p4N+78S3zEuymfrL0nYcGvJ9HSg9I+EqER3IH8vanbw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RCpZyENIV4XpcuwU2buWrt+5Y6o0fabxY8fTF9YUi37BjKPmx3kqwdH5n0rRtbhqv
 tEKjct5vRxAlO4LunX6eu4/y3W9CbWcF3IW6bt1k5rUbhCl9YQ2f0Wr/GyJ19BtlaT
 rApMZquzP6WJ3qWygWpJqf5unNurs/vonu4/x6U9R4vEbBUKReUSTRaVv+VDuKOzPp
 LMj+4xc5jO+a1mvgBmwQIAbvMM0O0svGdYxerPIdeIEKURjVgDpHk1fLfMTam7jf/s
 +7d2QqoiY6Ci4ouT3HXxxTIJ/AETxWsVsRY4ssorOSroeTCNpX9MSMAQDgdEyQ5Zj2
 Oiju85ZQLkTwA==
Date: Thu, 10 Feb 2022 19:18:39 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: intel: fix wrong register name in
 intel_shim_wake
Message-ID: <YgUXtwfOPy0tD33z@matsya>
References: <20220126011451.27853-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126011451.27853-1-yung-chuan.liao@linux.intel.com>
Cc: libin.yang@intel.com, alsa-devel@alsa-project.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, srinivas.kandagatla@linaro.org,
 sanyog.r.kale@intel.com, bard.liao@intel.com
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

On 26-01-22, 09:14, Bard Liao wrote:
> From: Libin Yang <libin.yang@intel.com>
> 
> When clearing the sdw wakests status, we should use SDW_SHIM_WAKESTS.

Applied, thanks

-- 
~Vinod
