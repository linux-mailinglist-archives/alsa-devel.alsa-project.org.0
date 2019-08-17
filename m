Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CF491137
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Aug 2019 17:23:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DF091664;
	Sat, 17 Aug 2019 17:22:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DF091664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566055380;
	bh=BldB3JvuujsIipvJZiRNVJBxYLWS6xL2g835qTJT/54=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R9uVH75Tibg7xBWnjCiioUiITNf7lFphBl76p8QxolYjvtU9goFE0txzNNH8Fw5UP
	 9U35968HlZtSlcM7rkrC+dbJCnC6n7t7XN4eRC5GJDC2LdpPkbYUT3RhGAG9ZAM+lG
	 gLVdv2pE/Jy7HMSytML52XR9Kg465f+Oz8QLk4cs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66541F80290;
	Sat, 17 Aug 2019 17:21:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB0ACF8044C; Sat, 17 Aug 2019 17:21:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24173F8011F
 for <alsa-devel@alsa-project.org>; Sat, 17 Aug 2019 17:21:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24173F8011F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Aug 2019 08:21:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,397,1559545200"; d="scan'208";a="182454472"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.2.119])
 ([10.252.2.119])
 by orsmga006.jf.intel.com with ESMTP; 17 Aug 2019 08:21:03 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20190815154500.29090-1-pierre-louis.bossart@linux.intel.com>
 <20190815154500.29090-3-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <c8c78674-7af8-4577-9e18-da85c064b345@intel.com>
Date: Sat, 17 Aug 2019 17:21:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190815154500.29090-3-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [alsa-devel] [PATCH 2/3] ASoC: SOF: imx: Add i.MX8 HW support
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

On 2019-08-15 17:44, Pierre-Louis Bossart wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> Add support for the audio DSP hardware found on NXP i.MX8 platform.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> +static void imx8_get_reply(struct snd_sof_dev *sdev)
> +{
> +	struct snd_sof_ipc_msg *msg = sdev->msg;
> +	struct sof_ipc_reply reply;
> +	int ret = 0;
> +
> +	if (!msg) {
> +		dev_warn(sdev->dev, "unexpected ipc interrupt\n");
> +		return;
> +	}
> +
> +	/* get reply */
> +	sof_mailbox_read(sdev, sdev->host_box.offset, &reply, sizeof(reply));
> +
> +	if (reply.error < 0) {
> +		memcpy(msg->reply_data, &reply, sizeof(reply));
> +		ret = reply.error;
> +	} else {
> +		/* reply has correct size? */
> +		if (reply.hdr.size != msg->reply_size) {
> +			dev_err(sdev->dev, "error: reply expected %zu got %u bytes\n",
> +				msg->reply_size, reply.hdr.size);
> +			ret = -EINVAL;
> +		}
> +
> +		/* read the message */
> +		if (msg->reply_size > 0)
> +			sof_mailbox_read(sdev, sdev->host_box.offset,
> +					 msg->reply_data, msg->reply_size);
> +	}
> +
> +	msg->reply_error = ret;
> +}

Assuming reply.hdr.size is coming from HW IPC regs, msg object is 
representing application side - SW, kernel. If so, is msg->reply_size 
value an estimated size (which can be overestimated since exact size may 
be unknown by the host) -or- the exact size of incoming IPC reply?

The estimated-case is usually permissive as long as assumed size is >= 
reply.hdr.size - dev_err needed. In the exact-case, it should be viewed 
as a requirement. If such "requirement" fails, is it valid to read 
mailbox regardless? Is this to extract some error-debug payload sent by FW?

Just curious, please feel free to correct me here, Pierre.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
