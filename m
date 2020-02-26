Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2D816F9DD
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 09:42:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59A191699;
	Wed, 26 Feb 2020 09:41:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59A191699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582706521;
	bh=LYIUguxIL6wJHCQWIRNDa0HHgxSUcSnBZ4MGaN9UEBs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sUSwUy8btv2VWbSB0dPHP+t6lK5//XR5ZLlGuv8aoj5Rql22GuU6dovFAlozxm/eo
	 P7xjUKOSTBG9fy05QseYUJepg32CwCTVKm97jw0S/rO3lyiidfIh20E3W1aeKUQndR
	 fVBH/2dJYxZjHjphWBfU9k4EO6U4e/FEX0fNVUHg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4C88F80213;
	Wed, 26 Feb 2020 09:39:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFAABF801F2; Wed, 26 Feb 2020 09:39:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BAEAF8014E
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 09:39:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BAEAF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mJqtwb1l"
Received: from localhost (unknown [171.76.87.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 78786222C2;
 Wed, 26 Feb 2020 08:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582706383;
 bh=LYIUguxIL6wJHCQWIRNDa0HHgxSUcSnBZ4MGaN9UEBs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mJqtwb1loYlCJ/FFQM9s1OHOUON3w4iePK73PkG8hhxlGfBeBVO4KHAlYOMnluSX+
 MjY+7kC6/tHP4Qpz6GKOUMBjdWOoyMl3GSAgdl9UsvYLVnHWDRyKNzYV3aVI3L0Ru2
 roTF4i1OHNCm5WlL2ws67tgrg/Jv63Q3eH8WQH1k=
Date: Wed, 26 Feb 2020 14:09:39 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 3/3] soundwire: add helper macros for devID fields
Message-ID: <20200226083939.GX2618@vkoul-mobl>
References: <20200225170041.23644-1-pierre-louis.bossart@linux.intel.com>
 <20200225170041.23644-4-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200225170041.23644-4-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
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

On 25-02-20, 11:00, Pierre-Louis Bossart wrote:
> Move bit extractors to macros, so that the definitions can be used by
> other drivers parsing the MIPI definitions extracted from firmware
> tables (ACPI or DT).

Applied, thanks

-- 
~Vinod
