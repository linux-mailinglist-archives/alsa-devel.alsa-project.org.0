Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E0B3CBC03
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 20:45:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFB5F169B;
	Fri, 16 Jul 2021 20:44:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFB5F169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626461121;
	bh=q7556uojeO0TLiF81wagje53SrKDidTKmDOf/RmeBa4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lav6Wb1vtMuafbwoo4gaVYRHcazvsLK5zZxAr+k3rEeBvuQ4/mvb1ZNidXNYh42cQ
	 URIQB8vHVoMAEccR+K5zfkhBHLbjmPqof+Bd+qLg0iYzIaGE8dUj5ZdsA00/3smoSl
	 6TJEDaRM9kiQsZ6Ie78+xBYMDYfoZ5EipsJm5s2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06F75F8025B;
	Fri, 16 Jul 2021 20:43:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C938CF80254; Fri, 16 Jul 2021 20:43:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24BCDF8013C
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 20:43:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24BCDF8013C
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="198038360"
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="198038360"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 11:43:46 -0700
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="497102536"
Received: from mohalshu-mobl2.amr.corp.intel.com (HELO [10.212.40.103])
 ([10.212.40.103])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 11:43:45 -0700
Subject: Re: [PATCH] ASoC: Intel: Handle device properties with software node
 API
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20210322110638.2681-1-heikki.krogerus@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <050073c4-5ea0-183d-5bd0-7df388fcce33@linux.intel.com>
Date: Fri, 16 Jul 2021 13:43:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210322110638.2681-1-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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

Hi Heikki,
Going back to this initial patch, I have a doubt based on Andy Shevchenko's comment on an update [1]

> The function device_add_properties() is going to be removed.
> Replacing it with software node API equivalents.

The replacement pattern takes this one line:

> -	ret = device_add_properties(sdw_dev, props);

which gets replaced by

> +	fwnode = fwnode_create_software_node(props, NULL);
> +	if (IS_ERR(fwnode)) {
> +		return PTR_ERR(fwnode);
>  	}
>  
> +	ret = device_add_software_node(sdw_dev, to_software_node(fwnode));
> +
> +	fwnode_handle_put(fwnode);

is the fwnode_handle_put() actually required here? This seems to work fine in our tests but I wasn't able to find in the code a matching _get().

Thanks for any pointers/comments!
-Pierre

[1] https://github.com/thesofproject/linux/pull/3041#discussion_r671450168

