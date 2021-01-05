Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B69E22EAB38
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jan 2021 13:51:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 430F71675;
	Tue,  5 Jan 2021 13:51:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 430F71675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609851112;
	bh=PpTeUg5BKXmtSQakm3V7AA3QLUAcO6LRjzNTprAUsws=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d9H9lrA2vuxt5OD1BsYSaq1K535KN0PLlkhtOq26uGlLaAY6h2Zijfg6EFgK+uq9p
	 pRefEqs8O90VAQH/OwW1DEjeDaa4Yv/NkzGtBtavqzgvaox670NkhM1qBpcz1eYCid
	 USROdiljla/eOCGohTdTI5XfmjI3Y3O3jgfSrfUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C757F80268;
	Tue,  5 Jan 2021 13:50:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADCD4F80258; Tue,  5 Jan 2021 13:50:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MSGID_FROM_MTA_HEADER, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B1A9F8015B
 for <alsa-devel@alsa-project.org>; Tue,  5 Jan 2021 13:50:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B1A9F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="p40RqElF"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5ff4607f0001>; Tue, 05 Jan 2021 04:50:07 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 Jan
 2021 12:50:02 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by HQMAIL111.nvidia.com (172.20.187.18) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 5 Jan 2021 12:50:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLNyKrNB8aAD5y9mWTlUrUwRIxWin6qtP2nc87xh2wdkCVteSYHmMlYZKRI8wZ1oNBnLxla5FlwzUK23uM3wu7Il0MQ/Pm6S769jipDXYWftkD3o320A5Yi+7idpuShSj07bQ0wBY8M0qIykZgECAyFfJ1gzdlg3TGRn+t4nSVt8KyOzmwWDuLok2KtCqF3Jr4TTZm0jtB6lQ64qOOlry3LSnAKedsY2bVln5LH2FAGZa1ZRSR98KdhrSCV22rEDdZMLDmKKiJxJFJZ5bttgU7tdg0fHIBmc0BUR0iYwjuGB6sVWFPLuBKExWzDwc27hBwGMsaiWF5Kiwz+yjCYpFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpTeUg5BKXmtSQakm3V7AA3QLUAcO6LRjzNTprAUsws=;
 b=YmxBAeZgE87MzsPJh76MZSPRviJjSuhvWql+7z+irkL8hWywD36sfPIYaq7r5IE5PmPLh8ArYLdCaI02IxBrjeil11ndI5FROa/J6sdrvZLQ7TnTJt4F00nf8+2SF7+h56yfAzLbEknardZ2h1xjDNchqRzt0ymRJvHK13srcScOi6thp8p9GYN0W2mOHYUHsCGKhWwRRPrBC7A6hNd9OkpoAdy7W6QOLxGvgSXQFBL96qE2Kz1jmclbIaTvBIvWc3vjd2s3h4p/VrGDkRA5CqoVFK7RzaASEImlVwukXfpIvfIknyyRTqGoc7MfiiWC5UgPrVVGxWNgf8dILvuJgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4250.namprd12.prod.outlook.com (2603:10b6:5:21a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Tue, 5 Jan
 2021 12:49:59 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::546d:512c:72fa:4727]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::546d:512c:72fa:4727%7]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 12:49:59 +0000
Date: Tue, 5 Jan 2021 08:49:56 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [resend/standalone PATCH v4] Add auxiliary bus support
Message-ID: <20210105124956.GN552508@nvidia.com>
References: <20201218184150.GY552508@nvidia.com>
 <20201218203211.GE5333@sirena.org.uk> <20201218205856.GZ552508@nvidia.com>
 <20201221185140.GD4521@sirena.org.uk> <20210104180831.GD552508@nvidia.com>
 <20210104211930.GI5645@sirena.org.uk> <20210105001341.GL552508@nvidia.com>
 <CAPcyv4gxprMo1LwGTqGDyN-z2TrXLcAvJ3AN9-fbUs6y-LwXeA@mail.gmail.com>
 <20210105015314.GM552508@nvidia.com>
 <CAPcyv4jAAC01rktNadUPv9jDRCOcDEO22uAOHXobpJ7TqAbp1w@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAPcyv4jAAC01rktNadUPv9jDRCOcDEO22uAOHXobpJ7TqAbp1w@mail.gmail.com>
X-ClientProxiedBy: YT1PR01CA0133.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::12) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YT1PR01CA0133.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.19 via Frontend Transport; Tue, 5 Jan 2021 12:49:58 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kwlme-002FUc-8U; Tue, 05 Jan 2021 08:49:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1609851007; bh=PpTeUg5BKXmtSQakm3V7AA3QLUAcO6LRjzNTprAUsws=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=p40RqElF/LZfDBbX75UPdffKlqCuNT006h6I1yRP5vQ/ird8gl2jezK72+ZdtM0XQ
 06cIfzAQSfACrpRkuvtKbR2gvsPX763xwipl62r3u+iQ4XVoMxKN54SLxlX9DN7Gj+
 DmLH3wM7ztGNoi11sh6bnCiIn+r1msJI+ZkGiShhYaCXXZTTf6Hn00xNmNVk3YoH2i
 7mr9qfBtaMW1mlI793FLt82IgGSq+eFTKZr4tbODeszgVqSoIY8ihPPeOBwxD54O2N
 Aw4C8MtmPUG7yk7CJwMYH3Li87DwcpNIa8jWSdEM/DDv7vGQEK+I4m/BPnN4kEW+ZB
 dXj3PbEJOzAiA==
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Kiran
 Patil <kiran.patil@intel.com>, alsa-devel@alsa-project.org,
 David Miller <davem@davemloft.net>, linux-rdma <linux-rdma@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>, Martin Habets <mhabets@solarflare.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Fred Oh <fred.oh@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Ranjani
 Sridharan <ranjani.sridharan@linux.intel.com>, Jakub
 Kicinski <kuba@kernel.org>, Dave Ertman <david.m.ertman@intel.com>,
 Lee Jones <lee.jones@linaro.org>, Shiraz Saleem <shiraz.saleem@intel.com>,
 Netdev <netdev@vger.kernel.org>, Leon Romanovsky <leonro@nvidia.com>,
 Parav Pandit <parav@mellanox.com>
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

On Mon, Jan 04, 2021 at 07:12:47PM -0800, Dan Williams wrote:

> I get that, but I'm fearing a gigantic bus_ops structure that has
> narrow helpers like ->gpio_count() that mean nothing to the many other
> clients of the bus. Maybe I'm overestimating the pressure there will
> be to widen the ops structure at the bus level.

If we want a 'universal device' then that stuff must live
someplace.. Open coding the dispatch as is today is also not the end
of the world, just seeing that is just usually a sign something is not
ideal with the object model.

Jason
