Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF3B3C9CBA
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 12:33:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7B9D169B;
	Thu, 15 Jul 2021 12:32:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7B9D169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626345208;
	bh=1LyQSI1qQ/U1Qz9Wc+ZF52A3DD245yl7zd5nhd1WQk4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QeL6AqSNDKaG13+enSSzYnjARWQI4pH3T2kzHGmWvH2Jhqj+Z4jh232czecPcXGei
	 zRCaJCrz+IoZ9qKhbxJcl9kRJnbFWHPN73AI4C6TCfEveuwtmPT/9PpRtWtQS9aVAZ
	 cNFMPRJDj6WPXWf1ETuPDB/8S8Z6Ou4FslLNW6+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C14AF800D3;
	Thu, 15 Jul 2021 12:32:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73B8EF80217; Thu, 15 Jul 2021 12:31:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07780F8013C
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 12:31:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07780F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="N5Lyb39o"
Received: by mail-wm1-x336.google.com with SMTP id w13so3396093wmc.3
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 03:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3/UMFIYsAEmuojKVnN83fkHudTM2KjmLO3fL2UtgQ6A=;
 b=N5Lyb39oENufWE6yapTpCuVDAhA3OtRhE2gyJO/P6vwASt50ZCX/EvD432it5Mczrf
 F/OZXxKcieDIWitNPfB5FugMJnt81uJwMbHEitadMBTzOcRYJOLf/d8wdFA76iy6WzIV
 sOKLwyAyXuWFrKHG3Nr22XtGjTm8gYsmUvwqqVeh6h1Bu6QIws6O291MKjrs2X/ISdoC
 B+9CChoPwlyRnJwiYyZ6cnBokbRphVDKQxUP8m45vHw/8FdqcfgnP+1G6fR0sns9xDxu
 vj87AJ/B/nPy8yjmfhHKKfzu7XKUparm39Wmup85/o2q2n4lGe0An4Cs/CDDgL0EYnq+
 3AaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3/UMFIYsAEmuojKVnN83fkHudTM2KjmLO3fL2UtgQ6A=;
 b=bzkLBboMfrs/V+Rn0MndzxjbERtdfZJpzVL0fc6sRPRRGfeCLk7NeKiP58KvZ8ULhh
 MYLlvnRbEihrZ8/aH0ugneRBmtdxTDXuuvGp2FFACdba7pW7rqeqo3G4+cwUh4ra8+k5
 x2SYV5YGpnLeICUfa/Vs9e3gNvLLgEfO1u814nOXQhU6THfLvJ91uhifjO7BcciVxDXw
 i7JI3h/K90R9VYHGgbHLzsqLpWWR0h5QrCwtCrpPpOJsZwE9EdZFEFdlI17RhjsaoiLK
 aR72kumxiUarJ9QEvmmxRurMci+EMwjfb1PxNEuKNMBJs7Qq3D9Xk9jgjrxs+AojbPTE
 gcRA==
X-Gm-Message-State: AOAM530e6BR9eTCF4NPCPGfwNI6UinTH9RdfVdi1is9zFVGb9FEvM7jV
 Ogm1xvmJIeZqJqYk64DfF1XVnA==
X-Google-Smtp-Source: ABdhPJycJXClZY+iOj0PtsWA83BQXsa43bgsifSJi81IB3vG8RMJeZKJ7IGF0rwEOuzlYe6mVFgSeQ==
X-Received: by 2002:a7b:c2a2:: with SMTP id c2mr3821401wmk.89.1626345107087;
 Thu, 15 Jul 2021 03:31:47 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id m15sm4687547wmc.20.2021.07.15.03.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 03:31:46 -0700 (PDT)
Subject: Re: [PATCH v2 03/16] soc: qcom: apr: Add GPR support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210714153039.28373-1-srinivas.kandagatla@linaro.org>
 <20210714153039.28373-4-srinivas.kandagatla@linaro.org>
 <349b94b8-0ce3-20f1-d7e3-b6d0609ecdc4@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <da7c8e4d-fe79-de54-025e-2bb25dc16698@linaro.org>
Date: Thu, 15 Jul 2021 11:31:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <349b94b8-0ce3-20f1-d7e3-b6d0609ecdc4@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

Many thanks Pierre for the review,

