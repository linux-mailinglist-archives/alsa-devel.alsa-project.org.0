Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DECB3DCFC7
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 06:37:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B304E17D3;
	Mon,  2 Aug 2021 06:36:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B304E17D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627879032;
	bh=SgNNxqoN0R+IJq58I42KXc1cu7KooyADDnnuUWV4/SI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=idZPnESAsf+LyqpN1vzFNHrVKtYjmI26n+k805RFZF+GQ7xMOoh6fJTbbjj03Ccxe
	 f7IuQoeflPZirZIXgkx0TtTVjPpKEhFLTjkRHW4t9ug0HB1M3g7+UO3y8I4VHAv322
	 GJXveWSqfZcC9CFOEZiOK1xlZzRALRbT9QiWbdv8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D271F8025F;
	Mon,  2 Aug 2021 06:36:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1232DF80271; Mon,  2 Aug 2021 06:36:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86846F8025F
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 06:36:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86846F8025F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MoAKPx7+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C4602601FE;
 Mon,  2 Aug 2021 04:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627878957;
 bh=SgNNxqoN0R+IJq58I42KXc1cu7KooyADDnnuUWV4/SI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MoAKPx7+08nU3QMhm8eZon6nCGbySXrA12filjWyl4TEV44A3XamfG0ZgfuA4NHSl
 WnhMmUm5IQCiPVsB7+8xjMPzoyIpNnQQd8aPfV21mNrvl1uFPCsRom8pUSuTKfhSiY
 G8uNmsNoI7uLg7TPwNhK76Y2BdjfoIGhglLJ18hW0Z2IgZlJe8QPUEos+muQqGtVZ+
 w80tYRKvsFLEx/v7qCu1WBNDtPlpol0iKJzMcBzKyGy6Oa0Czr1SAFF3awrrtAGxCb
 15D0oKXEwJ1CzPBImIA4BApcQc8TRa5FymLjBRBMdJlIf6o2yZlxKCN3/F9usitlYW
 fGygHd0EEClCA==
Date: Mon, 2 Aug 2021 10:05:53 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2 1/6] soundwire: move intel sdw register definitions to
 sdw_intel.h
Message-ID: <YQd2KSaFkIQqx+F7@matsya>
References: <20210723115451.7245-1-yung-chuan.liao@linux.intel.com>
 <20210723115451.7245-2-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723115451.7245-2-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

On 23-07-21, 19:54, Bard Liao wrote:
> Those Intel sdw registers will be used by ASoC SOF drivers in the
> following commits. So move those definitions to sdw_intel.h and it can
> be visible to SOF drivers.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
