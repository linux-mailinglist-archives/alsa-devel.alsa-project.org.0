Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88445122D2D
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 14:43:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 188CB165E;
	Tue, 17 Dec 2019 14:42:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 188CB165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576590187;
	bh=wGbK5J33Nu6YDJV7ro1xqPLNhRxsy3Lqtvs+fyJ3/NM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OTnRkoCxb1+tq8sVJTZHIvJyPnexSwnzZXh6OFIu4PBnQcWAKBQuDaWB+SYjajXo0
	 eIQUN31ZcLUe7q961zsnSrXzY0tuhg9dJy0QJ+yjVppSFVBbA1MmQRTM9U3PYgJH79
	 e8cLJwk8CJwDtSd2vNdZ2lrupkR1yepmMHg0bBsI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C57EF8028B;
	Tue, 17 Dec 2019 14:39:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6672F80255; Mon, 16 Dec 2019 16:24:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2E9EF800AD
 for <alsa-devel@alsa-project.org>; Mon, 16 Dec 2019 16:24:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2E9EF800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="hRiLsi+0"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df7a19b0000>; Mon, 16 Dec 2019 07:24:11 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 16 Dec 2019 07:24:38 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 16 Dec 2019 07:24:38 -0800
Received: from tbergstrom-lnx.Nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 16 Dec 2019 15:24:37 +0000
Received: by tbergstrom-lnx.Nvidia.com (Postfix, from userid 1000)
 id 7D6A842762; Mon, 16 Dec 2019 17:24:35 +0200 (EET)
Date: Mon, 16 Dec 2019 17:24:35 +0200
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <20191216152435.GD28289@pdeschrijver-desktop.Nvidia.com>
References: <ccb715cc-c927-ea91-a26e-24d6eeeeef1a@gmail.com>
 <ee1d39d4-9a57-da9b-fce6-8130dac1d2fd@nvidia.com>
 <49da77dc-b346-68eb-9ef8-42cfb3221489@nvidia.com>
 <3f1c9325-3017-62be-1e3b-82fd28540fdf@nvidia.com>
 <6fcbff3d-8695-7cd0-60de-6eb523b6964c@gmail.com>
 <20191211151028.GZ28289@pdeschrijver-desktop.Nvidia.com>
 <0930a710-174b-859b-294c-e9f81f6a3b5e@gmail.com>
 <20191216122005.GB28289@pdeschrijver-desktop.Nvidia.com>
 <53653719-f8e5-f6d1-a1d1-e53c7ccd7636@gmail.com>
 <20191216151132.GC28289@pdeschrijver-desktop.Nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191216151132.GC28289@pdeschrijver-desktop.Nvidia.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576509852; bh=pWpE3o2tiFHLJrLl2PwAQ76GOSg2rnsHi4e46CsvdYo=;
 h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
 X-NVConfidentiality:User-Agent:X-Originating-IP:X-ClientProxiedBy;
 b=hRiLsi+0bgoX0LbYPMmHbTnHOo4XYITpxTxVLSJvqrPn4Y4HaOUe5qOtNOX6K/HwQ
 IakYnabL3/kvgSPFbR4DDxhCx2/6ZXC+eapBKe1/HspBvR8b8WgpoYPT2z8N0YH2/s
 LVrKCk4tMYRPtg8ODqcRTIoXpAjVpjuJ/18a5uWW3qIObSEod0rUHqhQbZ4Jwv3gG0
 ylTDc1ZUpulC1Zmbm3ucygH2kyvW+Kmj31wB5CqubFkD/jfIsDmd4ZsmhWk8PJWC7h
 XjtKy4D/SFcO/J6QdnLgB+gumP5lBNke494+Qvh8jMLnRBaTmLGgMeo7+oMenxEjfH
 sgQseh+Itf0SQ==
X-Mailman-Approved-At: Tue, 17 Dec 2019 14:39:17 +0100
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

On Mon, Dec 16, 2019 at 05:11:32PM +0200, Peter De Schrijver wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Mon, Dec 16, 2019 at 05:23:23PM +0300, Dmitry Osipenko wrote:
> > >> Could you please clarify what do you mean by the "existing users"?
> > >> AFAIK, nothing in kernel uses mux clocks.
> > >
> > > The DT clk bindings allow for parent initialization, so it's certainly
> > > possible there are some DTs which rely on this. We promised to never
> > > break the bindings, which changing to 1 clock would do.
> >
> > What about this variant:
> >
> >   1. Keep the old CaR code in place.
> >
> >   2. Make CaR driver to scan whole device-tree for the legacy PMC clocks.
> >
> >   3. If legacy clock is found, then register PMC clocks from CaR.
> >
> >   4. If legacy clocks are not found, then don't register PMC clocks from
> > CaR.
> >
> >   5. Add clocks support to the PMC driver and only register them if
> > legacy clocks are not registered by CaR.
> >
> > Now both old and new DTBs can co-exist and work, everyone happy.
> 
> That seems even more work.. Today the only upstream user is audio.
> Currently these clocks are setup by the CAR clock driver. However
> as they will move to the PMC driver, this mechanism cannot be used.
> Hence the plan is to modify the audio driver to check for the PMC clocks
> in DT and if they are not available use the CAR clocks as fallback.
> The whole reason the clocks move to the PMC driver, is that when PMC
> becomes secure, all accesses have to go via an SMC. Given that we don't
> want SMCs all over the Tegra drivers, it's a good opportunity to move
> the PMC clock handling into the PMC driver. PMC can be secure with both
> 'new' and old DTs, so just registering the PMC clocks in the CAR driver
> if legacy clocks are found in the DT, won't always work.
> 

Given the audio driver needs to change anyway, we can indeed use 1 clock
per PMC clk_out_ rather than 2 as we have today. As this models the hw
slightly better, I think we should do that as you suggested.

Peter.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
