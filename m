Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7FD261195
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 14:47:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94FA916E7;
	Tue,  8 Sep 2020 14:46:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94FA916E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599569227;
	bh=MaeOl+6v1L0qf/Y77xQCskS48IYyVlLCVL3PXTTQg3g=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nL+SeYgl4bb3o+BE4doaSXzhZWQUHpFpqqheW6Kya/lg0cJSzBQNx3g4yrgARvXms
	 P1XY2TaeeSDw1EWASiok/fQAoSiJOtacaaUMV4FdZWoawCRa70MllNbjv/kzDueEwJ
	 GqVHxyO+ujrhPicGoQAGM/l6zu6ODmBoAWMESO/w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A694CF8015F;
	Tue,  8 Sep 2020 14:45:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39AA1F801F2; Tue,  8 Sep 2020 14:45:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 248DCF8010B
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 14:45:14 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 8487BA0056;
 Tue,  8 Sep 2020 14:45:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 8487BA0056
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1599569114; bh=b/A9QPQeR8HGF5I3TJZV1+lxFGDVaYfuxBJZUNhPV+o=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=TzCYYeaw9POFp0HwiKuqLbC3IcaDqlMpRHYzm/XbsldHvouu0SEZJhX6Ub7jMNWdf
 I66kqeB2khEsI0RfRKMXYFHI5weYKuCtayS9Y7w8mV5+g5C85XYbsJbojkWNINaJ1/
 zVrCmcYNFrCWVdl6WuDkvyjneHofjrywzjHWsXpI=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  8 Sep 2020 14:44:57 +0200 (CEST)
Subject: Re: [PATCH v2 0/4] soundwire: Remove sdw stream operations from Intel
To: Bard Liao <yung-chuan.liao@linux.intel.com>, alsa-devel@alsa-project.org, 
 vkoul@kernel.org
References: <20200903204739.31206-1-yung-chuan.liao@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <28bd0f89-3dc5-0bf4-bf2a-dca62fddc507@perex.cz>
Date: Tue, 8 Sep 2020 14:44:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200903204739.31206-1-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 bard.liao@intel.com, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com,
 linux-kernel@vger.kernel.org
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

Dne 03. 09. 20 v 22:47 Bard Liao napsal(a):
> Sdw stream operation APIs can be called once per stream. Move these
> operations to dailink ops. The linked series is "ASoC: Add sdw stream
> operations to dailink ops".
> 
> Pierre-Louis Bossart (4):
>   soundwire: stream: fix NULL/IS_ERR confusion
>   soundwire: intel: fix NULL/ERR_PTR confusion
>   soundwire: intel: remove .trigger operation
>   soundwire: intel: remove stream handling from .prepare and .hw_free
> 
>  drivers/soundwire/intel.c  | 60 +++++---------------------------------
>  drivers/soundwire/stream.c |  2 +-
>  2 files changed, 9 insertions(+), 53 deletions(-)
> 

Straight patches. I tested them. For all:

Acked-by: Jaroslav Kysela <perex@perex.cz>

Note: The ASoC part must be merged in sync -
  "[PATCH v3 0/3] ASoC: Add sdw stream operations to dailink ops."

						Jaroslav
-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
