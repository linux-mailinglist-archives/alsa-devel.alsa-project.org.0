Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 029327A9307
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 11:24:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8FF686F;
	Thu, 21 Sep 2023 11:23:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8FF686F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695288281;
	bh=GlqO8T8bowphYtTb5DMQz6h5eLfHtVJJumchJwCbpis=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m2vg7GsxhwTBmgU9C53Ze/hRB9LCD/aWZpQgEIAXgWg2rS2xtJ7gArHqVQnwDWTiO
	 7AnUFjwmc4qHzay/SB+CF7fqkfgkUaA5zkAlPPHs5BdEVxHHM9FWFHOVI/0eW84Xaa
	 IDOEd/4GO8IP/EFSJ4P8Zgwac72L21JFOLkkhYYw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 552F7F80124; Thu, 21 Sep 2023 11:23:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8E57F801F5;
	Thu, 21 Sep 2023 11:23:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A32C5F8025A; Thu, 21 Sep 2023 11:23:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DED3F80125
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 11:23:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DED3F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=K25k0jVX
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38L8q8d1026256;
	Thu, 21 Sep 2023 04:23:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=J2qZUJ1cFFZzjHH3/osBYzH3RiKVzD3UD+0CYZe2Z0w=; b=
	K25k0jVXTmiC1djsdbSsw3+D847Wwreu5QA/zqwZjNDh/roLz3QUnhfMaPGtAhGC
	k7jZ2xnHQA5e0HshCUgeskbptgi0oKbrCzaaY62wUNU5vuRy86vtRK3drhWDCtxd
	aZ9TWLuwKg4inVXhkM59vlGc1WiJntNIjTu4euy9XCNeVxAq+pKbPKyEoI6ROVV1
	aW9jWmHDbYC6gsDxHLtVAU6fFbFmhtfqyd/VTQlBzd9xVftEksK9NqHQQfC+S6/C
	KZnX1OuWkQzWL2CxoGY5nOMvMidTunznSYbVtMtMYeZyF1/SiyHNp2Sd10Fd/oaj
	8WFzUqsEhvKA5CiXjGVGdw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3t58shwgnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 04:23:23 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 21 Sep
 2023 10:23:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Thu, 21 Sep 2023 10:23:22 +0100
Received: from [198.90.238.129] (unknown [198.90.238.129])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9749C2A1;
	Thu, 21 Sep 2023 09:23:19 +0000 (UTC)
Message-ID: <0a4644bc-d345-9988-2eb6-e95c8db06219@opensource.cirrus.com>
Date: Thu, 21 Sep 2023 10:23:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [tiwai-sound:for-next 36/38]
 sound/pci/hda/cirrus_scodec_test.c:151:60: error: initializer element is not
 a compile-time constant
Content-Language: en-US
To: <arnd@arndb.de>, <treding@nvidia.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
        <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>
References: <202309210751.TXlnuEMF-lkp@intel.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <202309210751.TXlnuEMF-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5UtX-_ESS5mGioR1LtJsS8Ft0QeIi43-
X-Proofpoint-ORIG-GUID: 5UtX-_ESS5mGioR1LtJsS8Ft0QeIi43-
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: AXRWBRODICKIRKCWCFS6PONT2XDLK66H
X-Message-ID-Hash: AXRWBRODICKIRKCWCFS6PONT2XDLK66H
X-MailFrom: prvs=46288e52b2=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AXRWBRODICKIRKCWCFS6PONT2XDLK66H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21/9/23 00:35, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
> head:   72f6a13022f3bf16df305b75c32f95ece263a5ce
> commit: 2144833e7b41459fa2d52bb0676f0ab4920cf32c [36/38] ALSA: hda: cirrus_scodec: Add KUnit test
> config: hexagon-randconfig-r041-20211219 (https://download.01.org/0day-ci/archive/20230921/202309210751.TXlnuEMF-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309210751.TXlnuEMF-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309210751.TXlnuEMF-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from sound/pci/hda/cirrus_scodec_test.c:9:
>     In file included from include/linux/gpio/driver.h:6:
>     In file included from include/linux/irqchip/chained_irq.h:10:
>     In file included from include/linux/irq.h:20:
>     In file included from include/linux/io.h:13:
>     In file included from arch/hexagon/include/asm/io.h:337:
>     include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>             val = __raw_readb(PCI_IOBASE + addr);
>                               ~~~~~~~~~~ ^
>     include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>             val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
>                                                             ~~~~~~~~~~ ^
>     include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
>     #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
>                                                       ^

This looks like it has nothing to do with cirrus_scodec_test, it's just
unfortunate that including gpio/driver.h results in also including io.h.

I think the problem here is that the way io.h tries to implement some
functions that might depend on PCI_IOBASE is not portable. If PCI_IOBASE
is not defined it defines it as NULL so that the functions will use
(0 + addr). But clang doesn't like this.

Probably the address calculation should be factored out from all these
functions so that it can be alternately defined as (PCI_IOBASE + addr)
or just (addr) depending whether PCI_IOBASE is set.

I've added the author and maintainer of the io.h code and the author of
the PCI_IOBASE hack for comment.

