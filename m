Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BED3A5C3E
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Jun 2021 06:44:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B4781779;
	Mon, 14 Jun 2021 06:43:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B4781779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623645870;
	bh=aI8cMZgT9nGkbzOwk4swnaCdK6M1OPDEIveCp5UKvNo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZRDcmpPyTp9C+NqN1C0yNAItX7DXW1haUbIIQYh76drkk7klDi1T1tJfuJKAymhf2
	 BPTEBBKO7ab1tfRSp3utIj+jj+tKMQiVJvrGC8VTopcxb3QZrn0f6Ll9bcybszLfnH
	 mYwqC77P1YDSKPDEfKN3ZSP6W/naahw9zcywPDmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D94F1F80234;
	Mon, 14 Jun 2021 06:43:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19BEBF8023C; Mon, 14 Jun 2021 06:43:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6AE0F800F7
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 06:42:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6AE0F800F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Kswggof0"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9502161283;
 Mon, 14 Jun 2021 04:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623645766;
 bh=aI8cMZgT9nGkbzOwk4swnaCdK6M1OPDEIveCp5UKvNo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kswggof0QOHxDsakxaZXl6U0LzceZK1TdqpkxcrKI1jHBW1YQAft7E6cax7/dq8ko
 7PQFW2M1QtmoD9dWaKPA3lFOEA/jPcsD6Q52XB4/9AbBNXLGNQnPsKqKOjl92czxs6
 tKoMfvKzIZZqoHvBEUUvuBnnw+0PAwq32gY21xf3POd1PT494EQmYZO7PuvH4mp6GW
 kVifhMaGcYO+PwSup8nWtUf4yiy4Q8iinBa0XR6Xf3y2mSNOT7CFKAZiajAcigeUhD
 vAYiHeLQ9LqgZoII0ylrke+YDVxiONz/Ro1kppRHEWvXSthsAUgQC1t19OaFl8OlfN
 2pTViCBwh3XFw==
Date: Mon, 14 Jun 2021 10:12:42 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v4] soundwire: intel: move to auxiliary bus
Message-ID: <YMbeQkK3EKsgkLj4@vkoul-mobl>
References: <20210511052132.28150-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511052132.28150-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, sanyog.r.kale@intel.com, rander.wang@linux.intel.com,
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

On 11-05-21, 13:21, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> Now that the auxiliary_bus exists, there's no reason to use platform
> devices as children of a PCI device any longer.
> 
> This patch refactors the code by extending a basic auxiliary device
> with Intel link-specific structures that need to be passed between
> controller and link levels. This refactoring is much cleaner with no
> need for cross-pointers between device and link structures.
> 
> Note that the auxiliary bus API has separate init and add steps, which
> requires more attention in the error unwinding paths. The main loop
> needs to deal with kfree() and auxiliary_device_uninit() for the
> current iteration before jumping to the common label which releases
> everything allocated in prior iterations.

Applied, thanks

-- 
~Vinod
