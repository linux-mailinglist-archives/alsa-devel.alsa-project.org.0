Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DED5BEA07
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 17:21:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2827720C;
	Tue, 20 Sep 2022 17:20:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2827720C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663687290;
	bh=CrOjcdjcD3HJ14a8ICpBWwws9UoHAEiQHEyf3ceayWA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uYeyWd4akMREGlda379DqpaOjIBEqMBOdsPFd4BvZ0gAZUggHYcbpttDRBW7j87Aq
	 9SUvX8/gQAWhyTCgB9nNYnx/i/uvjOPK4CKepGzComLWI1tsO4hMZ/jrhPInhTkkSU
	 Ae8zRsp43a+i/cC2cBV6rj3yByY18HSf1JqtiIXE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9307FF80171;
	Tue, 20 Sep 2022 17:20:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBBA8F800C9; Tue, 20 Sep 2022 17:20:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B8F8F800C9
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 17:20:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B8F8F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="azAsn2Bw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663687225; x=1695223225;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CrOjcdjcD3HJ14a8ICpBWwws9UoHAEiQHEyf3ceayWA=;
 b=azAsn2Bwlc0U/iOHvzZZb3SFFRZZm+Sq/XdRa5hmIUc4bJlV0jBHmnDT
 Vx2k6eMbmHkrXMreD+MxdnSiPUFmJC1PXjc8CCQBqy2m9sjSpJWhqHwvb
 aXdQ4164Lkah83k89nEyjEaDojAqrU/ot4Z3AeYJmhMcGqv3gWzVRXkk/
 pS3goMHavHND/hJvvJfcpvTxTo/HuO8RhEwH83d3rWm6+n3pKwpuo7XYC
 8dbloBNVxNRXtgau2ccerK1Y+FQOyYCBAZTOjbykC/y45i8PoAMejhuxD
 49ReBmSgP4mGhDgKp3LEU0bLmfZpSRrkSnZjjtY52FgXSDy+DUMlEhLYJ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="386013873"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="386013873"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 08:20:07 -0700
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="681354723"
Received: from atcamara-mobl1.amr.corp.intel.com (HELO [10.251.209.87])
 ([10.251.209.87])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 08:20:04 -0700
Message-ID: <0264df6b-15fe-9082-be3a-7fa31488366d@linux.intel.com>
Date: Tue, 20 Sep 2022 17:20:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 0/4] ADD SOF support for rembrandt platform
Content-Language: en-US
To: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220913144319.1055302-1-Vsujithkumar.Reddy@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220913144319.1055302-1-Vsujithkumar.Reddy@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 venkataprasad.potturu@amd.com, Basavaraj.Hiregoudar@amd.com,
 Vijendar.Mukunda@amd.com, Daniel Baluta <daniel.baluta@nxp.com>
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



On 9/13/22 16:43, V sujith kumar Reddy wrote:
> This series consists of
> 
> 1.Make ACP core code generic for newer SOC transition
> 2.Add support for Rembrandt plaform
> 3.Adding amd HS functionality to the sof core 
> 4.increase SRAM inbox and outbox size to 1024

As Daniel Baluta mentioned it, the Reviewed-by tags are added with a
GitHub API script when the topic/sof-dev-rebase branch is updated.

Since I was the only reviewer, it's probably faster at this point to
re-add my tag, for the series:

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> Ajit Kumar Pandey (1):
>   ASoC: SOF: amd: Make ACP core code generic for newer SOC transition
> 
> V sujith kumar Reddy (3):
>   ASoC: SOF: amd: Add support for Rembrandt plaform.
>   ASoC: SOF: Adding amd HS functionality to the sof core
>   ASoC: SOF: amd: increase SRAM inbox and outbox size to 1024
> 
>  include/sound/sof/dai.h            |   2 +
>  sound/soc/sof/amd/Kconfig          |  10 ++
>  sound/soc/sof/amd/Makefile         |   4 +-
>  sound/soc/sof/amd/acp-common.c     | 111 +++++++++++++++++
>  sound/soc/sof/amd/acp-dsp-offset.h |  33 +++--
>  sound/soc/sof/amd/acp-ipc.c        |  49 ++++++--
>  sound/soc/sof/amd/acp-loader.c     |  20 +++-
>  sound/soc/sof/amd/acp-pcm.c        |   3 +-
>  sound/soc/sof/amd/acp-stream.c     |   7 +-
>  sound/soc/sof/amd/acp.c            |  52 +++++---
>  sound/soc/sof/amd/acp.h            |  38 ++++--
>  sound/soc/sof/amd/pci-rmb.c        | 186 +++++++++++++++++++++++++++++
>  sound/soc/sof/amd/pci-rn.c         |  11 ++
>  sound/soc/sof/amd/rembrandt.c      | 134 +++++++++++++++++++++
>  sound/soc/sof/amd/renoir.c         | 101 ++--------------
>  sound/soc/sof/ipc3-pcm.c           |   9 ++
>  sound/soc/sof/ipc3-topology.c      |  33 +++++
>  sound/soc/sof/topology.c           |   1 +
>  18 files changed, 653 insertions(+), 151 deletions(-)
>  create mode 100644 sound/soc/sof/amd/acp-common.c
>  create mode 100644 sound/soc/sof/amd/pci-rmb.c
>  create mode 100644 sound/soc/sof/amd/rembrandt.c
> 
