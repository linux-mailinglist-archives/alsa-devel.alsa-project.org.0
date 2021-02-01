Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1727430A5A1
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 11:42:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E3E016F9;
	Mon,  1 Feb 2021 11:41:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E3E016F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612176158;
	bh=2jh+fJAKzsRCx0tAq2KiU/OY1vRdWeJS3MENBzgi3Hs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f8B6lTLiViq043VVbT/qChm4U7Hxb/lA1xfrmKEQd7DEbb+SkFfiNVCwyhUx8JSsi
	 JyDccJHjP+GmWjSzJ8ds7QAd9vPV//Adiz8UIwiFrzlYBaat3uWXx0lHhpVDkPke2T
	 AmjtFv2r9Rm8j5+ob3FyeI8m89yr5Q955savtNzU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECDEAF80154;
	Mon,  1 Feb 2021 11:41:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31A4DF800E2; Mon,  1 Feb 2021 11:41:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C85ECF800E2
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 11:40:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C85ECF800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="psbVWCWx"
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC5B764E98;
 Mon,  1 Feb 2021 10:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612176056;
 bh=2jh+fJAKzsRCx0tAq2KiU/OY1vRdWeJS3MENBzgi3Hs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=psbVWCWxT2ELhKuPWLZh8RNyvdIHo1MwmMfXOjMoIS1/IbMpBWO5/Zk7f4b57Pgbh
 RoGCrnrDq6wXtBj59ylKXQqUA5XsmszF8h7mq1iPH+ZUITYnpvXzn3OjME7Bt7sygf
 AEg85HhParFbnDZApRP0XkL3MUNv+Y4+6FFMvTPDwfyRTGSIjivT7zfFNDPPtEBh3W
 E0ydZQ4fe1763PvgoYdsBMZ6t6cfd2V+fylI0Rm5rC0yiUjsCxeXzoUPgraZ3b7xDA
 mdgd8EWEuGlQbX6BYGgaMYjkuBmc+QJJbszHsAplypTr8ToWSeqlFklsP5Ge4pTNX5
 /cJwv4rJbnDOA==
Date: Mon, 1 Feb 2021 16:10:51 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: bus: add better dev_dbg to track complete()
 calls
Message-ID: <20210201104051.GW2771@vkoul-mobl>
References: <20210126085402.4264-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126085402.4264-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com,
 srinivas.kandagatla@linaro.org, jank@cadence.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

On 26-01-21, 16:54, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> Add a dev_dbg() log for both enumeration and initialization completion
> to better track suspend-resume issues.

Applied, thanks

-- 
~Vinod
