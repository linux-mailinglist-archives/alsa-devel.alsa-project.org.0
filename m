Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCDDA6B4F
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2019 16:23:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BD8B167B;
	Tue,  3 Sep 2019 16:22:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BD8B167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567520627;
	bh=wq894k/Rm1BGzK+xWl/vtC9hmAk8QT/0gef7IGeWyt8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gh8EW0JwEHNuqZ1XoAmwZY4Kh1KpfTb6vz0T5kUH6Dx6Jz0ylJwCIfahYrYJdZqQ+
	 QFoxq/3gr6/ucVu6YfQW8bgh9exFejgUykdDQlScXVioEr/P9Tx4+urSlAGJuacTHG
	 fY9sci/KqZULADrIfMaOOXqXMH2w7V8h0k01MQms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD5CEF8049B;
	Tue,  3 Sep 2019 16:22:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A939F8011E; Tue,  3 Sep 2019 16:22:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83FB5F8011E;
 Tue,  3 Sep 2019 16:21:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83FB5F8011E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Sep 2019 07:21:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,463,1559545200"; d="scan'208";a="184765156"
Received: from mloktyuk-mobl.amr.corp.intel.com (HELO [10.251.152.40])
 ([10.251.152.40])
 by orsmga003.jf.intel.com with ESMTP; 03 Sep 2019 07:21:52 -0700
To: Bard liao <yung-chuan.liao@linux.intel.com>, alsa-devel@alsa-project.org
References: <20190829181135.16049-1-yung-chuan.liao@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f75ff0ea-efe1-def5-3fcf-1e90a817234c@linux.intel.com>
Date: Tue, 3 Sep 2019 08:54:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829181135.16049-1-yung-chuan.liao@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, Blauciak@alsa-project.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 bard.liao@intel.com
Subject: Re: [alsa-devel] [PATCH] soundwire: bus: set initial value to
 port_status
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 8/29/19 1:11 PM, Bard liao wrote:
> From: Bard Liao <yung-chuan.liao@linux.intel.com>
> 
> port_status[port_num] are assigned for each port_num in some if
> conditions. So some of the port_status may not be initialized.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>   drivers/soundwire/bus.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index f6a1e4b4813d..33f41b3e642e 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -835,7 +835,7 @@ static int sdw_handle_port_interrupt(struct sdw_slave *slave,
>   static int sdw_handle_slave_alerts(struct sdw_slave *slave)
>   {
>   	struct sdw_slave_intr_status slave_intr;
> -	u8 clear = 0, bit, port_status[15];
> +	u8 clear = 0, bit, port_status[15] = {0};
>   	int port_num, stat, ret, count = 0;
>   	unsigned long port;
>   	bool slave_notify = false;
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
