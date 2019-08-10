Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEAF888F9
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Aug 2019 09:04:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6DC4166A;
	Sat, 10 Aug 2019 09:03:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6DC4166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565420661;
	bh=2Qes0wtT94IDdzj+NUH2cvt5ajCpxTJGtqPmQua0CHg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XJET29s4QYvhZ3Q845tefmObhnqdMntSIR6q2IGwbGWzayEFeTm54tw33a6LWoEFl
	 IYiBoILdmMu5lO4/QBBQ4Sj7EDgEMaPrbEUuGhAz6zgGzY7cgXYTYZ0IVE12rUaM20
	 Et4ycMx0NWFn9iLY0Jhle6xS2QdP13pl0owDRWMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8525CF804FF;
	Sat, 10 Aug 2019 09:03:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 438A0F80535; Sat, 10 Aug 2019 09:03:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9900F8015B
 for <alsa-devel@alsa-project.org>; Sat, 10 Aug 2019 09:03:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9900F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fmFGNzTT"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C0872208C3;
 Sat, 10 Aug 2019 07:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565420591;
 bh=j3o2I6/nAgp98LE0CK60cAiv7Ns+ZvZsp9cgjjg7OUU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fmFGNzTTTXJ3aZjvnBjLK8baXIiRf1t9rlTbYhp/0bdNPj3bBfU1+UeCyqEKaNbmH
 uZry4cY/QxywKrsZVi8KJEhqytd3i71giBVfyc7Ru6locgKUzRTNsJHYgxYLSXeqdr
 nGnloxOG/DFHateAN2a7zO4dyJOEMwwAvEb6BvCM=
Date: Sat, 10 Aug 2019 09:03:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190810070308.GB6896@kroah.com>
References: <20190809224341.15726-1-pierre-louis.bossart@linux.intel.com>
 <20190809224341.15726-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809224341.15726-3-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH 2/3] soundwire: cadence_master: add debugfs
	register dump
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Aug 09, 2019 at 05:43:40PM -0500, Pierre-Louis Bossart wrote:
> +/**
> + * sdw_cdns_debugfs_init() - Cadence debugfs init
> + * @cdns: Cadence instance
> + * @root: debugfs root
> + */
> +void sdw_cdns_debugfs_init(struct sdw_cdns *cdns, struct dentry *root)
> +{
> +	debugfs_create_file("cdns-registers", 0400, root, cdns, &cdns_reg_fops);
> +}
> +EXPORT_SYMBOL_GPL(sdw_cdns_debugfs_init);

You create this function but never actually call it.  Don't add apis
that no one uses :(

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
