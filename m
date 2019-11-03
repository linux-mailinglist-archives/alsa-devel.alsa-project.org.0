Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C16ED1D8
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Nov 2019 06:24:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 846E718BD;
	Sun,  3 Nov 2019 06:24:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 846E718BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572758691;
	bh=ZkZTdVn8h6X4hAP8I2qiIuV4N88G6u+iGWoj/K/2E+o=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bbj6hiAueFa29xJHrV4AisWnMKy9S8v5Z1lSBiyjU8323EsWv4zaVJlW1UNjSnHBd
	 dudhM4not9QLzFnhGGOkcq/O2zwzdIDop5iVi5Nis96J8E4Hctb5CEdiv8LdT+v1oG
	 HE5uvrqHkiXTpgJKPHhef6qkIGtz0cOpO60Xme+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA038F80535;
	Sun,  3 Nov 2019 06:23:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F07F0F80535; Sun,  3 Nov 2019 06:23:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E221F8015B
 for <alsa-devel@alsa-project.org>; Sun,  3 Nov 2019 06:22:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E221F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qQW3uyCl"
Received: from localhost (unknown [106.206.115.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 031EE214D8;
 Sun,  3 Nov 2019 05:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572758570;
 bh=Oqzo9tv0916Zywny7m8yNkHyuqH/rVT0IioPzWiyk2A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qQW3uyClIEkKDDRmnSOMh5Vy6tWu30EcjlSMXU7j+AXtC3ZLO96spvePoKnFVvNDq
 IP3RvtdtAu1ZIbtZCBBQ4lkz6bTPDAaqnSIZM6r84emnn5Ur5CMtJnPRMDB+4uKooL
 cHkJmH60CZEgTmXbCt1oBFEae7uWtAN89p/ArLfg=
Date: Sun, 3 Nov 2019 10:52:43 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191103052243.GF2695@vkoul-mobl.Dlink>
References: <20191023210657.32440-1-pierre-louis.bossart@linux.intel.com>
 <20191023210657.32440-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023210657.32440-3-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 2/4] soundwire: add enumeration_complete
	structure
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

On 23-10-19, 16:06, Pierre-Louis Bossart wrote:
> We need an async mechanism to prevent access to Slaves that are not
> fully-enumerated.
> 
> init_completion() will be invoked when the Slave becomes UNATTACHED,
> and complete() will be invoked when the state become ATTACHED. Any
> read/write before this status change will be delayed with a
> wait_for_completion().
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  include/linux/soundwire/sdw.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index a381a596212b..1381edfaa206 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -565,6 +565,7 @@ struct sdw_slave {
>  	u16 dev_num;
>  	bool probed;
>  	struct completion probe_complete;
> +	struct completion enumeration_complete;

Which series/patch uses this..?

Thanks
-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
