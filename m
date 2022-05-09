Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 101D051F491
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 08:33:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7AC6AE8;
	Mon,  9 May 2022 08:32:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7AC6AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652078027;
	bh=W8cliMtnerFoQoMHfNGdAtAdChXBgjuV4eR7fUqzKOY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uev04K6O/PBjioY8TRPBn9Y5Z03SBxyEDE6UBah5sEqDrjerec0cGzeN16VP0ZIyt
	 ndwi62oydncYDQ4QQspwXdswGjpQdtsU5PONQdpV+HKNsTSdxB6nnbSl8BTcI6SPjY
	 qNzrMLAUNi++tDzWJNNDEf3uFP7KBWy4Q3c0rYp8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31B34F80269;
	Mon,  9 May 2022 08:32:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3795F8025D; Mon,  9 May 2022 08:32:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 689A0F8014C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 08:32:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 689A0F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IA6KqQVJ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5B9CF60F24;
 Mon,  9 May 2022 06:32:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C81C385A8;
 Mon,  9 May 2022 06:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652077961;
 bh=W8cliMtnerFoQoMHfNGdAtAdChXBgjuV4eR7fUqzKOY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IA6KqQVJ3CIq3NTuobW1jvzyf40OZMdh91dnvWDEEEwohjTjQTu7Ofas53PDBLySx
 Fgk2yW7yy+wtiOACqXFvSQVqlCT1c2hqk4S/Up7e9e65AhYKHyzYsrEDi6L1zlEpDB
 6ZaG6RCo/kdvofN03aSZOCez2B6WxoF5pSqXOMbLCi85Ba7CYJztcUMpLXrV5MufKF
 UjKudBKl4OQengpKVDnzWrWvxECRjRi6/qrBhg60nuPoXTiAK/qFMfVyNKTyPEGDIL
 M0leKhN4IPHnNe780Nsfspa+a8ghOLupciheuGD4cFxo7g6HObfTX9W1JWRPXLoSCP
 moxEw927lLy2g==
Date: Mon, 9 May 2022 12:02:37 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/5] soundwire: use pm_runtime_resume_and_get()
Message-ID: <Yni1hdMzehYtSJM3@matsya>
References: <20220426235623.4253-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426235623.4253-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

On 27-04-22, 07:56, Bard Liao wrote:
> Use pm_runtime_resume_and_get() to replace the pm_runtime_get_sync() and
> pm_runtime_put_noidle() pattern.

Applied, thanks

-- 
~Vinod
