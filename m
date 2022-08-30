Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFC35A5AE3
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 06:48:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FD10165D;
	Tue, 30 Aug 2022 06:47:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FD10165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661834888;
	bh=o/BsIPtg6md1OkJKd4gG8ixwnMhUgGQo7v8th2g+4fg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PYF6TsjWprvdxZo4bqgGpjGy0K1XNfwd6Eu33ddshtoA1SNoOJVUFG9Uc6IBBtYnQ
	 QGU7ZhmgE9PtISE7rBdlwfwFuoOEFR7P0oACqjA1gvZOQLIOWgSB+SYbXvTCMFBWhv
	 PSgkVu80LCV3735FiYV8OvfC0g5EFR6lKweGfC8k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6330EF800AA;
	Tue, 30 Aug 2022 06:47:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44A5DF8023A; Tue, 30 Aug 2022 06:47:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0A59F8012A
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 06:47:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0A59F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qlfOsyLz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A55E3B8161C;
 Tue, 30 Aug 2022 04:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC4CDC433C1;
 Tue, 30 Aug 2022 04:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661834818;
 bh=o/BsIPtg6md1OkJKd4gG8ixwnMhUgGQo7v8th2g+4fg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qlfOsyLzQPR8vST6u16a00SupkgTKPLMi5QSIiqMCwlliNu6iYM6mKSClKLLjKkvl
 px5ZhJSQJWgASXjlOoZTkju15+FxmB1Bp1LW8/o/S/agnFqw5lV2R+whft4rm/M4lI
 imHDPcojO/U9exi5H99rCE3X83Ke9fSjhii8F4YVnBlsjZXh0Zsl7gBsYtdHncoPHA
 O6/M6uhOKwew5fFgRlFaMJm94IHYkF3e0OTyYS4A+5f8gZq3ztks5P9Y0maMw5XfJz
 gTRpv0mC1ec60jgIzK43d6/7qJklT+WtEfvI5Bo0D82Y33eOWmPWDcVtO7nuRAPYmi
 b710z4H2BtXyg==
Date: Tue, 30 Aug 2022 10:16:53 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/3] soundwire: allocate device_number with IDA
Message-ID: <Yw2WPRiWSh/qk/rE@matsya>
References: <20220823045004.2670658-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823045004.2670658-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 bard.liao@intel.com, pierre-louis.bossart@linux.intel.com
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

On 23-08-22, 12:50, Bard Liao wrote:
> The device_number is currently allocated in the scope of each bus and does
> not need to be unique at the system level.
> This leads e.g. on Dell devices with three or four Device1 on different
> bus segments. To make the device_number unique at the system level, and
> unified with the HDaudio/iDISP SDI values, this series allocates the
> dev_number with an IDA restricted between 4 and 11 (inclusive).

Applied, thanks

-- 
~Vinod
