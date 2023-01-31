Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D64682C36
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 13:07:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE1611DA;
	Tue, 31 Jan 2023 13:06:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE1611DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675166854;
	bh=6NvZwOTnmGtu06OJClq79zLqlK+qMM997UIwtzBa1rk=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nT+1jqwxaf0SGaDbAO7H92tDbWFhC3CV+kehrxHqrIGYmeXFwbfj4BF8IWJ3n7i07
	 64z+A2LlN4opcNL7Q6mN2hC45u42cJfq088nvIrG3aqLkf8ja1zxaDapMnmO7jggOG
	 U5dXQ7XX6m7g5xU+B1ollCLD7JJHiKc5lo5tpPQk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26DBEF804DF;
	Tue, 31 Jan 2023 13:06:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 434C0F800A7; Tue, 31 Jan 2023 13:06:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16885F800A7
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 13:06:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16885F800A7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Zh9OsXz2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 90D75B81BF7;
 Tue, 31 Jan 2023 12:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93AC3C433D2;
 Tue, 31 Jan 2023 12:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675166788;
 bh=6NvZwOTnmGtu06OJClq79zLqlK+qMM997UIwtzBa1rk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zh9OsXz25PRCuBcixfjmARbHu83f0+Z5Mlvk51qOtyCUYRy9qysNBeUsCVIOWE+6O
 f5V5qY4KG+0dAwTIDKUkGY7j8qCyyTSOZG6oiMYn5f9oEwCd3DuYlUafab/aAzLlfY
 tzkF4qnT+sZ7QHueEzDi8DMsTRg2PfYHMiy7YPu7Ie1/JiPvnuQoUiTa4TkElU9D+I
 s1c0jUcbtq0Rlk8+wJO+162qmBZjtgdzfLDj/Ghpzf4abDsAtyw4Y2sV+fMI1dcCt/
 B5FATRTtAmUqXA4sio22nMcgDidtgI6jmSsi+FKO2rFcvwzGsUPLYAhPxbmeuCF6Gc
 7VBTHEnrcJIjQ==
Date: Tue, 31 Jan 2023 17:36:23 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH v2 0/2] soundwire: Remove redundant zeroing of page
 registers
Message-ID: <Y9kEP+ozg8eyYLbS@matsya>
References: <20230123164949.245898-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123164949.245898-1-rf@opensource.cirrus.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 23-01-23, 16:49, Richard Fitzgerald wrote:
> Writing zero to the page registers after each message transaction can add
> up to a lot of overhead for codecs that need to transfer large amount of
> data - for example a firmware download.
> 
> There's no spec reason I can see for this zeroing. The page registers are
> only used for a paged address. The bus code uses a non-paged address for
> registers in page 0. It always writes the page registers at the start of
> a paged transaction.
> 
> If this zeroing was a workaround for anything, let me know and I will
> re-implement the zeroing as a quirk that can be enabled only when it is
> necessary.

Applied, thanks

-- 
~Vinod
