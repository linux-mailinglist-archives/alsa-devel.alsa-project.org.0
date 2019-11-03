Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D15FEED1C3
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Nov 2019 05:58:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 496C618BF;
	Sun,  3 Nov 2019 05:57:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 496C618BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572757091;
	bh=Kix5p6fpdAFgbbBoa1X6k9IjcHX/bhkPmZbaJcq5XP8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rOdISV0hUVzvEuPT048fjVakq6LWvm7dZMQQGy5NX9UvfrVLsCDY6ouhaGiFc0ClP
	 lGPVXGQko3BpW9iZE2fXWUaEH3vz4fWHJo1JPCY/3wRTrQCc0eJ4rzBeBQnVnxR5sQ
	 P7L5TnH5ylVDLEsv3fDxhJUOIBSGCo/KK3yATTAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD7A6F80446;
	Sun,  3 Nov 2019 05:56:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4099AF80535; Sun,  3 Nov 2019 05:56:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71A13F80368
 for <alsa-devel@alsa-project.org>; Sun,  3 Nov 2019 05:56:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71A13F80368
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V/I69N0+"
Received: from localhost (unknown [106.206.115.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F1C7220848;
 Sun,  3 Nov 2019 04:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572756977;
 bh=LNDBIGrezfGTuxdh0E7VEudgND+qq4oiCQ1SZqWL0Mc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V/I69N0+C9oVDKL7HN9+0fKDiBaDsDsasQC9P8sMi9jalbpYL7ZllA/HXhYQEdAvO
 0ZPXGRHtRXFtQwiI8I8JF3HBGupOzfho0vOE435xH/7PKZnc5LMJpDr0Z8JeGgFdPK
 +6K4W2ZUsZbnsyMgci6mMGOZ8nKizI7GbalGYUoc=
Date: Sun, 3 Nov 2019 10:26:04 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191103045604.GE2695@vkoul-mobl.Dlink>
References: <20191023210657.32440-1-pierre-louis.bossart@linux.intel.com>
 <20191023210657.32440-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023210657.32440-2-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/4] soundwire: sdw_slave: add new fields
 to track probe status
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
> Changes to the sdw_slave structure needed to solve race conditions on
> driver probe.

Can you please explain the race you have observed, it would be a very
useful to document it as well

> 
> The functionality is added in the next patch.

which one..?

> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  include/linux/soundwire/sdw.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index 688b40e65c89..a381a596212b 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -545,6 +545,10 @@ struct sdw_slave_ops {
>   * @node: node for bus list
>   * @port_ready: Port ready completion flag for each Slave port
>   * @dev_num: Device Number assigned by Bus
> + * @probed: boolean tracking driver state
> + * @probe_complete: completion utility to control potential races
> + * on startup between driver probe/initialization and SoundWire
> + * Slave state changes/imp-def interrupts
>   */
>  struct sdw_slave {
>  	struct sdw_slave_id id;
> @@ -559,6 +563,8 @@ struct sdw_slave {
>  	struct list_head node;
>  	struct completion *port_ready;
>  	u16 dev_num;
> +	bool probed;
> +	struct completion probe_complete;
>  };
>  
>  #define dev_to_sdw_dev(_dev) container_of(_dev, struct sdw_slave, dev)
> -- 
> 2.20.1

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
