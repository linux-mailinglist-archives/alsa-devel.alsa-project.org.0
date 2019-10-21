Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A743DE322
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2019 06:23:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCEDD15E2;
	Mon, 21 Oct 2019 06:22:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCEDD15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571631800;
	bh=SYIOW+k7WfhKqnbx5lkiSH8ZuL4kGg30UagdYFlP47c=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uxkr6hP0wSWe6Cn57BDIy0m/XNz3BTktVQB+e6HTF4W78dlzbarhhTbiuCmNDRD6B
	 qcdWhP/0oKysy/FdMHKWky9zeq2rHbd96pyT0VzFUi6df1fBaC4ch8bedDi9MexHef
	 nnewJEuWvqGJkuHg66mElWwZP2BvVblGz6Db6Ucg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A587F801EB;
	Mon, 21 Oct 2019 06:21:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D60AF80321; Mon, 21 Oct 2019 06:21:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD535F80112
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 06:21:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD535F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="00LqS1fA"
Received: from localhost (unknown [122.167.89.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 90285205ED;
 Mon, 21 Oct 2019 04:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571631686;
 bh=aKV0GI2LaBZexbyO2kDe7uvFBubaBAfSXZDSi1+3jrM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=00LqS1fAywMwgzZDkaA4wUXkNntXhF2/biX4ZwRPRe+H3nQoLyUSHXedpmUoU1k+9
 MD21JXUWro4CPAcjg0Ew5ewuIoGXuoqOBGx+zhf2qKo5hsx8d3UUxmNgoTfZ9E/DBA
 n6MiPppKQuMRlZQYgGqtvQCIWg9n4d1/fg4hTkig=
Date: Mon, 21 Oct 2019 09:51:17 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191021042117.GZ2654@vkoul-mobl>
References: <20190916192348.467-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190916192348.467-1-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 0/6] soundwire: intel/cadence: simplify PDI
	handling
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

On 16-09-19, 14:23, Pierre-Louis Bossart wrote:
> These patches were originally submitted as '[RFC PATCH 00/11]
> soundwire: intel: simplify DAI/PDI handling'. There were no comments
> received.
> 
> This series only provides the PDI changes, which makes it simpler to
> review. The DAI changes will be provided with the complete series for
> ASoC/SOF integration, which is a larger change.

Applied all, thanks

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
