Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 955CF3DDB41
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 16:41:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F41A4170F;
	Mon,  2 Aug 2021 16:40:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F41A4170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627915277;
	bh=HRQe5IgTCJl6BJBOOnWV2LUsULeXRrlO4+xd/GzEm4A=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=knB1+OecWdQwop/qmd4PQ4xnnS258VHMvRI2fph0ipOMdoyS9urjRv4tqllkO37gz
	 g40D46dz/6FwH8gRaKeWMyy268gbojT0Rs/IuPc1nXKxQ9Dg3wu7wh0nMZtzRv+h7+
	 7B+VcmbJ2GbseSL+EJJsiSCruG/hrhoWC2W5Vz6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B142F8014D;
	Mon,  2 Aug 2021 16:39:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AD67F8025F; Mon,  2 Aug 2021 16:39:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93DBDF800BF
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 16:39:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93DBDF800BF
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="299057813"
X-IronPort-AV: E=Sophos;i="5.84,289,1620716400"; d="scan'208";a="299057813"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 07:39:36 -0700
X-IronPort-AV: E=Sophos;i="5.84,289,1620716400"; d="scan'208";a="436684246"
Received: from skshirsa-mobl1.amr.corp.intel.com (HELO [10.209.189.56])
 ([10.209.189.56])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 07:39:35 -0700
Subject: Re: [PATCH v2 0/6] ASoC: Intel: bytcr_rt5640: Fix HP ElitePad 1000 G2
 audio routing
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20210802142501.991985-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <73bdef93-bc19-61fb-1d6a-c211df55d3d7@linux.intel.com>
Date: Mon, 2 Aug 2021 09:39:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210802142501.991985-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Bard Liao <bard.liao@intel.com>
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


> Hans de Goede (6):
>   ASoC: Intel: bytcr_rt5640: Move "Platform Clock" routes to the maps
>     for the matching in-/output
>   ASoC: Intel: bytcr_rt5640: Add line-out support
>   ASoC: Intel: bytcr_rt5640: Add a byt_rt5640_get_codec_dai() helper
>   ASoC: Intel: bytcr_rt5640: Add support for a second headphones output
>   ASoC: Intel: bytcr_rt5640: Add support for a second headset mic input
>   ASoC: Intel: bytcr_rt5640: Fix HP ElitePad 1000 G2 quirk

For the series

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks Hans for your work, this is an interesting hardware setup.
