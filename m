Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF754C54CE
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Feb 2022 10:16:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CD891A9E;
	Sat, 26 Feb 2022 10:15:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CD891A9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645866971;
	bh=4sE4Gtevnk8/TCjMANbcRjCHG8DgJ5S+RZAsg3tQewo=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Bod3D7IKyEdtS8i4skH0i6P8h7s10bQWuWtPWoMf++qrF41HsTDgvriErizuuQJ/S
	 fmTjk5DPMPbgBmyTYQegXkH7bK7djGa0NtCB3PNoB7GBj9hocFz1pa/OsGrQZIouTy
	 AOIFXsUDz7odTmFldq9uJHY1Xa3Wukd1jpVBD3XY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B393BF800E1;
	Sat, 26 Feb 2022 10:15:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C85C5F80132; Fri, 25 Feb 2022 18:13:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51CD3F800E1
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 18:13:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51CD3F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aKNMEZYO"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4B11261D72;
 Fri, 25 Feb 2022 17:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E452C340E7;
 Fri, 25 Feb 2022 17:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645809222;
 bh=4sE4Gtevnk8/TCjMANbcRjCHG8DgJ5S+RZAsg3tQewo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=aKNMEZYO9GYS47EsbtSGoBp7jQ6cq+PB2zbte+AwwqqiqpcVRMxGDM0F0Afex5ZJW
 4rYESli2esu86LIUX6eb+GIiQqKG0aJoZCwpzqlHuXkixzO/1AezAk2443Z9c992ps
 XywAbCY1/AWyw1jhDZ3bHZQXnfC+/H1QPWErc949Yi5ixSLpl4/cO2POfTAAfrxKho
 CAVXpDY7lijl79zw4wxpFlP592n7RcY/q2RQ45t4e4X5U4/DfLgdvmThUjLUu/hMNF
 a6Vl3pNKPQMeAYVdX3MJ7TCbUyat1DVH9TvH+imzTBTV3gNbtHMVmiV6Fa05o9r3/n
 oKdbLx9yzFJlA==
Date: Fri, 25 Feb 2022 11:13:41 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v2 05/11] pci: use helper for safer setting of
 driver_override
Message-ID: <20220225171341.GA364850@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0aff95ff-5b79-8ae9-48fd-720a9f27cbce@canonical.com>
X-Mailman-Approved-At: Sat, 26 Feb 2022 10:15:04 +0100
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

On Fri, Feb 25, 2022 at 10:36:20AM +0100, Krzysztof Kozlowski wrote:
> On 25/02/2022 00:52, Bjorn Helgaas wrote:
> > On Thu, Feb 24, 2022 at 08:49:15AM +0100, Krzysztof Kozlowski wrote:
> >> On 23/02/2022 22:51, Bjorn Helgaas wrote:
> >>> In subject, to match drivers/pci/ convention, do something like:
> >>>
> >>>   PCI: Use driver_set_override() instead of open-coding
> >>>
> >>> On Wed, Feb 23, 2022 at 08:13:04PM +0100, Krzysztof Kozlowski wrote:
> >>>> Use a helper for seting driver_override to reduce amount of duplicated
> >>>> code.
> >>>> @@ -567,31 +567,15 @@ static ssize_t driver_override_store(struct device *dev,
> >>>>  				     const char *buf, size_t count)
> >>>>  {
> >>>>  	struct pci_dev *pdev = to_pci_dev(dev);
> >>>> -	char *driver_override, *old, *cp;
> >>>> +	int ret;
> >>>>  
> >>>>  	/* We need to keep extra room for a newline */
> >>>>  	if (count >= (PAGE_SIZE - 1))
> >>>>  		return -EINVAL;
> >>>
> >>> This check makes no sense in the new function.  Michael alluded to
> >>> this as well.
> >>
> >> I am not sure if I got your comment properly. You mean here:
> >> 1. Move this check to driver_set_override()?
> >> 2. Remove the check entirely?
> > 
> > I was mistaken about the purpose of the comment and the check.  I
> > thought it had to do with *this* function, and this function doesn't
> > add a newline, and there's no obvious connection with PAGE_SIZE.
> > 
> > But looking closer, I think the "extra room for a newline" is really
> > to make sure that *driver_override_show()* can add a newline and have
> > it still fit within the PAGE_SIZE sysfs limit.
> > 
> > Most driver_override_*() functions have the same comment, so maybe
> > this was obvious to everybody except me :)  I do see that spi.c adds
> > "when displaying value" at the end, which helps a lot.
> > 
> > Sorry for the wild goose chase.
> 
> I think I will move this check anyway to driver_set_override() helper,
> because there is no particular benefit to have duplicated all over. The
> helper will receive "count" argument so can perform all checks.

Thanks, I think that would be good!

Bjorn
