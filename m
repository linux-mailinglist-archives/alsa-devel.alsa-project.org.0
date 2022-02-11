Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B664B1EBC
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Feb 2022 07:49:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9431516E4;
	Fri, 11 Feb 2022 07:48:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9431516E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644562187;
	bh=gmBDke/Eqe0vt9nmaqpu+uYvi5DAKYYCl85zDp/sin0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qO8dyfTIR4xSKxcMo62t7FzdwdjcL5T39BK36UzAWe7FV812z0HZjTDKcle7VFnrl
	 pPwKpd3LAGSiqY5sfMoGzl7l6cHO1F7ArSQ4QrelQs1sBUimnsqNPL4+bPIBDu5GvY
	 18rXz8PP43n+G/BD9JAgnZtUIEGlndKjzD934KDU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0616BF8013D;
	Fri, 11 Feb 2022 07:48:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BA4FF80139; Fri, 11 Feb 2022 07:48:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3640F80125
 for <alsa-devel@alsa-project.org>; Fri, 11 Feb 2022 07:48:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3640F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Xoaj3I/S"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E085E61B72;
 Fri, 11 Feb 2022 06:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78AB3C340E9;
 Fri, 11 Feb 2022 06:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644562112;
 bh=gmBDke/Eqe0vt9nmaqpu+uYvi5DAKYYCl85zDp/sin0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xoaj3I/S1Qn84qINfIRlgGNGWzeWc7INRi9oy3CbwGvmxPssVMF8r+SycTI2w4CE/
 xhqSvqYM0ENUrj5kokkm3/ShV2dNXeZiyBmJKhtpEDA8Vu5+rTOdC1SFIX6+93+dpw
 6cmcHMCY8Y9lh5IvoCFUSeoj5ui4rd7XSbtWixax+khMGXbC7Uua0P4MqOx2eW/oTu
 Dmq84R4A5wrPzzLy80MEMRQrK9j/LeWgKBgoShARtksz9AzEZxhV4vL1Vt/CgP2x+N
 Ou//xV+Ei+miRQPyzVpImm/nQ9cA7/VcmLlVO7SXZ8v9G82/T0IyMAnostNp2Um97q
 657rn2HByJeaw==
Date: Fri, 11 Feb 2022 12:18:27 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 00/19] soundwire: stream: cleanup of 'stream' support
Message-ID: <YgYGu1S/RTuC5rhm@matsya>
References: <20220126011715.28204-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126011715.28204-1-yung-chuan.liao@linux.intel.com>
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

On 26-01-22, 09:16, Bard Liao wrote:
> This series revisits the SoundWire 'sdw_stream' support to split allocation
> and configuration steps. This is necessary if for example the routines are
> called multiple times from the hw_params stage. This also helps with better
> error handling.

Patch 13 added a trailing empty line to file, I have fixed that up while
applying...

-- 
~Vinod
