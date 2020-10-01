Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1618E27FFBC
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 15:06:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8BBB1805;
	Thu,  1 Oct 2020 15:05:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8BBB1805
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601557596;
	bh=4jB5NNPi2mfqalUzQY1g01aI+oaEvy/trCClIkJoAyA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SD7R7Fo/R1hZyERcdoBiwW0otcPbKGn+PxW8LO5wPJEdtX/EmLODWNDookgqTU4Hq
	 47TdqOgb9DLWE7TgIb7Gw+76Hun6NumfacgBbaILvPOSkda1J55Q1TV9B6kCFdxLpE
	 sGlLvB7+/H09S4pdvchRnakKH30M4nymYBYqt2+U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7A03F8020C;
	Thu,  1 Oct 2020 15:04:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22390F801F5; Thu,  1 Oct 2020 15:04:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABC54F801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 15:04:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABC54F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MPq6yDzy"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7A1EF2075F;
 Thu,  1 Oct 2020 13:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601557489;
 bh=4jB5NNPi2mfqalUzQY1g01aI+oaEvy/trCClIkJoAyA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MPq6yDzyVh3xeUSelfdKc/aiLnEls+zYMufxf+GiB15/+kA1n6Oeu2Dz4kSRRA+0+
 RfZRivdsTuSkw8oD0Iq4WJhLD60ZAbzohiS6GoEdpCV+EyeNTDeUk1YqCP7dS4lsEz
 U9D8uzsTAzOKFlz1VJvZInS0e5WJoV2BxU00+EZw=
Date: Thu, 1 Oct 2020 15:04:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dave Ertman <david.m.ertman@intel.com>
Subject: Re: [PATCH 3/6] ASoC: SOF: Create client driver for IPC test
Message-ID: <20201001130450.GC2378679@kroah.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-4-david.m.ertman@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930225051.889607-4-david.m.ertman@intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, ranjani.sridharan@intel.com,
 pierre-louis.bossart@linux.intel.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, broonie@kernel.org, parav@nvidia.com,
 jgg@nvidia.com
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

On Wed, Sep 30, 2020 at 03:50:48PM -0700, Dave Ertman wrote:
> +/*
> + * The IPC test client creates a couple of debugfs entries that will be used
> + * flood tests. Users can write to these entries to execute the IPC flood test
> + * by specifying either the number of IPCs to flood the DSP with or the duration
> + * (in ms) for which the DSP should be flooded with test IPCs. At the
> + * end of each test, the average, min and max response times are reported back.
> + * The results of the last flood test can be accessed by reading the debugfs
> + * entries.
> + */
> +static int sof_ipc_test_probe(struct ancillary_device *ancildev,
> +			      const struct ancillary_device_id *id)
> +{
> +	struct sof_client_dev *cdev = ancillary_dev_to_sof_client_dev(ancildev);
> +	struct sof_ipc_client_data *ipc_client_data;
> +
> +	/*
> +	 * The ancillary device has a usage count of 0 even before runtime PM
> +	 * is enabled. So, increment the usage count to let the device
> +	 * suspend after probe is complete.
> +	 */
> +	pm_runtime_get_noresume(&ancildev->dev);
> +
> +	/* allocate memory for client data */
> +	ipc_client_data = devm_kzalloc(&ancildev->dev, sizeof(*ipc_client_data), GFP_KERNEL);
> +	if (!ipc_client_data)
> +		return -ENOMEM;
> +
> +	ipc_client_data->buf = devm_kzalloc(&ancildev->dev, IPC_FLOOD_TEST_RESULT_LEN, GFP_KERNEL);
> +	if (!ipc_client_data->buf)
> +		return -ENOMEM;
> +
> +	cdev->data = ipc_client_data;
> +
> +	/* create debugfs root folder with device name under parent SOF dir */
> +	ipc_client_data->dfs_root = debugfs_create_dir(dev_name(&ancildev->dev),
> +						       sof_client_get_debugfs_root(cdev));
> +
> +	/* create read-write ipc_flood_count debugfs entry */
> +	debugfs_create_file("ipc_flood_count", 0644, ipc_client_data->dfs_root,
> +			    cdev, &sof_ipc_dfs_fops);
> +
> +	/* create read-write ipc_flood_duration_ms debugfs entry */
> +	debugfs_create_file("ipc_flood_duration_ms", 0644, ipc_client_data->dfs_root,
> +			    cdev, &sof_ipc_dfs_fops);

These debugfs files are never removed, why not?

thanks,

greg k-h
