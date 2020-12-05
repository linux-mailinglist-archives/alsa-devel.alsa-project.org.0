Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 124B82CFA57
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Dec 2020 08:47:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A9E418D0;
	Sat,  5 Dec 2020 08:46:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A9E418D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607154468;
	bh=3ovR2MSyO+5/qt/IdHjAeJTXVn/uSem0OvtClb/IKYY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HuKHgXvOw2l/hfVf3hfe4C7yb409MJyxS+JIYmR2SQjQyZ5AEU3QWF5oWp0pbZLgv
	 72SgXP/A9kUuYyCxBBbzLS0PMZSxZ0ZG1JSo9Q8QWRB+/anEUJQ6v1rwrUKTunuEt4
	 PCT3FoW1WhgLo6sTvu/bvTWedUeg4zYp4p0Ok4zM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 872BFF804B2;
	Sat,  5 Dec 2020 08:46:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BE06F80254; Sat,  5 Dec 2020 08:46:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 222D1F80254
 for <alsa-devel@alsa-project.org>; Sat,  5 Dec 2020 08:46:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 222D1F80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mR64Efcj"
Date: Sat, 5 Dec 2020 13:16:30 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607154394;
 bh=3ovR2MSyO+5/qt/IdHjAeJTXVn/uSem0OvtClb/IKYY=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=mR64EfcjossT4dvgyqNo2s0QxeHD4B4OnnuBSTJ97ChyfEhqsayWgvB9oPJkJpmnO
 MijbMcIsSSZFXB+WeWoNAVRYB6I6geCI6/5+u1klCUKvfrmHHuKGK6l1/+9obtkHxf
 Mm+S25PIuoAx5/eSylCbvA58Gt98U9YLxRcaKAEzsqdmbypFY64OYJ/PezSDwHLikj
 YtX7rtGVlECjQ7TyYrP440oUZhCSnq0KLQ5uzET2y2d+2f9HynodMKj6zNTYBP+85+
 49PHFLOKzuBBdNIE/AC19dkWhZaXY8UDP01OeAAXmo9ittIXuT/LQrNCM62VYEvdKQ
 l0V+hlcGy5u7Q==
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 5/7] regmap: sdw: use no_pm routines for SoundWire 1.2 MBQ
Message-ID: <20201205074630.GS8403@vkoul-mobl>
References: <20201202204645.23891-1-yung-chuan.liao@linux.intel.com>
 <20201202204645.23891-6-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202204645.23891-6-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

On 03-12-20, 04:46, Bard Liao wrote:

>  MODULE_DESCRIPTION("Regmap SoundWire MBQ Module");
> -MODULE_LICENSE("GPL v2");
> +MODULE_LICENSE("GPL");

Why do you want to change this ?

> -- 
> 2.17.1

-- 
~Vinod
