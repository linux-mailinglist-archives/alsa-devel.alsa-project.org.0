Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7865E11ED41
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2019 22:51:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A1E2851;
	Fri, 13 Dec 2019 22:50:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A1E2851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576273894;
	bh=ZfG690I0a8Xx7APcAXqWY4i+8FUcQ4HP/DaC3W+rJyY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UQ6h2u4+VQM2V73BYNvhOmvmsLQmvgtKodXS8eTaYIc0QAH3ekC0bPou7i3v1L0u0
	 ts1XMrZn1QnaPWi2u4WD1HdfE9mcnQH2PFSoc+yN99w/0XlrUXP9ky+ru2+JZ+X1NA
	 /v9vCF/36wP9I0TWsH56Nx9ryjcbWf6X35zvHx1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9D11F801F4;
	Fri, 13 Dec 2019 22:49:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2A70F80234; Fri, 13 Dec 2019 22:49:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE2FCF8014F
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 22:49:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE2FCF8014F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NNxGGuTf"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5559A24671;
 Fri, 13 Dec 2019 21:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576273740;
 bh=JkU7pUvaKNy5Abj/NmXgU27ugejd1YYKGoQ2rkZGU+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NNxGGuTfHNgQJd1A4PyH2px5iUPwIg7glsLCWqKEOgDKkPBjl/VUbclA4hcTJiWnU
 hqIYMNlsBBOKPz2jCEcV2rchcjdAG4UYQ9DFv7xVK5pQD8Z83nt4fegstWbLIrv0ID
 ZCvac/xIjGViCuy6kMI+bYY10QcPPuEd+meaFp5w=
Date: Fri, 13 Dec 2019 17:11:22 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191213161122.GB2653074@kroah.com>
References: <20191213050409.12776-1-pierre-louis.bossart@linux.intel.com>
 <20191213050409.12776-8-pierre-louis.bossart@linux.intel.com>
 <20191213072231.GE1750354@kroah.com>
 <032e6505-22b6-45bb-ff04-87db1f8d8be9@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <032e6505-22b6-45bb-ff04-87db1f8d8be9@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v4 07/15] soundwire: slave: move uevent
 handling to slave
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

On Fri, Dec 13, 2019 at 09:11:27AM -0600, Pierre-Louis Bossart wrote:
> On 12/13/19 1:22 AM, Greg KH wrote:
> > On Thu, Dec 12, 2019 at 11:04:01PM -0600, Pierre-Louis Bossart wrote:
> > > Currently the code deals with uevents at the bus level, but we only care
> > > for Slave events
> > 
> > What does this mean?  I can't understand it, can you please provide more
> > information on what you are doing here?
> 
> In the earlier versions of the patch, the code looks like this and there was
> an open on what to do with a master-specific event.
> 
>  static int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
>  {
> +	struct sdw_master_device *md;
>  	struct sdw_slave *slave;
>  	char modalias[32];
> 
> -	if (is_sdw_slave(dev)) {
> +	if (is_sdw_md(dev)) {
> +		md = to_sdw_master_device(dev);
> +		/* TODO: do we need to call add_uevent_var() ? */
> +	} else if (is_sdw_slave(dev)) {
>  		slave = to_sdw_slave_device(dev);
> +
> +		sdw_slave_modalias(slave, modalias, sizeof(modalias));
> +
> +		if (add_uevent_var(env, "MODALIAS=%s", modalias))
> +			return -ENOMEM;
>  	} else {
>  		dev_warn(dev, "uevent for unknown Soundwire type\n");
>  		return -EINVAL;
>  	}
> 
> Vinod suggested this was not needed and suggested the code for uevents be
> moved to be slave-specific, which is what this patch does.

Then describe it really really well in the changelog text.  We have no
rememberance of prior conversations when looking at commits in the tree
in the future.

thaniks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
