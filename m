Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3971940CA66
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 18:36:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5C3217DE;
	Wed, 15 Sep 2021 18:35:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5C3217DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631723762;
	bh=4tBdPjNynHZjQu437ZPOuYTNuhVhXAXf+grdMbuPqUE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CL9i2qGRaem9/yJ2MF4EZiedrrRkDq/QdtQkTJR/LZndcKsK8wOoRlnkLe18IcgHA
	 xk4MdYJw7PGQwVRz2HQ4llgsQ71+WqQ7KAfJ3BEBhccsuqQkad+ictFnAWXJjA960w
	 sYalqVfTu59/U4WrCI8mYQk3bT3uA44Io8ZOqupM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DA82F804E2;
	Wed, 15 Sep 2021 18:34:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7CDAF802E8; Wed, 15 Sep 2021 18:34:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C1E3F80132
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 18:34:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C1E3F80132
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="286060875"
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="286060875"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 09:34:31 -0700
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="583352167"
Received: from mvetrive-mobl3.amr.corp.intel.com (HELO [10.212.69.198])
 ([10.212.69.198])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 09:34:30 -0700
Subject: Re: [PATCH v6 05/22] soc: qcom: apr: Add GPR support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210915131333.19047-1-srinivas.kandagatla@linaro.org>
 <20210915131333.19047-6-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <83c503aa-7cb2-e6fa-e22a-b359a9cb9059@linux.intel.com>
Date: Wed, 15 Sep 2021 10:47:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210915131333.19047-6-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com
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


> +gpr_port_t *gpr_alloc_port(struct apr_device *gdev, struct device *dev,
> +				gpr_port_cb cb,	void *priv)
> +{
> +	struct packet_router *pr = dev_get_drvdata(gdev->dev.parent);
> +	gpr_port_t *port;
> +	struct pkt_router_svc *svc;
> +	int id;
> +
> +	port = kzalloc(sizeof(*port), GFP_KERNEL);
> +	if (!port)
> +		return ERR_PTR(-ENOMEM);
> +
> +	svc = port;
> +	svc->callback = cb;
> +	svc->pr = pr;
> +	svc->priv = priv;
> +	svc->dev = dev;
> +	spin_lock_init(&svc->lock);
> +
> +	spin_lock(&pr->svcs_lock);
> +	id = idr_alloc_cyclic(&pr->svcs_idr, svc, GPR_DYNAMIC_PORT_START,
> +			      GPR_DYNAMIC_PORT_END, GFP_ATOMIC);
> +	if (id < 0) {
> +		dev_err(dev, "Unable to allocate dynamic GPR src port\n");
> +		kfree(port);
> +		spin_unlock(&pr->svcs_lock);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	svc->id = id;
> +	spin_unlock(&pr->svcs_lock);
> +
> +	dev_info(dev, "Adding GPR src port (%x)\n", svc->id);

nit-pick: isn't this a bit verbose?

> +
> +	return port;
> +}
> +EXPORT_SYMBOL_GPL(gpr_alloc_port);

> +struct gpr_pkt {
> +	struct gpr_hdr hdr;
> +	uint32_t payload[0];
> +};

looks like a zero-length array?

should this be

struct gpr_pkt {
    struct gpr_hdr hdr;
    uint32_t payload[];
};

?

