Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CB53D251C
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 16:03:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95FF41661;
	Thu, 22 Jul 2021 16:03:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95FF41661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626962637;
	bh=fCx34pyy5zhmiATs8iVFTMlaCZDb84ZObEWxKW0AAUQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h1jxmkwO1DgLh8S8B+atn5jmCbqN/yP8BFrgqgbz9nHaAMKB/ziBjkRLVDxTHSmVc
	 ZhzLMgMDH7/bir09cDw2zyB5pgdsHd5/IfaS1cH/m3DTfFTQxIRzlKfaurI3P1la/x
	 UwJZZD7Wevhn7UGHJWbVm7ZtJs2wRWpOVKCF17fw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8C8EF80256;
	Thu, 22 Jul 2021 16:02:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE409F80227; Thu, 22 Jul 2021 16:02:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99754F800DA
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 16:02:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99754F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FjK4UErk"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8F6F61244;
 Thu, 22 Jul 2021 14:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626962539;
 bh=fCx34pyy5zhmiATs8iVFTMlaCZDb84ZObEWxKW0AAUQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FjK4UErk5KiaCr1k0Iz75UMpe3LVTAPpRuOZqq58OwTFnlnXMJLbAKpfMTEeckvso
 aANEF2pp/rXkpV+NU/3/nrbzGYJuL1wRxEdBAKigHekkZMPtuPjyjdnAVyGvKqM+xc
 wFofBj0i/PqE7U4ioAQnI9guySY3HXc1e5dXlNA0cQXHDLFETCB1LyhxFdML8UjHzd
 TH7PiJqG3mS5PnPqpnf48Ze9hfS9iqsyaJTUsbLicyogs1r5G2OUdIubeA7GhtkDGp
 J+FHY3cv/SE95/umuUE5uQ+S2XeNnm5WGSDS3VUBwg2WHCeQPi1vtHrLneAN1pWlA5
 IbxZs89C/Z5NA==
Date: Thu, 22 Jul 2021 19:32:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/2] soundwire: dmi-quirks: add quirk for Intel 'Bishop
 County' NUC M15
Message-ID: <YPl6Z+jqR9gnTw05@matsya>
References: <20210719233248.557923-1-pierre-louis.bossart@linux.intel.com>
 <20210719233248.557923-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210719233248.557923-2-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, gregkh@linuxfoundation.org, Rander Wang <rander.wang@intel.com>,
 broonie@kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>
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

On 19-07-21, 18:32, Pierre-Louis Bossart wrote:
> The same quirk is used for LAPBC510 and LAPBC710 skews who use the
> same audio design.
> 
> These devices have the same BIOS issues inherited from the Intel
> reference, add the same _ADR remap previously used on HP devices.

This fails to apply on rc1, pls rebase or if there are any dependencies,
do spell them out

-- 
~Vinod
