Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8056148B3BB
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jan 2022 18:25:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ED9D1AA0;
	Tue, 11 Jan 2022 18:24:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ED9D1AA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641921924;
	bh=gEUR+PS3VK1rPxJq6WRhpVCCJmBWIol2sYXcM1N0t6I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=atH7gwQnpkvVMaf98HZu55/ye1q16KV71j6L9eFXSkUXZIhxvqCEcntfeERkDRt/f
	 /tcaaHkNQCr3Obndw/tmo0zX5g0b4LqWjIh3Ozcj4BXNqZ0p9s0FdGeTQ8xSdrzyyw
	 h+DJmZn/sRHLfqMmYyA6vNgmJHlnan34gCoFa7R8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 057B7F800A7;
	Tue, 11 Jan 2022 18:23:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E2C6F8049E; Tue, 11 Jan 2022 18:23:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 516C1F800A7;
 Tue, 11 Jan 2022 18:23:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 516C1F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="anNagfXT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641921820; x=1673457820;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=gEUR+PS3VK1rPxJq6WRhpVCCJmBWIol2sYXcM1N0t6I=;
 b=anNagfXTEhdQvdxJASaJ0VM7we0CwbaH3KfAN13r/p6D9Ttyfb6VSZGl
 UXHS3Wcs/brj5ffTavfnV3NZBIrmm3/I0G7FNM+Ptpj/2l+UHiaeoKZXp
 joWqHn+hEKGcE40vt/eRDdapAqo4tdLLGrxcGLjkLyFPh4vL0N9MOPQLH
 nzXj3CixD1+QcW38ct0FGv2JTD5tY306vYkmZS3sPDgGB19mJUQMTZVbn
 +WvO3IU/giCrM8hdoGcakqx4Th/vPWTAMAwIn4YCugfX+ArKRfW1nsrSP
 5DmTnrqlL53p03ONaQehxlFyQOkMHb/14Vc/gM4gPM/Xx+qkc+1mCHOdG w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="224237925"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="224237925"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 09:23:33 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="592749789"
Received: from cdoher2x-mobl1.amr.corp.intel.com (HELO [10.212.119.165])
 ([10.212.119.165])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 09:23:32 -0800
Subject: Re: [PATCH] firmware: mediatek: add adsp ipc protocol interface
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20220111071011.5964-1-allen-kh.cheng@mediatek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <91eef4c9-adda-1921-16b5-af181b30d36e@linux.intel.com>
Date: Tue, 11 Jan 2022 11:02:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220111071011.5964-1-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, cujomalainey@google.com,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-arm-kernel@lists.infradead.org, sound-open-firmware@alsa-project.org
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


> +int mtk_adsp_ipc_send(struct mtk_adsp_ipc *ipc, unsigned int idx, uint32_t msg)
> +{
> +	struct mtk_adsp_chan *dsp_chan;
> +	int ret;
> +
> +	if (idx >= MTK_ADSP_MBOX_NUM)
> +		return -EINVAL;
> +
> +	dsp_chan = &ipc->chans[idx];
> +	ret = mbox_send_message(dsp_chan->ch, &msg);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;

this can be simplified a bit without the 'ret' variable

return mbox_send_message(dsp_chan->ch, &msg);

> +}
> +EXPORT_SYMBOL(mtk_adsp_ipc_send);


> +static int mtk_adsp_ipc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_adsp_ipc *dsp_ipc;
> +	struct mtk_adsp_chan *dsp_chan;
> +	struct mbox_client *cl;
> +	char *chan_name;
> +	int ret;
> +	int i, j;
> +
> +	device_set_of_node_from_dev(&pdev->dev, pdev->dev.parent);
> +
> +	dsp_ipc = devm_kzalloc(dev, sizeof(*dsp_ipc), GFP_KERNEL);
> +	if (!dsp_ipc)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < MTK_ADSP_MBOX_NUM; i++) {
> +		chan_name = kasprintf(GFP_KERNEL, "mbox%d", i);
> +		if (!chan_name) {
> +			ret = -ENOMEM;
> +			goto out;
> +		}

in this case with the existing code you will free something that was not
allocated. It's not super elegant, consider using different labels as
suggested below.

> +
> +		dsp_chan = &dsp_ipc->chans[i];
> +		cl = &dsp_chan->cl;
> +		cl->dev = dev->parent;
> +		cl->tx_block = false;
> +		cl->knows_txdone = false;
> +		cl->tx_prepare = NULL;
> +		cl->rx_callback = mtk_adsp_ipc_recv;
> +
> +		dsp_chan->ipc = dsp_ipc;
> +		dsp_chan->idx = i;
> +		dsp_chan->ch = mbox_request_channel_byname(cl, chan_name);
> +		if (IS_ERR(dsp_chan->ch)) {
> +			ret = PTR_ERR(dsp_chan->ch);
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(dev, "Failed to request mbox chan %d ret %d\n",
> +					i, ret);
> +			goto out;

goto out_free;

> +		}
> +
> +		dev_dbg(dev, "request mbox chan %s\n", chan_name);
> +		kfree(chan_name);
> +	}
> +
> +	dsp_ipc->dev = dev;
> +	dev_set_drvdata(dev, dsp_ipc);
> +	dev_dbg(dev, "MTK ADSP IPC initialized\n");
> +
> +	return 0;
> +
> +out:

out_free:
> +	kfree(chan_name);

out:

> +	for (j = 0; j < i; j++) {
> +		dsp_chan = &dsp_ipc->chans[j];
> +		mbox_free_channel(dsp_chan->ch);
> +	}
> +
> +	return ret;
> +}
> +
> +static int mtk_adsp_ipc_remove(struct platform_device *pdev)
> +{
> +	struct mtk_adsp_ipc *dsp_ipc = dev_get_drvdata(&pdev->dev);
> +	struct mtk_adsp_chan *dsp_chan;
> +	int i;
> +
> +	for (i = 0; i < MTK_ADSP_MBOX_NUM; i++) {
> +		dsp_chan = &dsp_ipc->chans[i];
> +		mbox_free_channel(dsp_chan->ch);
> +	}
> +
> +	return 0;
> +}
> +
> +static struct platform_driver mtk_adsp_ipc_driver = {
> +	.driver = {
> +		.name = "mtk-adsp-ipc",
> +	},
> +	.probe = mtk_adsp_ipc_probe,
> +	.remove = mtk_adsp_ipc_remove,
> +};
> +builtin_platform_driver(mtk_adsp_ipc_driver);
> +
> +MODULE_AUTHOR("Allen-KH Cheng <allen-kh.cheng@mediatek.com>");
> +MODULE_DESCRIPTION("MTK ADSP IPC Driver");
> +MODULE_LICENSE("GPL v2");

the v2 here isn't useful, the license information can be found in the
SPDX line.

MODULE_LICENSE("GPL");


