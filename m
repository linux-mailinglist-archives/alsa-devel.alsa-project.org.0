Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FD54C45AB
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:15:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD9491AD2;
	Fri, 25 Feb 2022 14:14:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD9491AD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645794931;
	bh=zVAGv3GzIY0CmGHccO6MTpPuZ0cGji1luXzfksNlM2M=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=pyI2tHvwU8RN71elRDvfsMUn0cbdfP4Agwp+vbUkPI94gEhEosbsMpVsonVWff9NW
	 hjiOJOg6DX5GDIWKrMOa790u2RANjlJuuDp7IRisuGfxsnt+b9fmmPP51TGhrQFevS
	 7R1QtnFD0+gieLRl2hVCTXJLcgWmjcdZHLY4+4h0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCECDF80559;
	Fri, 25 Feb 2022 14:11:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8D4DF8030F; Fri, 25 Feb 2022 00:52:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB4C0F800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 00:52:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB4C0F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kCSNhdmj"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4D79BB828B7;
 Thu, 24 Feb 2022 23:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD98FC340E9;
 Thu, 24 Feb 2022 23:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645746728;
 bh=zVAGv3GzIY0CmGHccO6MTpPuZ0cGji1luXzfksNlM2M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=kCSNhdmjCNFp4p3nEZo05DvtkYaTYatl89i6A6bnh2GoE1LafejZW2+LdT+xyn9p9
 vFysfr3uU3CN1goYGDWRGNKLLknLWL4gwXq4LwSu/xs2AfSKORCBht3dm2YESZuJkC
 QTihOOdWAM03oTBu5HCC9wQYShduFbcLphU9XZZOZ2w+HR8xeoLGBBRX0Da60zkFuO
 Gw55uOtn72xOyN5dsOgPR66lVXrDqagidhgfw1lK88dhzevhVz/lXIRWDLrY+G2rDT
 B2vC1ShfZifdcQml58IDHz2aBNdppV0ayqFTRcbx14EaEZyzuuUqWcpsrE30jKvDVw
 +pVWnNSGt5bFQ==
Date: Thu, 24 Feb 2022 17:52:06 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v2 05/11] pci: use helper for safer setting of
 driver_override
Message-ID: <20220224235206.GA302751@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7347531-8aa4-c011-d405-dea93e29779f@canonical.com>
X-Mailman-Approved-At: Fri, 25 Feb 2022 14:11:18 +0100
Cc: linux-hyperv@vger.kernel.org, Stuart Yoder <stuyoder@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
 Jason Wang <jasowang@redhat.com>, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Abel Vesa <abel.vesa@nxp.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Dexuan Cui <decui@microsoft.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Bjorn Helgaas <bhelgaas@google.com>, virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Sven Schnelle <svens@linux.ibm.com>, Shawn Guo <shawnguo@kernel.org>
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

On Thu, Feb 24, 2022 at 08:49:15AM +0100, Krzysztof Kozlowski wrote:
> On 23/02/2022 22:51, Bjorn Helgaas wrote:
> > In subject, to match drivers/pci/ convention, do something like:
> > 
> >   PCI: Use driver_set_override() instead of open-coding
> > 
> > On Wed, Feb 23, 2022 at 08:13:04PM +0100, Krzysztof Kozlowski wrote:
> >> Use a helper for seting driver_override to reduce amount of duplicated
> >> code.
> >> @@ -567,31 +567,15 @@ static ssize_t driver_override_store(struct device *dev,
> >>  				     const char *buf, size_t count)
> >>  {
> >>  	struct pci_dev *pdev = to_pci_dev(dev);
> >> -	char *driver_override, *old, *cp;
> >> +	int ret;
> >>  
> >>  	/* We need to keep extra room for a newline */
> >>  	if (count >= (PAGE_SIZE - 1))
> >>  		return -EINVAL;
> > 
> > This check makes no sense in the new function.  Michael alluded to
> > this as well.
> 
> I am not sure if I got your comment properly. You mean here:
> 1. Move this check to driver_set_override()?
> 2. Remove the check entirely?

I was mistaken about the purpose of the comment and the check.  I
thought it had to do with *this* function, and this function doesn't
add a newline, and there's no obvious connection with PAGE_SIZE.

But looking closer, I think the "extra room for a newline" is really
to make sure that *driver_override_show()* can add a newline and have
it still fit within the PAGE_SIZE sysfs limit.

Most driver_override_*() functions have the same comment, so maybe
this was obvious to everybody except me :)  I do see that spi.c adds
"when displaying value" at the end, which helps a lot.

Sorry for the wild goose chase.

> >> -	driver_override = kstrndup(buf, count, GFP_KERNEL);
> >> -	if (!driver_override)
> >> -		return -ENOMEM;
> >> -
> >> -	cp = strchr(driver_override, '\n');
> >> -	if (cp)
> >> -		*cp = '\0';
> >> -
> >> -	device_lock(dev);
> >> -	old = pdev->driver_override;
> >> -	if (strlen(driver_override)) {
> >> -		pdev->driver_override = driver_override;
> >> -	} else {
> >> -		kfree(driver_override);
> >> -		pdev->driver_override = NULL;
> >> -	}
> >> -	device_unlock(dev);
> >> -
> >> -	kfree(old);
> >> +	ret = driver_set_override(dev, &pdev->driver_override, buf);
> >> +	if (ret)
> >> +		return ret;
> >>  
> >>  	return count;
> >>  }
> >> -- 
> >> 2.32.0
> >>
> >>
> >> _______________________________________________
> >> linux-arm-kernel mailing list
> >> linux-arm-kernel@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
> 
> Best regards,
> Krzysztof
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
