Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C950C59E831
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 19:01:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60A9E1670;
	Tue, 23 Aug 2022 19:00:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60A9E1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661274092;
	bh=d+UO5JCLB6pOQQecPBJTnPqg/phJ8oDfkjxDgPpU78M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mSJvE5aROHch3emAXmIyIxAaSfroQMjzVqvL7pchP5+d7PlSoYnFQcFyVAU0nx6vD
	 r4CLEPR+HVAd/olutpw4dQa40MISpdehCMvlGQdJeff/fiXpslTaFrMbEo05DCVrTd
	 sIv8Fqm78rb4R+PCes9vvU5jsqQQczyVUM03gPr4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0997F8027B;
	Tue, 23 Aug 2022 19:00:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6ABDBF8020D; Tue, 23 Aug 2022 19:00:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EF7FF8014E
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 19:00:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EF7FF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dWGbMRp6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 76596B81F73;
 Tue, 23 Aug 2022 17:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BCCC433D6;
 Tue, 23 Aug 2022 17:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661274027;
 bh=d+UO5JCLB6pOQQecPBJTnPqg/phJ8oDfkjxDgPpU78M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dWGbMRp6InFfgbZqiXs/vb/mHcDhH1LHqnOYHw8dNY3Xl58QBc8nSYOZQm4YYnMVo
 nkaL7e2XtTTDlRkLD5ZB4LUX/SoNPCNdmfbnF4ZLVf3ug7pmzTByhfDAgnoPfhrbrx
 Rij1uPC7arGaxcC6UOLMLyrluOHs6QVHY/F9YHiijb12ayaqo/SnMdztWZjZvv8ucP
 Zg/1Oe34+GrYSgXc8yEYaHpNhK7TEZR6tVJW9EYagtRc8c3k2csTnCQfutdHb1WuQy
 Pi8c/zgzjqQH8TTxkG/8Mx2d5Pcvt1AGiBTvPvH/5/+yfVoO27TpsSXGb5IECpj19u
 h7C5Z7OiCU+rw==
Date: Tue, 23 Aug 2022 22:30:23 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/3] soundwire: allocate device_number with IDA
Message-ID: <YwUHp3ivSktx6/Lo@matsya>
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
> bus segments. 

And how is that an issue that should be fixed?

> To make the device_number unique at the system level, and

Why should we do that...
> unified with the HDaudio/iDISP SDI values, this series allocates the
> dev_number with an IDA restricted between 4 and 11 (inclusive).

Does this not place an artificial restriction that a system can have
only 12 devices if we have unique device

Perhaps a better way would be to use dus:dev combination while dealing
with a device always..??

-- 
~Vinod
