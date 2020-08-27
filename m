Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F6C2541D9
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Aug 2020 11:19:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05C6D17DD;
	Thu, 27 Aug 2020 11:19:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05C6D17DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598519996;
	bh=5CSOYiTDnWhgk6b8udFSA9YQh3AgxjyxOtINZ6oasks=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QWhPyCOwGQLNaIo4b14lpuGRPjDVcUQLD4+9HwhWSNI4d+2JDrnb4nypZ3AKZhpsB
	 eTCcLl2T5dv8gy4Rhjm7/F1XkmZ2i8HnNI0sBNq9+dXjhRh4kPuJDzmVZr0/lsZJs6
	 Uh5SddRQxzbHlIg8tL9lbfBs4mM1ZSY5jc3YOjHw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16A19F801D9;
	Thu, 27 Aug 2020 11:18:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 158CDF8016F; Thu, 27 Aug 2020 11:18:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8C67F80085
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 11:18:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8C67F80085
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1kBE2Y-0004qN-Hf; Thu, 27 Aug 2020 11:17:50 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <mfe@pengutronix.de>)
 id 1kBE2U-0007L7-JH; Thu, 27 Aug 2020 11:17:46 +0200
Date: Thu, 27 Aug 2020 11:17:46 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Yu Kuai <yukuai3@huawei.com>
Subject: Re: [PATCH 2/2] ASoC: fsl: imx-es8328: add missing put_device() call
 in imx_es8328_probe()
Message-ID: <20200827091746.xcbggzqqufndyuk7@pengutronix.de>
References: <20200825120531.1479304-1-yukuai3@huawei.com>
 <20200825120531.1479304-3-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200825120531.1479304-3-yukuai3@huawei.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:08:08 up 286 days, 26 min, 272 users, load average: 0.04, 0.12, 
 0.08
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 yi.zhang@huawei.com, festevam@gmail.com, s.hauer@pengutronix.de,
 tiwai@suse.com, lgirdwood@gmail.com, nicoleotsuka@gmail.com,
 broonie@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 yukuai@huawei.com, shawnguo@kernel.org, xobs@kosagi.com,
 shengjiu.wang@gmail.com, linux-kernel@vger.kernel.org
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

On 20-08-25 20:05, Yu Kuai wrote:
> if of_find_device_by_node() succeed, imx_es8328_probe() doesn't have
> a corresponding put_device().

Why do we need the ssi_pdev reference here at all?

Regards,
  Marco
