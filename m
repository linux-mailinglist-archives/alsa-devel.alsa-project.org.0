Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E9637A630
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 14:00:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E109017BA;
	Tue, 11 May 2021 13:59:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E109017BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620734441;
	bh=bCfMYBm9bj3DpdDPiHHkxHjc9hQjxEEHrRs4ALJlbKg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qxqMmu0ax5Fxcm8Zx/RbQRadEz7kbZljwr3cihshXnuToVzrUF43uGk39wADntevD
	 H0snVYzR8OKUmwMnldJKWXHQIIwzCFlE3WGOZmfhByV/zYVEfC44ewpvbZyp5PKM9r
	 0V+yRC7jUMNArkVDMeiGrCiEfR0BvqdLfly/1qtU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4376CF8016B;
	Tue, 11 May 2021 13:59:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DDF1F800E9; Tue, 11 May 2021 13:59:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C74D1F800E9
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 13:59:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C74D1F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZskWK1iq"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 15E56613BC;
 Tue, 11 May 2021 11:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620734341;
 bh=bCfMYBm9bj3DpdDPiHHkxHjc9hQjxEEHrRs4ALJlbKg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZskWK1iqCqh5h8yKujom1ymUXz8dJo6WA/XekhZx897r7VzrgMXFRxkKXqesa9Qfu
 PyHiFFZeShCr/Djy3F4fkOwX41cfwdWYXnZNdJ3aqqoGS6Ig61M4EL1ySOn5JHlEMr
 f24DpvoM8edviOojmGpf6Gbb+wwbz0Zfz33B2q2fY19/vsFE4KsBk6J9bdDnw3BqB1
 QzL9znyThLMCLO83W1SD6ESQlsdDLsyM3S6B6oU2gaIEox9yCC2Rr7wBYxp9OO1USd
 IB1fXLngFMZuWF3YsiVVEHkEFANOH5NfMrzDtCQaXdhVKnPArrfwQIcItesxWy4XE1
 ztBQeqbXsK33A==
Date: Tue, 11 May 2021 17:28:56 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire/ASoC: add leading zeroes in peripheral device
 name
Message-ID: <YJpxgAYQDJLQg+yV@vkoul-mobl.Dlink>
References: <20210511060137.29856-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511060137.29856-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 jank@cadence.com, sanyog.r.kale@intel.com, rander.wang@linux.intel.com,
 bard.liao@intel.com
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

On 11-05-21, 14:01, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> We recently added leading zeroes in dev_dbg() messages but forgot to
> do the same for the peripheral device name. Adding leading zeroes
> makes it easier to read manufacturer ID and part ID, e.g.:
> 
> sdw:0:025d:0700:00
> sdw:0:025d:0711:00
> sdw:1:025d:0700:00
> sdw:1:025d:1308:00
> sdw:2:025d:0700:00
> sdw:2:025d:0701:00
> sdw:3:025d:0700:00
> sdw:3:025d:0715:00
> 
> The use of '01x' for link_id and unique_id is intentional to show the
> value range in the code, it's understood it does not actually change
> the format.
> 
> To avoid problems with git bisect, the same change needs to be applied
> to the Intel SoundWire machine driver, otherwise the components can't
> be found and the card registration fails.

Applied, thanks

-- 
~Vinod
