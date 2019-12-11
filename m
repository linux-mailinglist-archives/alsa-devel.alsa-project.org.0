Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EC811CFA7
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 15:22:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3B3516E1;
	Thu, 12 Dec 2019 15:21:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3B3516E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576160525;
	bh=sSfUSoKiC21aW9KwtzbCesGKbGN+wb6DR3clwkNpcCs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TkDCsYrXMiI454pbXLV8VrtZ9OmCAmKIdiotzkub2QvMhcWem+GXQ1RNQBw6qQ45w
	 FAqqqXDRDsz0RJisVWs7N/P3Vx73bRS77ITzHLXzh2UTLS3Gx6LQ1Ohsg/aW7aOZDF
	 o5hUtCWGu7EZ3RCBpEXvvp/FvMn6/eSUQEMT4W4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56D0FF80249;
	Thu, 12 Dec 2019 15:19:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA793F801F4; Wed, 11 Dec 2019 16:10:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29326F8011E
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 16:10:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29326F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Lm5F6nqi"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df106e40000>; Wed, 11 Dec 2019 07:10:28 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 11 Dec 2019 07:10:34 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 11 Dec 2019 07:10:34 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Dec
 2019 15:10:31 +0000
Received: from tbergstrom-lnx.Nvidia.com (10.124.1.5) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Wed, 11 Dec 2019 15:10:30 +0000
Received: by tbergstrom-lnx.Nvidia.com (Postfix, from userid 1000)
 id 66AC6447B2; Wed, 11 Dec 2019 17:10:28 +0200 (EET)
Date: Wed, 11 Dec 2019 17:10:28 +0200
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <20191211151028.GZ28289@pdeschrijver-desktop.Nvidia.com>
References: <ad3a6743-4b36-fa25-9cc7-72803038ecc5@gmail.com>
 <dc7a057a-0bed-0e6f-0987-edcfec47f867@gmail.com>
 <288a1701-def6-d628-26bc-a305f817bdb1@gmail.com>
 <78644d45-2ae3-121f-99fc-0a46f205907d@nvidia.com>
 <b35916e1-c6ee-52ca-9111-5ae109437b6e@nvidia.com>
 <ccb715cc-c927-ea91-a26e-24d6eeeeef1a@gmail.com>
 <ee1d39d4-9a57-da9b-fce6-8130dac1d2fd@nvidia.com>
 <49da77dc-b346-68eb-9ef8-42cfb3221489@nvidia.com>
 <3f1c9325-3017-62be-1e3b-82fd28540fdf@nvidia.com>
 <6fcbff3d-8695-7cd0-60de-6eb523b6964c@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6fcbff3d-8695-7cd0-60de-6eb523b6964c@gmail.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576077028; bh=VvDMrUYT7taYzbMa3m3Y5QwG5+rFZtiGCZ+lwUnZ+H4=;
 h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
 X-NVConfidentiality:User-Agent:X-Originating-IP:X-ClientProxiedBy;
 b=Lm5F6nqi5lm9oF3AFvMVlJyM+vsVmkKVxMC3aCEATgZO2h7/YDOmlhxTh16jJsYJc
 RiTDpkOAGndf7f5g1VHhTGp0uN0v291Ea9MpN52Vs9fo5PtJEB6Zx5z61K91j3ytjq
 mff6ObVy21nYWvLr+C7tSIvriqp0/PQ0hSigNsBE/FlJGH+QmpZXlRv7KroBogN+1w
 Cz7mjfNTukwY2nltQx3atJPxUyEKwDEJnOP/0N6zXKUqC2iRiQJTV8QETKFJ8qqemu
 yrIV5TJcqcqdsN6mPTX3i85m8T+/UOb2TOeAfLfE+x5CnmT8RyiTFIDmSn7YykhuIu
 1ZWP3M73v2MFg==
X-Mailman-Approved-At: Thu, 12 Dec 2019 15:19:27 +0100
Cc: mark.rutland@arm.com, alsa-devel@alsa-project.org, pgaikwad@nvidia.com,
 lgirdwood@gmail.com, mturquette@baylibre.com, mperttunen@nvidia.com,
 thierry.reding@gmail.com, josephl@nvidia.com, linux-clk@vger.kernel.org,
 mmaddireddy@nvidia.com, daniel.lezcano@linaro.org, krzk@kernel.org,
 jonathanh@nvidia.com, spujar@nvidia.com, devicetree@vger.kernel.org,
 arnd@arndb.de, markz@nvidia.com, alexios.zavras@intel.com, robh+dt@kernel.org,
 tiwai@suse.com, linux-tegra@vger.kernel.org, horms+renesas@verge.net.au,
 tglx@linutronix.de, allison@lohutok.net, sboyd@kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vidyas@nvidia.com,
 Jisheng.Zhang@synaptics.com, broonie@kernel.org,
 Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [alsa-devel] [PATCH v3 03/15] soc: tegra: Add Tegra PMC clock
 registrations into PMC driver
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

On Tue, Dec 10, 2019 at 08:41:56PM +0300, Dmitry Osipenko wrote:

..

> >
> > PMC clock gate is based on the state of CLKx_ACCEPT_REQ and FORCE_EN
> > like explained above.
> >
> > CLKx_ACCEPT_REQ is 0 default and FORCE_EN acts as gate to enable/disable
> > EXTPERIPH clock output to PMC CLK_OUT_1/2/3.
> 
> [and to enable OSC as well]
> 
> > So I believe we need to register as MUX and Gate rather than as a single
> > clock. Please confirm.
> 
> 1. The force-enabling is applied to both OSC and EXTERN sources of
> PMC_CLK_OUT_x by PMC at once.
> 
> 2. Both of PMC's force-enabling and OSC/EXTERN selection is internal to PMC.
> 
> Should be better to define it as a single "pmc_clk_out_x". I don't see
> any good reasons for differentiating PMC's Gate from the MUX, it's a
> single hardware unit from a point of view of the rest of the system.
> 
> Peter, do you have any objections?

The reason to have separate gate and mux clocks, is to preserve compatibility
with existing users.
Otherwise the current users would need to figure out if there's a
single clock or 2 clocks to configure. I don't think adding that code in
each user is worth it only to have a sligthly nicer modelling of the
hardware.

Cheers,

Peter.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
