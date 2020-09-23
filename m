Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F36D275884
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 15:19:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A13941706;
	Wed, 23 Sep 2020 15:18:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A13941706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600867178;
	bh=5lDCOr8nlJUOCmqktnfahYKtXNbNG55Xtf81dJf4Chw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e30OKSFb2/lSeDcNhNdSiFVRoXfCGGRr5cUe5WZpfX5JVcPHi67hg0DefppMzn+Vs
	 xL8D4dZrzoDNK0nV2ToXxXuyRriHIBRho1g/N9ukFgxwjtUjJWptT7KQkzeFNlI2dz
	 PYz3qH60ZMP+zn+taj7p1IDoQ40/brxQomzLQksg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4313F8015F;
	Wed, 23 Sep 2020 15:17:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A1DFF80162; Wed, 23 Sep 2020 15:17:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA1B7F8010A
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 15:17:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA1B7F8010A
IronPort-SDR: D3XnUPDgEyZDHU0MLv5InZ3GUGcYr/61vH28LU56pQMjj+wJxtY95zuyqsTQMViAdMcxhSRu1S
 /H/wn5GvVnCQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="161817477"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="161817477"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 06:17:39 -0700
IronPort-SDR: J/0Xcgev9aUeqi0JIeDa+fFkBzaE+vTJWWSNusXu5OeNrtroIgMVRA3ae7x3OEZL7en/Pw7OOR
 vcn548ctRprw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="338656838"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 23 Sep 2020 06:17:35 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kL4eJ-001OzB-Aw; Wed, 23 Sep 2020 16:17:31 +0300
Date: Wed, 23 Sep 2020 16:17:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v8 02/14] ASoC: Intel: catpt: Implement IPC protocol
Message-ID: <20200923131731.GE3956970@smile.fi.intel.com>
References: <20200923122508.3360-1-cezary.rojewski@intel.com>
 <20200923122508.3360-3-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923122508.3360-3-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com,
 gregkh@linuxfoundation.org, marcin.barlik@intel.com, zwisler@google.com,
 lgirdwood@gmail.com, tiwai@suse.com, filip.proborszcz@intel.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 michal.wasko@intel.com, cujomalainey@chromium.org,
 krzysztof.hejmowski@intel.com, ppapierkowski@habana.ai,
 vamshi.krishna.gopal@intel.com
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

On Wed, Sep 23, 2020 at 02:24:56PM +0200, Cezary Rojewski wrote:
> Implement IRQ handlers for immediate and delayed replies and
> notifications. Communication is synchronous and allows for serialization
> of maximum one message at a time.
> 
> DSP may respond with ADSP_PENDING status for a request - known as
> delayed reply - and when situation occurs, framework keeps the lock and
> awaits upcoming response through IPCD channel which is handled in
> bottom-half. Immediate replies spawn no BH at all as their processing is
> very short.

...

> +static void catpt_dsp_send_tx(struct catpt_dev *cdev,
> +			      const struct catpt_ipc_msg *tx)
> +{
> +	u32 header = tx->header | CATPT_IPCC_BUSY;

> +	if (tx->size)

This check is not needed.

> +		memcpy_toio(catpt_outbox_addr(cdev), tx->data, tx->size);
> +	catpt_writel_shim(cdev, IPCC, header);
> +}

...

> +	ret = ipc->rx.rsp.status;
> +	if (reply) {

> +		reply->header = ipc->rx.header;

So, even in case of error the header is still updated?

> +		if (!ret && reply->data && reply->size)

> +			memcpy(reply->data, ipc->rx.data, ipc->rx.size);

This I didn't get. You copy data by using source size?!

> +	}
> +
> +	return ret;

I guess the above piece may be refactored, but I don't know how until it is
clear why it's written like this.

...

> +static void catpt_dsp_copy_rx(struct catpt_dev *cdev, u32 header)
> +{
> +	struct catpt_ipc *ipc = &cdev->ipc;
> +
> +	ipc->rx.header = header;
> +	if (ipc->rx.size && ipc->rx.rsp.status == CATPT_REPLY_SUCCESS) {

Check for size is redundant.

> +		memcpy_fromio(ipc->rx.data, catpt_outbox_addr(cdev),
> +			      ipc->rx.size);
> +	}

Can be done like

	if (status != SUCCESS)
		return;
	memcpy_fromio(...);

> +}

-- 
With Best Regards,
Andy Shevchenko