On 14/07/2021 17:20, Pierre-Louis Bossart wrote:
> 
>> +void gpr_free_port(gpr_port_t *port)
>> +{
>> +	struct packet_router *gpr = port->pr;
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&gpr->svcs_lock, flags);
>> +	idr_remove(&gpr->svcs_idr, port->id);
>> +	spin_unlock_irqrestore(&gpr->svcs_lock, flags);
> 
> maybe add a comment somewhere on why you need the irqsave/irqrestore version of spin_lock/unlock?

All the responses to the messages arrive in interrupt context which 
could try to find the matching svc idr, so we needed this irq version of 
spinlock here. I did move this handling to a work queue in the past, so 
we should be able to relax this lock to non-irq version.

> 
> It's not very clear by looking at this patch only that those locks are handled in interrupt context.
> 
>> +
>> +	kfree(port);
>> +}
>> +EXPORT_SYMBOL_GPL(gpr_free_port);
>> +
>> +gpr_port_t *gpr_alloc_port(struct apr_device *gdev, struct device *dev,
>> +				gpr_port_cb cb,	void *priv)
>> +{
>> +	struct packet_router *pr = dev_get_drvdata(gdev->dev.parent);
>> +	gpr_port_t *port;
>> +	struct pkt_router_svc *svc;
>> +	int id;
>> +
>> +	port = kzalloc(sizeof(*port), GFP_KERNEL);
>> +	if (!port)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	svc = port;
>> +	svc->callback = cb;
>> +	svc->pr = pr;
>> +	svc->priv = priv;
>> +	svc->dev = dev;
>> +	spin_lock_init(&svc->lock);
>> +
>> +	spin_lock(&pr->svcs_lock);
>> +	id = idr_alloc_cyclic(&pr->svcs_idr, svc, GPR_DYNAMIC_PORT_START,
>> +			      GPR_DYNAMIC_PORT_END, GFP_ATOMIC);
>> +	if (id < 0) {
>> +		dev_err(dev, "Unable to allocate dynamic GPR src port\n");
>> +		kfree(port);
>> +		spin_unlock(&pr->svcs_lock);
> 
> nit-pick: more this before the dev_err?

I agree, will do that in next spin.
> 
>> +		return ERR_PTR(-ENOMEM);
>> +	}
>> +
>> +	svc->id = id;
>> +	spin_unlock(&pr->svcs_lock);
>> +
>> +	dev_info(dev, "Adding GPR src port (%x)\n", svc->id);
>> +
>> +	return port;
>> +}
> 
>> +static int gpr_do_rx_callback(struct packet_router *gpr, struct apr_rx_buf *abuf)
>> +{
>> +	uint16_t hdr_size, ver;
>> +	struct pkt_router_svc *svc = NULL;
> 
> unnecessary init? it's overritten...
> 
Yep.


--srini

>> +	struct gpr_resp_pkt resp;
>> +	struct gpr_hdr *hdr;
>> +	unsigned long flags;
>> +	void *buf = abuf->buf;
>> +	int len = abuf->len;
>> +
>> +	hdr = buf;
>> +	ver = hdr->version;
>> +	if (ver > GPR_PKT_VER + 1)
>> +		return -EINVAL;
>> +
>> +	hdr_size = hdr->hdr_size;
>> +	if (hdr_size < GPR_PKT_HEADER_WORD_SIZE) {
>> +		dev_err(gpr->dev, "GPR: Wrong hdr size:%d\n", hdr_size);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (hdr->pkt_size < GPR_PKT_HEADER_BYTE_SIZE || hdr->pkt_size != len) {
>> +		dev_err(gpr->dev, "GPR: Wrong packet size\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	resp.hdr = *hdr;
>> +	resp.payload_size = hdr->pkt_size - (hdr_size * 4);
>> +
>> +	/*
>> +	 * NOTE: hdr_size is not same as GPR_HDR_SIZE as remote can include
>> +	 * optional headers in to gpr_hdr which should be ignored
>> +	 */
>> +	if (resp.payload_size > 0)
>> +		resp.payload = buf + (hdr_size *  4);
>> +
>> +
>> +	spin_lock_irqsave(&gpr->svcs_lock, flags);
>> +	svc = idr_find(&gpr->svcs_idr, hdr->dest_port);
> 
> ... here
> 
>> +	spin_unlock_irqrestore(&gpr->svcs_lock, flags);
>> +
>> +	if (!svc) {
>> +		dev_err(gpr->dev, "GPR: Port(%x) is not registered\n",
>> +			hdr->dest_port);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (svc->callback)
>> +		svc->callback(&resp, svc->priv, 0);
>> +
>> +	return 0;
>> +}
>> +
> 
