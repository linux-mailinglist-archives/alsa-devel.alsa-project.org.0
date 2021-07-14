Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 174BD3C898B
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 19:16:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73B1B169B;
	Wed, 14 Jul 2021 19:15:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73B1B169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626282977;
	bh=8/e/JOv6kLrtMCAhwTZRtMjrU1ksDsT5AsjxYWr9qwg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iwn4fLgtstv+HgJh9AM07gn5U9BDoUGIRJUwNDJD5uT3g1X2FTfCimFzZdxbqmETf
	 3xN1vNiHzCZdxLwk1W+IcrS61DvGI83jR3ApEvuf6ohtCnTR81MHBxxT1k8QWa9+4j
	 2gqtArqFVNkJNjJlKM8D+r7ZcYMdQLiXM3YzKwZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF04BF804A9;
	Wed, 14 Jul 2021 19:14:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86988F802E7; Wed, 14 Jul 2021 19:14:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94D5CF80253
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 19:14:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94D5CF80253
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="190769916"
X-IronPort-AV: E=Sophos;i="5.84,239,1620716400"; d="scan'208";a="190769916"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 10:14:22 -0700
X-IronPort-AV: E=Sophos;i="5.84,239,1620716400"; d="scan'208";a="413353647"
Received: from alpinagh-mobl1.amr.corp.intel.com (HELO [10.212.71.223])
 ([10.212.71.223])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 10:14:21 -0700
Subject: Re: [PATCH v2 03/16] soc: qcom: apr: Add GPR support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210714153039.28373-1-srinivas.kandagatla@linaro.org>
 <20210714153039.28373-4-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <349b94b8-0ce3-20f1-d7e3-b6d0609ecdc4@linux.intel.com>
Date: Wed, 14 Jul 2021 11:20:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714153039.28373-4-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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


> +void gpr_free_port(gpr_port_t *port)
> +{
> +	struct packet_router *gpr = port->pr;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&gpr->svcs_lock, flags);
> +	idr_remove(&gpr->svcs_idr, port->id);
> +	spin_unlock_irqrestore(&gpr->svcs_lock, flags);

maybe add a comment somewhere on why you need the irqsave/irqrestore version of spin_lock/unlock?

It's not very clear by looking at this patch only that those locks are handled in interrupt context.

> +
> +	kfree(port);
> +}
> +EXPORT_SYMBOL_GPL(gpr_free_port);
> +
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

nit-pick: more this before the dev_err?

> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	svc->id = id;
> +	spin_unlock(&pr->svcs_lock);
> +
> +	dev_info(dev, "Adding GPR src port (%x)\n", svc->id);
> +
> +	return port;
> +}

> +static int gpr_do_rx_callback(struct packet_router *gpr, struct apr_rx_buf *abuf)
> +{
> +	uint16_t hdr_size, ver;
> +	struct pkt_router_svc *svc = NULL;

unnecessary init? it's overritten...

> +	struct gpr_resp_pkt resp;
> +	struct gpr_hdr *hdr;
> +	unsigned long flags;
> +	void *buf = abuf->buf;
> +	int len = abuf->len;
> +
> +	hdr = buf;
> +	ver = hdr->version;
> +	if (ver > GPR_PKT_VER + 1)
> +		return -EINVAL;
> +
> +	hdr_size = hdr->hdr_size;
> +	if (hdr_size < GPR_PKT_HEADER_WORD_SIZE) {
> +		dev_err(gpr->dev, "GPR: Wrong hdr size:%d\n", hdr_size);
> +		return -EINVAL;
> +	}
> +
> +	if (hdr->pkt_size < GPR_PKT_HEADER_BYTE_SIZE || hdr->pkt_size != len) {
> +		dev_err(gpr->dev, "GPR: Wrong packet size\n");
> +		return -EINVAL;
> +	}
> +
> +	resp.hdr = *hdr;
> +	resp.payload_size = hdr->pkt_size - (hdr_size * 4);
> +
> +	/*
> +	 * NOTE: hdr_size is not same as GPR_HDR_SIZE as remote can include
> +	 * optional headers in to gpr_hdr which should be ignored
> +	 */
> +	if (resp.payload_size > 0)
> +		resp.payload = buf + (hdr_size *  4);
> +
> +
> +	spin_lock_irqsave(&gpr->svcs_lock, flags);
> +	svc = idr_find(&gpr->svcs_idr, hdr->dest_port);

... here 

> +	spin_unlock_irqrestore(&gpr->svcs_lock, flags);
> +
> +	if (!svc) {
> +		dev_err(gpr->dev, "GPR: Port(%x) is not registered\n",
> +			hdr->dest_port);
> +		return -EINVAL;
> +	}
> +
> +	if (svc->callback)
> +		svc->callback(&resp, svc->priv, 0);
> +
> +	return 0;
> +}
> +

