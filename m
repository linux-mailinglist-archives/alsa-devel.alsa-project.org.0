Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C335E682C2D
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 13:04:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05B811FE;
	Tue, 31 Jan 2023 13:03:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05B811FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675166680;
	bh=eZPwAa3uVEmQhS+VUB7emHsAjVwBiFMfTB3sPV6910Q=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=X6xZW/xzYiZIh5AoLAmFMsB8Sv0/kTv8E0QLz2fI63HfHjSUUNNbwwxZ9aVWYvI54
	 nTAp4yqSLfLdrJo+ZpB6gavl74ApAXu0/XaWDtTN8PoP0wPchLAJteVTCeBjHMnbMO
	 jAt/PEqfH4SS9qhYk5dxT82B2B7BZh+5SUN2CubA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCC6EF800A7;
	Tue, 31 Jan 2023 13:03:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D31FCF804C2; Tue, 31 Jan 2023 13:03:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1850F800A7
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 13:03:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1850F800A7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aTVu6jJa
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 45F60614D5;
 Tue, 31 Jan 2023 12:03:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7699CC433EF;
 Tue, 31 Jan 2023 12:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675166610;
 bh=eZPwAa3uVEmQhS+VUB7emHsAjVwBiFMfTB3sPV6910Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aTVu6jJaZOoDZ8GCdZ0z8lGwNpvTbD8jvSWt/BExP6jT1zMCD7cjlLhPYkbe4Izy1
 bOtaYy5+CRtKMFOK7sgXTQI4Ruai4ab9FPDEjke8VXM55tvt7xkDpUgV0qm8gNeKR1
 B/+FNMJPamScJ+EgQrEh7R5K6Xh1AGV0Xe+1IpQudSbX8WH38hCCNqXCMxGMnDezrK
 8Yf2qduOWzLLpEWSkj5XLSX/h3WKaisW+Mhlp5OKAQDyAXKsqLqhP2Uc7OWnRZFAKb
 Wp2jEaAAJ5jLnZgGuwUC3rVP8jHtq+JsDGW20t4JSDqxS0XhdJ7URG1qCCUBf26P1S
 ZEC3rnOX73gZA==
Date: Tue, 31 Jan 2023 17:33:25 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH v2] soundwire: bus_type: Avoid lockdep assert in
 sdw_drv_probe()
Message-ID: <Y9kDje/NwUluB2O0@matsya>
References: <20230123172520.339367-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123172520.339367-1-rf@opensource.cirrus.com>
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

On 23-01-23, 17:25, Richard Fitzgerald wrote:
> Don't hold sdw_dev_lock while calling the peripheral driver
> probe() and remove() callbacks.

Applied, thanks

-- 
~Vinod
