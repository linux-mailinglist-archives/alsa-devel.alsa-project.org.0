Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 577C72CFA4C
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Dec 2020 08:44:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D959218B7;
	Sat,  5 Dec 2020 08:43:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D959218B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607154242;
	bh=vgr/4zhYo/GWjvLrs9SuBftzWso6XJWiC5KcvOZQpWM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aVq0O6hHl/PiXFvgtPA72XvNNqxcwVrME0QqoTjZQNE45iSRX8Zu9OQXimA7LNjqe
	 NEyyzR/W+D1ovokaCnBjGCzSy1W8Mlq+k4w+qjeNlsmBXj9QHd0MHxb+lu1Vnayofy
	 L7yErJ2zTJ3pHq6K11uyBz0HPl6WZ9za3D8EbQ4c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08852F80254;
	Sat,  5 Dec 2020 08:42:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE8C0F8016D; Sat,  5 Dec 2020 08:42:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD972F800E8
 for <alsa-devel@alsa-project.org>; Sat,  5 Dec 2020 08:42:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD972F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M+XlDxUC"
Date: Sat, 5 Dec 2020 13:12:10 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607154135;
 bh=vgr/4zhYo/GWjvLrs9SuBftzWso6XJWiC5KcvOZQpWM=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=M+XlDxUCUyHicUEQPaEnt984FrcxJwSotwmcfDASKG9IYW/0Lc0S50KYVvBT6CXTZ
 TO7ML80/0zLXsboLG1YHmP9lZ50dvkVtmGrTU15WKNDN/sy7f0RD26tZS12oWdUA/G
 SE6WMafdtcFxiBzowAPwT7ipuBhBDZcFo0yIZe+U1na95TcKjajZxxHEoHCggSC+Ry
 DsJLGaDbpU1xHnVTypacHWsYTC4v0RoHc3+qzuxauN1LCwABTnOMlvdRUzg1TpxrZI
 T/E2pUU1D/GgIJrwIciqvgNX8y2cBpaS5xgukCxWht/Xosu2d0HyB+sd8M4uCUm6KB
 CmNNFNTN4pTXg==
From: Vinod Koul <vkoul@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] soundwire: intel: fix another unused-function warning
Message-ID: <20201205074210.GP8403@vkoul-mobl>
References: <20201203230502.1480063-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203230502.1480063-1-arnd@kernel.org>
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On 04-12-20, 00:04, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Without CONFIG_PM, there is another warning about an unused function:
> 
> drivers/soundwire/intel.c:530:12: error: 'intel_link_power_down' defined but not used [-Werror=unused-function]

Applied, thanks

-- 
~Vinod
