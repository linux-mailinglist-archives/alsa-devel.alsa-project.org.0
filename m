Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE554E595E
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Mar 2022 20:47:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E30D71672;
	Wed, 23 Mar 2022 20:46:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E30D71672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648064849;
	bh=q7XKqK7lYrNstZDl2OUGdDm0xZRoRoMopxSVN8wezhk=;
	h=Date:From:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ebDhZe4vja5wXOqk7pkEWWkCklmy7N1MgHm0e36I7m/c/Yan35fJpx3hGoXw3UHNI
	 d/7fq/AKLkirZKVvkXdeOuw9ZuycEQAZ1x7mWRBeQcCwoV4cx0+tZ4Ks65Z3sTNoyz
	 4Tt3SF8oud1Wg10KH+xNqM3C6kk01VMkDBRGWDBc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 513B7F80310;
	Wed, 23 Mar 2022 20:46:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D31E5F800F5; Wed, 23 Mar 2022 20:46:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EFF4F800F5
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 20:46:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EFF4F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="eRCumAPM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648064779; x=1679600779;
 h=message-id:date:mime-version:from:subject:to:cc:
 content-transfer-encoding;
 bh=q7XKqK7lYrNstZDl2OUGdDm0xZRoRoMopxSVN8wezhk=;
 b=eRCumAPMPDkJmHhiCCifjY1rgCsJukiA4MNjam7h4jZ62onxas47lotP
 wxOHslJ93w8ItzS2X2VzV5+LeZEKcRz0ocSwoJ8ryVG/KnAZC9El07GXB
 NPpfbuuQ257PLe22YZ19+Px1AnIFO1NkDqYNNvCB3WkuNUFdvTeJ4GY02
 MP1RjqSAkxcruMDVHnxXVZ7qqGup9yyey2lnQsp0AN06CeWdmHXIuQ1jV
 48kchKczOvBKjDONX5Ex7SKE6c/gSaLprtCcApXX3dqPCcJy4GTCmZsQW
 ek8EM67lNPRYo6Z2c43Qc/4MtZUwVeKkc8HibRHYz3mOqiqTcUOZR8Y12 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="283064945"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="283064945"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 12:46:01 -0700
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="519497343"
Received: from thientha-mobl1.amr.corp.intel.com (HELO [10.251.10.76])
 ([10.251.10.76])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 12:46:00 -0700
Message-ID: <d0559e97-c4a0-b817-428c-d3e305390270@linux.intel.com>
Date: Wed, 23 Mar 2022 14:45:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Conceptual bug on SoundWire probe/remove?
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
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

Hi,
I could use feedback/guidance on a possible conceptual bug in the 
SoundWire probe and bus handling.

When we probe a driver, the code does this:

static int sdw_drv_probe(struct device *dev)
{
	struct sdw_slave *slave = dev_to_sdw_dev(dev);
	struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
	const struct sdw_device_id *id;
	const char *name;
	int ret;

	/*
	 * fw description is mandatory to bind
	 */
	if (!dev->fwnode)
		return -ENODEV;

	if (!IS_ENABLED(CONFIG_ACPI) && !dev->of_node)
		return -ENODEV;

	id = sdw_get_device_id(slave, drv);
	if (!id)
		return -ENODEV;

	slave->ops = drv->ops;

The last line is the problematic one. If at some point, the user does an 
rmmod and unbinds the SoundWire codec driver, the .remove will be called 
and the 'drv' will no longer be valid, but we will still have a 
reference to drv->ops and use that pointer in the bus code, e.g.

		/* Update the Slave driver */
		if (slave_notify && slave->ops &&
		    slave->ops->interrupt_callback) {
			slave_intr.sdca_cascade = sdca_cascade;
			slave_intr.control_port = clear;
			memcpy(slave_intr.port, &port_status,
			       sizeof(slave_intr.port));

			slave->ops->interrupt_callback(slave,
&slave_intr);
		}

I noodled with a potential fix in
https://github.com/thesofproject/linux/pull/3534/commits/82d64fb0fd39b532263f060a8ec86e47e9ab305b

where I force-reset this slave->ops pointer, but it is likely to be very 
racy.

We probably need to avoid such references, or have a clean mechanism to 
unbind, e.g. with all commands and interrupts stopped while the codec 
driver .remove routine is handled.

Initial error reports at https://github.com/thesofproject/linux/issues/3531

Suggestions and comments welcome, thanks!
-Pierre
