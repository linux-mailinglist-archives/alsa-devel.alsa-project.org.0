Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3957141E6A6
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 06:25:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC08016EC;
	Fri,  1 Oct 2021 06:24:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC08016EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633062329;
	bh=yPLO6sbNbrqRSdQVyGY0+tjRtqQaJKTwoi57bTd853k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bGf81qtenikcwP7aMONFhTo7IxqKLhSz0HVJ2OWk/wmVf25D9r3Ozv2aBvIUlXE49
	 eptaZWeeYaKFHFa+OQL9gyYwIcXJHmC7cvQMCDuUrHEdMLMi2/dv7xRuO4DgyYl2VT
	 L5nKDN+tuBaSA64Ujp8FIxT1+KtJHXMp1B3+T5ew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64C17F800F3;
	Fri,  1 Oct 2021 06:24:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32880F80245; Fri,  1 Oct 2021 06:24:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F05BAF800F3
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 06:24:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F05BAF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="e0XOw8ZT"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 83DD3619F8;
 Fri,  1 Oct 2021 04:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633062239;
 bh=yPLO6sbNbrqRSdQVyGY0+tjRtqQaJKTwoi57bTd853k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e0XOw8ZTUdtwwELC3AtLEiizytz7XGc5A3HDFi8RP8mGO6UVkZ5KCwfYHyRm8jzRU
 GFwAmXSsYsJg6sBmtAgxB7rSRZXaEclMZ/M6JgysifZXxzoiUndBFY8MiiW+m+HZkv
 3532b3ikJLxYD/RNfMuw14fqgX9XEKe/Ndk8AAdzc8hu1iHhKwheYmn3bY8mPfXS3O
 usZIWOIsgQVz8A/qa4E/WbMgW4baaTKAMxjI2MMO939ZOJycnL14jPQwfOd7sRoVQl
 hxc2I0Q/rvObtYKZZGCO/Lh+9kRY2O8FytqxPIF+fDwPzhF0yzjciqR5stM4WSVYIC
 e23JeTzP+hBEQ==
Date: Fri, 1 Oct 2021 09:53:55 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2] soundwire: debugfs: use controller id and link_id for
 debugfs
Message-ID: <YVaNW1MuotWqakyK@matsya>
References: <20210907105332.1257-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907105332.1257-1-srinivas.kandagatla@linaro.org>
Cc: sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
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

On 07-09-21, 11:53, Srinivas Kandagatla wrote:
> link_id can be zero and if we have multiple controller instances
> in a system like Qualcomm debugfs will end-up with duplicate namespace
> resulting in incorrect debugfs entries.
> 
> Using bus-id and link-id combination should give a unique debugfs directory
> entry and should fix below warning too.
> "debugfs: Directory 'master-0' with parent 'soundwire' already present!"

Applied, thanks

-- 
~Vinod
